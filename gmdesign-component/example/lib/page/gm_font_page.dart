import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../../annotation/demo.dart';
import '../../base/example_widget.dart';

/// 字体示例页面
class GMFontPage extends StatelessWidget {
  const GMFontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPaintBaselinesEnabled = true;
    return ExamplePage(padding: const EdgeInsets.all(8), title: tdTitle(context), exampleCodeGroup: 'fonts', children: [
      ExampleModule(title: 'Token', children: [
        ExampleItem(
            ignoreCode: true,
            builder: (context) {
              var children = <Widget>[];
              GMTheme.of(context).fontMap.forEach((key, value) {
                children.add(Container(
                  child: GMText(
                    '@$key:${value.size.toInt()}px',
                    font: value,

                    /// link类型的示例添加下划线
                    style: TextStyle(
                        decoration: key.contains('Link') ? TextDecoration.underline : null,
                        decorationColor: GMTheme.of(context).fontGyColor1),
                  ),
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: GMTheme.of(context).grayColor4, width: 0.5))),
                ));
              });
              return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: children,
              );
            })
      ]),
    ], test: [
      ExampleItem(
          ignoreCode: true,
          builder: (context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GMText('使用主题字体:fontBodySmall', font: GMTheme.of(context).fontBodySmall),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GMText('使用主题字体:fontBodyLarge', font: GMTheme.of(context).fontBodyLarge),
                ),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: GMText(
                      '不使用数字字体:1234567890abcd',
                      font: GMTheme.defaultData().fontTitleSmall,
                      textColor: GMTheme.of(context).brandColor6,
                    )),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: GMText(
                      '使用数字字体:1234567890abcd',
                      font: GMTheme.defaultData().fontTitleSmall,
                      textColor: GMTheme.of(context).brandColor6,
                      fontFamily: GMTheme.defaultData().numberFontFamily,
                    )),
              ],
            );
          })
    ]);
  }
}
