import 'package:flutter/material.dart';
import '../../../gmdesign_flutter.dart';

enum GMResultTheme { defaultTheme, success, warning, error }

class GMResult extends StatelessWidget {
// 描述文本，用于提供额外信息
  final String? description;
// 图标组件，用于在结果中显示一个图标
  final Widget? icon;
// 自定义字体样式，用于设置标题文本的样式
  final TextStyle? titleStyle;
// 主题样式，定义了结果组件的视觉风格
  final GMResultTheme theme;
// 标题文本，显示结果的主要信息
  final String title;

  // 构造函数，用于初始化Result组件
  const GMResult({
    Key? key,
    this.description,
    this.icon,
    this.titleStyle,
    this.theme = GMResultTheme.defaultTheme, // 默认主题样式为defaultTheme
    this.title = '', // 默认标题为空字符串
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 根据主题获取默认的图标组件
    Widget displayIcon = icon ?? _getDefaultIconByTheme(context, theme);
    // 构建组件布局
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: displayIcon,
        ),
        // 如果标题不为空，则显示标题
        if (title.isNotEmpty)
          Padding(
              padding: const EdgeInsets.only(top: 17),
              child: GMText(
                title,
                textColor: GMTheme.of(context).fontGyColor1,
                font: GMTheme.of(context).fontTitleExtraLarge,
                style: titleStyle,
              )),
        // 如果描述不为空，则显示描述
        if (description?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: GMText(description!,
                textColor: GMTheme.of(context).fontGyColor2,
                font: GMTheme.of(context).fontTitleSmall),
          ),
      ],
    );
  }

  // 根据主题返回对应的默认图标组件
  Widget _getDefaultIconByTheme(BuildContext context, GMResultTheme theme) {
    switch (theme) {
      case GMResultTheme.success:
        return Icon(GMIcons.check_circle,
            color: GMTheme.of(context).successNormalColor, size: 70);
      case GMResultTheme.warning:
        return Icon(GMIcons.error_circle,
            color: GMTheme.of(context).warningNormalColor, size: 70);
      case GMResultTheme.error:
        return Icon(GMIcons.close_circle,
            color: GMTheme.of(context).errorNormalColor, size: 70);
      default:
        return Icon(GMIcons.info_circle,
            color: GMTheme.of(context).brandNormalColor, size: 70);
    }
  }
}
