import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';
import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMResultPage extends StatefulWidget {
  const GMResultPage({Key? key}) : super(key: key);

  @override
  State<GMResultPage> createState() => _GMResultPageState();
}

class _GMResultPageState extends State<GMResultPage> {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Result 结果',
      desc: '反馈结果状态。',
      exampleCodeGroup: 'result',
      children: [
        ExampleModule(title: '组件类型', children: [
          ExampleItem(
              desc: '基础结果', ignoreCode: true, builder: _buildBasicResult),
          ExampleItem(
              desc: '带描述的结果',
              ignoreCode: true,
              builder: _buildResultWithDescription),
          ExampleItem(
              desc: '自定义结果', ignoreCode: true, builder: _buildCustomResult),
          ExampleItem(
              desc: '页面示例', ignoreCode: true, builder: _buildPageExample),
        ]),
      ],
    );
  }

  Widget _buildBasicResult(BuildContext context) {
    return Column(
      children: [
        CodeWrapper(
          builder: _buildBasicResultSuccess,
        ),
        const SizedBox(height: 48),
        CodeWrapper(
          builder: _buildBasicResultError,
        ),
        const SizedBox(height: 48),
        CodeWrapper(
          builder: _buildBasicResultWarning,
        ),
        const SizedBox(height: 48),
        CodeWrapper(
          builder: _buildBasicResultDefault,
        ),
      ],
    );
  }

  Widget _buildResultWithDescription(BuildContext context) {
    return Column(
      children: [
        CodeWrapper(
          builder: _buildResultWithDescriptionSuccess,
        ),
        const SizedBox(height: 48),
        CodeWrapper(
          builder: _buildResultWithDescriptionError,
        ),
        const SizedBox(height: 48),
        CodeWrapper(
          builder: _buildResultWithDescriptionWarning,
        ),
        const SizedBox(height: 48),
        CodeWrapper(
          builder: _buildResultWithDescriptionDefault,
        ),
      ],
    );
  }

  Widget _buildCustomResult(BuildContext context) {
    return CodeWrapper(
      builder: _buildCustomResultContent,
    );
  }

  Widget _buildPageExample(BuildContext context) {
    return GMButton(
      text: '页面示例',
      theme: GMButtonTheme.primary,
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      isBlock: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text('Result 结果'),
              ),
              body: Column(
                children: [
                  const SizedBox(height: 48),
                  const GMResult(
                    title: '成功状态',
                    theme: GMResultTheme.success,
                    description: '描述文字',
                  ),
                  const SizedBox(height: 48),
                  GMButton(
                    text: '返回',
                    theme: GMButtonTheme.primary,
                    size: GMButtonSize.large,
                    type: GMButtonType.outline,
                    isBlock: true,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @Demo(group: 'result')
  GMResult _buildBasicResultSuccess(BuildContext context) {
    return const GMResult(
      title: '成功状态',
      theme: GMResultTheme.success,
    );
  }

  @Demo(group: 'result')
  GMResult _buildBasicResultError(BuildContext context) {
    return const GMResult(
      title: '失败状态',
      theme: GMResultTheme.error,
    );
  }

  @Demo(group: 'result')
  GMResult _buildBasicResultWarning(BuildContext context) {
    return const GMResult(
      title: '警示状态',
      theme: GMResultTheme.warning,
    );
  }

  @Demo(group: 'result')
  GMResult _buildBasicResultDefault(BuildContext context) {
    return const GMResult(
      title: '默认状态',
      theme: GMResultTheme.defaultTheme,
    );
  }

  @Demo(group: 'result')
  GMResult _buildResultWithDescriptionSuccess(BuildContext context) {
    return const GMResult(
      title: '成功状态',
      theme: GMResultTheme.success,
      description: '描述文字',
    );
  }

  @Demo(group: 'result')
  GMResult _buildResultWithDescriptionError(BuildContext context) {
    return const GMResult(
      title: '失败状态',
      theme: GMResultTheme.error,
      description: '描述文字',
    );
  }

  @Demo(group: 'result')
  GMResult _buildResultWithDescriptionWarning(BuildContext context) {
    return const GMResult(
      title: '警示状态',
      theme: GMResultTheme.warning,
      description: '描述文字',
    );
  }

  @Demo(group: 'result')
  GMResult _buildResultWithDescriptionDefault(BuildContext context) {
    return const GMResult(
      title: '默认状态',
      theme: GMResultTheme.defaultTheme,
      description: '描述文字',
    );
  }

  @Demo(group: 'result')
  GMResult _buildCustomResultContent(BuildContext context) {
    return GMResult(
      title: '自定义结果',
      icon: Image.asset('assets/img/illustration.png'),
      description: '描述文字',
    );
  }
}
