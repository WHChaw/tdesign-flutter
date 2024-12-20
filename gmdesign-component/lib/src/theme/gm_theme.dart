import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../gmdesign_flutter.dart';
import '../util/css2JsonTheme.dart';
import '../util/log.dart';
import '../util/string_util.dart';
import 'gm_default_theme.dart';

/// 主题控件
class GMTheme extends StatelessWidget {
  const GMTheme({required this.data, required this.child, this.systemData, Key? key}) : super(key: key);

  /// 仅使用Default主题，不需要切换主题功能
  static bool _needMultiTheme = false;

  /// 主题数据
  static GMThemeData? _singleData;

  static String? _themeFilePath;

  /// 子控件
  final Widget child;

  /// 主题数据
  final GMThemeData data;

  /// Flutter系统主题数据
  final ThemeData? systemData;

  @override
  Widget build(BuildContext context) {
    if (!_needMultiTheme) {
      _singleData = data;
    }
    var extensions = [data];
    return Theme(data: systemData?.copyWith(extensions: extensions) ?? ThemeData(extensions: extensions), child: child);
  }

  /// 注册theme.css,支持传入多个theme.css， 请在main函数中runApp()之前调用
  /// 传入文件路径，资源文件目录需要现在pubspec.yaml中的assets声明
  /// outputDir表示存放theme的文件目录，不传会使用默认路径
  static Future<void> registerTheme(List<ThemeItem> themeItems) async {
    final dir = (await getApplicationDocumentsDirectory()).path;
    _themeFilePath = '${dir}theme.json';

    final isExsits = File(_themeFilePath!).existsSync();
    if (!isExsits) {
      await genThemeJson(items: themeItems, output: _themeFilePath!);
    }
  }

  /// 注销Theme，此方法会删除保存在磁盘中的theme.json
  static Future<void> unregisterTheme() async {
    if (_themeFilePath == null) {
      final dir = (await getApplicationDocumentsDirectory()).path;
      _themeFilePath = '${dir}theme.json';
    }
    final file = File(_themeFilePath!);
    final isExsits = file.existsSync();
    if (isExsits) {
      await file.delete();
    }
  }

  ///获取ThemeData 必须先调用registerTheme，否则将返回defaultThemeData
  static Future<GMThemeData> loadThemeData(String name) async {
    if (_themeFilePath == null) {
      Log.w('_themeFilePath is null');
      return defaultData();
    }

    final themeFile = File(_themeFilePath!);
    if (!themeFile.existsSync()) {
      Log.w('themeFile is null');
      return defaultData();
    }
    String? themeJson;
    try {
      themeJson = await themeFile.readAsString();
    } catch (e) {
      Log.e('read themeJson failed ${e.toString()}');
    }

    final themeData = GMThemeData.fromJson(name, themeJson!);
    if (themeData == null) {
      Log.w('themeData is null');
      return defaultData();
    }
    return themeData;
  }

  /// 开启多套主题功能
  static void needMultiTheme([bool value = true]) {
    _needMultiTheme = value;
  }

  /// 设置资源代理,
  /// needAlwaysBuild=true:每次都会走build方法;如果全局有多个Delegate,需要区分情况去获取,则可以设置needAlwaysBuild为true,业务自己判断返回哪个delegate
  /// needAlwaysBuild=false:返回delegate为null,则每次都会走build方法,返回了
  static void setResourceBuilder(GMGMResourceBuilder delegate, {bool needAlwaysBuild = false}) {
    GMResourceManager.instance.setResourceBuilder(delegate, needAlwaysBuild);
  }

  /// 获取默认主题数据，全局唯一
  static GMThemeData defaultData() {
    return GMThemeData.defaultData();
  }

  /// 获取主题数据，如果未传context则获取全局唯一的默认数据,
  /// 传了context，则获取最近的主题，取不到则会获取全局唯一默认数据
  static GMThemeData of([BuildContext? context]) {
    if (!_needMultiTheme || context == null) {
      // 如果context为null,则返回全局默认主题
      return _singleData ?? GMThemeData.defaultData();
    }
    // 如果传了context，则从其中获取最近主题
    try {
      var data = Theme.of(context).extensions[GMThemeData] as GMThemeData?;
      return data ?? GMThemeData.defaultData();
    } catch (e) {
      Log.w('GMTheme', 'GMTheme.of() error: $e');
      return GMThemeData.defaultData();
    }
  }

  /// 获取主题数据，取不到则可空
  /// 传了context，则获取最近的主题，取不到或未传context则返回null,
  static GMThemeData? ofNullable([BuildContext? context]) {
    if (context != null) {
      // 如果传了context，则从其中获取最近主题
      return Theme.of(context).extensions[GMThemeData] as GMThemeData?;
    } else {
      // 如果context为null,则返回null
      return null;
    }
  }
}

/// 主题数据
class GMThemeData extends ThemeExtension<GMThemeData> {
  static const String _defaultThemeName = 'default';
  static GMThemeData? _defaultThemeData;

  /// 名称
  late String name;

  /// 颜色
  late GMMap<String, Color> colorMap;

  /// 字体尺寸
  late GMMap<String, Font> fontMap;

  /// 圆角
  late GMMap<String, double> radiusMap;

  /// 字体样式
  late GMMap<String, FontFamily> fontFamilyMap;

  /// 阴影
  late GMMap<String, List<BoxShadow>> shadowMap;

  /// 间隔
  late GMMap<String, double> spacerMap;

  /// 映射关系
  late GMMap<String, String> refMap;

  /// 额外定义的结构
  late GMExtraThemeData? extraThemeData;

  GMThemeData({
    required this.name,
    required this.colorMap,
    required this.fontMap,
    required this.radiusMap,
    required this.fontFamilyMap,
    required this.shadowMap,
    required this.spacerMap,
    required this.refMap,
    this.extraThemeData,
  });

  /// 获取默认Data，一个App里只有一个，用于没有context的地方
  static GMThemeData defaultData({GMExtraThemeData? extraThemeData}) {
    _defaultThemeData ??=
        fromJson(_defaultThemeName, GMDefaultTheme.defaultThemeConfig, extraThemeData: extraThemeData) ??
            _emptyData(_defaultThemeName, extraThemeData: extraThemeData);

    return _defaultThemeData!;
  }

  /// 从父类拷贝
  GMThemeData copyWithGMThemeData(
    String name, {
    Map<String, Color>? colorMap,
    Map<String, Font>? fontMap,
    Map<String, double>? radiusMap,
    Map<String, FontFamily>? fontFamilyMap,
    Map<String, List<BoxShadow>>? shadowMap,
    Map<String, double>? marginMap,
    GMExtraThemeData? extraThemeData,
  }) {
    return copyWith(
        name: name,
        colorMap: colorMap,
        fontMap: fontMap,
        radiusMap: radiusMap,
        fontFamilyMap: fontFamilyMap,
        shadowMap: shadowMap,
        marginMap: marginMap,
        extraThemeData: extraThemeData) as GMThemeData;
  }

  @override
  ThemeExtension<GMThemeData> copyWith({
    String? name,
    Map<String, Color>? colorMap,
    Map<String, Font>? fontMap,
    Map<String, double>? radiusMap,
    Map<String, FontFamily>? fontFamilyMap,
    Map<String, List<BoxShadow>>? shadowMap,
    Map<String, double>? marginMap,
    GMExtraThemeData? extraThemeData,
  }) {
    var result = GMThemeData(
        name: name ?? 'default',
        colorMap: _copyMap<Color>(this.colorMap, colorMap),
        fontMap: _copyMap<Font>(this.fontMap, fontMap),
        radiusMap: _copyMap<double>(this.radiusMap, radiusMap),
        fontFamilyMap: _copyMap<FontFamily>(this.fontFamilyMap, fontFamilyMap),
        shadowMap: _copyMap<List<BoxShadow>>(this.shadowMap, shadowMap),
        spacerMap: _copyMap<double>(spacerMap, marginMap),
        refMap: _copyMap<String>(refMap, refMap),
        extraThemeData: extraThemeData ?? this.extraThemeData);
    return result;
  }

  /// 拷贝Map,防止内层
  GMMap<String, T> _copyMap<T>(GMMap<String, T> src, Map<String, T>? add) {
    var map = GMMap<String, T>(factory: () => src);

    src.forEach((key, value) {
      map[key] = value;
    });
    if (add != null) {
      map.addAll(add);
    }
    return map;
  }

  /// 创建空对象
  static GMThemeData _emptyData(String name, {GMExtraThemeData? extraThemeData}) {
    var refMap = GMMap<String, String>();
    return GMThemeData(
        name: name,
        colorMap: GMMap(factory: () => defaultData().colorMap, refs: refMap),
        fontMap: GMMap(factory: () => defaultData().fontMap, refs: refMap),
        radiusMap: GMMap(factory: () => defaultData().radiusMap, refs: refMap),
        fontFamilyMap: GMMap(factory: () => defaultData().fontFamilyMap, refs: refMap),
        shadowMap: GMMap(factory: () => defaultData().shadowMap, refs: refMap),
        spacerMap: GMMap(factory: () => defaultData().spacerMap, refs: refMap),
        refMap: refMap);
  }

  /// 解析配置的json文件为主题数据
  static GMThemeData? fromJson(String name, String themeJson,
      {var recoverDefault = false, GMExtraThemeData? extraThemeData}) {
    if (themeJson.isEmpty) {
      Log.e('TTheme', 'parse themeJson is empty');
      return null;
    }
    try {
      /// 要求json配置必须正确
      final themeConfig = json.decode(themeJson);
      if (themeConfig.containsKey(name)) {
        var theme = _emptyData(name);
        Map<String, dynamic> curThemeMap = themeConfig['$name'];

        /// 设置颜色
        Map<String, dynamic>? colorsMap = curThemeMap['color'];
        colorsMap?.forEach((key, value) {
          var color = toColor(value);
          if (color != null) {
            theme.colorMap[key] = color;
          }
        });

        /// 设置颜色
        Map<String, dynamic>? refMap = curThemeMap['ref'];
        refMap?.forEach((key, value) {
          theme.refMap[key] = value;
        });

        /// 设置字体尺寸
        Map<String, dynamic>? fontsMap = curThemeMap['font'];
        fontsMap?.forEach((key, value) {
          theme.fontMap[key] = Font.fromJson(value);
        });

        /// 设置圆角
        Map<String, dynamic>? cornersMap = curThemeMap['radius'];
        cornersMap?.forEach((key, value) {
          theme.radiusMap[key] = value.toDouble();
        });

        /// 设置字体
        Map<String, dynamic>? fontFamilyMap = curThemeMap['fontFamily'];
        fontFamilyMap?.forEach((key, value) {
          theme.fontFamilyMap[key] = FontFamily.fromJson(value);
        });

        /// 设置阴影
        Map<String, dynamic>? shadowMap = curThemeMap['shadow'];
        shadowMap?.forEach((key, value) {
          var list = <BoxShadow>[];
          (value as List).forEach((element) {
            list.add(BoxShadow(
              color: toColor(element['color']) ?? Colors.black,
              blurRadius: element['blurRadius'].toDouble(),
              spreadRadius: element['spreadRadius'].toDouble(),
              offset: Offset(element['offset']?['x'].toDouble() ?? 0, element['offset']?['y'].toDouble() ?? 0),
            ));
          });

          theme.shadowMap[key] = list;
        });

        /// 设置Margin
        Map<String, dynamic>? marginsMap = curThemeMap['margin'];
        marginsMap?.forEach((key, value) {
          theme.spacerMap[key] = value.toDouble();
        });

        if (extraThemeData != null) {
          extraThemeData.parse(name, curThemeMap);
          theme.extraThemeData = extraThemeData;
        }
        if (recoverDefault) {
          _defaultThemeData = theme;
        }
        return theme;
      } else {
        Log.e('TTheme', 'load theme error ,not found the theme with name:${name}');
        return null;
      }
    } catch (e) {
      Log.e('TTheme', 'parse theme data error:${e}');
      return null;
    }
  }

  Color? ofColor(
    String? key,
  ) {
    return colorMap[key];
  }

  Font? ofFont(String? key) {
    return fontMap[key];
  }

  double? ofCorner(
    String? key,
  ) {
    return radiusMap[key];
  }

  FontFamily? ofFontFamily(
    String? key,
  ) {
    return fontFamilyMap[key];
  }

  List<BoxShadow>? ofShadow(
    String? key,
  ) {
    return shadowMap[key];
  }

  T? ofExtra<T extends GMExtraThemeData>() {
    try {
      return extraThemeData as T;
    } catch (e) {
      Log.e('GMThemeData ofExtra error: $e');
    }
    return null;
  }

  @override
  ThemeExtension<GMThemeData> lerp(ThemeExtension<GMThemeData>? other, double t) {
    if (other is! GMThemeData) {
      return this;
    }
    return GMThemeData(
        name: other.name,
        colorMap: other.colorMap,
        fontMap: other.fontMap,
        radiusMap: other.radiusMap,
        fontFamilyMap: other.fontFamilyMap,
        shadowMap: other.shadowMap,
        spacerMap: other.spacerMap,
        refMap: other.refMap);
  }
}

/// 扩展主题数据
abstract class GMExtraThemeData {
  /// 解析json
  void parse(String name, Map<String, dynamic> curThemeMap);
}

typedef DefaultMapFactory = GMMap? Function();

/// 自定义Map
class GMMap<K, V> extends SplayTreeMap<K, V> {
  GMMap({this.factory, this.refs});
  DefaultMapFactory? factory;
  GMMap? refs;

  @override
  V? operator [](Object? key) {
    // return super[key];
    key = refs?[key] ?? key;
    var value = super[key];
    if (value != null) {
      return value;
    }
    var defaultValue = factory?.call()?.get(key);
    if (defaultValue is V) {
      return defaultValue;
    }
    return null;
  }

  V? get(Object? key) {
    return super[key];
  }
}
