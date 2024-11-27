import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMCalendarPage extends StatelessWidget {
  const GMCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GMTheme.of(context).grayColor2,
      child: ExamplePage(
        title: tdTitle(context),
        desc: '按照日历形式展示数据或日期的容器。',
        exampleCodeGroup: 'calendar',
        children: [
          ExampleModule(title: '组件类型', children: [
            ExampleItem(
              ignoreCode: true,
              center: false,
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildSimple);
              },
            ),
          ]),
          ExampleModule(title: '组件样式', children: [
            ExampleItem(
              desc: '可以自由定义想要的风格',
              ignoreCode: true,
              center: false,
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildStyle);
              },
            ),
            ExampleItem(
              desc: '不使用Popup',
              ignoreCode: true,
              center: false,
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildBlock);
              },
            ),
          ]),
        ],
        test: [],
      ),
    );
  }
}

@Demo(group: 'calendar')
Widget _buildSimple(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final selected = ValueNotifier<List<int>>([DateTime.now().millisecondsSinceEpoch]);
  return ValueListenableBuilder(
    valueListenable: selected,
    builder: (context, value, child) {
      final date = DateTime.fromMillisecondsSinceEpoch(value[0]);
      return GMCellGroup(
        cells: [
          GMCell(
            title: '单个选择日历',
            arrow: true,
            note: '${date.year}-${date.month}-${date.day}',
            onClick: (cell) {
              GMCalendarPopup(
                context,
                visible: true,
                onConfirm: (value) {
                  print('onConfirm:$value');
                  selected.value = value;
                },
                onClose: () {
                  print('onClose');
                },
                child: GMCalendar(
                  title: '请选择日期',
                  value: value,
                  height: size.height * 0.6 + 176,
                  onCellClick: (value, type, tdate) {
                    print('onCellClick:$value');
                  },
                  onCellLongPress: (value, type, tdate) {
                    print('onCellLongPress:$value');
                  },
                  onHeanderClick: (index, week) {
                    print('onHeanderClick:$week');
                  },
                  onChange: (value) {
                    print('onChange:$value');
                  },
                ),
              );
            },
          ),
          GMCell(
            title: '多个选择日历',
            arrow: true,
            onClick: (cell) {
              GMCalendarPopup(
                context,
                visible: true,
                child: GMCalendar(
                  title: '请选择日期',
                  type: CalendarType.multiple,
                  value: [DateTime.now().millisecondsSinceEpoch],
                  height: size.height * 0.6 + 176,
                ),
              );
            },
          ),
          GMCell(
            title: '区间选择日历',
            arrow: true,
            onClick: (cell) {
              GMCalendarPopup(
                context,
                visible: true,
                child: GMCalendar(
                  title: '请选择日期区间',
                  type: CalendarType.range,
                  value: [
                    DateTime.now().millisecondsSinceEpoch,
                    DateTime.now().add(const Duration(days: 6)).millisecondsSinceEpoch,
                  ],
                  height: size.height * 0.6 + 176,
                ),
              );
            },
          ),
          GMCell(
            title: '单个选择日历和时间',
            arrow: true,
            note: '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}',
            onClick: (cell) {
              GMCalendarPopup(
                context,
                visible: true,
                onConfirm: (value) {
                  print('onConfirm:$value');
                  selected.value = value;
                },
                onClose: () {
                  print('onClose');
                },
                child: GMCalendar(
                  title: '请选择日期和时间',
                  value: value,
                  height: size.height * 0.92,
                  useTimePicker: true,
                  onCellClick: (value, type, tdate) {
                    print('onCellClick:$value');
                  },
                  onCellLongPress: (value, type, tdate) {
                    print('onCellLongPress:$value');
                  },
                  onHeanderClick: (index, week) {
                    print('onHeanderClick:$week');
                  },
                  onChange: (value) {
                    print('onChange:$value');
                  },
                ),
              );
            },
          ),
          GMCell(
            title: '区间选择日历和时间',
            arrow: true,
            onClick: (cell) {
              GMCalendarPopup(
                context,
                visible: true,
                onConfirm: (value) {
                  print('onConfirm:$value');
                },
                onClose: () {
                  print('onClose');
                },
                child: GMCalendar(
                  title: '请选择日期和时间区间',
                  height: size.height * 0.92,
                  type: CalendarType.range,
                  value: [
                    DateTime.now().millisecondsSinceEpoch,
                    DateTime.now().add(const Duration(days: 3)).millisecondsSinceEpoch,
                  ],
                  useTimePicker: true,
                  onCellClick: (value, type, tdate) {
                    print('onCellClick:$value');
                  },
                  onCellLongPress: (value, type, tdate) {
                    print('onCellLongPress:$value');
                  },
                  onHeanderClick: (index, week) {
                    print('onHeanderClick:$week');
                  },
                  onChange: (value) {
                    print('onChange:$value');
                  },
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

@Demo(group: 'calendar')
Widget _buildStyle(BuildContext context) {
  final size = MediaQuery.of(context).size;
  const map = {
    1: '初一',
    2: '初二',
    3: '初三',
    14: '情人节',
    15: '元宵节',
  };
  return GMCellGroup(
    cells: [
      GMCell(
        title: '自定义文案',
        arrow: true,
        onClick: (cell) {
          GMCalendarPopup(
            context,
            visible: true,
            child: GMCalendar(
              title: '请选择日期',
              height: size.height * 0.6 + 176,
              minDate: DateTime(2022, 1, 1).millisecondsSinceEpoch,
              maxDate: DateTime(2022, 2, 15).millisecondsSinceEpoch,
              format: (day) {
                day?.suffix = '¥60';
                if (day?.date.month == 2) {
                  if (map.keys.contains(day?.date.day)) {
                    day?.suffix = '¥100';
                    day?.prefix = map[day.date.day];
                    day?.style = TextStyle(
                      fontSize: GMTheme.of(context).fontTitleMedium?.size,
                      height: GMTheme.of(context).fontTitleMedium?.height,
                      fontWeight: GMTheme.of(context).fontTitleMedium?.fontWeight,
                      color: GMTheme.of(context).errorColor6,
                    );
                    if (day?.typeNotifier.value == DateSelectType.selected) {
                      day?.style = day.style?.copyWith(color: GMTheme.of(context).fontWhColor1);
                    }
                  }
                }
                return null;
              },
            ),
          );
        },
      ),
      GMCell(
        title: '自定义按钮',
        arrow: true,
        onClick: (cell) {
          late final GMCalendarPopup calendar;
          calendar = GMCalendarPopup(
            context,
            visible: true,
            confirmBtn: Padding(
              padding: EdgeInsets.symmetric(vertical: GMTheme.of(context).spacer16),
              child: GMButton(
                theme: GMButtonTheme.danger,
                shape: GMButtonShape.round,
                text: 'ok',
                isBlock: true,
                size: GMButtonSize.large,
                onTap: () {
                  print(calendar.selected);
                  calendar.close();
                },
              ),
            ),
            child: GMCalendar(
              title: '请选择日期',
              value: [DateTime.now().millisecondsSinceEpoch],
              height: size.height * 0.6 + 176,
            ),
          );
        },
      ),
      GMCell(
        title: '自定义日期区间',
        arrow: true,
        onClick: (cell) {
          GMCalendarPopup(
            context,
            visible: true,
            child: GMCalendar(
              title: '请选择日期',
              minDate: DateTime(2022, 1, 1).millisecondsSinceEpoch,
              maxDate: DateTime(2022, 1, 31).millisecondsSinceEpoch,
              value: [DateTime(2022, 1, 15).millisecondsSinceEpoch],
              height: size.height * 0.6 + 176,
            ),
          );
        },
      ),
    ],
  );
}

@Demo(group: 'calendar')
Widget _buildBlock(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return GMCalendar(
    title: '请选择日期',
    value: [DateTime.now().millisecondsSinceEpoch],
    height: size.height * 0.6 + 176,
  );
}
