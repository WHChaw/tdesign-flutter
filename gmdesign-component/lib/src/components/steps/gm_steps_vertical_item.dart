import 'package:flutter/material.dart';
import '../../../gmdesign_flutter.dart';

/// Steps步骤条，垂直步骤item
class GMStepsVerticalItem extends StatelessWidget {
  final GMStepsItemData data;
  final int index;
  final int stepsCount;
  final int activeIndex;
  final GMStepsStatus status;
  final bool simple;
  final bool readOnly;
  final bool verticalSelect;
  const GMStepsVerticalItem({
    super.key,
    required this.data,
    required this.index,
    required this.stepsCount,
    required this.activeIndex,
    required this.status,
    required this.simple,
    required this.readOnly,
    required this.verticalSelect,
  });

  @override
  Widget build(BuildContext context) {
    /// 步骤条数字背景色
    var stepsNumberBgColor = GMTheme.of(context).brandNormalColor;
    /// 步骤条数字颜色
    var stepsNumberTextColor = GMTheme.of(context).whiteColor1;
    /// 步骤条标题颜色
    var stepsTitleColor = GMTheme.of(context).brandColor7;
    /// 步骤条icon颜色
    var stepsIconColor = GMTheme.of(context).brandColor7;
    /// 简略步骤条icon颜色
    var simpleStepsIconColor = GMTheme.of(context).brandColor7;

    /// 是否要设置步骤图标widget的Decoration
    bool shouldSetIconWidgetDecoration = true;

    Widget? completeIconWidget;
    /// 错误icon图标显示
    Widget errorIconWidget = Icon(GMIcons.close, color: GMTheme.of(context).errorColor6, size: 16,);

    /// 激活索引大于当前索引
    if (activeIndex > index) {
      stepsNumberBgColor = GMTheme.of(context).brandColor1;
      stepsNumberTextColor = GMTheme.of(context).brandColor7;
      stepsTitleColor = GMTheme.of(context).fontGyColor1;
      /// 已完成的用icon图标显示
      completeIconWidget = Icon(GMIcons.check, color: GMTheme.of(context).brandColor7, size: 16,);
    }else if (activeIndex < index) {
      /// 激活索引小于当前索引
      stepsNumberBgColor = GMTheme.of(context).grayColor1;
      stepsNumberTextColor = GMTheme.of(context).fontGyColor3;
      stepsTitleColor = GMTheme.of(context).fontGyColor3;
      stepsIconColor = GMTheme.of(context).fontGyColor3;
      simpleStepsIconColor = GMTheme.of(context).grayColor4;
    }

    /// 步骤条icon图标组件，默认为索引文字
    Widget? stepsIconWidget = Text(
      (index + 1).toString(),
      style: TextStyle(
        color: stepsNumberTextColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );

    /// 已完成的用icon图标显示
    if (completeIconWidget != null) {
      stepsIconWidget = completeIconWidget;
    }

    /// 传递了成功的icon图标, 已完成的step都需要显示
    if (data.successIcon != null) {
      stepsIconWidget = Icon(data.successIcon, color: stepsIconColor, size: 22,);
      /// 传了图标则不用设置背景色
      shouldSetIconWidgetDecoration = false;
    }

    /// 状态是错误状态，激活索引是当前索引，只有当前激活索引才需要显示
    if (status == GMStepsStatus.error && activeIndex == index) {
      /// 显示错误颜色
      stepsNumberBgColor = GMTheme.of(context).errorColor1;
      stepsTitleColor = GMTheme.of(context).errorColor6;
      /// 显示错误图标
      stepsIconWidget = errorIconWidget;
      if (data.errorIcon != null) {
        stepsIconWidget = Icon(data.errorIcon, color: GMTheme.of(context).errorColor6, size: 22,);
      }
      /// 传了图标则不用设置背景色等Decoration
      shouldSetIconWidgetDecoration = data.errorIcon == null;
      if (simple) {
        simpleStepsIconColor = GMTheme.of(context).errorColor6;
      }
    }

    /// 步骤条icon图标背景和形状
    var iconWidgetDecoration = shouldSetIconWidgetDecoration ? BoxDecoration(
      color: stepsNumberBgColor,
      shape: BoxShape.circle,
    ): null;


    /// icon组件容器大小
    double iconContainerSize = 22;

    /// icon组件容器margin
    double iconMarginBottom = 8;

    /// 简略步骤条
    if (simple || readOnly) {
      /// readOnly纯展示
      if (readOnly) {
        simpleStepsIconColor = GMTheme.of(context).brandColor7;
        stepsTitleColor = GMTheme.of(context).fontGyColor1;
      }
      iconContainerSize = 8;
      iconMarginBottom = 4;
      stepsIconWidget = null;
      /// 简略步骤条BoxDecoration
      var simpleDecoration = BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: simpleStepsIconColor,
          width: 1,
        ),
      );
      if (activeIndex == index && !readOnly) {
        simpleDecoration = BoxDecoration(
          color: simpleStepsIconColor,
          shape: BoxShape.circle,
        );
      }
      iconWidgetDecoration = simpleDecoration;
    }

    /// 自定义内容
    var customContent = data.customContent != null ? Container(
      margin: const EdgeInsets.only(top: 4),
      child: data.customContent!,
    ) : Container();

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: 22,
              child:  ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 62),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: iconContainerSize,
                      height: 22,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: iconMarginBottom),
                      decoration: iconWidgetDecoration,
                      child: stepsIconWidget,
                    ),
                    Expanded(
                      flex: 1,
                      child: Opacity(
                        opacity: index == stepsCount - 1 ? 0 : 1,
                        child: Container(
                          width: 1,
                          height: double.infinity,
                          color: (activeIndex > index || readOnly) ? GMTheme.of(context).brandColor7 : GMTheme.of(context).grayColor4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 22,
                    margin: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GMText(
                          data.title,
                          style: TextStyle(
                            fontWeight: (activeIndex == index && !readOnly) ? FontWeight.w600 : FontWeight.w400,
                            color: stepsTitleColor,
                            fontSize: 14,
                            height: 1.2,
                          ),
                        ),
                        verticalSelect ? Icon(GMIcons.chevron_right, color: GMTheme.of(context).fontGyColor1, size: 16,): Container(),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GMText(
                        data.content,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: GMTheme.of(context).fontGyColor3,
                          fontSize: 12,
                        ),
                      ),
                      customContent,
                    ]
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
