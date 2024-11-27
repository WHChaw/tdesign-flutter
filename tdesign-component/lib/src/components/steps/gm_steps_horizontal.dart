import 'package:flutter/material.dart';
import 'package:tdesign_flutter/src/components/steps/gm_steps_horizontal_item.dart';
import '../../../tdesign_flutter.dart';

/// Steps步骤条，水平步骤
class GMStepsHorizontal extends StatelessWidget {
  final List<GMStepsItemData> steps;
  final int activeIndex;
  final GMStepsStatus status;
  final bool simple;
  final bool readOnly;
  const GMStepsHorizontal({
    super.key,
    required this.steps,
    required this.activeIndex,
    required this.status,
    required this.simple,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    final stepsCount = steps.length;
    List<Widget> stepsHorizontalItem = steps.asMap().entries.map((item){
      return Expanded(
        flex: 1,
        child: GMStepsHorizontalItem(
          index: item.key,
          data: item.value,
          stepsCount: stepsCount,
          activeIndex: activeIndex,
          status: status,
          simple: simple,
          readOnly: readOnly,
        ),
      );
    }).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stepsHorizontalItem,
    );
  }

}

