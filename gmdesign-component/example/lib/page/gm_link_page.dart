import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../annotation/demo.dart';
import '../base/example_widget.dart';

class GMLinkViewPage extends StatefulWidget {
  const GMLinkViewPage({Key? key}) : super(key: key);

  @override
  _GMLinkViewPageState createState() => _GMLinkViewPageState();
}

class _GMLinkViewPageState extends State<GMLinkViewPage> {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        backgroundColor: const Color(0xFFF0F2F5),
        title: tdTitle(),
        desc: '当功能使用图标即可表意清楚时，可使用纯图标悬浮按钮，例如：添加、发布。',
        exampleCodeGroup: 'link',
        children: [
          ExampleModule(title: '组件类型', children: [
            ExampleItem(desc: '基础文字链接', builder: _basicTypeBasic),
            ExampleItem(desc: '下划线文字链接', builder: _withUnderline),
            ExampleItem(desc: '前置图标文字链接', builder: _withPrefixIcon),
            ExampleItem(desc: '后置图标文字链接', builder: _withSuffixIcon),
          ]),
          ExampleModule(title: '组件状态', children: [
            ExampleItem(desc: '不同主题', builder: _buildLinkStats),
            ExampleItem(desc: '禁用状态', builder: _buildDisabledLinkStats)
          ]),
          ExampleModule(
              title: '组件样式',
              children: [ExampleItem(desc: '链接尺寸', builder: _buildLinkSizes)]),
        ]);
  }

  @Demo(group: 'link')
  Widget _basicTypeBasic(BuildContext context) {
    return Container(
        color: GMTheme.of(context).whiteColor1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildLinksWithType(GMLinkType.basic),
        ));
  }

  List<Widget> _buildLinksWithType(GMLinkType type) {
    return [
      GMLink(
        label: '跳转链接',
        style: GMLinkStyle.primary,
        type: type,
        size: GMLinkSize.small,
      ),
      const SizedBox(
        height: 48,
        width: 80,
      ),
      GMLink(
        label: '跳转链接',
        style: GMLinkStyle.defaultStyle,
        type: type,
        size: GMLinkSize.small,
      ),
      const SizedBox(
        height: 16,
      ),
    ];
  }

  @Demo(group: 'link')
  Widget _withUnderline(BuildContext context) {
    return Container(
        color: GMTheme.of(context).whiteColor1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildLinksWithType(GMLinkType.withUnderline),
        ));
  }

  @Demo(group: 'link')
  Widget _withSuffixIcon(BuildContext context) {
    return Container(
        color: GMTheme.of(context).whiteColor1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildLinksWithType(GMLinkType.withSuffixIcon),
        ));
  }

  @Demo(group: 'link')
  Widget _withPrefixIcon(BuildContext context) {
    return Container(
        color: GMTheme.of(context).whiteColor1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildLinksWithType(GMLinkType.withPrefixIcon),
        ));
  }

  @Demo(group: 'link')
  Widget _buildLinkStats(BuildContext context) {
    return _buildLinkWithStyles(GMLinkState.normal);
  }

  @Demo(group: 'link')
  Widget _buildDisabledLinkStats(BuildContext context) {
    return _buildLinkWithStyles(GMLinkState.disabled);
  }

  Column _buildLinkWithStyles(GMLinkState state) {
    return Column(
      children: [
        Container(
            color: GMTheme.of(context).whiteColor1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLinkWithTypeAndState(GMLinkStyle.primary, state),
                const SizedBox(height: 48, width: 50),
                _buildLinkWithTypeAndState(GMLinkStyle.defaultStyle, state),
                const SizedBox(height: 48, width: 50),
                _buildLinkWithTypeAndState(GMLinkStyle.danger, state),
              ],
            )),
        const SizedBox(height: 16),
        Container(
            color: GMTheme.of(context).whiteColor1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLinkWithTypeAndState(GMLinkStyle.warning, state),
                const SizedBox(height: 48, width: 50),
                _buildLinkWithTypeAndState(GMLinkStyle.success, state),
              ],
            )),
      ],
    );
  }

  GMLink _buildLinkWithTypeAndState(GMLinkStyle style, GMLinkState state) {
    return GMLink(
      label: '跳转链接',
      style: style,
      state: state,
      type: GMLinkType.withSuffixIcon,
      size: GMLinkSize.small,
    );
  }

  @Demo(group: 'link')
  Widget _buildLinkSizes(BuildContext context) {
    return Container(
        color: GMTheme.of(context).whiteColor1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLinkWithSizeAndStyle(GMLinkStyle.primary, GMLinkSize.small),
            const SizedBox(height: 48, width: 40),
            _buildLinkWithSizeAndStyle(GMLinkStyle.primary, GMLinkSize.medium),
            const SizedBox(height: 48, width: 40),
            _buildLinkWithSizeAndStyle(GMLinkStyle.primary, GMLinkSize.large),
          ],
        ));
  }

  GMLink _buildLinkWithSizeAndStyle(GMLinkStyle style, GMLinkSize size) {
    var s = size == GMLinkSize.small
        ? 'S'
        : (size == GMLinkSize.medium ? 'M' : 'L');
    return GMLink(
      label: '$s号链接',
      style: style,
      state: GMLinkState.normal,
      type: GMLinkType.withSuffixIcon,
      size: size,
    );
  }
}
