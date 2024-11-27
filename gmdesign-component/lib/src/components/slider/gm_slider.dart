///
///  Created by arvinwli@tencent.com on 4/24/23.
///
import 'package:flutter/material.dart';
import 'gm_slider_theme.dart';

/// 单滑动选择器
class GMSlider extends StatefulWidget {
  /// 默认值
  final double value;

  /// 自定义盒子样式
  final Decoration? boxDecoration;

  /// 左侧标签
  final String? leftLabel;

  /// 右侧标签
  final String? rightLabel;

  /// 滑动变化监听
  final ValueChanged<double>? onChanged;

  /// 滑动开始监听
  final ValueChanged<double>? onChangeStart;

  /// 滑动结束监听
  final ValueChanged<double>? onChangeEnd;

  /// 样式
  final GMSliderThemeData? sliderThemeData;

  const GMSlider(
      {Key? key,
      required this.value,
      this.boxDecoration,
      this.onChanged,
      this.sliderThemeData,
      this.leftLabel,
      this.rightLabel,
      this.onChangeStart,
      this.onChangeEnd})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GMSliderState();
  }
}

class GMSliderState extends State<GMSlider> {
  double value = 0;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  void didUpdateWidget(covariant GMSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    value = widget.value;
  }

  bool get enabled => widget.onChanged != null;

  TextStyle get labelTextStyle =>
      TextStyle(fontSize: 16, color: enabled ? const Color(0xE6000000) : const Color(0x42000000));

  Widget get leftLabel => widget.leftLabel?.isNotEmpty == true
      ? Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(widget.leftLabel!, style: labelTextStyle),
        )
      : Container();

  Widget get rightLabel => widget.rightLabel?.isNotEmpty == true
      ? Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(widget.rightLabel!, style: labelTextStyle),
        )
      : Container();

  @override
  Widget build(BuildContext context) {
    var tdSliderThemeData = widget.sliderThemeData ?? GMSliderThemeData();
    return Container(
      padding: EdgeInsets.only(
        top: (tdSliderThemeData.showScaleValue || tdSliderThemeData.showThumbValue ? 16 : 0) + 8,
        bottom: 8,
      ),
      decoration: widget.boxDecoration ??
          BoxDecoration(
            color: Colors.white,
          ),
      child: Row(
        children: [
          leftLabel,
          const SizedBox(width: 8),
          Expanded(
              child: SliderTheme(
            data: tdSliderThemeData.sliderThemeData,
            child: Slider(
              value: value,
              min: tdSliderThemeData.min,
              max: tdSliderThemeData.max,
              divisions: tdSliderThemeData.divisions,
              onChangeStart: widget.onChangeStart,
              onChangeEnd: widget.onChangeEnd,
              onChanged: enabled
                  ? (slideValue) {
                      setState(() {
                        value = slideValue;
                        if (widget.onChanged != null) {
                          widget.onChanged!(slideValue);
                        }
                      });
                    }
                  : null,
            ),
          )),
          const SizedBox(width: 8),
          rightLabel
        ],
      ),
    );
  }
}

/// 范围滑动选择器
class GMRangeSlider extends StatefulWidget {
  /// 默认值
  final RangeValues value;

  /// 自定义盒子样式
  final Decoration? boxDecoration;

  /// 左侧标签
  final String? leftLabel;

  /// 右侧标签

  final String? rightLabel;

  /// 滑动变化监听
  final ValueChanged<RangeValues>? onChanged;

  /// 滑动开始监听

  final ValueChanged<RangeValues>? onChangeStart;

  /// 滑动结束监听
  final ValueChanged<RangeValues>? onChangeEnd;

  /// 样式
  final GMSliderThemeData? sliderThemeData;

  const GMRangeSlider(
      {Key? key,
      required this.value,
      this.boxDecoration,
      this.onChanged,
      this.sliderThemeData,
      this.leftLabel,
      this.rightLabel,
      this.onChangeStart,
      this.onChangeEnd})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GMRangeSliderState();
  }
}

class _GMRangeSliderState extends State<GMRangeSlider> {
  RangeValues rangeValues = const RangeValues(0, 100);

  @override
  void initState() {
    super.initState();
    rangeValues = widget.value;
  }

  @override
  void didUpdateWidget(covariant GMRangeSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    rangeValues = widget.value;
  }

  bool get enabled => widget.onChanged != null;

  TextStyle get labelTextStyle =>
      TextStyle(fontSize: 16, color: enabled ? const Color(0xE6000000) : const Color(0x42000000));

  Widget get leftLabel => widget.leftLabel?.isNotEmpty == true
      ? Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(widget.leftLabel!, style: labelTextStyle),
        )
      : Container();

  Widget get rightLabel => widget.rightLabel?.isNotEmpty == true
      ? Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(widget.rightLabel!, style: labelTextStyle),
        )
      : Container();

  @override
  Widget build(BuildContext context) {
    var tdSliderThemeData = widget.sliderThemeData ?? GMSliderThemeData();
    return Container(
      padding: EdgeInsets.only(
        top: (tdSliderThemeData.showScaleValue || tdSliderThemeData.showThumbValue ? 16 : 0) + 8,
        bottom: 8,
      ),
      decoration: widget.boxDecoration ??
          BoxDecoration(
            color: Colors.white,
          ),
      child: Row(
        children: [
          leftLabel,
          const SizedBox(width: 8),
          Expanded(
              child: SliderTheme(
            data: tdSliderThemeData.sliderThemeData,
            child: RangeSlider(
              values: rangeValues,
              min: tdSliderThemeData.min,
              max: tdSliderThemeData.max,
              divisions: tdSliderThemeData.divisions,
              onChanged: widget.onChanged == null
                  ? null
                  : (slideValue) {
                      setState(() {
                        rangeValues = slideValue;
                        if (widget.onChanged != null) {
                          widget.onChanged!(slideValue);
                        }
                      });
                    },
              onChangeStart: widget.onChangeStart,
              onChangeEnd: widget.onChangeEnd,
            ),
          )),
          const SizedBox(width: 8),
          rightLabel,
        ],
      ),
    );
  }
}
