import 'package:flutter/cupertino.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../annotation/demo.dart';
import '../base/example_widget.dart';

class GMTreeSelectPage extends StatefulWidget {
  const GMTreeSelectPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GMTreeSelectPageState();
}

class _GMTreeSelectPageState extends State<GMTreeSelectPage> {
  String? inputText;
  List<dynamic> values1 = [
    1,
    11,
  ];
  List<dynamic> values2 = [
    1,
    [11, 12, 13],
  ];
  List<dynamic> values3 = [1, 11, 111];

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(),
        desc: '适用于选择树形的数据结构',
        exampleCodeGroup: 'tree',
        backgroundColor: GMTheme.of(context).grayColor2,
        children: [
          ExampleModule(
            title: '组件类型',
            children: [
              ExampleItem(desc: '基础树形选择', builder: _buildDefaultTreeSelect),
              ExampleItem(desc: '多选树形选择', builder: _buildMultipleTreeSelect),
            ],
          ),
          ExampleModule(
            title: '组件状态',
            children: [
              ExampleItem(desc: '三级树形选择', builder: _buildThirdTreeSelect),
            ],
          ),
        ]);
  }

  @Demo(group: 'tree')
  Widget _buildDefaultTreeSelect(BuildContext context) {
    var options = <GMSelectOption>[];

    for (var i = 1; i <= 10; i++) {
      options.add(GMSelectOption(label: '选项$i', value: i, children: []));

      for (var j = 1; j <= 10; j++) {
        options[i - 1].children.add(
            GMSelectOption(label: '选项$i.$j', value: i * 10 + j, children: []));
      }
    }

    return GMTreeSelect(
      options: options,
      defaultValue: values1,
      onChange: (val, level) {
        print('$val, $level');
      },
    );
  }

  @Demo(group: 'tree')
  Widget _buildMultipleTreeSelect(BuildContext context) {
    var options = <GMSelectOption>[];

    for (var i = 1; i <= 10; i++) {
      options.add(GMSelectOption(label: '选项$i', value: i, children: []));

      for (var j = 1; j <= 10; j++) {
        options[i - 1].children.add(
            GMSelectOption(label: '选项$i.$j', value: i * 10 + j, children: []));
      }
    }

    return GMTreeSelect(
      options: options,
      defaultValue: values2,
      multiple: true,
      onChange: (val, level) {
        print('$val, $level');
      },
    );
  }

  @Demo(group: 'tree')
  Widget _buildThirdTreeSelect(BuildContext context) {
    var options = <GMSelectOption>[];

    for (var i = 1; i <= 10; i++) {
      options.add(GMSelectOption(label: '选项$i', value: i, children: []));

      for (var j = 1; j <= 10; j++) {
        options[i - 1].children.add(
            GMSelectOption(label: '选项$i.$j', value: i * 10 + j, children: []));

        for (var k = 1; k <= 10; k++) {
          options[i - 1].children[j - 1].children.add(
              GMSelectOption(label: '选项$i.$j.$k', value: i * 100 + j * 10 + k));
        }
      }
    }

    return GMTreeSelect(
      options: options,
      defaultValue: values3,
      onChange: (val, level) {
        print('$val, $level');
      },
    );
  }
}
