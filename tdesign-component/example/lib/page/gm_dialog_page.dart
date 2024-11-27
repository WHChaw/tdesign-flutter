/*
 * Created by haozhicao@tencent.com on 6/17/22.
 * gm_dialog_page.dart
 * 
 */

import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMDialogPage extends StatefulWidget {
  const GMDialogPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GMDialogPageState();
}

class _GMDialogPageState extends State<GMDialogPage> {
  final _dialogTitle = '对话框标题';
  final _commonContent = '告知当前状态、信息和解决方法，等内容。描述尽可能控制在三行内。';
  final _longContent = '这里是辅助内容文案，这里是辅助内容文案，这里是辅助内容文案，这里是辅助内容文案。\n\n' * 4;
  final _inputHint = '请输入文字';

  final _demoImage = Image.asset(
    'assets/img/image.png',
  );

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(),
        desc: '用于显示重要提示或请求用户进行重要操作，一种打断当前操作的模态视图。',
        exampleCodeGroup: 'dialog',
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        children: [
          ExampleModule(title: '组件类型', children: [
            ExampleItem(desc: '反馈类对话框', builder: _buildFeedbackNormal),
            ExampleItem(builder: _buildFeedbackNoTitle),
            ExampleItem(builder: _buildFeedbackOnlyTitle),
            ExampleItem(builder: _buildFeedbackLongContent),
            ExampleItem(desc: '确认类对话框', builder: _buildConfirmNormal),
            ExampleItem(builder: _buildConfirmNoTitle),
            ExampleItem(builder: _buildConfirmOnlyTitle),
            ExampleItem(desc: '输入类对话框', builder: _buildInputNormal),
            ExampleItem(builder: _buildInputNoContent),
            ExampleItem(desc: '带图片的对话框', builder: _buildImageTop),
            ExampleItem(builder: _buildImageTopNoTitle),
            ExampleItem(builder: _buildImageTopOnlyTitle),
            ExampleItem(builder: _buildImageMiddle),
            ExampleItem(builder: _buildImageMiddleOnlyTitle),
            ExampleItem(builder: _buildImageMiddleOnlyImage),
          ]),
          ExampleModule(title: '组件类型', children: [
            ExampleItem(desc: '文字按钮', builder: _buildTextButtonSingle),
            ExampleItem(builder: _buildTextButtonDouble),
            ExampleItem(desc: '横向基础按钮', builder: _buildNormalButtonSingle),
            ExampleItem(builder: _buildNormalButtonDouble),
            ExampleItem(desc: '纵向基础按钮', builder: _buildVerticalButtonDouble),
            ExampleItem(builder: _buildVerticalButtonTriple),
            ExampleItem(
                desc: '带关闭按钮的对话框', builder: _buildDialogWithCloseButton),
          ]),
        ],
    test: [
      ExampleItem(desc: '自定义标题对齐和内容组件', builder: _customFeedbackNormal),
      ExampleItem(builder: _customConfirmNormal),
      ExampleItem(builder: _customConfirmVertical),
      ExampleItem(builder: _customImageTop),
      ExampleItem(desc: '自定义边距和按钮', builder: _customContentAndBtn)
    ],);
  }

  // 反馈类
  @Demo(group: 'dialog')
  Widget _buildFeedbackNormal(BuildContext context) {
    return GMButton(
      text: '反馈类-带标题',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMConfirmDialog(
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildFeedbackNoTitle(BuildContext context) {
    return GMButton(
      text: '反馈类-无标题',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMConfirmDialog(
              content: _commonContent,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildFeedbackOnlyTitle(BuildContext context) {
    return GMButton(
      text: '反馈类-纯标题',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMConfirmDialog(
              title: _dialogTitle,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildFeedbackLongContent(BuildContext context) {
    return GMButton(
      text: '反馈类-内容超长',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMConfirmDialog(
              title: _dialogTitle,
              content: _longContent,
              contentMaxHeight: 300,
            );
          },
        );
      },
    );
  }

  // 确认类
  @Demo(group: 'dialog')
  Widget _buildConfirmNormal(BuildContext context) {
    return GMButton(
      text: '确认类-带标题',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMAlertDialog(
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildConfirmNoTitle(BuildContext context) {
    return GMButton(
      text: '确认类-无标题',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMAlertDialog(
              content: _commonContent,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildConfirmOnlyTitle(BuildContext context) {
    return GMButton(
      text: '确认类-纯标题',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMAlertDialog(
              title: _dialogTitle,
            );
          },
        );
      },
    );
  }

  // 输入类
  @Demo(group: 'dialog')
  Widget _buildInputNormal(BuildContext context) {
    return GMButton(
      text: '输入类-带描述',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMInputDialog(
              textEditingController: TextEditingController(),
              title: _dialogTitle,
              content: _commonContent,
              hintText: _inputHint,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildInputNoContent(BuildContext context) {
    return GMButton(
      text: '输入类-无描述',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMInputDialog(
              textEditingController: TextEditingController(),
              title: _dialogTitle,
              hintText: _inputHint,
            );
          },
        );
      },
    );
  }

  // 图片类型
  @Demo(group: 'dialog')
  Widget _buildImageTop(BuildContext context) {
    return GMButton(
      text: '图片置顶-带标题描述',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMImageDialog(
              image: _demoImage,
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildImageTopNoTitle(BuildContext context) {
    return GMButton(
      text: '图片置顶-无标题',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMImageDialog(
              image: _demoImage,
              content: _commonContent,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildImageTopOnlyTitle(BuildContext context) {
    return GMButton(
      text: '图片置顶-纯标题',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMImageDialog(
              image: _demoImage,
              title: _dialogTitle,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildImageMiddle(BuildContext context) {
    return GMButton(
      text: '图片居中-带标题描述',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMImageDialog(
              image: _demoImage,
              title: _dialogTitle,
              content: _commonContent,
              imagePosition: GMDialogImagePosition.middle,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildImageMiddleOnlyTitle(BuildContext context) {
    return GMButton(
      text: '图片居中-纯标题',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMImageDialog(
              image: _demoImage,
              title: _dialogTitle,
              imagePosition: GMDialogImagePosition.middle,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildImageMiddleOnlyImage(BuildContext context) {
    return GMButton(
      text: '图片居中-纯图片',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMImageDialog(
              image: _demoImage,
              imagePosition: GMDialogImagePosition.middle,
            );
          },
        );
      },
    );
  }

  // 文字按钮
  @Demo(group: 'dialog')
  Widget _buildTextButtonSingle(BuildContext context) {
    return GMButton(
      text: '单个文字按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMConfirmDialog(
              title: _dialogTitle,
              content: _commonContent,
              buttonStyle: GMDialogButtonStyle.text,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildTextButtonDouble(BuildContext context) {
    return GMButton(
      text: '左右文字按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMAlertDialog(
              title: _dialogTitle,
              content: _commonContent,
              buttonStyle: GMDialogButtonStyle.text,
            );
          },
        );
      },
    );
  }

  // 横向基础按钮
  @Demo(group: 'dialog')
  Widget _buildNormalButtonSingle(BuildContext context) {
    return GMButton(
      text: '单个横向基础按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMConfirmDialog(
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildNormalButtonDouble(BuildContext context) {
    return GMButton(
      text: '左右横向基础按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMAlertDialog(
              title: _dialogTitle,
              content: _commonContent,
            );
          },
        );
      },
    );
  }

  // 纵向基础按钮
  @Demo(group: 'dialog')
  Widget _buildVerticalButtonDouble(BuildContext context) {
    return GMButton(
      text: '两个纵向基础按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMAlertDialog.vertical(
                title: _dialogTitle,
                content: _commonContent,
                buttons: [
                  GMDialogButtonOptions(
                      title: '主要按钮',
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: GMButtonTheme.primary),
                  GMDialogButtonOptions(
                      title: '次要按钮',
                      titleColor: GMTheme.of(context).brandColor7,
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: GMButtonTheme.light),
                ]);
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildVerticalButtonTriple(BuildContext context) {
    return GMButton(
      text: '三个纵向基础按钮',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMAlertDialog.vertical(
                title: _dialogTitle,
                content: _commonContent,
                buttons: [
                  GMDialogButtonOptions(
                      title: '主要按钮',
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: GMButtonTheme.primary),
                  GMDialogButtonOptions(
                      title: '次要按钮',
                      titleColor: GMTheme.of(context).brandColor7,
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: GMButtonTheme.light),
                  GMDialogButtonOptions(
                      title: '次要按钮',
                      titleColor: GMTheme.of(context).brandColor7,
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: GMButtonTheme.light),
                ]);
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _buildDialogWithCloseButton(BuildContext context) {
    return GMButton(
      text: '带关闭按钮的对话框',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMConfirmDialog(
              title: _dialogTitle,
              content: _commonContent,
              showCloseButton: true,
            );
          },
        );
      },
    );
  }

  // 反馈类
  @Demo(group: 'dialog')
  Widget _customFeedbackNormal(BuildContext context) {
    return GMButton(
      text: '反馈类-标题偏左',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMConfirmDialog(
              title: _dialogTitle,
              titleAlignment: Alignment.centerLeft,
              contentWidget: GMText.rich(
                  GMTextSpan(
                      children: [
                        GMTextSpan(text: '红色文字', textColor: Colors.red),
                        GMTextSpan(text: '绿色文字', textColor: Colors.green),
                      ]
                  )
              ),
            );
          },
        );
      },
    );
  }
  @Demo(group: 'dialog')
  Widget _customConfirmNormal(BuildContext context) {
    return GMButton(
      text: '确认类-标题偏右',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMAlertDialog(
              title: _dialogTitle,
              titleAlignment: Alignment.centerRight,
              contentWidget: GMText.rich(
                  GMTextSpan(
                      children: [
                        GMTextSpan(text: '红色文字', textColor: Colors.red),
                        GMTextSpan(text: '绿色文字', textColor: Colors.green),
                      ]
                  )
              ),
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _customConfirmVertical(BuildContext context) {
    return GMButton(
      text: '纵向按钮-自定义内容',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMAlertDialog.vertical(
                title: _dialogTitle,
                contentWidget: GMText.rich(
                    GMTextSpan(
                        children: [
                          GMTextSpan(text: '红色文字', textColor: Colors.red),
                          GMTextSpan(text: '绿色文字', textColor: Colors.green),
                        ]
                    )
                ),
                buttons: [
                  GMDialogButtonOptions(
                      title: '主要按钮',
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: GMButtonTheme.primary),
                  GMDialogButtonOptions(
                      title: '次要按钮',
                      titleColor: GMTheme.of(context).brandColor7,
                      action: () {
                        Navigator.pop(context);
                      },
                      theme: GMButtonTheme.light),
                ]);
          },
        );
      },
    );
  }
  @Demo(group: 'dialog')
  Widget _customImageTop(BuildContext context) {
    return GMButton(
      text: '图片置顶-自定义列表内容',
      size: GMButtonSize.large,
      type: GMButtonType.outline,
      theme: GMButtonTheme.primary,
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return GMImageDialog(
              image: _demoImage,
              title: _dialogTitle,
              contentWidget: ListView(
                shrinkWrap: true,
                children: const [
                  GMText('红色文字', textColor: Colors.red),
                  GMText('绿色文字', textColor: Colors.green),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @Demo(group: 'dialog')
  Widget _customContentAndBtn(BuildContext context) {
    return GMButton(
        text: '自定义边距和按钮',
        size: GMButtonSize.large,
        type: GMButtonType.outline,
        theme: GMButtonTheme.primary,
        onTap: () {
          showGeneralDialog(
            context: context,
            pageBuilder: (BuildContext buildContext, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return GMConfirmDialog(
                title: _dialogTitle,
                content: _commonContent,
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                buttonWidget: Container(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: GMButton(
                    text: '自定义按钮',
                    theme: GMButtonTheme.primary,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }
          );
        }
    );
  }
}
