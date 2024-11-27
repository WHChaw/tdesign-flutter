import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/gmdesign_flutter.dart';
import '../../annotation/demo.dart';
import '../../base/example_widget.dart';

class GMButtonPage extends StatefulWidget {
  const GMButtonPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GMButtonPageState();
}

class _GMButtonPageState extends State<GMButtonPage> {
  void onTap() {
    GMToast.showText('点击了按钮', context: context);
  }

  void onLongPress() {
    GMToast.showText('长按了按钮', context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: GMTheme.of(context).grayColor2,
        child: ExamplePage(
          title: tdTitle(),
          desc: '用于开启一个闭环的操作任务，如“删除”对象、“购买”商品等。',
          exampleCodeGroup: 'button',
          // padding: const EdgeInsets.only(top: 8, bottom: 8, ),
          children: [
            ExampleModule(title: '组件类型', children: [
              ExampleItem(
                  ignoreCode: true,
                  desc: '基础按钮',
                  builder: (context) {
                    return Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 8),
                      child: Wrap(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(
                              builder: _buildPrimaryFillButton,
                              methodName: '_buildPrimaryFillButton',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(
                              builder: _buildLightFillButton,
                              methodName: '_buildLightFillButton',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildDefaultFillButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildPrimaryStrokeButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildPrimaryTextButton),
                          ),
                        ],
                      ),
                    );
                  }),
              ExampleItem(
                  ignoreCode: true,
                  desc: '图标按钮',
                  center: false,
                  builder: (context) {
                    return Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Wrap(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildRectangleIconButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(builder: _buildSquareIconButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildLoadingIconButton),
                          )
                        ],
                      ),
                    );
                  }),
              ExampleItem(
                  ignoreCode: true,
                  desc: '幽灵按钮',
                  builder: (context) {
                    return Container(
                      alignment: Alignment.topLeft,
                      color: GMTheme.of(context).grayColor14,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Wrap(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildPrimaryGhostButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildDangerGhostButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildDefaultGhostButton),
                          ),
                        ],
                      ),
                    );
                  }),
              ExampleItem(
                  ignoreCode: true,
                  desc: '组合按钮',
                  builder: (_) =>
                      CodeWrapper(builder: _buildCombinationButtons)),
              ExampleItem(desc: '通栏按钮', builder: _buildFilledFillButton),
            ]),
            ExampleModule(title: '组件状态', children: [
              ExampleItem(
                  ignoreCode: true,
                  desc: '按钮禁用状态',
                  builder: (context) {
                    return Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 8),
                      child: Wrap(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(
                                builder: _buildDisablePrimaryFillButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(
                                builder: _buildDisableLightFillButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(
                                builder: _buildDisableDefaultFillButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(
                                builder: _buildDisablePrimaryStrokeButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(
                                builder: _buildDisablePrimaryTextButton),
                          ),
                        ],
                      ),
                    );
                  }),
            ]),
            ExampleModule(title: '组件主题', children: [
              ExampleItem(
                  ignoreCode: true,
                  desc: '按钮尺寸',
                  builder: (context) {
                    return Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10),
                      child: Wrap(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(6),
                            child: CodeWrapper(builder: _buildLargeButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6),
                            child: CodeWrapper(builder: _buildMediumButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6),
                            child: CodeWrapper(builder: _buildSmallButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6),
                            child: CodeWrapper(builder: _buildExtraSmallButton),
                          ),
                        ],
                      ),
                    );
                  }),
              ExampleItem(
                  ignoreCode: true,
                  desc: '按钮形状',
                  builder: (context) {
                    return Container(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 16, right: 6, top: 6),
                            child: CodeWrapper(
                              builder: _buildPrimaryFillButton,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6),
                            child: CodeWrapper(builder: _buildSquareIconButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6),
                            child: CodeWrapper(builder: _buildRoundButton),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                right: 16, left: 6, top: 6),
                            child: CodeWrapper(builder: _buildCircleButton),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: CodeWrapper(builder: _buildFilledButton),
                          )
                        ],
                      ),
                    );
                  }),
              ExampleItem(
                  ignoreCode: true,
                  desc: '按钮主题',
                  builder: (context) {
                    return Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 8),
                      child: Wrap(
                        children: [
                          /// 默认主题
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildDefaultFillButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildDefaultStrokeButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildDefaultTextButton),
                          ),

                          /// primary主题
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(
                              builder: _buildPrimaryFillButton,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildPrimaryStrokeButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildPrimaryTextButton),
                          ),

                          /// danger主题
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(builder: _buildDangerFillButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildDangerStrokeButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(builder: _buildDangerTextButton),
                          ),

                          /// light主题
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(builder: _buildLightFillButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child:
                                CodeWrapper(builder: _buildLightStrokeButton),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: CodeWrapper(
                              builder: _buildLightTextButton,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ]),
          ],
          test: [
            ExampleItem(
                ignoreCode: true,
                desc: '测试child',
                builder: (context) {
                  return CodeWrapper(builder: _buildChildTestButton);
                }),
            ExampleItem(
                ignoreCode: true,
                desc: '通栏按钮测试',
                builder: (context) {
                  return Container(
                    color: Colors.grey,
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        GMButton(
                          isBlock: true,
                          text: '填充block按钮',
                          theme: GMButtonTheme.primary,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GMButton(
                          isBlock: true,
                          text: '描边block按钮',
                          type: GMButtonType.outline,
                          theme: GMButtonTheme.primary,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GMButton(
                          isBlock: true,
                          text: '文字block按钮',
                          type: GMButtonType.text,
                          theme: GMButtonTheme.primary,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GMButton(
                          isBlock: true,
                          text: '幽灵block按钮',
                          type: GMButtonType.ghost,
                          theme: GMButtonTheme.primary,
                        ),
                      ],
                    ),
                  );
                }),
            ExampleItem(
                ignoreCode: true,
                desc: '各种按钮状态测试',
                builder: _buildStatusDisplay),
            ExampleItem(
                ignoreCode: true,
                desc: '按钮中路由跳转',
                builder: (context){
                  return GMButton(
                    text: '点击跳转',
                    size: GMButtonSize.large,
                    // type: GMButtonType.text,
                    shape: GMButtonShape.rectangle,
                    onTap: () async{
                      var result = await Navigator.of(context).pushNamedAndRemoveUntil('divider',(router){
                        return true;
                      });
                      print('pushNamedAndRemoveUntil result: $result');
                    },
                  );
                }),
          ],
        ));
  }

  @Demo(group: 'button')
  GMButton _buildLightTextButton(BuildContext context) {
    return const GMButton(
      text: '文字按钮',
      size: GMButtonSize.large,
      type: GMButtonType.text,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.light,
    );
  }

  @Demo(group: 'button')
  GMButton _buildLightStrokeButton(BuildContext context) {
    return const GMButton(
      text: '描边按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.light,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDangerTextButton(BuildContext context) {
    return const GMButton(
      text: '文字按钮',
      size: GMButtonSize.large,
      type: GMButtonType.text,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.danger,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDangerStrokeButton(BuildContext context) {
    return const GMButton(
      text: '描边按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.danger,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDangerFillButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.danger,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDefaultTextButton(BuildContext context) {
    return const GMButton(
      text: '文字按钮',
      size: GMButtonSize.large,
      type: GMButtonType.text,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.defaultTheme,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDefaultStrokeButton(BuildContext context) {
    return const GMButton(
      text: '描边按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.defaultTheme,
    );
  }

  @Demo(group: 'button')
  GMButton _buildFilledButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.filled,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildCircleButton(BuildContext context) {
    return const GMButton(
      icon: GMIcons.app,
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.circle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildRoundButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.round,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildExtraSmallButton(BuildContext context) {
    return const GMButton(
      text: '按钮28',
      size: GMButtonSize.extraSmall,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildSmallButton(BuildContext context) {
    return const GMButton(
      text: '按钮32',
      size: GMButtonSize.small,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildMediumButton(BuildContext context) {
    return const GMButton(
      text: '按钮40',
      size: GMButtonSize.medium,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildLargeButton(BuildContext context) {
    return const GMButton(
      text: '按钮48',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDisablePrimaryTextButton(BuildContext context) {
    return const GMButton(
      text: '文字按钮',
      size: GMButtonSize.large,
      type: GMButtonType.text,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
      disabled: true,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDisablePrimaryStrokeButton(BuildContext context) {
    return const GMButton(
      text: '描边按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
      disabled: true,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDisableDefaultFillButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.defaultTheme,
      disabled: true,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDisableLightFillButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.light,
      disabled: true,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDisablePrimaryFillButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
      disabled: true,
    );
  }

  @Demo(group: 'button')
  GMButton _buildFilledFillButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      icon: GMIcons.app,
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      theme: GMButtonTheme.primary,
      isBlock: true,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDefaultGhostButton(BuildContext context) {
    return const GMButton(
      text: '幽灵按钮',
      size: GMButtonSize.large,
      type: GMButtonType.ghost,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.defaultTheme,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDangerGhostButton(BuildContext context) {
    return const GMButton(
      text: '幽灵按钮',
      size: GMButtonSize.large,
      type: GMButtonType.ghost,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.danger,
    );
  }

  @Demo(group: 'button')
  GMButton _buildPrimaryGhostButton(BuildContext context) {
    return const GMButton(
      text: '幽灵按钮',
      size: GMButtonSize.large,
      type: GMButtonType.ghost,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildSquareIconButton(BuildContext context) {
    return const GMButton(
      icon: GMIcons.app,
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.square,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildLoadingIconButton(BuildContext context) {
    return GMButton(
      text: '加载中',
      iconWidget: GMLoading(
        size: GMLoadingSize.small,
        icon: GMLoadingIcon.circle,
        iconColor: GMTheme.of(context).whiteColor1,
      ),
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildRectangleIconButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      icon: GMIcons.app,
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildPrimaryTextButton(BuildContext context) {
    return const GMButton(
      text: '文字按钮',
      size: GMButtonSize.large,
      type: GMButtonType.text,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildPrimaryStrokeButton(BuildContext context) {
    return const GMButton(
      text: '描边按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildDefaultFillButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.defaultTheme,
    );
  }

  @Demo(group: 'button')
  @Demo(group: 'button')
  GMButton _buildPrimaryFillButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.primary,
    );
  }

  @Demo(group: 'button')
  GMButton _buildLightFillButton(BuildContext context) {
    return const GMButton(
      text: '填充按钮',
      size: GMButtonSize.large,
      type: GMButtonType.fill,
      shape: GMButtonShape.rectangle,
      theme: GMButtonTheme.light,
    );
  }

  @Demo(group: 'button')
  Widget _buildCombinationButtons(BuildContext context) {
    return Row(
      children: const [
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: GMButton(
          text: '填充按钮',
          size: GMButtonSize.large,
          type: GMButtonType.fill,
          shape: GMButtonShape.rectangle,
          theme: GMButtonTheme.light,
        )),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: GMButton(
          text: '填充按钮',
          size: GMButtonSize.large,
          type: GMButtonType.fill,
          shape: GMButtonShape.rectangle,
          theme: GMButtonTheme.primary,
        )),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }

  @Demo(group: 'button')
  Widget _buildChildTestButton(BuildContext context) {
    return GMButton(
      child: Container(
        height: 24,
        width: 24,
        color: Colors.red,
      ),
    );
  }

  Widget _buildStatusDisplay(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        /// fill
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                style: GMButtonStyle.generateFillStyleByTheme(
                    context, GMButtonTheme.primary, GMButtonStatus.active),
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                disabled: true,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                style: GMButtonStyle.generateFillStyleByTheme(
                    context, GMButtonTheme.light, GMButtonStatus.active),
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                disabled: true,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                style: GMButtonStyle.generateFillStyleByTheme(
                    context, GMButtonTheme.defaultTheme, GMButtonStatus.active),
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                disabled: true,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                style: GMButtonStyle.generateFillStyleByTheme(
                    context, GMButtonTheme.danger, GMButtonStatus.active),
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                disabled: true,
              ),
            ],
          ),
        ),

        /// outline
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                type: GMButtonType.outline,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                style: GMButtonStyle.generateOutlineStyleByTheme(
                    context, GMButtonTheme.primary, GMButtonStatus.active),
                type: GMButtonType.outline,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                disabled: true,
                type: GMButtonType.outline,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                type: GMButtonType.outline,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                style: GMButtonStyle.generateOutlineStyleByTheme(
                    context, GMButtonTheme.light, GMButtonStatus.active),
                type: GMButtonType.outline,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                disabled: true,
                type: GMButtonType.outline,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                type: GMButtonType.outline,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                style: GMButtonStyle.generateOutlineStyleByTheme(
                    context, GMButtonTheme.defaultTheme, GMButtonStatus.active),
                type: GMButtonType.outline,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                disabled: true,
                type: GMButtonType.outline,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                type: GMButtonType.outline,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                style: GMButtonStyle.generateOutlineStyleByTheme(
                    context, GMButtonTheme.danger, GMButtonStatus.active),
                type: GMButtonType.outline,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                disabled: true,
                type: GMButtonType.outline,
              ),
            ],
          ),
        ),

        /// text
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                type: GMButtonType.text,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                style: GMButtonStyle.generateTextStyleByTheme(
                    context, GMButtonTheme.primary, GMButtonStatus.active),
                type: GMButtonType.text,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                disabled: true,
                type: GMButtonType.text,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                type: GMButtonType.text,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                style: GMButtonStyle.generateTextStyleByTheme(
                    context, GMButtonTheme.light, GMButtonStatus.active),
                type: GMButtonType.text,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                disabled: true,
                type: GMButtonType.text,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                type: GMButtonType.text,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                style: GMButtonStyle.generateTextStyleByTheme(
                    context, GMButtonTheme.defaultTheme, GMButtonStatus.active),
                type: GMButtonType.text,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                disabled: true,
                type: GMButtonType.text,
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                type: GMButtonType.text,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                style: GMButtonStyle.generateTextStyleByTheme(
                    context, GMButtonTheme.danger, GMButtonStatus.active),
                type: GMButtonType.text,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                disabled: true,
                type: GMButtonType.text,
              ),
            ],
          ),
        ),

        /// ghost
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.black,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                type: GMButtonType.ghost,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                style: GMButtonStyle.generateGhostStyleByTheme(
                    context, GMButtonTheme.primary, GMButtonStatus.active),
                type: GMButtonType.ghost,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.primary,
                disabled: true,
                type: GMButtonType.ghost,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.black,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                type: GMButtonType.ghost,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                style: GMButtonStyle.generateGhostStyleByTheme(
                    context, GMButtonTheme.light, GMButtonStatus.active),
                type: GMButtonType.ghost,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.light,
                disabled: true,
                type: GMButtonType.ghost,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.black,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                type: GMButtonType.ghost,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                style: GMButtonStyle.generateGhostStyleByTheme(
                    context, GMButtonTheme.defaultTheme, GMButtonStatus.active),
                type: GMButtonType.ghost,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.defaultTheme,
                disabled: true,
                type: GMButtonType.ghost,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.black,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                type: GMButtonType.ghost,
              ),
              GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                style: GMButtonStyle.generateGhostStyleByTheme(
                    context, GMButtonTheme.danger, GMButtonStatus.active),
                type: GMButtonType.ghost,
              ),
              const GMButton(
                icon: GMIcons.app,
                text: 'Button',
                theme: GMButtonTheme.danger,
                disabled: true,
                type: GMButtonType.ghost,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
