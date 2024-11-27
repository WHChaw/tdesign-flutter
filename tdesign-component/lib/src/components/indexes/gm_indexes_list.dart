import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

import '../../../tdesign_flutter.dart';
import '../../util/iterable_ext.dart';
import 'sticky_header/sticky_header_widget.dart';
import 'gm_indexes_anchor.dart';

/// 索引
class GMIndexesList extends StatefulWidget {
  const GMIndexesList({
    Key? key,
    required this.indexList,
    this.indexListMaxHeight = 0.8,
    required this.activeIndex,
    required this.onSelect,
    this.builderIndex,
  }) : super(key: key);

  /// 索引字符列表。不传默认 A-Z
  final List<String> indexList;

  /// 索引列表最大高度（父容器高度的百分比，默认0.8）
  final double indexListMaxHeight;

  /// 选中索引
  final ValueNotifier<String> activeIndex;

  /// 点击侧边栏时触发事件
  final void Function(String newIndex, String oldIndex) onSelect;

  /// 索引文本自定义构建，包括索引激活左侧提示
  final Widget Function(BuildContext context, String index, bool isActive)? builderIndex;

  @override
  State<GMIndexesList> createState() => _GMIndexesListState();
}

class _GMIndexesListState extends State<GMIndexesList> {
  late Map<String, GlobalKey> _containerKeys;
  final _indexSize = 20.0;
  Timer? _hideTipTimer;
  var _showTip = false;

  @override
  void initState() {
    super.initState();
    _containerKeys = widget.indexList.asMap().map((index, e) => MapEntry(e, GlobalKey()));
  }

  @override
  void didUpdateWidget(GMIndexesList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.indexList != oldWidget.indexList) {
      _containerKeys = widget.indexList.asMap().map((index, e) => MapEntry(e, GlobalKey()));
    }
  }

  @override
  void dispose() {
    _hideTipTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: GMTheme.of(context).spacer8,
      top: 0,
      bottom: 0,
      child: Align(
        child: FractionallySizedBox(
          heightFactor: widget.indexListMaxHeight,
          child: Align(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onVerticalDragUpdate: (details) {
                _changeSelect(details.globalPosition);
              },
              onTapUp: (details) {
                _changeSelect(details.globalPosition);
                _hideTip();
              },
              onVerticalDragEnd: (details) {
                _hideTip();
              },
              child: ValueListenableBuilder(
                valueListenable: widget.activeIndex,
                builder: (context, value, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.indexList.map(
                      (e) {
                        final isActive = value == e;
                        if (widget.builderIndex != null) {
                          return widget.builderIndex!(context, e, isActive);
                        }
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            if (_showTip && value == e)
                              Positioned(
                                top: -GMTheme.of(context).spacer48 / 2 + _indexSize / 2,
                                left: -GMTheme.of(context).spacer48,
                                child: Container(
                                  height: GMTheme.of(context).spacer48,
                                  width: GMTheme.of(context).spacer48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(GMTheme.of(context).radiusCircle),
                                    color: GMTheme.of(context).brandColor1,
                                  ),
                                  child: Center(
                                    child: GMText(
                                      e,
                                      forceVerticalCenter: true,
                                      font: GMTheme.of(context).fontTitleExtraLarge,
                                      textColor: GMTheme.of(context).brandColor7,
                                    ),
                                  ),
                                ),
                              ),
                            Container(
                              key: _containerKeys[e],
                              padding: EdgeInsets.only(left: GMTheme.of(context).spacer8),
                              color: Colors.transparent,
                              child: Container(
                                width: _indexSize,
                                height: _indexSize,
                                decoration: isActive
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.circular(GMTheme.of(context).radiusCircle),
                                        color: GMTheme.of(context).brandColor7,
                                      )
                                    : null,
                                child: Center(
                                  child: GMText(
                                    e,
                                    forceVerticalCenter: true,
                                    font: isActive ?  GMTheme.of(context).fontMarkSmall : GMTheme.of(context).fontLinkSmall,
                                    textColor:
                                        isActive ? GMTheme.of(context).fontWhColor1 : GMTheme.of(context).fontGyColor1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _changeSelect(Offset globalPosition) {
    final newIndex = _fingerInsideContainer(globalPosition);
    if (newIndex != null && newIndex != widget.activeIndex.value) {
      final oldIndex = widget.activeIndex.value;
      widget.activeIndex.value = newIndex;
      _showTip = true;
      widget.onSelect.call(newIndex, oldIndex);
    }
  }

  String? _fingerInsideContainer(Offset globalPosition) {
    for (var entry in _containerKeys.entries) {
      final renderBox = entry.value.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final localPosition = renderBox.globalToLocal(globalPosition);
        final isIn = renderBox.hitTest(BoxHitTestResult(), position: localPosition);
        if (isIn) {
          return entry.key;
        }
      }
    }
    return null;
  }

  void _hideTip() {
    _hideTipTimer?.cancel();
    _hideTipTimer = Timer(
      const Duration(seconds: 1),
      () {
        setState(() {
          _showTip = false;
        });
      },
    );
  }
}
