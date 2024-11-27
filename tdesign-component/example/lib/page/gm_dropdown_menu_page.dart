import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMDropdownMenuPage extends StatelessWidget {
  const GMDropdownMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: GMTheme.of(context).grayColor2,
        child: ExamplePage(
          title: tdTitle(context),
          desc: '菜单呈现数个并列的选项类目，用于整个页面的内容筛选，由菜单面板和菜单选项组成。',
          exampleCodeGroup: 'dropdownMenu',
          children: [
            ExampleModule(title: '组件类型', children: [
              ExampleItem(
                ignoreCode: true,
                desc: '单选下拉菜单',
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildDownSimple);
                },
              ),
              ExampleItem(
                ignoreCode: true,
                desc: '分栏下拉菜单',
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildDownChunk);
                },
              ),
              ExampleItem(
                ignoreCode: true,
                desc: '向上展开',
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildUp);
                },
              ),
            ]),
            ExampleModule(title: '组件状态', children: [
              ExampleItem(
                ignoreCode: true,
                desc: '禁用状态',
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildDisabled);
                },
              ),
              ExampleItem(
                ignoreCode: true,
                desc: '分组菜单',
                builder: (BuildContext context) {
                  return const CodeWrapper(builder: _buildGroup);
                },
              ),
            ]),
          ],
          test: [
            ExampleItem(
              ignoreCode: true,
              desc: '自动弹出方向',
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildHidden);
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '最大高度限制',
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildHeight);
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '可横向滚动菜单',
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildOverflow);
              },
            ),
          ],
        ));
  }
}

@Demo(group: 'dropdownMenu')
GMDropdownMenu _buildDownSimple(BuildContext context) {
  return GMDropdownMenu(
    direction: GMDropdownMenuDirection.down,
    onMenuOpened: (value) {
      print('打开第$value个菜单');
    },
    onMenuClosed: (value) {
      print('关闭第$value个菜单');
    },
    items: [
      GMDropdownItem(
        options: [
          GMDropdownItemOption(label: '全部产品', value: 'all', selected: true),
          GMDropdownItemOption(label: '最新产品', value: 'new'),
          GMDropdownItemOption(label: '最火产品', value: 'hot'),
        ],
        onChange: (value) {
          print('选择：$value');
        },
      ),
      GMDropdownItem(
        options: [
          GMDropdownItemOption(label: '默认排序', value: 'default', selected: true),
          GMDropdownItemOption(label: '价格从高到低', value: 'price'),
        ],
      ),
    ],
  );
}

@Demo(group: 'dropdownMenu')
GMDropdownMenu _buildDownChunk(BuildContext context) {
  return GMDropdownMenu(
    direction: GMDropdownMenuDirection.down,
    items: [
      GMDropdownItem(
        label: '单列多选',
        multiple: true,
        options: [
          GMDropdownItemOption(label: '选项1', value: '1', selected: true),
          GMDropdownItemOption(label: '选项2', value: '2'),
          GMDropdownItemOption(label: '选项3', value: '3'),
          GMDropdownItemOption(label: '选项4', value: '4'),
          GMDropdownItemOption(label: '选项5', value: '5'),
          GMDropdownItemOption(label: '选项6', value: '6'),
          GMDropdownItemOption(label: '选项7', value: '7'),
          GMDropdownItemOption(label: '选项8', value: '8'),
          GMDropdownItemOption(label: '禁用选项', value: '9', disabled: true),
        ],
        onChange: (value) {
          print('选择：$value');
        },
        onConfirm: (value) {
          print('确定选择：$value');
        },
        onReset: () {
          print('清空选择');
        },
      ),
      GMDropdownItem(
        label: '双列多选',
        multiple: true,
        optionsColumns: 2,
        options: [
          GMDropdownItemOption(label: '选项1', value: '1', selected: true),
          GMDropdownItemOption(label: '选项2', value: '2', selected: true),
          GMDropdownItemOption(label: '选项3', value: '3'),
          GMDropdownItemOption(label: '选项4', value: '4'),
          GMDropdownItemOption(label: '选项5', value: '5'),
          GMDropdownItemOption(label: '选项6', value: '6'),
          GMDropdownItemOption(label: '选项7', value: '7'),
          GMDropdownItemOption(label: '选项8', value: '8'),
          GMDropdownItemOption(label: '禁用选项', value: '9', disabled: true),
          GMDropdownItemOption(label: '禁用选项', value: '10', disabled: true),
        ],
      ),
      GMDropdownItem(
        label: '三列多选',
        multiple: true,
        optionsColumns: 3,
        options: [
          GMDropdownItemOption(label: '选项1', value: '1', selected: true),
          GMDropdownItemOption(label: '选项2', value: '2', selected: true),
          GMDropdownItemOption(label: '选项3', value: '3', selected: true),
          GMDropdownItemOption(label: '选项4', value: '4'),
          GMDropdownItemOption(label: '选项5', value: '5'),
          GMDropdownItemOption(label: '选项6', value: '6'),
          GMDropdownItemOption(label: '选项7', value: '7'),
          GMDropdownItemOption(label: '选项8', value: '8'),
          GMDropdownItemOption(label: '选项9', value: '9'),
          GMDropdownItemOption(label: '禁用选项', value: '10', disabled: true),
          GMDropdownItemOption(label: '禁用选项', value: '11', disabled: true),
          GMDropdownItemOption(label: '禁用选项', value: '12', disabled: true),
        ],
      ),
    ],
  );
}

@Demo(group: 'dropdownMenu')
GMDropdownMenu _buildUp(BuildContext context) {
  return GMDropdownMenu(
    direction: GMDropdownMenuDirection.up,
    onMenuOpened: (value) {
      print('打开第$value个菜单');
    },
    onMenuClosed: (value) {
      print('关闭第$value个菜单');
    },
    builder: (context) {
      return [
        GMDropdownItem(
          options: [
            GMDropdownItemOption(label: '全部产品', value: 'all', selected: true),
            GMDropdownItemOption(label: '最新产品', value: 'new'),
            GMDropdownItemOption(label: '最火产品', value: 'hot'),
          ],
          onChange: (value) {
            print('选择：$value');
          },
        ),
        GMDropdownItem(
          options: [
            GMDropdownItemOption(label: '默认排序', value: 'default', selected: true),
            GMDropdownItemOption(label: '价格从高到低', value: 'price'),
          ],
        ),
      ];
    },
  );
}

@Demo(group: 'dropdownMenu')
GMDropdownMenu _buildDisabled(BuildContext context) {
  return GMDropdownMenu(
    direction: GMDropdownMenuDirection.down,
    builder: (context) {
      return [
        const GMDropdownItem(
          disabled: true,
          label: '禁用菜单',
        ),
        const GMDropdownItem(
          disabled: true,
          label: '禁用菜单',
        ),
      ];
    },
  );
}

@Demo(group: 'dropdownMenu')
GMDropdownMenu _buildGroup(BuildContext context) {
  return GMDropdownMenu(
    direction: GMDropdownMenuDirection.up,
    builder: (context) {
      return [
        GMDropdownItem(
          label: '分组菜单',
          multiple: true,
          optionsColumns: 3,
          options: [
            GMDropdownItemOption(label: '选项1', value: '1', selected: true, group: '类型'),
            GMDropdownItemOption(label: '选项2', value: '2', group: '类型'),
            GMDropdownItemOption(label: '选项3', value: '3', group: '类型'),
            GMDropdownItemOption(label: '选项4', value: '4', group: '类型'),
            GMDropdownItemOption(label: '选项5', value: '5', group: '角色'),
            GMDropdownItemOption(label: '选项6', value: '6', group: '角色'),
            GMDropdownItemOption(label: '选项7', value: '7', group: '角色'),
            GMDropdownItemOption(label: '选项8', value: '8', group: '角色'),
            GMDropdownItemOption(label: '禁用选项', value: '9', disabled: true, group: '角色'),
          ],
          onChange: (value) {
            print('选择：$value');
          },
          onConfirm: (value) {
            print('确定选择：$value');
          },
        ),
      ];
    },
  );
}

@Demo(group: 'dropdownMenu')
GMDropdownMenu _buildHidden(BuildContext context) {
  return GMDropdownMenu(
    direction: GMDropdownMenuDirection.auto,
    arrowIcon: GMIcons.caret_up_small,
    builder: (context) {
      return [
        GMDropdownItem(
          label: '分组菜单',
          multiple: true,
          optionsColumns: 3,
          options: [
            GMDropdownItemOption(label: '选项1', value: '1', selected: true, group: '类型'),
            GMDropdownItemOption(label: '选项2', value: '2', group: '类型'),
            GMDropdownItemOption(label: '选项3', value: '3', group: '类型'),
            GMDropdownItemOption(label: '选项4', value: '4', group: '类型'),
            GMDropdownItemOption(label: '选项5', value: '5', group: '角色'),
            GMDropdownItemOption(label: '选项6', value: '6', group: '角色'),
            GMDropdownItemOption(label: '选项7', value: '7', group: '角色'),
            GMDropdownItemOption(label: '选项8', value: '8', group: '角色'),
            GMDropdownItemOption(label: '禁用选项', value: '9', disabled: true, group: '角色'),
          ],
          onChange: (value) {
            print('选择：$value');
          },
        ),
      ];
    },
  );
}

@Demo(group: 'dropdownMenu')
GMDropdownMenu _buildHeight(BuildContext context) {
  return GMDropdownMenu(
    direction: GMDropdownMenuDirection.up,
    onMenuOpened: (value) {
      print('打开第$value个菜单');
    },
    onMenuClosed: (value) {
      print('关闭第$value个菜单');
    },
    builder: (context) {
      return [
        GMDropdownItem(
          label: '最大高度限制',
          multiple: true,
          maxHeight: 200,
          options: [
            GMDropdownItemOption(label: '选项1', value: '1', selected: true),
            GMDropdownItemOption(label: '选项2', value: '2', selected: true),
            GMDropdownItemOption(label: '选项3', value: '3', selected: true),
            GMDropdownItemOption(label: '选项4', value: '4'),
            GMDropdownItemOption(label: '选项5', value: '5'),
            GMDropdownItemOption(label: '选项6', value: '6'),
            GMDropdownItemOption(label: '选项7', value: '7'),
            GMDropdownItemOption(label: '选项8', value: '8'),
            GMDropdownItemOption(label: '选项9', value: '9'),
            GMDropdownItemOption(label: '禁用选项', value: '10', disabled: true),
            GMDropdownItemOption(label: '禁用选项', value: '11', disabled: true),
            GMDropdownItemOption(label: '禁用选项', value: '12', disabled: true),
          ],
          onChange: (value) {
            print('选择：$value');
          },
        ),
        GMDropdownItem(
          maxHeight: 200,
          options: [
            GMDropdownItemOption(label: '选项1', value: '1', selected: true),
            GMDropdownItemOption(label: '选项2', value: '2'),
            GMDropdownItemOption(label: '选项3', value: '3'),
            GMDropdownItemOption(label: '选项4', value: '4'),
            GMDropdownItemOption(label: '选项5', value: '5'),
            GMDropdownItemOption(label: '选项6', value: '6'),
            GMDropdownItemOption(label: '选项7', value: '7'),
            GMDropdownItemOption(label: '选项8', value: '8'),
            GMDropdownItemOption(label: '选项9', value: '9'),
            GMDropdownItemOption(label: '禁用选项', value: '10', disabled: true),
            GMDropdownItemOption(label: '禁用选项', value: '11', disabled: true),
            GMDropdownItemOption(label: '禁用选项', value: '12', disabled: true),
          ],
        ),
      ];
    },
  );
}

@Demo(group: 'dropdownMenu')
GMDropdownMenu _buildOverflow(BuildContext context) {
  return GMDropdownMenu(
    isScrollable: true,
    tabBarAlign: MainAxisAlignment.spaceAround,
    direction: GMDropdownMenuDirection.up,
    onMenuOpened: (value) {
      print('打开第$value个菜单');
    },
    onMenuClosed: (value) {
      print('关闭第$value个菜单');
    },
    builder: (context) {
      return [
        GMDropdownItem(
          label: '最大高度限制',
          multiple: true,
          maxHeight: 200,
          tabBarWidth: 200,
          options: [
            GMDropdownItemOption(label: '选项1', value: '1', selected: true),
            GMDropdownItemOption(label: '选项2', value: '2', selected: true),
            GMDropdownItemOption(label: '选项3', value: '3', selected: true),
            GMDropdownItemOption(label: '选项4', value: '4'),
            GMDropdownItemOption(label: '选项5', value: '5'),
            GMDropdownItemOption(label: '选项6', value: '6'),
            GMDropdownItemOption(label: '选项7', value: '7'),
            GMDropdownItemOption(label: '选项8', value: '8'),
            GMDropdownItemOption(label: '选项9', value: '9'),
            GMDropdownItemOption(label: '禁用选项', value: '10', disabled: true),
            GMDropdownItemOption(label: '禁用选项', value: '11', disabled: true),
            GMDropdownItemOption(label: '禁用选项', value: '12', disabled: true),
          ],
          onChange: (value) {
            print('选择：$value');
          },
        ),
        GMDropdownItem(
          maxHeight: 200,
          tabBarWidth: 200,
          tabBarAlign: MainAxisAlignment.start,
          options: [
            GMDropdownItemOption(label: '选项1选项1选项1选项1选项1选项1选项1', value: '1', selected: true),
            GMDropdownItemOption(label: '选项2', value: '2'),
          ],
        ),
        GMDropdownItem(
          maxHeight: 200,
          options: [
            GMDropdownItemOption(label: '选项1', value: '1', selected: true),
            GMDropdownItemOption(label: '选项2', value: '2'),
          ],
        ),
        GMDropdownItem(
          maxHeight: 200,
          options: [
            GMDropdownItemOption(label: '选项1', value: '1', selected: true),
            GMDropdownItemOption(label: '选项2', value: '2'),
          ],
        ),
        GMDropdownItem(
          maxHeight: 200,
          options: [
            GMDropdownItemOption(label: '选项1', value: '1', selected: true),
            GMDropdownItemOption(label: '选项2', value: '2'),
          ],
        ),
      ];
    },
  );
}