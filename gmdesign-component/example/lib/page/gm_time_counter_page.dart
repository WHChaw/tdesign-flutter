import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';
import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMTimeCounterPage extends StatelessWidget {
  const GMTimeCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GMTheme.of(context).grayColor2,
      child: ExamplePage(
        title: tdTitle(context),
        desc: '用于实时展示计时数值。',
        exampleCodeGroup: 'timeCounter',
        children: [
          ExampleModule(title: '组件类型', children: [
            ExampleItem(
              ignoreCode: true,
              desc: '时分秒',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildSimple);
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '带毫秒',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildMillisecondSimple);
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '正向计时',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildUpSimple);
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '带方形底',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildSquareSimple);
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '带圆形底',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildRoundSimple);
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '带单位',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildUnitSimple);
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '无底色带单位',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return const CodeWrapper(builder: _buildCustomUnitSimple);
              },
            ),
          ]),
          ExampleModule(title: '组件尺寸', children: [
            ExampleItem(
              ignoreCode: true,
              desc: '纯数字',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.topLeft,
                  child: Wrap(spacing: 8, direction: Axis.vertical, children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('小'),
                        ),
                        CodeWrapper(builder: _buildSmallSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('中'),
                        ),
                        CodeWrapper(builder: _buildMediumSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('大'),
                        ),
                        CodeWrapper(builder: _buildLargeSize),
                      ],
                    ),
                  ]),
                );
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '带方形底',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.topLeft,
                  child: Wrap(spacing: 8, direction: Axis.vertical, children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('小'),
                        ),
                        CodeWrapper(builder: _buildSquareSmallSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('中'),
                        ),
                        CodeWrapper(builder: _buildSquareMediumSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('大'),
                        ),
                        CodeWrapper(builder: _buildSquareLargeSize),
                      ],
                    ),
                  ]),
                );
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '带圆形底',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.topLeft,
                  child: Wrap(spacing: 8, direction: Axis.vertical, children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('小'),
                        ),
                        CodeWrapper(builder: _buildRoundSmallSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('中'),
                        ),
                        CodeWrapper(builder: _buildRoundMediumSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('大'),
                        ),
                        CodeWrapper(builder: _buildRoundLargeSize),
                      ],
                    ),
                  ]),
                );
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '带单位',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.topLeft,
                  child: Wrap(spacing: 8, direction: Axis.vertical, children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('小'),
                        ),
                        CodeWrapper(builder: _buildUnitSmallSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('中'),
                        ),
                        CodeWrapper(builder: _buildUnitMediumSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('大'),
                        ),
                        CodeWrapper(builder: _buildUnitLargeSize),
                      ],
                    ),
                  ]),
                );
              },
            ),
            ExampleItem(
              ignoreCode: true,
              desc: '无底色带单位',
              center: false,
              padding: const EdgeInsets.only(left: 16),
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.topLeft,
                  child: Wrap(spacing: 8, direction: Axis.vertical, children: [
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('小'),
                        ),
                        CodeWrapper(builder: _buildCustomUnitSmallSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('中'),
                        ),
                        CodeWrapper(builder: _buildCustomUnitMediumSize),
                      ],
                    ),
                    Row(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Text('大'),
                        ),
                        CodeWrapper(builder: _buildCustomUnitLargeSize),
                      ],
                    ),
                  ]),
                );
              },
            ),
          ]),
        ],
        test: [
          ExampleItem(
            ignoreCode: true,
            desc: '控制倒计时',
            center: false,
            padding: const EdgeInsets.only(left: 16),
            builder: (BuildContext context) {
              return const CodeWrapper(builder: _buildControl);
            },
          ),
          ExampleItem(
            ignoreCode: true,
            desc: '自定义显示位数',
            center: false,
            padding: const EdgeInsets.only(left: 16),
            builder: (BuildContext context) {
              return const CodeWrapper(builder: _buildCustomNum);
            },
          ),
        ],
      ),
    );
  }
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildSimple(BuildContext context) {
  return const GMTimeCounter(time: 60 * 60 * 1000);
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildMillisecondSimple(BuildContext context) {
  return const GMTimeCounter(time: 60 * 60 * 1000, millisecond: true);
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildUpSimple(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    millisecond: true,
    direction: GMTimeCounterDirection.up,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildSquareSimple(BuildContext context) {
  return const GMTimeCounter(time: 60 * 60 * 1000, theme: GMTimeCounterTheme.square);
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildRoundSimple(BuildContext context) {
  return const GMTimeCounter(time: 60 * 60 * 1000, theme: GMTimeCounterTheme.round);
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildUnitSimple(BuildContext context) {
  return const GMTimeCounter(time: 60 * 60 * 1000, theme: GMTimeCounterTheme.square, splitWithUnit: true);
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildCustomUnitSimple(BuildContext context) {
  var style = GMTimeCounterStyle.generateStyle(context);
  style.timeColor = GMTheme.of(context).errorColor6;
  return GMTimeCounter(time: 60 * 60 * 1000, splitWithUnit: true, style: style);
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildSmallSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.small,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildMediumSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.medium,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildLargeSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.large,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildSquareSmallSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.small,
    theme: GMTimeCounterTheme.square,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildSquareMediumSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.medium,
    theme: GMTimeCounterTheme.square,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildSquareLargeSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.large,
    theme: GMTimeCounterTheme.square,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildRoundSmallSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.small,
    theme: GMTimeCounterTheme.round,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildRoundMediumSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.medium,
    theme: GMTimeCounterTheme.round,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildRoundLargeSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.large,
    theme: GMTimeCounterTheme.round,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildUnitSmallSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.small,
    theme: GMTimeCounterTheme.square,
    splitWithUnit: true,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildUnitMediumSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.medium,
    theme: GMTimeCounterTheme.square,
    splitWithUnit: true,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildUnitLargeSize(BuildContext context) {
  return const GMTimeCounter(
    time: 60 * 60 * 1000,
    size: GMTimeCounterSize.large,
    theme: GMTimeCounterTheme.square,
    splitWithUnit: true,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildCustomUnitSmallSize(BuildContext context) {
  var style = GMTimeCounterStyle.generateStyle(context, size: GMTimeCounterSize.small);
  style.timeColor = GMTheme.of(context).errorColor6;
  return GMTimeCounter(
    time: 60 * 60 * 1000,
    splitWithUnit: true,
    style: style,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildCustomUnitMediumSize(BuildContext context) {
  var style = GMTimeCounterStyle.generateStyle(context, size: GMTimeCounterSize.medium);
  style.timeColor = GMTheme.of(context).errorColor6;
  return GMTimeCounter(
    time: 60 * 60 * 1000,
    splitWithUnit: true,
    style: style,
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildCustomUnitLargeSize(BuildContext context) {
  var style = GMTimeCounterStyle.generateStyle(context, size: GMTimeCounterSize.large);
  style.timeColor = GMTheme.of(context).errorColor6;
  return GMTimeCounter(
    time: 60 * 60 * 1000,
    splitWithUnit: true,
    style: style,
  );
}

@Demo(group: 'timeCounter')
Widget _buildControl(BuildContext context) {
  var controller = GMTimeCounterController();
  return Wrap(
    direction: Axis.vertical,
    spacing: 8,
    children: [
      Wrap(
        spacing: 8,
        children: [
          GMButton(
            text: '开始',
            size: GMButtonSize.extraSmall,
            theme: GMButtonTheme.primary,
            onTap: () {
              controller.start();
            },
          ),
          GMButton(
            text: '结束',
            size: GMButtonSize.extraSmall,
            theme: GMButtonTheme.primary,
            onTap: () {
              controller.reset(0);
            },
          ),
          GMButton(
            text: '重置',
            size: GMButtonSize.extraSmall,
            theme: GMButtonTheme.primary,
            onTap: () {
              controller.reset();
            },
          ),
          GMButton(
            text: '暂停',
            size: GMButtonSize.extraSmall,
            theme: GMButtonTheme.primary,
            onTap: () {
              controller.pause();
            },
          ),
          GMButton(
            text: '继续',
            size: GMButtonSize.extraSmall,
            theme: GMButtonTheme.primary,
            onTap: () {
              controller.resume();
            },
          ),
        ],
      ),
      GMTimeCounter(
        time: 60 * 60 * 1000,
        controller: controller,
        // autoStart: false,
      ),
    ],
  );
}

@Demo(group: 'timeCounter')
GMTimeCounter _buildCustomNum(BuildContext context) {
  return const GMTimeCounter(
    time: 2000 * 60 * 1000,
    format: 'mmmmmmm分sss秒',
  );
}
