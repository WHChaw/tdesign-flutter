import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../gmdesign_flutter.dart';
import '../../util/context_extension.dart';
import 'gm_cupertino_switch.dart';

/// 开关改变事件处理
typedef OnSwitchChanged = bool Function(bool value);

enum GMSwitchSize { large, medium, small }

enum GMSwitchType { fill, text, loading, icon }

class GMSwitch extends StatefulWidget {
  const GMSwitch({
    Key? key,
    this.enable = true,
    this.isOn = false,
    this.size = GMSwitchSize.medium,
    this.type = GMSwitchType.fill,
    this.trackOnColor,
    this.trackOffColor,
    this.thumbContentOnColor,
    this.thumbContentOffColor,
    this.onChanged,
    this.openText,
     this.closeText,
  }) : super(key: key);

  /// 是否可点击
  final bool enable;

  /// 是否打开
  final bool isOn;

  /// 开启时轨道颜色
  final Color? trackOnColor;

  /// 关闭时轨道颜色
  final Color? trackOffColor;

  /// 开启时ThumbView的颜色
  final Color? thumbContentOnColor;

  /// 关闭时ThumbView的颜色
  final Color? thumbContentOffColor;

  /// 尺寸：大、中、小
  final GMSwitchSize? size;

  /// 类型：填充、文本、加载
  final GMSwitchType? type;

  /// 改变事件
  final OnSwitchChanged? onChanged;

  /// 打开文案
  final String? openText;

  /// 关闭文案
  final String? closeText;

  @override
  State<StatefulWidget> createState() {
    return GMSwitchState();
  }
}

class GMSwitchState extends State<GMSwitch> {
  bool isOn = false;

  @override
  void initState() {
    super.initState();
    isOn = widget.isOn;
  }

  @override
  void didUpdateWidget(covariant GMSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    isOn = widget.isOn;
  }

  @override
  Widget build(BuildContext context) {
    final theme = GMTheme.of(context);
    final switchEnable = widget.enable && widget.type != GMSwitchType.loading;
    final trackOnColor = widget.trackOnColor ?? theme.brandColor7;
    final trackOffColor = widget.trackOffColor ?? theme.grayColor4;
    final thumbContentOnColor = widget.thumbContentOnColor ?? theme.brandNormalColor;
    final thumbContentOffColor = widget.thumbContentOffColor ?? theme.fontGyColor4;
    Widget current = GMCupertinoSwitch(
      value: isOn,
      activeColor: trackOnColor,
      trackColor: trackOffColor,
      onChanged: (value) {
        var process = widget.onChanged?.call(value) ?? false;
        // 如果外部未处理,才需要自定刷新开关,如果已处理则不需要刷新
        if (!process) {
          isOn = value;
          setState(() {});
        }
      },
      thumbView: _getThumbView(thumbContentOnColor, thumbContentOffColor),
    );
    if (!switchEnable) {
      current = Opacity(
        opacity: 0.4,
        child: IgnorePointer(
          ignoring: !switchEnable,
          child: current,
        ),
      );
    }
    return SizedBox(
      width: _getWidth(),
      height: _getHeight(),
      child: FittedBox(
        child: current,
      ),
    );
    // return ConstrainedBox( _getWidth(), height: _getHeight(), child: current);
  }

  double _getWidth() {
    switch (widget.size) {
      case GMSwitchSize.large:
        return 52;
      case GMSwitchSize.medium:
        return 45;
      case GMSwitchSize.small:
        return 39;
      default:
        return 45;
    }
  }

  double _getHeight() {
    switch (widget.size) {
      case GMSwitchSize.large:
        return 32;
      case GMSwitchSize.medium:
        return 28;
      case GMSwitchSize.small:
        return 24;
      default:
        return 28;
    }
  }

  Widget? _getThumbView(Color thumbContentOnColor, Color thumbContentOffColor) {
    switch (widget.type) {
      case GMSwitchType.text:
        return Stack(
          children: [Container(
            alignment: Alignment.center,
            width: 16,
            child: GMText(
              isOn ? (widget.openText ?? context.resource.open) : (widget.closeText ?? context.resource.close),
              style: TextStyle(color: isOn ? thumbContentOnColor : thumbContentOffColor, fontSize: 14),
              forceVerticalCenter: true,
              maxLines: 1,
            ),
          )],
        );
      case GMSwitchType.loading:
        return Container(
          alignment: Alignment.centerLeft,
          child: GMCircleIndicator(
            color: thumbContentOnColor,
            size: 16,
            lineWidth: 3,
          ),
        );
      case GMSwitchType.icon:
        return Container(
          alignment: Alignment.centerLeft,
          child: Icon(isOn ? GMIcons.check : GMIcons.close,
              size: 16, color: isOn ? thumbContentOnColor : thumbContentOffColor),
        );
      case GMSwitchType.fill:
      default:
        return null;
    }
  }
}
