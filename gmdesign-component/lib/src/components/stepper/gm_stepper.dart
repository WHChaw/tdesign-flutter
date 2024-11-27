import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../gmdesign_flutter.dart';

enum GMStepperSize { small, medium, large }

enum GMStepperTheme { normal, filled, outline }

enum GMStepperIconType { remove, add }

enum GMStepperOverlimitType { minus, plus }

typedef GMStepperOverlimitFunction = void Function(GMStepperOverlimitType type);

class GMStepper extends StatefulWidget {
  const GMStepper({
    Key? key,
    this.disableInput = false,
    this.disabled = false,
    this.inputWidth,
    this.max = 100,
    this.min = 0,
    this.size = GMStepperSize.medium,
    this.step = 1,
    this.theme = GMStepperTheme.normal,
    this.value = 0,
    this.defaultValue = 0,
    this.onBlur,
    this.onChange,
    this.onOverlimit,
  }) : super(key: key);

  /// 禁用输入框
  final bool disableInput;

  /// 禁用全部操作
  final bool disabled;

  /// 禁用全部操作
  final double? inputWidth;

  /// 最大值
  final int max;

  /// 最小值
  final int min;

  /// 组件尺寸
  final GMStepperSize size;

  /// 步长
  final int step;

  /// 组件风格
  final GMStepperTheme theme;

  /// 值
  final int? value;

  /// 默认值
  final int? defaultValue;

  /// 输入框失去焦点时触发
  final VoidCallback? onBlur;

  /// 数值发生变更时触发
  final ValueChanged<int>? onChange;

  /// 数值超出限制时触发
  final GMStepperOverlimitFunction? onOverlimit;

  @override
  State<GMStepper> createState() => _GMStepperState();
}

class _GMStepperState extends State<GMStepper> {
  late int value;
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    value = widget.value ?? widget.defaultValue ?? 0;
    _controller = TextEditingController(text: value.toString());
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        if (widget.onBlur != null) {
          widget.onBlur!();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  double _getWidth() {
    if (widget.inputWidth != null && widget.inputWidth! > 0) {
      return widget.inputWidth!;
    }

    switch (widget.size) {
      case GMStepperSize.small:
        return 34;
      case GMStepperSize.medium:
        return 38;
      case GMStepperSize.large:
        return 45;
      default:
        return 38;
    }
  }

  double _getTextWidth() {
    var textLength = value.toString().length;
    return textLength < 4 ? 0 : (textLength - 4) * _getFontSize();
  }

  double _getHeight() {
    switch (widget.size) {
      case GMStepperSize.small:
        return 20;
      case GMStepperSize.medium:
        return 24;
      case GMStepperSize.large:
        return 28;
      default:
        return 24;
    }
  }

  Color? _getBackgroundColor(BuildContext context) {
    switch (widget.theme) {
      case GMStepperTheme.filled:
        return widget.disabled
            ? GMTheme.of(context).grayColor2
            : GMTheme.of(context).grayColor1;
      case GMStepperTheme.outline:
        return GMTheme.of(context).whiteColor1;
      case GMStepperTheme.normal:
      default:
        return null;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case GMStepperSize.small:
        return 10;
      case GMStepperSize.medium:
        return 12;
      case GMStepperSize.large:
        return 16;
      default:
        return 12;
    }
  }

  void onAdd() {
    if (value >= widget.max) {
      return;
    }

    if (value + widget.step > widget.max) {
      setState(() {
        value = widget.max;
      });

      if (widget.onOverlimit != null) {
        widget.onOverlimit!(GMStepperOverlimitType.plus);
      }

      renderNumber();
      return;
    }

    setState(() {
      value += widget.step;
    });

    renderNumber();
  }

  void onReduce() {
    if (value <= widget.min) {
      return;
    }

    if (value - widget.step < widget.min) {
      setState(() {
        value = widget.min;
      });

      if (widget.onOverlimit != null) {
        widget.onOverlimit!(GMStepperOverlimitType.minus);
      }

      renderNumber();
      return;
    }

    setState(() {
      value -= widget.step;
    });
    renderNumber();
  }

  void renderNumber() {
    _controller.value = TextEditingValue(
        text: value.toString(),
        selection: TextSelection.fromPosition(TextPosition(
          affinity: TextAffinity.downstream,
          offset: value.toString().length,
        )));
    _focusNode.unfocus();

    if (widget.onChange != null) {
      widget.onChange!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GMStepperIconButton(
          type: GMStepperIconType.remove,
          disabled: widget.disabled || value <= widget.min,
          theme: widget.theme,
          size: widget.size,
          onTap: onReduce,
        ),
        Container(
          decoration: BoxDecoration(
              border: widget.theme == GMStepperTheme.outline
                  ? Border(
                      top: BorderSide(
                        color: GMTheme.of(context).grayColor4,
                      ),
                      bottom: BorderSide(
                        color: GMTheme.of(context).grayColor4,
                      ))
                  : null),
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.theme == GMStepperTheme.normal ? 0 : 4),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: _getWidth(),
                    maxWidth: _getWidth() + _getTextWidth()),
                child: Container(
                  height: _getHeight(),
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: _getBackgroundColor(context)),
                  child: Container(
                    height: PlatformUtil.isWeb ? _getFontSize() : null,
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: TextField(
                      controller: _controller,
                      enabled: !widget.disabled && !widget.disableInput,
                      focusNode: _focusNode,
                      style: TextStyle(
                          fontSize: _getFontSize(),
                          color: widget.disabled
                              ? GMTheme.of(context).fontGyColor4
                              : GMTheme.of(context).fontGyColor1),
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          try {
                            if (newValue.text == '') {
                              setState(() {
                                value = widget.min;
                              });

                              if (widget.onOverlimit != null) {
                                widget
                                    .onOverlimit!(GMStepperOverlimitType.minus);
                              }

                              return newValue.copyWith(
                                  text: value.toString(),
                                  selection: TextSelection.collapsed(
                                      offset: value.toString().length));
                            }

                            final newNum = int.parse(newValue.text);
                            if (newNum < widget.min) {
                              setState(() {
                                value = widget.min;
                              });
                              if (widget.onOverlimit != null) {
                                widget
                                    .onOverlimit!(GMStepperOverlimitType.minus);
                              }
                            } else if (newNum > widget.max) {
                              setState(() {
                                value = widget.max;
                              });
                              if (widget.onOverlimit != null) {
                                widget
                                    .onOverlimit!(GMStepperOverlimitType.plus);
                              }
                            } else {
                              setState(() {
                                value = newNum;
                              });
                            }

                            return newValue.copyWith(
                                text: value.toString(),
                                selection: TextSelection.collapsed(
                                    offset: value.toString().length));
                          } catch (e) {
                            return oldValue;
                          }
                        })
                      ],
                      onChanged: (newValue) {
                        final result = int.parse(newValue);
                        if (widget.onChange != null) {
                          widget.onChange!(result);
                        }
                      },
                    ),
                  ),
                ),
              )),
        ),
        GMStepperIconButton(
          type: GMStepperIconType.add,
          disabled: widget.disabled || value >= widget.max,
          theme: widget.theme,
          size: widget.size,
          onTap: onAdd,
        )
      ],
    );
  }
}

typedef GMTapFunction = void Function();

class GMStepperIconButton extends StatelessWidget {
  const GMStepperIconButton(
      {Key? key,
      this.onTap,
      this.size = GMStepperSize.medium,
      this.disabled = false,
      this.theme = GMStepperTheme.normal,
      required this.type})
      : super(key: key);

  final GMTapFunction? onTap;
  final GMStepperSize size;
  final GMStepperIconType type;
  final bool disabled;
  final GMStepperTheme theme;

  double _getIconSize() {
    switch (size) {
      case GMStepperSize.large:
        return 20;
      case GMStepperSize.medium:
        return 16;
      case GMStepperSize.small:
        return 12;
      default:
        return 16;
    }
  }

  Icon _getIcon(context) {
    var iconType = type == GMStepperIconType.add ? Icons.add : Icons.remove;

    return Icon(iconType,
        size: _getIconSize(),
        color: disabled
            ? GMTheme.of(context).fontGyColor4
            : GMTheme.of(context).fontGyColor1);
  }

  Color? _getBackgroundColor(BuildContext context) {
    switch (theme) {
      case GMStepperTheme.filled:
        return disabled
            ? GMTheme.of(context).grayColor2
            : GMTheme.of(context).grayColor1;
      case GMStepperTheme.outline:
        return disabled ? GMTheme.of(context).grayColor2 : null;
      case GMStepperTheme.normal:
      default:
        return null;
    }
  }

  BorderRadiusGeometry? _getBorderRadius(BuildContext context) {
    if (theme == GMStepperTheme.normal) {
      return null;
    }

    return type == GMStepperIconType.remove
        ? const BorderRadius.only(
            topLeft: Radius.circular(3), bottomLeft: Radius.circular(3))
        : const BorderRadius.only(
            topRight: Radius.circular(3), bottomRight: Radius.circular(3));
  }

  BoxBorder? _getBoxBorder(BuildContext context) {
    if (theme == GMStepperTheme.outline) {
      return Border.all(
        color: GMTheme.of(context).grayColor4,
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: disabled ? null : onTap,
        child: Container(
          decoration: BoxDecoration(
            color: _getBackgroundColor(context),
            borderRadius: _getBorderRadius(context),
            border: _getBoxBorder(context),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: _getIcon(context),
          ),
        ));
  }
}
