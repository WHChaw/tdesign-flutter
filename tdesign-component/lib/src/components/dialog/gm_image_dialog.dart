/*
 * Created by haozhicao@tencent.com on 6/20/22.
 * gm_image_dialog.dart
 * 
 */

import 'package:flutter/material.dart';

import '../../../tdesign_flutter.dart';
import '../../util/context_extension.dart';
import 'gm_dialog_widget.dart';

enum GMDialogImagePosition {
  top,
  middle,
}

/// 带有图片的弹窗控件
class GMImageDialog extends StatelessWidget {
  const GMImageDialog({
    Key? key,
    required this.image,
    this.imagePosition = GMDialogImagePosition.top,
    this.backgroundColor = Colors.white,
    this.radius = 12.0,
    this.title,
    this.titleColor = const Color(0xE6000000),
    this.titleAlignment,
    this.contentWidget,
    this.content,
    this.contentColor,
    this.leftBtn,
    this.rightBtn,
    this.showCloseButton,
    this.padding,
    this.buttonWidget,
  }) : super(key: key);

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

  /// 左侧按钮配置
  final GMDialogButtonOptions? leftBtn;

  /// 右侧按钮配置
  final GMDialogButtonOptions? rightBtn;

  /// 图片
  final Image image;

  /// 图片位置
  final GMDialogImagePosition? imagePosition;

  /// 显示右上角关闭按钮
  final bool? showCloseButton;

  /// 内容内边距
  final EdgeInsets? padding;

  /// 自定义按钮
  final Widget? buttonWidget;

  Widget _buildImage(BuildContext context) {
    return SizedBox(
      width: 311,
      height: 160,
      child: FittedBox(
        fit: BoxFit.cover,
        child: image,
      ),
    );
  }

  Widget _buildTopImage(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)),
        child: _buildImage(context),
      ),
      GMDialogInfoWidget(
        title: title,
        padding: padding ?? const EdgeInsets.fromLTRB(24, 24, 24, 0),
        titleColor: titleColor,
        titleAlignment: titleAlignment,
        contentWidget: contentWidget,
        content: content,
        contentColor: contentColor,
      ),
      const GMDivider(height: 24, color: Colors.transparent),
      _horizontalButtons(context),
    ]);
  }

  Widget _buildMiddleImage(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      GMDialogInfoWidget(
        padding: padding ?? const EdgeInsets.fromLTRB(24, 24, 24, 0),
        title: title,
        titleColor: titleColor,
        titleAlignment: titleAlignment,
        contentWidget: contentWidget,
        content: content,
        contentColor: contentColor,
      ),
      Container(
        padding: const EdgeInsets.only(top: 24),
        child: ClipRRect(
          child: _buildImage(context),
        ),
      ),
      const GMDivider(height: 24, color: Colors.transparent),
      _horizontalButtons(context),
    ]);
  }

  Widget _buildOnlyImage(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)),
        child: _buildImage(context),
      ),
      const GMDivider(height: 24, color: Colors.transparent),
      _horizontalButtons(context),
    ]);
  }

  Widget _buildBody(BuildContext context) {
    if (title == null && content == null) {
      return _buildOnlyImage(context);
    } else if (imagePosition == GMDialogImagePosition.middle) {
      return _buildMiddleImage(context);
    } else {
      return _buildTopImage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GMDialogScaffold(
        showCloseButton: showCloseButton,
        backgroundColor: backgroundColor,
        radius: radius,
        body: _buildBody(context));
  }

  Widget _horizontalButtons(BuildContext context) {
    if (buttonWidget != null) {
      return buttonWidget!;
    }
    final left = leftBtn ??
        GMDialogButtonOptions(
            title: context.resource.cancel, theme: GMButtonTheme.light, action: null);
    final right = rightBtn ??
        GMDialogButtonOptions(
            title: context.resource.confirm, theme: GMButtonTheme.primary, action: null);
    return HorizontalNormalButtons(
      leftBtn: left,
      rightBtn: right,
    );
  }
}
