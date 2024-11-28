/*
 * Created by haozhicao@tencent.com on 6/20/22.
 * gm_alert_dialog.dart
 * 
 */

import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';
import '../../util/context_extension.dart';
import 'gm_dialog_widget.dart';

/// 弹窗控件
///
/// 支持横向或竖向摆放按钮
/// 横向最多摆放两个按钮
class GMAlertDialog extends StatelessWidget {
  /// 横向按钮排列的对话框
  ///
  /// [leftBtn]和[rightBtn]不传style参数会应用默认样式，左侧弱按钮，右侧强按钮
  const GMAlertDialog({
    Key? key,
    this.backgroundColor = Colors.white,
    this.radius = 12.0,
    this.title,
    this.titleColor = const Color(0xE6000000),
    this.content,
    this.contentColor,
    this.titleAlignment,
    this.contentWidget,
    this.contentMaxHeight = 0,
    this.leftBtn,
    this.rightBtn,
    this.leftBtnAction,
    this.rightBtnAction,
    this.showCloseButton,
    GMDialogButtonStyle buttonStyle = GMDialogButtonStyle.normal,
    this.padding = const EdgeInsets.fromLTRB(24, 32, 24, 0),
    this.buttonWidget,
  })  : assert((title != null || content != null)),
        _vertical = false,
        _buttons = null,
        _buttonStyle = buttonStyle,
        super(key: key);

  /// 纵向按钮排列的对话框
  ///
  /// [buttons]参数是必须的，纵向按钮默认样式都是[GMButtonTheme.primary]
  const GMAlertDialog.vertical({
    Key? key,
    required List<GMDialogButtonOptions> buttons,
    this.backgroundColor = Colors.white,
    this.radius = 12.0,
    this.title,
    this.titleColor = Colors.black,
    this.titleAlignment,
    this.contentWidget,
    this.content,
    this.contentColor,
    this.contentMaxHeight = 0,
    this.showCloseButton,
    this.padding = const EdgeInsets.fromLTRB(24, 32, 24, 0),
    this.buttonWidget,
  })  : _vertical = true,
        leftBtn = null,
        rightBtn = null,
        _buttons = buttons,
        _buttonStyle = GMDialogButtonStyle.normal,
        leftBtnAction = null,
        rightBtnAction = null,
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

  /// 内容颜色
  final Color? contentColor;

  /// 内容的最大高度，默认为0，也就是不限制高度
  final double contentMaxHeight;

  /// 左侧按钮配置
  final GMDialogButtonOptions? leftBtn;

  /// 右侧按钮配置
  final GMDialogButtonOptions? rightBtn;

  /// 左侧按钮默认点击
  final Function()? leftBtnAction;

  /// 右侧按钮默认点击
  final Function()? rightBtnAction;

  /// 显示右上角关闭按钮
  final bool? showCloseButton;

  /// 选项是否是垂直排布，默认是左右排布
  final bool _vertical;

  /// 垂直排布的按钮列表
  final List<GMDialogButtonOptions>? _buttons;

  /// 按钮样式
  ///
  /// 支持普通类型和文字类型按钮
  /// 文字类型仅支持横向排列
  /// [leftBtn]和[rightBtn]中的style会覆盖此配置
  final GMDialogButtonStyle _buttonStyle;

  /// 内容内边距
  final EdgeInsets? padding;

  /// 自定义按钮
  final Widget? buttonWidget;

  @override
  Widget build(BuildContext context) {
    // 标题和内容不能同时为空
    return GMDialogScaffold(
        showCloseButton: showCloseButton,
        backgroundColor: backgroundColor,
        radius: radius,
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          GMDialogInfoWidget(
            title: title,
            titleColor: titleColor,
            titleAlignment: titleAlignment,
            contentWidget: contentWidget,
            content: content,
            contentColor: contentColor,
            contentMaxHeight: contentMaxHeight,
            padding: padding,
          ),
          const GMDivider(height: 24, color: Colors.transparent),
          _vertical ? _verticalButtons(context) : _horizontalButtons(context),
        ]));
  }

  Widget _horizontalButtons(BuildContext context) {
    if(buttonWidget != null) {
      return buttonWidget!;
    }
    final left = leftBtn ??
        GMDialogButtonOptions(
            title: context.resource.cancel, theme: GMButtonTheme.light, action: leftBtnAction);
    final right = rightBtn ??
        GMDialogButtonOptions(
            title: context.resource.confirm, theme: GMButtonTheme.primary, action: rightBtnAction);
    return _buttonStyle == GMDialogButtonStyle.text
        ? HorizontalTextButtons(leftBtn: left, rightBtn: right)
        : HorizontalNormalButtons(
            leftBtn: left,
            rightBtn: right,
          );
  }

  Widget _verticalButtons(BuildContext context) {
    var widgets = <Widget>[];
    _buttons!.asMap().forEach((index, value) {
      Widget btn = GMDialogButton(
        buttonText: value.title,
        buttonTextColor: value.titleColor,
        height: value.height,
        buttonTextFontWeight: value.fontWeight ?? FontWeight.w600,
        buttonStyle: value.style,
        buttonTheme: value.theme,
        buttonType: value.type,
        onPressed: () {
          if(value.action != null){
            value.action!();
          } else {
            Navigator.pop(context);
          }
        },
      );
      widgets.add(btn);
      if (index < _buttons!.length - 1) {
        widgets.add(const GMDivider(height: 12, color: Colors.transparent));
      }
    });

    return Container(
      padding:
          const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Column(
        children: widgets,
      ),
    );
  }
}