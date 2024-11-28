import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';

/// 展开项 向下箭头宽
const double _kArrowWidth = 13.5;

/// 展开项  向下箭头高
const double _kArrowHeight = 8;

/// 展开项选项弹窗 单个item最低高度
const double _kMenuItemMinHeight = 23;

/// 展开项弹窗 单个item默认高度
const double _kDefaultMenuItemHeight = 48;

/// 展开项弹窗 单个item默认宽度为按钮宽度-20
const double _kDefaultMenuItemWidthShrink = 20;

/// 导航栏默认高度
const double _kDefaultTabBarHeight = 56;

/// 展开项弹窗弹出动画时间
const Duration _kPopupMenuDuration = Duration(milliseconds: 10);

enum GMBottomTabBarBasicType {
  /// 单层级纯文本标签栏
  text,

  /// 文本加图标标签栏
  iconText,

  /// 纯图标标签栏
  icon,

  /// 双层级纯文本标签栏
  expansionPanel,
}

enum GMBottomTabBarComponentType {
  /// 普通样式
  normal,

  /// 带胶囊背景的item选中样式
  label
}

enum GMBottomTabBarOutlineType {
  /// 填充样式
  filled,

  /// 胶囊样式
  capsule
}

/// 飘新配置
class BadgeConfig {
  BadgeConfig({
    required this.showBadge,
    GMBadge? tdBadge,
    this.badgeTopOffset,
    this.badgeRightOffset,
  }) : tdBadge = tdBadge ?? const GMBadge(GMBadgeType.redPoint);

  /// 是否展示消息
  final bool showBadge;

  /// 消息样式(未设置但showBadge为true，则默认使用红点)
  final GMBadge? tdBadge;

  /// 消息顶部偏移量
  final double? badgeTopOffset;

  /// 消息右侧偏移量
  final double? badgeRightOffset;
}

/// 单个tab配置
class GMBottomTabBarTabConfig {
  GMBottomTabBarTabConfig({
    required this.onTap,
    this.selectedIcon,
    this.unselectedIcon,
    this.tabText,
    this.selectTabTextStyle,
    this.unselectTabTextStyle,
    this.badgeConfig,
    this.popUpButtonConfig,
  }) : assert(() {
          if (badgeConfig?.showBadge ?? false) {
            if (badgeConfig?.tdBadge == null) {
              throw FlutterError('[NavigationTab] if set showBadge = true, '
                  'you must set a tdBadge instance');
            }
          }
          return true;
        }());

  /// 选中时图标
  final Widget? selectedIcon;

  /// 未选中时图标
  final Widget? unselectedIcon;

  /// tab文本
  final String? tabText;

  /// 文本已选择样式 basicType为text时必填
  final TextStyle? selectTabTextStyle;

  /// 文本未选择样式 basicType为text时必填
  final TextStyle? unselectTabTextStyle;

  /// tab点击事件
  final GestureTapCallback? onTap;

  /// 消息配置
  final BadgeConfig? badgeConfig;

  /// 弹窗配置
  final GMBottomTabBarPopUpBtnConfig? popUpButtonConfig;
}

class GMBottomTabBar extends StatefulWidget {
  GMBottomTabBar(
    this.basicType, {
    Key? key,
    this.componentType = GMBottomTabBarComponentType.label,
    this.outlineType = GMBottomTabBarOutlineType.filled,
    required this.navigationTabs,
    this.barHeight = _kDefaultTabBarHeight,
    this.useVerticalDivider,
    this.dividerHeight,
    this.dividerThickness,
    this.dividerColor,
    this.showTopBorder = true,
    this.topBorder,
    this.useSafeArea = true,
    this.selectedBgColor,
    this.unselectedBgColor,
    this.backgroundColor,
    this.centerDistance,
    this.currentIndex,
  })  : assert(() {
          if (navigationTabs.isEmpty) {
            throw FlutterError('[GMBottomTabBar] please set at least one tab!');
          }
          if (basicType == GMBottomTabBarBasicType.text) {
            for (final item in navigationTabs) {
              if (item.tabText == null) {
                throw FlutterError('[GMBottomTabBar] type is GMBottomBarType.text, but not set tabText.');
              }
            }
          }
          if (basicType == GMBottomTabBarBasicType.icon) {
            for (final item in navigationTabs) {
              if (item.selectedIcon == null || item.unselectedIcon == null) {
                throw FlutterError('[GMBottomTabBar] type is GMBottomBarType.icon,'
                    'but has no set icon.');
              }
            }
          }
          if (basicType == GMBottomTabBarBasicType.iconText) {
            for (final item in navigationTabs) {
              if (item.tabText == null || item.selectedIcon == null || item.unselectedIcon == null) {
                throw FlutterError('[GMBottomTabBar] type is GMBottomBarType.iconText,'
                    'but not set tabText or icon.');
              }
            }
          }
          if (currentIndex != null && (currentIndex < 0 || currentIndex >= navigationTabs.length)) {
            throw FlutterError('[GMBottomTabBar] currentIndex must in [0,navigationTabs.length)');
          }
          return true;
        }()),
        super(key: key);

  /// 基本样式（纯文本、纯图标、图标+文本）
  final GMBottomTabBarBasicType basicType;

  /// 选项样式 默认label
  final GMBottomTabBarComponentType? componentType;

  /// 标签栏样式 默认filled
  final GMBottomTabBarOutlineType? outlineType;

  /// tabs配置
  final List<GMBottomTabBarTabConfig> navigationTabs;

  /// tab高度
  final double? barHeight;

  /// 是否使用竖线分隔(如果选项样式为label则强制为false)
  final bool? useVerticalDivider;

  /// 分割线高度（可选）
  final double? dividerHeight;

  /// 分割线厚度（可选）
  final double? dividerThickness;

  /// 分割线颜色（可选）
  final Color? dividerColor;

  /// 是否展示bar上边线（设置为true 但是topBorder样式未设置，则使用默认值,非胶囊型才生效）
  final bool? showTopBorder;

  /// 上边线样式
  final BorderSide? topBorder;

  /// 使用安全区域
  final bool useSafeArea;

  /// 选中时背景颜色
  final Color? selectedBgColor;

  /// 未选中时背景颜色
  final Color? unselectedBgColor;

  /// 背景颜色 （可选）
  final Color? backgroundColor;

  /// icon与文本中间距离（可选）
  final double? centerDistance;

  /// 选中的index（可选）
  final int? currentIndex;

  @override
  State<GMBottomTabBar> createState() => _GMBottomTabBarState();
}

class _GMBottomTabBarState extends State<GMBottomTabBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex ?? 0;
  }

  @override
  void didUpdateWidget(covariant GMBottomTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectedIndex = widget.currentIndex ?? _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    var isCapsuleOutlineType = widget.outlineType == GMBottomTabBarOutlineType.capsule;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        /// -2 是为了增加边框
        var maxWidth = double.parse(constraints.biggest.width.toStringAsFixed(1)) - 2;

        /// 胶囊样式 比正常样式宽度要小32
        if (isCapsuleOutlineType) {
          maxWidth -= 32;
        }
        var itemWidth = maxWidth / widget.navigationTabs.length;

        Widget result = Container(
            height: widget.barHeight ?? _kDefaultTabBarHeight,
            alignment: Alignment.center,
            margin: isCapsuleOutlineType ? const EdgeInsets.symmetric(horizontal: 16) : null,
            decoration: BoxDecoration(
                color: widget.backgroundColor ?? Colors.white,
                borderRadius: isCapsuleOutlineType ? BorderRadius.circular(56) : null,
                border: widget.showTopBorder! && !isCapsuleOutlineType
                    ? Border(top: widget.topBorder ?? BorderSide(color: GMTheme.of(context).grayColor3, width: 0.5))
                    : null,
                boxShadow: isCapsuleOutlineType ? GMTheme.of(context).shadowsTop : null),
            child: Stack(alignment: Alignment.center, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(widget.navigationTabs.length, (index) {
                    return _item(index, itemWidth);
                  })),
              _verticalDivider(),
            ]));
        if (widget.useSafeArea) {
          result = SafeArea(child: result);
        }
        return result;
      },
    );
  }

  void _onTap(int index) {
    setState(() {
      if (_selectedIndex != index) {
        _selectedIndex = index;
        widget.navigationTabs[index].onTap?.call();
      }
    });
  }

  Widget _item(int index, double itemWidth) {
    var tabItemConfig = widget.navigationTabs[index];
    return Container(
        height: widget.barHeight ?? _kDefaultTabBarHeight,
        width: itemWidth,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: GMBottomTabBarItemWithBadge(
          basiceType: widget.basicType,
          componentType: widget.componentType ?? GMBottomTabBarComponentType.label,
          outlineType: widget.outlineType ?? GMBottomTabBarOutlineType.filled,
          itemConfig: tabItemConfig,
          isSelected: index == _selectedIndex,
          itemHeight: widget.barHeight ?? _kDefaultTabBarHeight,
          itemWidth: itemWidth,
          tabsLength: widget.navigationTabs.length,
          selectedBgColor: widget.selectedBgColor,
          unselectedBgColor: widget.unselectedBgColor,
          centerDistance: widget.centerDistance ?? 0,
          onTap: () {
            _onTap(index);
          },
        ));
  }

  Widget _verticalDivider() {
    if (widget.componentType == GMBottomTabBarComponentType.label) {}
    return Visibility(
      visible: widget.componentType != GMBottomTabBarComponentType.label && (widget.useVerticalDivider ?? false),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.navigationTabs.length - 1, (index) {
          return SizedBox(
            width: widget.dividerThickness ?? 0.5,
            height: widget.dividerHeight ?? 32,
            child: VerticalDivider(
              color: widget.dividerColor ?? GMTheme.of(context).grayColor3,
              thickness: widget.dividerThickness ?? 0.5,
            ),
          );
        }),
      ),
    );
  }
}

class GMBottomTabBarItemWithBadge extends StatelessWidget {
  const GMBottomTabBarItemWithBadge({
    Key? key,
    required this.basiceType,
    required this.componentType,
    required this.outlineType,
    required this.itemConfig,
    required this.isSelected,
    required this.itemHeight,
    required this.itemWidth,
    required this.onTap,
    required this.tabsLength,
    required this.selectedBgColor,
    required this.unselectedBgColor,
    required this.centerDistance,
  }) : super(key: key);

  /// tab基本类型
  final GMBottomTabBarBasicType basiceType;

  /// tab选中背景类型
  final GMBottomTabBarComponentType componentType;

  //
  final GMBottomTabBarOutlineType outlineType;

  /// 单个tab的属性配置
  final GMBottomTabBarTabConfig itemConfig;

  /// 选中状态
  final bool isSelected;

  /// tab高度
  final double itemHeight;

  /// tab宽度
  final double itemWidth;

  /// 点击事件
  final GestureTapCallback onTap;

  /// tab总个数
  final int tabsLength;

  /// 选中时背景颜色
  final Color? selectedBgColor;

  /// 未选中时背景颜色
  final Color? unselectedBgColor;

  /// icon与文本中间距离
  final double centerDistance;

  @override
  Widget build(BuildContext context) {
    var popUpButtonConfig = itemConfig.popUpButtonConfig;
    var badgeConfig = itemConfig.badgeConfig;
    var isInOrOutCapsule =
        componentType == GMBottomTabBarComponentType.label || outlineType == GMBottomTabBarOutlineType.capsule;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap.call();
        if (itemConfig.popUpButtonConfig != null) {
          Navigator.push(
              context,
              PopRoute(
                child: PopupDialog(
                  itemWidth - _kDefaultMenuItemWidthShrink,
                  btnContext: context,
                  config: popUpButtonConfig!.popUpDialogConfig,
                  items: popUpButtonConfig.items,
                  onClickMenu: (value) {
                    popUpButtonConfig.onChanged(value);
                  },
                ),
              ));
        }
      },
      child: Container(
        height: itemHeight,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            if (isSelected || unselectedBgColor != null)
              Visibility(
                  visible: componentType == GMBottomTabBarComponentType.label,
                  child: Container(
                    /// 设计稿上 tab个数大于3时，左右边距为8，小于等于3时，左右边距为12
                    width: itemWidth - (tabsLength > 3 ? 16 : 24),
                    height: basiceType == GMBottomTabBarBasicType.text ||
                            basiceType == GMBottomTabBarBasicType.expansionPanel
                        ? 32
                        : null,
                    decoration: BoxDecoration(
                        color: isSelected ? selectedBgColor ?? GMTheme.of(context).brandColor1 : unselectedBgColor,
                        borderRadius: const BorderRadius.all(Radius.circular(24))),
                  )),
            Container(
                padding: EdgeInsets.only(top: isInOrOutCapsule ? 3.0 : 2.0, bottom: isInOrOutCapsule ? 1.0 : 0.0),
                child: _constructItem(context, badgeConfig, isInOrOutCapsule)),

            /// )
          ],
        ),
      ),
    );
  }

  Widget _badge(BadgeConfig? badgeConfig) {
    if (badgeConfig?.showBadge ?? false) {
      if (badgeConfig?.tdBadge != null) {
        return badgeConfig!.tdBadge!;
      }
    }
    return Container();
  }

  Widget _constructItem(BuildContext context, BadgeConfig? badgeConfig, bool isInOrOutCapsule) {
    Widget child = Container();
    if (basiceType == GMBottomTabBarBasicType.text) {
      child = _textItem(context, itemConfig, isSelected, GMTheme.of(context).fontTitleMedium!);
    }
    if (basiceType == GMBottomTabBarBasicType.expansionPanel) {
      if (itemConfig.popUpButtonConfig != null) {
        child = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              GMIcons.view_list,
              size: 16.0,
              color: isSelected ? GMTheme.of(context).brandNormalColor : GMTheme.of(context).fontGyColor1,
            ),
            const SizedBox(width: 5),
            _textItem(context, itemConfig, isSelected, GMTheme.of(context).fontTitleMedium!)
          ],
        );
      } else {
        child = _textItem(context, itemConfig, isSelected, GMTheme.of(context).fontTitleMedium!);
      }
    }
    if (basiceType == GMBottomTabBarBasicType.icon) {
      var selectedIcon = itemConfig.selectedIcon;
      var unSelectedIcon = itemConfig.unselectedIcon;
      child = isSelected ? selectedIcon! : unSelectedIcon!;
    }

    if (basiceType == GMBottomTabBarBasicType.iconText) {
      var selectedIcon = itemConfig.selectedIcon;
      var unSelectedIcon = itemConfig.unselectedIcon;
      child = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isSelected ? selectedIcon! : unSelectedIcon!,
          if (centerDistance > 0)
            SizedBox(
              height: centerDistance,
            ),
          _textItem(
            context,
            itemConfig,
            isSelected,
            GMTheme.of(context).fontBodyExtraSmall!,
          )
        ],
      );
    }

    var top = badgeConfig?.badgeTopOffset ?? -2;
    var right = badgeConfig?.badgeRightOffset ?? -10;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Visibility(
            visible: badgeConfig?.showBadge ?? false,
            child: Positioned(top: top, right: right, child: _badge(badgeConfig))),
      ],
    );
  }

  Widget _textItem(BuildContext context, GMBottomTabBarTabConfig config, bool isSelected, Font font) {
    return GMText(
      config.tabText,
      font: font,
      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      style: isSelected ? config.selectTabTextStyle : config.unselectTabTextStyle,
      textColor: isSelected ? GMTheme.of(context).brandNormalColor : GMTheme.of(context).fontGyColor1,
      forceVerticalCenter: true,
    );
  }
}

/// 展开项配置
class GMBottomTabBarPopUpBtnConfig {
  GMBottomTabBarPopUpBtnConfig({required this.items, required this.onChanged, this.popUpDialogConfig})
      : assert(() {
          if (popUpDialogConfig != null) {
            if ((popUpDialogConfig.arrowHeight != null && popUpDialogConfig.arrowHeight! <= 0.0) ||
                (popUpDialogConfig.arrowWidth != null && popUpDialogConfig.arrowWidth! <= 0.0)) {
              throw FlutterError('[GMBottomTabBarPopUpBtnConfig] arrowHeight or arrowHeight can '
                  'not set less than or equal to zero');
            }
          }
          return true;
        }());

  /// 选项list
  final List<PopUpMenuItem> items;

  /// 统一在 onChanged 中处理各item点击事件
  final ValueChanged<String> onChanged;

  /// 弹窗UI配置
  final GMBottomTabBarPopUpShapeConfig? popUpDialogConfig;
}

/// 弹窗UI配置
class GMBottomTabBarPopUpShapeConfig {
  GMBottomTabBarPopUpShapeConfig(
      {this.popUpWidth,
      this.popUpitemHeight = _kDefaultMenuItemHeight,
      this.backgroundColor,
      this.radius,
      this.arrowWidth,
      this.arrowHeight});

  /// 弹窗宽度（不设置，默认为按钮宽度 - 20）
  final double? popUpWidth;

  /// 单个选项高度 所有选项等高 不设置则使用默认值 48
  final double? popUpitemHeight;

  /// 弹窗背景颜色
  final Color? backgroundColor;

  /// panel圆角 默认0
  final double? radius;

  /// 箭头宽度 默认13.5
  final double? arrowWidth;

  /// 箭头高度 默认8
  final double? arrowHeight;
}

/// 弹窗菜单item
class PopUpMenuItem extends StatelessWidget {
  const PopUpMenuItem({
    Key? key,
    this.itemWidget,
    required this.value,
    this.alignment = AlignmentDirectional.center,
  }) : super(key: key);

  /// 选项widget
  final Widget? itemWidget;

  /// 选项值
  final String value;

  /// 对齐方式
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: _kMenuItemMinHeight),
      alignment: alignment,
      child: itemWidget ??
          GMText(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
    );
  }
}

class PopRoute extends PopupRoute {
  Widget child;

  PopRoute({required this.child});

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'popUpMenuBarrierLabel';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _kPopupMenuDuration;
}

class PopupDialog extends StatefulWidget {
  /// 按钮context
  final BuildContext btnContext;

  /// 点击事件
  final ValueChanged<String> onClickMenu;

  /// 弹窗选项列表
  final List<PopUpMenuItem> items;

  /// 弹窗配置
  final GMBottomTabBarPopUpShapeConfig? config;

  /// 默认弹窗宽度
  final double defaultPopUpWidth;

  const PopupDialog(this.defaultPopUpWidth,
      {Key? key, required this.btnContext, required this.onClickMenu, required this.items, required this.config})
      : super(key: key);

  @override
  PopupDialogState createState() => PopupDialogState();
}

class PopupDialogState extends State<PopupDialog> {
  RenderBox? button;
  RenderBox? overlay;
  RelativeRect? position;
  Size? size;

  @override
  void initState() {
    super.initState();
    button = widget.btnContext.findRenderObject() as RenderBox;
    size = button!.size;
    overlay = Overlay.of(widget.btnContext)?.context.findRenderObject() as RenderBox;
    position = RelativeRect.fromRect(
      Rect.fromPoints(
        button!.localToGlobal(Offset.zero, ancestor: overlay),
        button!.localToGlobal(Offset.zero, ancestor: overlay),
      ),
      Offset.zero & overlay!.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    var popUpitemHeight = widget.config?.popUpitemHeight ?? _kDefaultMenuItemHeight;
    var popUpItemWidth = widget.config?.popUpWidth ?? widget.defaultPopUpWidth;
    var menuItems = widget.items
        .map((e) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              widget.onClickMenu(e.value);
              Navigator.of(context).pop();
            },
            child: SizedBox(
              height: popUpitemHeight,
              child: e,
            )))
        .toList();

    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
            ),
            Positioned(

                /// 这里 -8 是因为widget.btnContext是GMBottomTabBarItemWithBadge的，它在父widget内有8dp的padding
                /// -4 是设计稿上箭头和tab有4dp的距离
                top: position!.top -
                    (popUpitemHeight * widget.items.length + (widget.config?.arrowHeight ?? _kArrowHeight)) -
                    8 -
                    4,
                right: position!.right - (popUpItemWidth + size!.width) / 2,
                child: Container(
                  width: popUpItemWidth,
                  height: popUpitemHeight * widget.items.length + (widget.config?.arrowHeight ?? _kArrowHeight),
                  decoration: BoxDecoration(boxShadow: GMTheme.of(context).shadowsTop),
                  child: CustomPaint(
                    painter: PanelWithDownArrow(config: widget.config),
                    child: Container(
                      alignment: Alignment.topCenter,
                      height: popUpitemHeight * widget.items.length,
                      child: Container(
                        constraints: BoxConstraints(maxHeight: popUpitemHeight * widget.items.length),
                        child: Stack(
                          children: [
                            Column(children: menuItems),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  widget.items.length - 1,
                                  (index) => Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Divider(
                                          thickness: 0.5,
                                          height: 0.5,
                                          color: GMTheme.of(context).grayColor3,
                                        ),
                                      )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

/// 带下箭头的展开panel
class PanelWithDownArrow extends CustomPainter {
  GMBottomTabBarPopUpShapeConfig? config;

  PanelWithDownArrow({
    this.config,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..color = config?.backgroundColor ?? Colors.white
      ..style = PaintingStyle.fill;
    var path = Path();
    var panelWidth = size.width;
    var panelHeight = size.height - (config?.arrowHeight ?? _kArrowHeight);

    canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, panelWidth, panelHeight), Radius.circular(config?.radius ?? 0.0)),
        paint);

    /// 下方箭头
    if (config?.arrowWidth != 0.0 && config?.arrowHeight != 0.0) {
      var left = (panelWidth - _kArrowWidth) / 2;
      var right = (panelWidth + _kArrowWidth) / 2;
      var bottom = panelHeight + _kArrowHeight;
      if (config?.arrowWidth != null) {
        left = (panelWidth - config!.arrowWidth!) / 2;
        right = (panelWidth + config!.arrowWidth!) / 2;
      }
      if (config?.arrowHeight != null) {
        bottom = panelHeight + config!.arrowHeight!;
      }

      path.moveTo(left, panelHeight);
      path.lineTo(panelWidth / 2, bottom);
      path.lineTo(right, panelHeight);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}