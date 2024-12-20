import 'package:flutter/material.dart';

/// 组件库相关的，只需要引入这个文件，里面暴露td前缀所有需要的类
import 'package:gmdesign_flutter/gmdesign_flutter.dart';
import '../annotation/demo.dart';
import '../base/example_widget.dart';

/// 主题颜色示例页
class GMThemeColorsPage extends StatefulWidget {
  const GMThemeColorsPage({Key? key}) : super(key: key);

  @override
  _GMThemeColorsPageState createState() => _GMThemeColorsPageState();
}

class _GMThemeColorsPageState extends State<GMThemeColorsPage> {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: tdTitle(),
      desc: '点击标题栏右上角图标可查看使用示例代码',
      exampleCodeGroup: 'theme',
      children: [
        ExampleModule(title: '颜色示例', children: [
          ExampleItem(
              desc: '功能色', builder: _buildFunctionColor, ignoreCode: true),
          ExampleItem(
              desc: '文字&图标颜色', builder: _buildTextColor, ignoreCode: true),
          ExampleItem(desc: '中性色板', builder: _buildOtherColor, ignoreCode: true)
        ])
      ],
      test: [
        ExampleItem(builder: _buildDefaultTheme),
        ExampleItem(builder: _buildCustomTheme)
      ],
    );
  }

  var brandMap = <String, Color>{};
  var errorMap = <String, Color>{};
  var warningMap = <String, Color>{};
  var successMap = <String, Color>{};
  var fontMap = <String, Color>{};
  var grayMap = <String, Color>{};

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async{


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      GMTheme.of(context).colorMap.forEach((key, value) {
        if (key.startsWith('brand')) {
          brandMap[key] = value;
        } else if (key.startsWith('error')) {
          errorMap[key] = value;
        } else if (key.startsWith('warning')) {
          warningMap[key] = value;
        } else if (key.startsWith('success')) {
          successMap[key] = value;
        } else if (key.startsWith('font')) {
          fontMap[key] = value;
        } else {
          grayMap[key] = value;
        }
      });

      GMTheme.of(context).refMap.forEach((key, value) {
        var color = GMTheme.of(context).colorMap[key];
        if(color == null){
          return;
        }
        if (key.startsWith('brand')) {
          brandMap[key] = color;
        } else if (key.startsWith('error')) {
          errorMap[key] = color;
        } else if (key.startsWith('warning')) {
          warningMap[key] = color;
        } else if (key.startsWith('success')) {
          successMap[key] = color;
        } else if (key.startsWith('font')) {
          fontMap[key] = color;
        } else {
          grayMap[key] = color;
        }
      });
      setState(() {

      });
    });
  }

  @Demo(group: 'theme')
  Widget _buildDefaultTheme(BuildContext context) {
    // 通过GMTheme.of(context).xxx使用公共主题属性
    return Container(
      margin: EdgeInsets.all(GMTheme.of(context).spacer8), // 间隔
      decoration: BoxDecoration(
        color: GMTheme.of(context).grayColor1, // 颜色
        borderRadius:
            BorderRadius.circular(GMTheme.of(context).radiusDefault), // 圆角
        boxShadow: GMTheme.of(context).shadowsBase, // 阴影
      ),
      child: GMText(
        '使用外层默认主题',
        font: GMTheme.of(context).fontBodyLarge, // 字体，业务方使用时，
        textColor:
            GMTheme.of(context).brandNormalColor, // 颜色，AS中点击颜色可查看具体设置和显示效果
      ),
    );
  }

  @Demo(group: 'theme')
  Widget _buildCustomTheme(BuildContext context) {
    /// 开启多主题
    GMTheme.needMultiTheme(true);
    /// 此处替换主题
    return GMTheme(
        // 替换fonts和colors，其他主题从父类拷贝
        data: GMTheme.of(context).copyWithGMThemeData('custom', fontMap: {
          'fontBodyLarge': Font(size: 40, lineHeight: 80),
        }, colorMap: {
          'brandNormalColor': Colors.red
        }),
        // 不能直接在此处使用contxt，这里虽然被包裹在TGTheme中，但是context未更新，因此阿不到最新数据
        child: const TestWidget());

    // /// 测试控件
// class TestWidget extends StatelessWidget {
//   const TestWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           GMText(
//             '使用内层赋值主题',
//             font: GMTheme.of(context).fontBodyLarge, //明确使用内层主题，必须传context
//             textColor:
//                 GMTheme.of(context).brandNormalColor, // 明确使用内层主题，必须传context
//           ),
//           GMText(
//             '使用内层不赋值主题',
//             font: GMTheme.of(context).fontTitleExtraLarge, //明确使用内层主题，必须传context
//             textColor:
//                 GMTheme.of(context).successNormalColor, // 明确使用内层主题，必须传context
//           ),
//           GMText(
//             '使用默认主题',
//             font: GMTheme.defaultData().fontBodyLarge, //不传context，使用默认主题，此处是外层的主题
//             textColor: GMTheme.defaultData().brandNormalColor,
//           ),
//         ],
//       ),
//     );
//   }
// }
  }

  Widget _buildFunctionColor(BuildContext context) {
    var spList = ['Light', 'Focus', 'Disabled', 'Hover', 'Normal', 'Click'];
    var functionList = [
      'brand',
      'error',
      'warning',
      'success',
    ];
    if (brandMap.length == errorMap.length &&
        warningMap.length == successMap.length &&
        brandMap.length == warningMap.length) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brandMap.length * 4,
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            var type = index ~/ brandMap.length;
            index = index % brandMap.length;
            var function = functionList[type];
            var map = {};
            if(type == 0){
              map = brandMap;
            } else if(type == 1){
              map = errorMap;
            } else if (type == 2){
              map = warningMap;
            } else if(type == 3){
              map = successMap;
            }
            if (index < 10) {
              return Container(
                color: GMTheme.of(context)
                    .colorMap['${function}Color${index + 1}'],
                child: GMText('${function}Color${index + 1}'),
              );
            } else {
              return Container(
                color: map.values.elementAt(index),
                child: GMText(map.keys.elementAt(index)),
              );
            }
          });
    } else {
      return GMText(
        '功能色数量不一样',
        textColor: GMTheme.of(context).errorNormalColor,
      );
    }
  }

  Widget _buildTextColor(BuildContext context) {
    var textList = ['Gy', 'Wh'];
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: fontMap.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var light = (index - 3).abs() < 2;
          var type = index ~/ 4;
          index = index % 4;
          var function = textList[type];
          return Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            color: type == 0 ? Colors.white : Colors.black,
            child: Container(
              color: GMTheme.of(context)
                  .colorMap['font${function}Color${index + 1}'],
              child: GMText(
                'font${function}Color${index + 1}',
                textColor: light ? Colors.black : Colors.white,
              ),
            ),
          );
        });
  }

  Widget _buildOtherColor(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: grayMap.length,
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var light = index < 6;
          if (index == 0) {
            return Container(
              color: GMTheme.of(context).colorMap['whiteColor1'],
              child: const GMText('whiteColor1'),
            );
          } else {
            return Container(
              color: GMTheme.of(context).colorMap['grayColor${index}'],
              child: GMText(
                'grayColor${index}',
                textColor: light ? Colors.black : Colors.white,
              ),
            );
          }
        });
  }
}

/// 测试控件
class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GMText(
            '使用内层赋值主题',
            font: GMTheme.of(context).fontBodyLarge, //明确使用内层主题，必须传context
            textColor:
                GMTheme.of(context).brandNormalColor, // 明确使用内层主题，必须传context
          ),
          GMText(
            '使用内层不赋值主题',
            font: GMTheme.of(context).fontTitleExtraLarge, //明确使用内层主题，必须传context
            textColor:
                GMTheme.of(context).successNormalColor, // 明确使用内层主题，必须传context
          ),
          const GMButton(
            text:  '使用内层赋值主题',
            theme: GMButtonTheme.primary,
          ),
          GMText(
            '使用默认主题',
            font:
                GMTheme.defaultData().fontBodyLarge, //不传context，使用默认主题，此处是外层的主题
            textColor: GMTheme.defaultData().brandNormalColor,
          ),
        ],
      ),
    );
  }
}

/// 扩展主题属性示例
extension TGLayouts on GMThemeData {
  /// 因为扩展中不能声明字段，只能借助GMExtraThemeData
  double get layout1 => ofExtra<LayoutExtra>()?.layouts['layout1'] ?? 0;

  Data2? get data2 => ofExtra<LayoutExtra>()?.data2;
}

class LayoutExtra extends GMExtraThemeData {
  Map<String, double> layouts = {};
  Data2? data2;

  @override
  void parse(String name, Map<String, dynamic> curThemeMap) {
    // TODO: implement parse
  }
}

/// 二级扩展测试
class Data2 {}

extension Data2Ext on Data2 {
  String get test => 'test';
}

void test() {
  GMTheme.of(null).layout1;
  GMTheme.of(null).data2!.test;
}
