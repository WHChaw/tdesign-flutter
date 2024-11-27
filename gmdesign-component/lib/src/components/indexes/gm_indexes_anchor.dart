import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';

/// 索引锚点
class GMIndexesAnchor extends StatelessWidget {
  const GMIndexesAnchor({
    Key? key,
    required this.sticky,
    required this.text,
    required this.capsuleTheme,
    this.builderAnchor,
    required this.activeIndex,
  }) : super(key: key);

  /// 索引是否吸顶
  final bool sticky;

  /// 锚点文本
  final String text;

  /// 是否为胶囊式样式
  final bool capsuleTheme;

  /// 选中索引
  final ValueNotifier<String> activeIndex;

  /// 索引锚点构建
  final Widget? Function(BuildContext context, String index, bool isPinnedToTop)? builderAnchor;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: activeIndex,
      builder: (context, value, child) {
        final isPinned = value == text;
        final customAnchor = builderAnchor?.call(context, text, isPinned);
        return customAnchor ??
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: GMTheme.of(context).spacer4, horizontal: GMTheme.of(context).spacer16),
              margin: capsuleTheme ? EdgeInsets.symmetric(horizontal: GMTheme.of(context).spacer8) : null,
              decoration: BoxDecoration(
                color: isPinned ? GMTheme.of(context).whiteColor1 : GMTheme.of(context).grayColor1,
                borderRadius: capsuleTheme ? BorderRadius.circular(GMTheme.of(context).radiusCircle) : null,
                border: isPinned
                    ? capsuleTheme
                        ? Border.all(color: GMTheme.of(context).grayColor1)
                        : Border(bottom: BorderSide(color: GMTheme.of(context).grayColor1))
                    : null,
              ),
              child: GMText(
                text,
                forceVerticalCenter: true,
                font: isPinned ? GMTheme.of(context).fontMarkMedium : GMTheme.of(context).fontTitleSmall,
                textColor: isPinned ? GMTheme.of(context).brandColor7 : GMTheme.of(context).fontGyColor1,
              ),
            );
      },
    );
  }
}
