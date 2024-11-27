import 'package:flutter/material.dart';

import '../../theme/gm_colors.dart';
import '../../theme/gm_theme.dart';
import 'gm_notice_bar.dart';

/// 公告栏类型
enum GMNoticeBarType {
  /// 静止（默认）
  none,

  /// 滚动
  scroll,

  /// 步进
  step
}

/// 公告栏主题
enum GMNoticeBarTheme {
  /// 默认
  info,

  /// 成功
  success,

  /// 警告
  warning,

  /// 错误
  error
}

/// 公告栏样式
class GMNoticeBarStyle {
  GMNoticeBarStyle(
      {this.context,
      this.backgroundColor,
      this.textStyle,
      this.leftIconColor,
      this.rightIconColor,
      this.padding});

  /// 上下文
  BuildContext? context;

  /// 公告栏背景色
  Color? backgroundColor;

  /// 公告栏左侧图标颜色
  Color? leftIconColor;

  /// 公告栏右侧图标颜色
  Color? rightIconColor;

  /// 公告栏内边距
  EdgeInsetsGeometry? padding;

  /// 公告栏内容样式
  TextStyle? textStyle;

  /// 公告栏内边距，用于获取默认值
  EdgeInsetsGeometry get getPadding =>
      padding ??
      const EdgeInsets.only(top: 13, bottom: 13, left: 16, right: 12);

  /// 公告栏内容样式，用于获取默认值
  TextStyle get getTextStyle =>
      textStyle ??
      TextStyle(
        color: GMTheme.of(context).fontGyColor1,
        fontSize: 14,
        height: 1,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      );

  /// 根据主题生成样式
  GMNoticeBarStyle.generateTheme(BuildContext context,
      {GMNoticeBarTheme? theme = GMNoticeBarTheme.info}) {
    rightIconColor = GMTheme.of(context).grayColor7;
    switch (theme) {
      case GMNoticeBarTheme.warning:
        leftIconColor = GMTheme.of(context).warningNormalColor;
        backgroundColor = GMTheme.of(context).warningLightColor;
        break;
      case GMNoticeBarTheme.error:
        leftIconColor = GMTheme.of(context).errorNormalColor;
        backgroundColor = GMTheme.of(context).errorLightColor;
        break;
      case GMNoticeBarTheme.success:
        leftIconColor = GMTheme.of(context).successNormalColor;
        backgroundColor = GMTheme.of(context).successLightColor;
        break;
      default:
        leftIconColor = GMTheme.of(context).brandNormalColor;
        backgroundColor = GMTheme.of(context).brandLightColor;
        break;
    }
  }
}
