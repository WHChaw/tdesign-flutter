/*
 * Created by haozhicao@tencent.com on 6/20/22.
 * gm_input_dialog.dart
 * 
 */

import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';
import '../../util/context_extension.dart';
import 'gm_dialog_widget.dart';

/// 带有输入框的弹窗
class GMInputDialog extends StatelessWidget {
  const GMInputDialog({
    Key? key,
    required this.textEditingController,
    this.backgroundColor = Colors.white,
    this.radius = 12.0,
    this.title,
    this.titleColor = const Color(0xE6000000),
    this.titleAlignment,
    this.contentWidget,
    this.content,
    this.hintText = '',
    this.contentColor,
    this.leftBtn,
    this.rightBtn,
    this.showCloseButton,
    this.padding = const EdgeInsets.fromLTRB(24, 32, 24, 0),
    this.buttonWidget,
    this.customInputWidget,
  })  : assert((title != null || content != null)),
        super(key: key);

  /// 背景颜色
  final Color backgroundColor;

  /// 圆角
  final double radius;

  /// 标题
  final String? title;

  /// 标题颜色
  final Color titleColor;

  /// 标题对齐模式
  final AlignmentGeometry? titleAlignment;

  /// 内容Widget
  final Widget? contentWidget;

  /// 内容
  final String? content;

  /// 输入提示
  final String? hintText;

  /// 内容颜色
  final Color? contentColor;

  /// 输入controller
  final TextEditingController textEditingController;

  /// 左侧按钮配置
  final GMDialogButtonOptions? leftBtn;

  /// 右侧按钮配置
  final GMDialogButtonOptions? rightBtn;

  /// 显示右上角关闭按钮
  final bool? showCloseButton;

  /// 内容内边距
  final EdgeInsets? padding;

  /// 自定义按钮
  final Widget? buttonWidget;

  /// 自定义输入框
  final Widget? customInputWidget;

  @override
  Widget build(BuildContext context) {
    return GMDialogScaffold(
      showCloseButton: showCloseButton,
      backgroundColor: backgroundColor,
      radius: radius,
      body: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          GMDialogInfoWidget(
            title: title,
            titleColor: titleColor,
            titleAlignment: titleAlignment,
            contentWidget: contentWidget,
            content: content,
            contentColor: contentColor,
            padding: padding,
          ),
          SizedBox(
            child: customInputWidget != null
                ? customInputWidget!
                : Container(
                    color: Colors.white,
                    height: 48,
                    margin: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                    child: TextField(
                      controller: textEditingController,
                      autofocus: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
                        hintText: hintText,
                        hintStyle: const TextStyle(color: Color(0x66000000)),
                        fillColor: const Color(0xFFF3F3F3),
                        filled: true,
                        // labelText: '左上角',
                      ),
                    ),
                  ),
          ),
          _horizontalButtons(context),
        ]),
      ),
    );
  }

  Widget _horizontalButtons(BuildContext context) {
    if (buttonWidget != null) {
      return buttonWidget!;
    }
    final left = leftBtn ??
        GMDialogButtonOptions(
            title: context.resource.cancel,
            titleColor: const Color(0xE6000000),
            fontWeight: FontWeight.normal,
            action: null,
            height: 56);
    final right = rightBtn ??
        GMDialogButtonOptions(title: context.resource.confirm, action: null, fontWeight: FontWeight.w600, height: 56);
    return HorizontalTextButtons(
      leftBtn: left,
      rightBtn: right,
    );
  }
}