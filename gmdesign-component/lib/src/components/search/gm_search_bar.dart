import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';
import '../../util/context_extension.dart';

///
/// 搜索框的样式
///
enum GMSearchStyle {
  square, // 方形
  round, // 圆形
}

///
/// 搜索框对齐方式
///
enum GMSearchAlignment {
  left, // 默认头部对齐
  center, // 居中
}

typedef GMSearchBarEvent = void Function(String value);
typedef GMSearchBarClearEvent = bool Function(String value);
typedef GMSearchBarCallBack = void Function();

class GMSearchBar extends StatefulWidget {
  const GMSearchBar({
    Key? key,
    this.placeHolder,
    this.style = GMSearchStyle.square,
    this.alignment = GMSearchAlignment.left,
    this.onTextChanged,
    this.onSubmitted,
    this.onEditComplete,
    this.autoHeight = false,
    this.padding = const EdgeInsets.fromLTRB(16, 8, 16, 8),
    this.autoFocus = false,
    this.mediumStyle = false,
    this.cursorHeight,
    this.needCancel = false,
    this.controller,
    this.backgroundColor = Colors.white,
    this.action = '',
    this.onActionClick,
    this.onClearClick,
    this.focusNode,
  }) : super(key: key);

  /// 预设文案
  final String? placeHolder;

  /// 样式
  final GMSearchStyle? style;

  /// 对齐方式，居中或这头部对齐
  final GMSearchAlignment? alignment;

  /// 背景颜色
  final Color? backgroundColor;

  /// 是否自动计算高度
  final bool autoHeight;

  /// 内部填充
  final EdgeInsets padding;

  /// 是否自动获取焦点
  final bool autoFocus;

  /// 是否在导航栏中的样式
  final bool mediumStyle;

  /// 光标的高
  final double? cursorHeight;


  /// 是否需要取消按钮
  final bool needCancel;

  /// 控制器
  final TextEditingController? controller;

  /// 文字改变回调
  final GMSearchBarEvent? onTextChanged;

  /// 提交回调
  final GMSearchBarEvent? onSubmitted;

  /// 编辑完成回调
  final GMSearchBarCallBack? onEditComplete;

  /// 自定义操作文字
  final String action;

  /// 自定义操作回调
  final GMSearchBarEvent? onActionClick;

  /// 自定义操作回调
  final GMSearchBarClearEvent? onClearClick;

  /// 自定义焦点
  final  FocusNode? focusNode;

  @override
  State<StatefulWidget> createState() => _GMSearchBarState();
}

enum _GMSearchBarStatus {
  unFocus,
  animatingToFocus,
  focused,
  animatingToUnFocus
}

class _GMSearchBarState extends State<GMSearchBar>
    with TickerProviderStateMixin {
  late FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  final GlobalKey _textFieldKey = GlobalKey();
  final GlobalKey _phKey = GlobalKey();

  late AnimationController _animationController;
  Animation<Offset>? _animation;
  bool clearBtnHide = true;
  bool cancelBtnHide = true;
  late _GMSearchBarStatus _status;
  @override
  void initState() {
    super.initState();
    if(widget.controller==null){
      controller.addListener(() {
        var clearVisible = controller.text.isNotEmpty;
        _updateClearBtnVisible(clearVisible!);
      });
    }else{
      widget.controller?.addListener(() {
        var clearVisible = widget.controller?.text.isNotEmpty;
        _updateClearBtnVisible(clearVisible!);
      });
    }
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _updateFocusNode();
  }

  void _updateFocusNode() {
    focusNode = widget.focusNode ?? focusNode;
    _status = widget.autoFocus
        ? _GMSearchBarStatus.focused
        : _GMSearchBarStatus.unFocus;
    focusNode.addListener(() {
      setState(() {
        _status = focusNode.hasFocus
            ? _GMSearchBarStatus.focused
            : _GMSearchBarStatus.unFocus;
      });
      _updateCancelBtnVisible(focusNode.hasFocus);
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (_status == _GMSearchBarStatus.animatingToFocus) {
            _status = _GMSearchBarStatus.focused;
            focusNode.requestFocus();
          } else if (_status == _GMSearchBarStatus.animatingToUnFocus) {
            _status = _GMSearchBarStatus.unFocus;
          }
        });
      }
    });
  }

  @override
  void didUpdateWidget(covariant GMSearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateFocusNode();
  }

  void _updateClearBtnVisible(bool visible) {
    setState(() {
      clearBtnHide = !visible;
    });
  }

  void _updateCancelBtnVisible(bool visible) {
    setState(() {
      cancelBtnHide = !visible;
    });
  }

  void _cleanInputText(){
    if(!(widget.onClearClick?.call(controller.text) ?? false)){
      // 如果外部没处理,则走默认清除逻辑
      if(widget.controller==null){
        controller.clear();
      }else{
        widget.controller?.clear();
      }
    }
  }

  Font? getSize(BuildContext context) {
    return widget.mediumStyle
        ? GMTheme.of(context).fontBodyMedium
        : GMTheme.of(context).fontBodyLarge;
  }

  Widget actionBtn(BuildContext context, String? text, {String? action, GMSearchBarEvent? onActionClick} ){
    return GestureDetector(
      onTap: (){
        onActionClick!(text??'');
      },
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        child: Text(action!,
            style: TextStyle(
                fontSize: getSize(context)?.size,
                color: GMTheme.of(context).brandNormalColor)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      height: widget.autoHeight ? double.infinity : 56,
      color: widget.backgroundColor,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    color: GMTheme.of(context).grayColor1,
                    borderRadius: BorderRadius.circular(
                        widget.style == GMSearchStyle.square ? 4 : 28)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Icon(
                      GMIcons.search,
                      size: widget.mediumStyle ? 20 : 24,
                      color: GMTheme.of(context).fontGyColor3,
                    ),
                    const Padding(padding: EdgeInsets.only(left: 3)),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 1),// 为了适配TextField与Text的差异，后续需要做通用适配
                        child: TextField(
                          key: _textFieldKey,
                          controller: widget.controller??controller,
                          autofocus: widget.autoFocus,
                          cursorColor: GMTheme.of(context).brandNormalColor,
                          cursorWidth: 1,
                          cursorHeight:widget.cursorHeight ??(widget.mediumStyle ? 16 : 18),
                          textAlign: widget.alignment == GMSearchAlignment.center
                              ? TextAlign.center
                              : TextAlign.left,
                          focusNode: focusNode,
                          onChanged: widget.onTextChanged,
                          onSubmitted: widget.onSubmitted,
                          onEditingComplete: widget.onEditComplete,
                          style: TextStyle(
                              fontSize: getSize(context)?.size,
                              color: GMTheme.of(context).fontGyColor1),
                          decoration: InputDecoration(
                            hintText: (_status != _GMSearchBarStatus.focused)
                                ? ''
                                : widget.placeHolder,
                            hintStyle: TextStyle(
                                fontSize: getSize(context)?.size,
                                color: GMTheme.of(context).fontGyColor3),
                            border: InputBorder.none,
                            isCollapsed: true,
                            filled: true,
                            fillColor: GMTheme.of(context).grayColor1,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 9)),
                    Offstage(
                      offstage: clearBtnHide,
                      child: GestureDetector(
                          onTap: () {
                            _cleanInputText();
                            if (widget.onTextChanged != null) {
                              widget.onTextChanged!('');
                            }
                          },
                          child: Icon(
                            GMIcons.close_circle_filled,
                            size: widget.mediumStyle ? 17 : 21,
                            color: GMTheme.of(context).fontGyColor3,
                          )),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 9)),
                  ],
                ),
              ),
            ),
            widget.action.isNotEmpty
                ? actionBtn(
              context,
              controller.text,
              action: widget.action,
              onActionClick: widget.onActionClick ?? (String text) {},
            )
                : Offstage(
              offstage: cancelBtnHide || !widget.needCancel,
              child: GestureDetector(
                onTap: () {
                  _cleanInputText();
                  if (widget.onTextChanged != null) {
                    widget.onTextChanged!('');
                  }
                  if (_animation == null) {
                    focusNode.unfocus();
                    setState(() {
                      _status = _GMSearchBarStatus.unFocus;
                    });
                    return;
                  }
                  setState(() {
                    _status = _GMSearchBarStatus.animatingToUnFocus;
                  });
                  focusNode.unfocus();
                  _animationController.reverse(
                      from: _animationController.upperBound);
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(context.resource.cancel,
                      style: TextStyle(
                          fontSize: getSize(context)?.size,
                          color: GMTheme.of(context).brandNormalColor)),
                ),
              ),
            ),
          ],
        ),
        Offstage(
          offstage:widget.controller==null?(_status == _GMSearchBarStatus.focused ||
              controller.text.isNotEmpty):(_status == _GMSearchBarStatus.focused ||widget.controller!.text.isNotEmpty),
          child: GestureDetector(
              onTap: () {
                if (_status == _GMSearchBarStatus.animatingToFocus ||
                    _status == _GMSearchBarStatus.animatingToUnFocus) {
                  return;
                }
                if (_animation == null) {
                  focusNode.requestFocus();
                  setState(() {
                    _status = _GMSearchBarStatus.focused;
                  });
                  return;
                }
                setState(() {
                  _status = _GMSearchBarStatus.animatingToFocus;
                  _animationController.forward();
                });
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: GMTheme.of(context).grayColor1,
                      borderRadius: BorderRadius.circular(
                          widget.style == GMSearchStyle.square ? 4 : 28),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    alignment: Alignment.centerLeft,
                    child: _getPlaceHolderWidgets(),
                  )
                ],
              )),
        ),
      ]),
    );
  }

  Widget _getPlaceHolderWidgets() {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints box) {
      if (_animation != null) {
        return Row(
          children: [
            Icon(
              GMIcons.search,
              size: widget.mediumStyle ? 20 : 24,
              color: GMTheme.of(context).fontGyColor3,
            ),
            Expanded(
                child: SlideTransition(
                  position: _animation!,
                  child: Row(
                    key: _phKey,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (widget.mediumStyle ? 20 : 24) / 2,
                      ),
                      Expanded(
                          child: Row(
                            mainAxisAlignment:
                            widget.alignment == GMSearchAlignment.left
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: box.maxWidth - 51,
                                ),
                                child: GMText(
                                  widget.placeHolder,
                                  font: getSize(context),
                                  textColor: GMTheme.of(context).fontGyColor3,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  forceVerticalCenter: true,
                                ),
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ))
          ],
        );
      } else {
        return Row(
          key: _phKey,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              GMIcons.search,
              size: widget.mediumStyle ? 20 : 24,
              color: GMTheme.of(context).fontGyColor3,
            ),
            const SizedBox(
              width: 3,
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: widget.alignment == GMSearchAlignment.left
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: box.maxWidth - 51,
                      ),
                      child: GMText(
                        widget.placeHolder,
                        font: getSize(context),
                        textColor: GMTheme.of(context).fontGyColor3,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )),
            const SizedBox(
              width: 6,
            ),
          ],
        );
      }
    });
  }
}
