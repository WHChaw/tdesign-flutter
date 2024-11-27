import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../../annotation/demo.dart';
import '../../base/example_widget.dart';

class GMTextPage extends StatelessWidget {
  const GMTextPage({Key? key}) : super(key: key);

  final exampleTxt = '文本Text';

  @override
  Widget build(BuildContext context) {
    // debugPaintBaselinesEnabled = true;
    return ExamplePage(
      padding: const EdgeInsets.all(8),
      title: tdTitle(context),
      exampleCodeGroup: 'text',
      children: [
        ExampleModule(title: '使用示例', children: [
          ExampleItem(desc: '系统Text:', builder: _buildSystemText),
          ExampleItem(desc: '普通GMText:', builder: _buildNormalGMText),
          ExampleItem(desc: '指定常用属性:', builder: _buildGeneralProp),
          ExampleItem(
              desc: 'style覆盖textColor,不覆盖font:',
              builder: _buildStyleCoverColor),
          ExampleItem(
              desc: 'style覆盖textColor和font:',
              builder: _buildStyleCoverColorAndFont),
          ExampleItem(desc: 'GMText.rich测试:', builder: _buildRichText),
          ExampleItem(desc: '获取系统Text:', builder: _getSystemText),
          ExampleItem(
              desc: '中文居中:（带有英文可能不居中）', builder: _buildVerticalCenterText),
          ExampleItem(desc: '自定义内部padding:', builder: _buildCustomPaddingText),
        ]),
      ],
      test: [
        ExampleItem(
            desc: '中文居中-系统字体',
            builder: (context){
          return Container(
            color: GMTheme.of(context).brandFocusColor,
            child: Text(exampleTxt),
          );
        }),
        ExampleItem(
            desc: '中文居中-GM字体',
            builder: (context){
          return Container(
            color: GMTheme.of(context).brandFocusColor,
            child: GMText(exampleTxt, forceVerticalCenter: true,),
          );
        }),
      ],
    );
  }

  @Demo(group: 'text')
  Widget _buildNormalGMText(BuildContext context) {
    return GMText(
      exampleTxt,
    );
  }

  @Demo(group: 'text')
  Widget _buildSystemText(BuildContext context) {
    return Text(
      exampleTxt,
    );
  }

  @Demo(group: 'text')
  Widget _buildGeneralProp(BuildContext context) {
    return GMText(
      exampleTxt,
      font: GMTheme.of(context).fontHeadlineLarge,
      textColor: GMTheme.of(context).brandNormalColor,
      backgroundColor: GMTheme.of(context).brandFocusColor,
    );
  }

  @Demo(group: 'text')
  Widget _buildStyleCoverColor(BuildContext context) {
    return GMText(
      exampleTxt,
      font: GMTheme.of(context).fontBodyLarge,
      textColor: GMTheme.of(context).brandNormalColor,
      style: TextStyle(color: GMTheme.of(context).errorNormalColor),
    );
  }

  @Demo(group: 'text')
  Widget _buildStyleCoverColorAndFont(BuildContext context) {
    return GMText(
      exampleTxt,
      font: GMTheme.of(context).fontBodyLarge,
      textColor: GMTheme.of(context).brandNormalColor,
    );
  }

  @Demo(group: 'text')
  Widget _buildRichText(BuildContext context) {
    return GMText.rich(
      TextSpan(children: [
        GMTextSpan(
            text: 'GMTextSpan1',
            font: GMTheme.of(context).fontTitleExtraLarge,
            textColor: GMTheme.of(context).warningNormalColor,
            isTextThrough: true,
            lineThroughColor: GMTheme.of(context).brandNormalColor,
            style: TextStyle(color: GMTheme.of(context).errorNormalColor)),
        TextSpan(
            text: 'TextSpan2',
            style: TextStyle(
                fontSize: 14, color: GMTheme.of(context).brandNormalColor)),
        const WidgetSpan(
            child: Icon(
          GMIcons.setting,
          size: 24,
        )),
      ]),
      font: GMTheme.of(context).fontBodyLarge,
      textColor: GMTheme.of(context).brandNormalColor,
      style:
          TextStyle(color: GMTheme.of(context).errorNormalColor, fontSize: 32),
    );
  }

  @Demo(group: 'text')
  Widget _getSystemText(BuildContext context) {
    return GMText(
      exampleTxt,
      backgroundColor: GMTheme.of(context).brandFocusColor,
    ).getRawText(context: context);
  }

  @Demo(group: 'text')
  Widget _buildVerticalCenterText(BuildContext context) {
    return GMText(
      '中华人民共和国腾讯科技',
      // font: Font(size: 100, lineHeight: 100),
      forceVerticalCenter: true,
      backgroundColor: GMTheme.of(context).brandFocusColor,
    );
  }

  @Demo(group: 'text')
  Widget _buildCustomPaddingText(BuildContext context) {
    return GMTextConfiguration(
      paddingConfig: CustomTextPaddingConfig(),
      child: const CustomPaddingText(),
    );
  }
}

/// 自定义控件，内部的context可拿到外部GMTextConfiguration的配置信息
class CustomPaddingText extends StatelessWidget {
  const CustomPaddingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GMText(
          '中华人民共和国腾讯科技fgjpqy',
          forceVerticalCenter: true,
          backgroundColor: GMTheme.of(context).brandFocusColor,
        ),
        GMText(
          'English',
          font: GMTheme.of(context).fontHeadlineLarge,
          forceVerticalCenter: true,
          backgroundColor: GMTheme.of(context).brandFocusColor,
        ),
      ],
    );
  }
}

/// 重写内部padding方法
class CustomTextPaddingConfig extends GMTextPaddingConfig {
  @override
  EdgeInsetsGeometry getPadding(String? data, double fontSize, double height) {
    var supperPadding = super.getPadding(data, fontSize, height);
    return EdgeInsets.only(left: 30, top: supperPadding.vertical.toDouble());
  }
}
