import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../annotation/demo.dart';
import '../base/example_widget.dart';

///
/// GMSwitchPage演示
///
class GMSwitchPage extends StatefulWidget {
  const GMSwitchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GMSwitchPageState();
  }
}

class GMSwitchPageState extends State<GMSwitchPage> {
  @override
  Widget build(BuildContext context) {
    var current = ExamplePage(
        title: tdTitle(),
        exampleCodeGroup: 'switch',
        desc: '用于控制某个功能的开启和关闭。',
        children: [
          ExampleModule(
            title: '组件类型',
            children: [
              ExampleItem(desc: '基础开关', builder: _buildSwitchWithBase),
              ExampleItem(desc: '带描述开关', builder: _buildSwitchWithText),
              ExampleItem(builder: _buildSwitchWithIcon),
              ExampleItem(desc: '自定义颜色开关', builder: _buildSwitchWithColor),
            ],
          ),
          ExampleModule(title: '组件状态', children: [
            ExampleItem(desc: '加载状态', builder: _buildSwitchWithLoadingOff),
            ExampleItem(builder: _buildSwitchWithLoadingOn),
            ExampleItem(desc: '禁用状态', builder: _buildSwitchWithDisableOff),
            ExampleItem(builder: _buildSwitchWithDisableOn),
          ]),
          ExampleModule(title: '组件样式', children: [
            ExampleItem(desc: '开关尺寸', builder: _buildSwitchWithSizeLarge),
            ExampleItem(builder: _buildSwitchWithSizeMed),
            ExampleItem(builder: _buildSwitchWithSizeSmall),
          ]),
        ],
    test: [
      ExampleItem(desc: '自定义开关文案-通常只支持一个字符,超出部分无法展示', builder: _customText),
    ],);
    return current;
  }

  Widget demoRow(
    BuildContext context,
    String? title, {
    String? desc,
    bool on = true,
    bool enable = true,
    Color? trackOnColor,
    Color? trackOffColor,
    Color? thumbContentOnColor,
    Color? thumbContentOffColor,
    GMSwitchSize? size,
    GMSwitchType? type,
  }) {
    final theme = GMTheme.of(context);
    Widget current = Row(
      children: [
        Expanded(
            child: GMText(
          title,
          textColor: theme.fontGyColor1,
        )),
        GMText(
          desc ?? '',
          textColor: theme.grayColor6,
        ),
        SizedBox(
          child: _buildSwitch(
              on: on,
              enable: enable,
              trackOnColor: trackOnColor,
              trackOffColor: trackOffColor,
              thumbContentOnColor: thumbContentOnColor,
              thumbContentOffColor: thumbContentOffColor,
              size: size,
              type: type),
        )
      ],
    );
    current = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: current,
          ),
          color: Colors.white,
        ),
        height: 56,
      ),
    );
    return current;
  }

  /// 每一项的封装
  @Demo(group: 'switch')
  Widget _buildItem(BuildContext context, Widget switchItem,
      {String? title, String? desc}) {
    final theme = GMTheme.of(context);
    Widget current = Row(
      children: [
        Expanded(
            child: GMText(
          title ?? '',
          textColor: theme.fontGyColor1,
        )),
        GMText(
          desc ?? '',
          textColor: theme.grayColor6,
        ),
        SizedBox(child: switchItem)
      ],
    );
    current = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: current,
          ),
          color: Colors.white,
        ),
        height: 56,
      ),
    );
    return Column(mainAxisSize: MainAxisSize.min, children: [current]);
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithBase(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(),
      title: '基础开关',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithText(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(isOn: true, type: GMSwitchType.text),
      title: '带文字开关',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithIcon(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(isOn: true, type: GMSwitchType.icon),
      title: '带图标开关',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithColor(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(isOn: true, trackOnColor: Colors.green),
      title: '自定义颜色开关',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithLoadingOff(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(
        isOn: false,
        type: GMSwitchType.loading,
      ),
      title: '加载状态',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithLoadingOn(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(
        isOn: true,
        type: GMSwitchType.loading,
      ),
      title: '加载状态',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithDisableOff(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(
        enable: false,
        isOn: false,
      ),
      title: '禁用状态',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithDisableOn(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(
        enable: false,
        isOn: true,
      ),
      title: '禁用状态',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithSizeLarge(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(
        isOn: true,
        size: GMSwitchSize.large,
      ),
      title: '大尺寸32',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithSizeMed(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(
        isOn: true,
        size: GMSwitchSize.medium,
      ),
      title: '中尺寸28',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitchWithSizeSmall(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(
        isOn: true,
        size: GMSwitchSize.small,
      ),
      title: '小尺寸24',
    );
  }

  @Demo(group: 'switch')
  Widget _buildSwitch({
    bool on = true,
    bool enable = true,
    Color? trackOnColor,
    Color? trackOffColor,
    Color? thumbContentOnColor,
    Color? thumbContentOffColor,
    GMSwitchSize? size,
    GMSwitchType? type,
  }) {
    return GMSwitch(
      isOn: on,
      trackOnColor: trackOnColor,
      trackOffColor: trackOffColor,
      thumbContentOnColor: thumbContentOnColor,
      thumbContentOffColor: thumbContentOffColor,
      enable: enable,
      size: size,
      type: type,
    );
  }

  @Demo(group: 'switch')
  Widget _customText(BuildContext context) {
    return _buildItem(
      context,
      const GMSwitch(
        type: GMSwitchType.text,
        openText: '1111',
        closeText: '—',
      ),
      title: '基础开关',
    );
  }
}
