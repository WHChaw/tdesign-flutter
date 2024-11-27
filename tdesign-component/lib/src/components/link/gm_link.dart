import 'package:flutter/material.dart';

import '../../../tdesign_flutter.dart';

/// 限制Function类型，防止传递错误的Function，导致参数对不上
typedef LinkClick = Function(Uri? uri);

enum GMLinkType {
  basic,
  withUnderline,
  withPrefixIcon,
  withSuffixIcon,
}

enum GMLinkStyle {
  primary,
  defaultStyle,
  danger,
  warning,
  success,
}

enum GMLinkState {
  normal,
  active,
  disabled,
}

enum GMLinkSize {
  small,
  medium,
  large,
}

class GMLink extends StatelessWidget {
  const GMLink({
    Key? key,
    required this.label,
    this.uri,
    this.prefixIcon,
    this.suffixIcon,
    this.linkClick,
    this.type = GMLinkType.basic,
    this.style = GMLinkStyle.defaultStyle,
    this.state = GMLinkState.normal,
    this.size = GMLinkSize.medium,
    this.color,
    this.iconSize,
    this.fontSize,
    this.leftGapWithIcon,
    this.rightGapWithIcon,
  }) : super(key: key);

  /// link 展示的文本
  final String label;

  /// link 跳转的uri
  final Uri? uri;

  /// link 类型
  final GMLinkType type;

  /// link 风格
  final GMLinkStyle style;

  /// link 状态
  final GMLinkState state;

  /// link 大小
  final GMLinkSize size;

  /// 前置 icon
  final Icon? prefixIcon;

  /// 后置 icon
  final Icon? suffixIcon;

  /// link 文本的颜色，如果不设置则根据状态和风格进行计算
  final Color? color;

  /// link icon 大小，如果不设置则根据状态和风格进行计算
  final double? iconSize;

  /// link 文本的字体大小，如果不设置则根据状态和风格进行计算
  final double? fontSize;

  /// 前置icon和文本之间的间隔，如果不设置则根据状态和风格进行计算
  final double? leftGapWithIcon;

  /// 后置icon和文本之间的间隔，如果不设置则根据状态和风格进行计算
  final double? rightGapWithIcon;

  /// link 被点击之后所采取的动作，会将uri当做参数传入到该方法当中
  final LinkClick? linkClick;

  @override
  Widget build(BuildContext context) {
    if (type == GMLinkType.withPrefixIcon) {
      return Row(children: [
        prefixIcon == null ? _getDefaultIcon(context) : prefixIcon!,
        SizedBox(
          width: _getLeftGapSize(context),
        ),
        _buildLink(context),
      ]);
    } else if (type == GMLinkType.withSuffixIcon) {
      return Row(children: [
        _buildLink(context),
        SizedBox(
          width: _getRightGapSize(context),
        ),
        suffixIcon == null ? _getDefaultIcon(context) : suffixIcon!,
      ]);
    }

    return _buildLink(context);
  }

  /// 提取成方法，允许业务定义自己的GMLinkConfiguration
  GMLinkConfiguration? getConfiguration(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GMLinkConfiguration>();
  }

  Color getColor(BuildContext context) {
    if (color != null) {
      return color!;
    }
    // to refactor: use map instead of multi level switch
    switch (state) {
      case GMLinkState.normal:
        switch (style) {
          case GMLinkStyle.primary:
            return GMTheme.of(context).brandNormalColor;
          case GMLinkStyle.danger:
            return GMTheme.of(context).errorColor6;
          case GMLinkStyle.warning:
            return GMTheme.of(context).warningColor5;
          case GMLinkStyle.success:
            return GMTheme.of(context).successColor5;
          case GMLinkStyle.defaultStyle:
            return GMTheme.of(context).fontGyColor1;
        }

      case GMLinkState.active:
        switch (style) {
          case GMLinkStyle.primary:
            return GMTheme.of(context).brandClickColor;
          case GMLinkStyle.danger:
            return GMTheme.of(context).errorColor7;
          case GMLinkStyle.warning:
            return GMTheme.of(context).warningColor6;
          case GMLinkStyle.success:
            return GMTheme.of(context).successColor6;
          case GMLinkStyle.defaultStyle:
            return GMTheme.of(context).brandClickColor;
        }
      case GMLinkState.disabled:
        switch (style) {
          case GMLinkStyle.primary:
            return GMTheme.of(context).brandDisabledColor;
          case GMLinkStyle.danger:
            return GMTheme.of(context).errorDisabledColor;
          case GMLinkStyle.warning:
            return GMTheme.of(context).warningDisabledColor;
          case GMLinkStyle.success:
            return GMTheme.of(context).successDisabledColor;
          case GMLinkStyle.defaultStyle:
            return GMTheme.of(context).fontGyColor4;
        }
    }
  }

  Widget _getDefaultIcon(BuildContext context) {
    return Icon(
      type == GMLinkType.withPrefixIcon ? GMIcons.link : GMIcons.jump,
      size: _getIconSize(context),
      color: getColor(context),
    );
  }

  Widget _buildLink(BuildContext context) {
    return InkWell(
        onTap: () {
          if (state == GMLinkState.disabled) {
            return;
          }
          if (linkClick != null) {
            linkClick!(uri);
          } else {
            var tdLinkConfig = getConfiguration(context);

            if (tdLinkConfig != null && tdLinkConfig.linkClick != null) {
              tdLinkConfig.linkClick!(uri);
            }
          }
        },
        child: GMText(
          label,
          style: TextStyle(
            fontSize: _getFontSize(context),
            color: getColor(context),
            decoration: type == GMLinkType.withUnderline
                ? TextDecoration.underline
                : null,
            decorationColor: getColor(context),
          ),
          forceVerticalCenter: true,
        ));
  }

  double _getIconSize(BuildContext context) {
    if (iconSize != null) {
      return iconSize!;
    }
    switch (size) {
      case GMLinkSize.large:
        return 18;
      case GMLinkSize.small:
        return 14;
      case GMLinkSize.medium:
        return 16;
    }
  }

  double _getFontSize(BuildContext context) {
    if (fontSize != null) {
      return fontSize!;
    }
    switch (size) {
      case GMLinkSize.large:
        return 16;
      case GMLinkSize.small:
        return 12;
      case GMLinkSize.medium:
        return 14;
    }
  }

  double _getLeftGapSize(BuildContext context) {
    if (leftGapWithIcon != null) {
      return leftGapWithIcon!;
    }
    switch (size) {
      case GMLinkSize.large:
        return 14.64;
      case GMLinkSize.small:
        return 6.05;
      case GMLinkSize.medium:
        return 6.34;
    }
  }

  double _getRightGapSize(BuildContext context) {
    if (rightGapWithIcon != null) {
      return rightGapWithIcon!;
    }
    switch (size) {
      case GMLinkSize.large:
        return 15.37;
      case GMLinkSize.small:
        return 6.63;
      case GMLinkSize.medium:
        return 7;
    }
  }
}

/// 存储可以自定义GMLink跳转算法的控件
class GMLinkConfiguration extends InheritedWidget {
  /// 统一跳转的函数
  final LinkClick? linkClick;

  const GMLinkConfiguration({this.linkClick, Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant GMLinkConfiguration oldWidget) {
    return linkClick != oldWidget.linkClick;
  }
}
