import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../../base/example_widget.dart';
import '../annotation/demo.dart';
import 'dart:async';

class GMInputViewPage extends StatefulWidget {
  const GMInputViewPage({Key? key}) : super(key: key);

  @override
  _GMInputViewPageState createState() => _GMInputViewPageState();
}

class _GMInputViewPageState extends State<GMInputViewPage> {
  String inputText = '请输入...';
  var controller = [];
  var browseOn = false;
  var confirmText = '发送验证码';
  var countDownText = '重发';
  Timer? _timer;
  int _countdownTime = 0;

  @override
  void initState() {
    for (var i = 0; i < 28; i++) {
      controller.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  void startCountdownTimer() {
    const oneSec = Duration(seconds: 1);
    var callback = (timer) => {
          setState(() {
            if (_countdownTime < 1) {
              _timer?.cancel();
            } else {
              _countdownTime = _countdownTime - 1;
            }
          })
        };
    _timer = Timer.periodic(oneSec, callback);
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      backgroundColor: const Color(0xFFF0F2F5),
      title: tdTitle(),
      desc: '用于在预设的一组选项中执行单项选择，并呈现选择结果。',
      exampleCodeGroup: 'input',
      children: [
        ExampleModule(
          title: '组件类型',
          children: [
            ExampleItem(desc: '基础输入框', builder: _basicTypeBasic),
            ExampleItem(builder: _basicTypeRequire),
            ExampleItem(builder: _basicTypeOptional),
            ExampleItem(builder: _basicTypePureInput),
            ExampleItem(builder: _basicTypeAdditionalDesc),
            ExampleItem(desc: '带字数限制输入框', builder: _basicTypeTextLimit),
            ExampleItem(builder: _basicTypeTextLimitChinese2),
            ExampleItem(desc: '带操作输入框', builder: _basicTypeWithHandleIconOne),
            ExampleItem(builder: _basicTypeWithHandleIconTwo),
            ExampleItem(builder: _basicTypeWithHandleIconThree),
            ExampleItem(desc: '带图标输入框', builder: _basicTypeWithLeftIconLeftLabel),
            ExampleItem(builder: _basicTypeWithLeftIcon),
            ExampleItem(desc: '特定类型输入框', builder: _specialTypePassword),
            ExampleItem(builder: _specialTypeVerifyCode),
            ExampleItem(builder: _specialTypePhoneNumber),
            ExampleItem(builder: _specialTypePrice),
            ExampleItem(builder: _specialTypeNumber),
            ExampleItem(builder: (context) {
              return Container();
            }),
          ],
        ),
        ExampleModule(title: '组件状态', children: [
          ExampleItem(desc: '输入框状态', builder: _inputStatusAdditionInfo),
          ExampleItem(builder: _inputStatusReadOnly),
          ExampleItem(desc: '信息超长状态', builder: _inputStatusLongLabel),
          ExampleItem(builder: _inputStatusLongInput),
        ]),
        ExampleModule(title: '组件样式', children: [
          ExampleItem(desc: '内容位置', builder: _contentLeft),
          ExampleItem(builder: _contentCenter),
          ExampleItem(builder: _contentRight),
          ExampleItem(desc: '竖排样式', builder: _verticalStyle),
          ExampleItem(desc: '非通栏样式', builder: _cardStyle),
          ExampleItem(desc: '标签外置样式', builder: _labelOutStyle),
          ExampleItem(desc: '自定义样式输入框', builder: _customStyle),
        ]),
      ],
      test: [
        ExampleItem(desc: '长文本样式', builder: _customLongTextStyle),
        ExampleItem(desc: '隐藏底部分割线', builder: _hideBottomDivider),
        ExampleItem(desc: '自定义高度-使用SizeBox', builder: _customHeight),
        ExampleItem(desc: '获取焦点时点击外部区域事件响应-onTapOutside', builder: _onTapOutside)
      ],
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeBasic(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftLabel: '标签文字',
          controller: controller[0],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[0].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeRequire(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftLabel: '标签文字',
          required: true,
          controller: controller[1],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[1].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeOptional(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftLabel: '标签文字',
          controller: controller[2],
          backgroundColor: Colors.white,
          hintText: '请输入文字(选填)',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[2].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _basicTypePureInput(BuildContext context) {
    return Column(
      children: [
        GMInput(
          controller: controller[3],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[3].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeAdditionalDesc(BuildContext context) {
    return GMInput(
      type: GMInputType.normal,
      leftLabel: '标签文字',
      controller: controller[4],
      hintText: '请输入文字',
      additionInfo: '辅助说明',
      backgroundColor: Colors.white,
      onChanged: (text) {
        setState(() {});
      },
      onClearTap: () {
        controller[4].clear();
        setState(() {});
      },
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeTextLimit(BuildContext context) {
    return Column(
      children: [
        GMInput(
          type: GMInputType.normal,
          leftLabel: '标签文字',
          controller: controller[5],
          hintText: '请输入文字',
          maxLength: 10,
          additionInfo: '最大输入10个字符',
          backgroundColor: Colors.white,
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[5].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeTextLimitChinese2(BuildContext context) {
    return GMInput(
      type: GMInputType.normal,
      leftLabel: '标签文字',
      controller: controller[6],
      hintText: '请输入文字',
      inputFormatters: [Chinese2Formatter(10)],
      additionInfo: '最大输入10个字符，汉字算两个',
      backgroundColor: Colors.white,
      onChanged: (text) {
        setState(() {});
      },
      onClearTap: () {
        controller[6].clear();
        setState(() {});
      },
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeWithHandleIconOne(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftLabel: '标签文字',
          controller: controller[7],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          rightBtn: Icon(
            GMIcons.error_circle_filled,
            color: GMTheme.of(context).fontGyColor3,
          ),
          onBtnTap: () {
            GMToast.showText('点击右侧按钮', context: context);
          },
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[7].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeWithHandleIconTwo(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftLabel: '标签文字',
          controller: controller[8],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          rightBtn: Container(
            alignment: Alignment.center,
            width: 73,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: GMTheme.of(context).brandNormalColor,
            ),
            child: const GMButton(
              text: '操作按钮',
              size: GMButtonSize.extraSmall,
              theme: GMButtonTheme.primary,
            ),
          ),
          onBtnTap: () {
            GMToast.showText('点击操作按钮', context: context);
          },
          needClear: false,
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeWithHandleIconThree(BuildContext context) {
    return GMInput(
      leftLabel: '标签文字',
      controller: controller[9],
      backgroundColor: Colors.white,
      hintText: '请输入文字',
      rightBtn: Icon(
        GMIcons.user_avatar,
        color: GMTheme.of(context).fontGyColor3,
      ),
      onBtnTap: () {
        GMToast.showText('点击操作按钮', context: context);
      },
      onChanged: (text) {
        setState(() {});
      },
      onClearTap: () {
        controller[9].clear();
        setState(() {});
      },
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeWithLeftIconLeftLabel(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftIcon: const Icon(GMIcons.app),
          leftLabel: '标签文字',
          controller: controller[10],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[10].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _basicTypeWithLeftIcon(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftIcon: const Icon(GMIcons.app),
          controller: controller[11],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[11].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _specialTypePassword(BuildContext context) {
    return Column(
      children: [
        GMInput(
          type: GMInputType.normal,
          controller: controller[12],
          obscureText: !browseOn,
          leftLabel: '输入密码',
          hintText: '请输入密码',
          backgroundColor: Colors.white,
          rightBtn: browseOn
              ? Icon(
                  GMIcons.browse,
                  color: GMTheme.of(context).fontGyColor3,
                )
              : Icon(
                  GMIcons.browse_off,
                  color: GMTheme.of(context).fontGyColor3,
                ),
          onBtnTap: () {
            setState(() {
              browseOn = !browseOn;
            });
          },
          needClear: false,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  @Demo(group: 'input')
  Widget _specialTypeVerifyCode(BuildContext context) {
    return Column(
      children: [
        GMInput(
          type: GMInputType.normal,
          size: GMInputSize.small,
          controller: controller[13],
          leftLabel: '验证码',
          hintText: '输入验证码',
          backgroundColor: Colors.white,
          rightBtn: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 0.5,
                height: 24,
                color: GMTheme.of(context).grayColor3,
              ),
              const SizedBox(
                width: 16,
              ),
              Image.network(
                'https://img2018.cnblogs.com/blog/736399/202001/736399-20200108170302307-1377487770.jpg',
                width: 72,
                height: 36,
              )
            ],
          ),
          needClear: false,
          onBtnTap: () {
            GMToast.showText('点击更换验证码', context: context);
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _specialTypePhoneNumber(BuildContext context) {
    return Column(
      children: [
        GMInput(
          type: GMInputType.normal,
          controller: controller[14],
          leftLabel: '手机号',
          hintText: '输入手机号',
          backgroundColor: Colors.white,
          rightBtn: SizedBox(
            width: 98,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    width: 0.5,
                    height: 24,
                    color: GMTheme.of(context).grayColor3,
                  ),
                ),
                _countdownTime > 0
                    ? GMText(
                        '${countDownText}(${_countdownTime}秒)',
                        textColor: GMTheme.of(context).fontGyColor4,
                      )
                    : GMText(confirmText, textColor: GMTheme.of(context).brandNormalColor),
              ],
            ),
          ),
          needClear: false,
          onBtnTap: () {
            if (_countdownTime == 0) {
              GMToast.showText('点击了发送验证码', context: context);
              setState(() {
                _countdownTime = 60;
              });
              startCountdownTimer();
            }
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _specialTypePrice(BuildContext context) {
    return Column(
      children: [
        GMInput(
          type: GMInputType.special,
          controller: controller[15],
          leftLabel: '价格',
          hintText: '0.00',
          backgroundColor: Colors.white,
          textAlign: TextAlign.end,
          rightWidget: GMText('元', textColor: GMTheme.of(context).fontGyColor1),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _specialTypeNumber(BuildContext context) {
    return GMInput(
      type: GMInputType.special,
      controller: controller[16],
      leftLabel: '数量',
      hintText: '填写个数',
      backgroundColor: Colors.white,
      textAlign: TextAlign.end,
      rightWidget: GMText('个', textColor: GMTheme.of(context).fontGyColor1),
    );
  }

  @Demo(group: 'input')
  Widget _inputStatusAdditionInfo(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftLabel: '标签文字',
          controller: controller[17],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          additionInfo: '错误提示说明',
          additionInfoColor: GMTheme.of(context).errorColor6,
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[17].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _inputStatusReadOnly(BuildContext context) {
    return GMInput(
      leftLabel: '标签文字',
      readOnly: true,
      // 不可编辑文字 则不必带入controller
      backgroundColor: Colors.white,
      hintText: '不可编辑文字',
    );
  }

  @Demo(group: 'input')
  Widget _inputStatusLongLabel(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftInfoWidth: 80,
          spacer: GMInputSpacer(iconLabelSpace: 4),
          leftLabel: '标签超长时最多十个字',
          controller: controller[18],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[18].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _inputStatusLongInput(BuildContext context) {
    return GMInput(
      type: GMInputType.normal,
      leftLabel: '标签文字',
      controller: controller[19],
      backgroundColor: Colors.white,
      hintText: '输入文字超长不超过两行输入文字超长不超过两行',
      hintTextStyle: TextStyle(
        color: GMTheme.of(context).fontGyColor1,
      ),
      maxLines: 2,
    );
  }

  @Demo(group: 'input')
  Widget _verticalStyle(BuildContext context) {
    return GMInput(
      spacer: GMInputSpacer(iconLabelSpace: 0),
      type: GMInputType.twoLine,
      leftLabel: '标签文字',
      controller: controller[20],
      hintText: '请输入文字',
      backgroundColor: Colors.white,
      rightBtn: Icon(
        GMIcons.error_circle_filled,
        color: GMTheme.of(context).fontGyColor3,
      ),
      onBtnTap: () {
        GMToast.showText('点击右侧按钮', context: context);
      },
      onChanged: (text) {
        setState(() {});
      },
      onClearTap: () {
        controller[20].clear();
        setState(() {});
      },
    );
  }

  @Demo(group: 'input')
  Widget _cardStyle(BuildContext context) {
    return GMInput(
      type: GMInputType.cardStyle,
      width: MediaQuery.of(context).size.width - 32,
      leftLabel: '标签文字',
      controller: controller[21],
      hintText: '请输入文字',
      backgroundColor: Colors.white,
      onChanged: (text) {
        setState(() {});
      },
      onClearTap: () {
        controller[21].clear();
        setState(() {});
      },
    );
  }

  @Demo(group: 'input')
  Widget _labelOutStyle(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: GMInput(
        type: GMInputType.cardStyle,
        cardStyle: GMCardStyle.topText,
        width: MediaQuery.of(context).size.width - 32,
        cardStyleTopText: '标签文字',
        controller: controller[22],
        hintText: '请输入文字',
        rightBtn: Icon(
          GMIcons.error_circle_filled,
          color: GMTheme.of(context).fontGyColor3,
        ),
        onBtnTap: () {
          GMToast.showText('点击右侧按钮', context: context);
        },
        onChanged: (text) {
          setState(() {});
        },
        onClearTap: () {
          controller[22].clear();
          setState(() {});
        },
      ),
    );
  }

  @Demo(group: 'input')
  Widget _contentLeft(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftLabel: '左对齐',
          controller: controller[23],
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[23].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _contentCenter(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftLabel: '居中',
          controller: controller[24],
          backgroundColor: Colors.white,
          contentAlignment: TextAlign.center,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[24].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _contentRight(BuildContext context) {
    return Column(
      children: [
        GMInput(
          leftLabel: '右对齐',
          controller: controller[25],
          backgroundColor: Colors.white,
          contentAlignment: TextAlign.end,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller[25].clear();
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  @Demo(group: 'input')
  Widget _customStyle(BuildContext context) {
    return GMInput(
      leftLabel: '标签文字',
      controller: controller[26],
      backgroundColor: GMTheme.of(context).grayColor12,
      leftLabelStyle: TextStyle(color: GMTheme.of(context).fontWhColor1),
      textStyle: TextStyle(color: GMTheme.of(context).fontWhColor1),
      hintText: '请输入文字',
      hintTextStyle: TextStyle(color: GMTheme.of(context).fontWhColor3),
      onChanged: (text) {
        setState(() {});
      },
      clearBtnColor: GMTheme.of(context).fontWhColor3,
      onClearTap: () {
        controller[26].clear();
        setState(() {});
      },
    );
  }

  @Demo(group: 'input')
  Widget _customLongTextStyle(BuildContext context) {
    var controller = TextEditingController();
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: GMInput(
        type: GMInputType.longText,
        cardStyle: GMCardStyle.topText,
        width: MediaQuery.of(context).size.width - 32,
        cardStyleTopText: '标签文字',
        controller: controller,
        hintText: '请输入文字',
        rightBtn: Icon(
          GMIcons.error_circle_filled,
          color: GMTheme.of(context).fontGyColor3,
        ),
        onBtnTap: () {
          GMToast.showText('点击右侧按钮', context: context);
        },
        onChanged: (text) {
          setState(() {});
        },
        onClearTap: () {
          controller.clear();
          setState(() {});
        },
      ),
    );
  }

  @Demo(group: 'input')
  Widget _hideBottomDivider(BuildContext context) {
    var controller = TextEditingController();
    return GMInput(
      leftLabel: '标签文字',
      controller: controller,
      backgroundColor: Colors.white,
      hintText: '请输入文字',
      onChanged: (text) {
        setState(() {});
      },
      onClearTap: () {
        controller.clear();
        setState(() {});
      },
      showBottomDivider: false,
    );
  }

  @Demo(group: 'input')
  Widget _customHeight(BuildContext context) {
    var controller = TextEditingController();
    return Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      height: 90,
      child: SizedBox(
        height: 60,
        child: GMInput(
          size: GMInputSize.small,
          leftLabel: '标签文字',
          controller: controller,
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller.clear();
            setState(() {});
          },
        ),
      ),
    );
  }

  @Demo(group: 'input')
  Widget _onTapOutside(BuildContext context) {
    var controller = TextEditingController();
    return Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      height: 90,
      child: SizedBox(
        height: 60,
        child: GMInput(
          size: GMInputSize.small,
          leftLabel: '标签文字',
          controller: controller,
          backgroundColor: Colors.white,
          hintText: '请输入文字',
          onChanged: (text) {
            setState(() {});
          },
          onClearTap: () {
            controller.clear();
            setState(() {});
          },
          onTapOutside: (event) {
            GMToast.showText('点击输入框外部区域', context: context);
            print('on tap outside ${event}');
          },
        ),
      ),
    );
  }
}