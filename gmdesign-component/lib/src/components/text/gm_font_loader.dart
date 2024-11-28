
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../gmdesign_flutter.dart';

/// 线上字体加载工具
class GMFontLoader{

  /// 缓存字体FontLoader,防止重复加载
  static final _record = <String,bool>{};

  /// 加载字体资源
  static Future<bool> load({required String name, required String fontFamilyUrl}) async {
    try {
      if(!(_record[name] ?? false)) {
        var fontLoader = FontLoader(name);

        fontLoader.addFont(Future(() async {
          var uri = Uri.parse(fontFamilyUrl);
          var bundle = NetworkAssetBundle(uri);
          return await bundle.load('');
        }));

        await fontLoader.load();
        _record[name] = true;
      }
      return true;
    } catch (e) {
      print('GMFontLoader load error, name: ${name}, fontFamilyUrl: $fontFamilyUrl}, e: $e');
    }
    return false;
  }
}

/// 懒加载FontWidget
class GMFontLoaderWidget extends StatefulWidget {
  const GMFontLoaderWidget({Key? key, required this.textWidget, required this.fontFamilyUrl}) : super(key: key);

  final GMText textWidget;

  /// FontFamily的下载地址
  final String fontFamilyUrl;

  @override
  State<GMFontLoaderWidget> createState() => _GMFontLoaderWidgetState();
}

class _GMFontLoaderWidgetState extends State<GMFontLoaderWidget> {
  bool fontFamilyLoaded = false;
  @override
  void initState() {
    super.initState();
    loadFont();
  }

  void loadFont() async {
    if ((widget.textWidget.fontFamily?.fontFamily.isNotEmpty ?? false)
        && widget.fontFamilyUrl.isNotEmpty) {
      try {
        if(await GMFontLoader.load(name: widget.textWidget.fontFamily!.fontFamily, fontFamilyUrl: widget.fontFamilyUrl)){
          setState(() {});
        }
      } catch (e) {
        print('GMFontLoader loadFont error, data: ${widget.textWidget.data}, fontFamily: ${widget.textWidget.fontFamilyUrl}, e: $e');
      }
    }

    fontFamilyLoaded = true;
  }

  @override
  Widget build(BuildContext context) {
    return GMText(widget.textWidget.data,
      font:widget.textWidget.font,
      fontWeight:widget.textWidget.fontWeight ?? FontWeight.w400,
      fontFamily:widget.textWidget.fontFamily,
      textColor:widget.textWidget.textColor,
      backgroundColor:widget.textWidget.backgroundColor,
      isTextThrough:widget.textWidget.isTextThrough ,
      lineThroughColor:widget.textWidget.lineThroughColor,
      package : widget.textWidget.package,
      forceVerticalCenter :widget.textWidget.forceVerticalCenter,
      style:widget.textWidget.style,
      strutStyle:widget.textWidget.strutStyle,
      textAlign:widget.textWidget.textAlign,
      textDirection:widget.textWidget.textDirection,
      locale:widget.textWidget.locale,
      softWrap:widget.textWidget.softWrap,
      overflow:widget.textWidget.overflow,
      textScaleFactor:widget.textWidget.textScaleFactor,
      maxLines:widget.textWidget.maxLines,
      semanticsLabel:widget.textWidget.semanticsLabel,
      textWidthBasis:widget.textWidget.textWidthBasis,
      textHeightBehavior:widget.textWidget.textHeightBehavior,
      isInFontLoader: true,
    );
  }
}