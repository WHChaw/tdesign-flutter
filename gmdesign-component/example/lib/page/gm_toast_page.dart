import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';
import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMToastPage extends StatefulWidget {
  const GMToastPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GMToastPageState();
}

class _GMToastPageState extends State<GMToastPage> {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(),
        desc: '用于轻量级反馈或提示，不会打断用户操作。',
        exampleCodeGroup: 'toast',
        children: [
          ExampleModule(title: '组件类型', children: [
            ExampleItem(desc: '纯文字', builder: _textToast),
            ExampleItem(desc: '多行文字', builder: _multipleToast),
            ExampleItem(desc: '带横向图标', builder: _horizontalIconToast),
            ExampleItem(desc: '带竖向图标', builder: _verticalIconToast),
            ExampleItem(desc: '加载状态', builder: _loadingToast),
            ExampleItem(desc: '加载状态(无文字)', builder: _loadingWithoutTextToast),
            ExampleItem(desc: '停止加载', builder: _dismissLoadingToast),
          ]),
          ExampleModule(title: '组件状态', children: [
            ExampleItem(desc: '成功提示', builder: _successToast),
            ExampleItem(desc: '成功提示(竖向)', builder: _successVerticalToast),
            ExampleItem(desc: '警告提示', builder: _warningToast),
            ExampleItem(desc: '警告提示(竖向)', builder: _warningVerticalToast),
            ExampleItem(desc: '失败提示', builder: _failToast),
            ExampleItem(desc: '失败提示(竖向)', builder: _failVerticalToast),
          ])
        ],
      test: [
        ExampleItem(desc: '禁止滚动+点击', builder: _preventTapToast),
      ],
    );
  }

  @Demo(group: 'toast')
  Widget _textToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showText('轻提示文字内容', context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '纯文字',
    );
  }

  @Demo(group: 'toast')
  Widget _multipleToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showText('最多一行展示十个汉字宽度限制最多不超过三行文字', context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '多行文字',
    );
  }

  @Demo(group: 'toast')
  Widget _horizontalIconToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showIconText('带横向图标',
            icon: GMIcons.check_circle, context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '带横向图标',
    );
  }

  @Demo(group: 'toast')
  Widget _verticalIconToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showIconText('带竖向图标',
            icon: GMIcons.check_circle,
            direction: IconTextDirection.vertical,
            context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '带竖向图标',
    );
  }

  @Demo(group: 'toast')
  Widget _loadingToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showLoading(context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '加载状态',
    );
  }

  @Demo(group: 'toast')
  Widget _loadingWithoutTextToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showLoadingWithoutText(context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '加载状态（无文案）',
    );
  }

  @Demo(group: 'toast')
  Widget _dismissLoadingToast(BuildContext context) {
    return const GMButton(
      onTap: GMToast.dismissLoading,
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '停止加载',
    );
  }

  @Demo(group: 'toast')
  Widget _successToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showSuccess('成功文案',context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '成功提示',
    );
  }

  @Demo(group: 'toast')
  Widget _successVerticalToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showSuccess('成功文案',
            direction: IconTextDirection.vertical, context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '成功提示(竖向)',
    );
  }

  @Demo(group: 'toast')
  Widget _warningToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showWarning('警告文案',
            direction: IconTextDirection.horizontal, context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '警告提示',
    );
  }

  @Demo(group: 'toast')
  Widget _warningVerticalToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showWarning('警告文案',
            direction: IconTextDirection.vertical, context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '警告提示(竖向)',
    );
  }

  @Demo(group: 'toast')
  Widget _failToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showFail('失败文案',
            direction: IconTextDirection.horizontal, context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '失败提示',
    );
  }

  @Demo(group: 'toast')
  Widget _failVerticalToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showFail('失败文案',
            direction: IconTextDirection.vertical, context: context);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '失败提示(竖向)',
    );
  }

  @Demo(group: 'toast')
  Widget _preventTapToast(BuildContext context) {
    return GMButton(
      onTap: () {
        GMToast.showText('轻提示文字内容',
            context: context, preventTap: true);
      },
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      isBlock: true,
      text: '禁止滚动+点击',
    );
  }
}
