// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';

class GMSideBarItem {
  const GMSideBarItem({
    Key? key,
    this.badge,
    this.disabled = false,
    this.icon,
    this.textStyle,
    this.label = '',
    this.value = -1,
  });

  /// 徽标
  final GMBadge? badge;

  /// 是否禁用
  final bool disabled;

  /// 图标
  final IconData? icon;

  /// 标签
  final String label;

  /// 标签样式
  final TextStyle? textStyle;

  /// 值
  final int value;
}
