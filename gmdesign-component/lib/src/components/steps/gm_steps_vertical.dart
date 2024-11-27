import 'package:flutter/material.dart';
import 'package:gmdesign_flutter/src/components/steps/gm_steps_vertical_item.dart';
import '../../../gmdesign_flutter.dart';

/// Steps步骤条，垂直步骤
class GMStepsVertical extends StatelessWidget {
  final List<GMStepsItemData> steps;
  final int activeIndex;
  final GMStepsStatus status;
  final bool simple;
  final bool readOnly;
  final bool verticalSelect;
  const GMStepsVertical({
    super.key,
    required this.steps,
    required this.activeIndex,
    required this.status,
    required this.simple,
    required this.readOnly,
    required this.verticalSelect,
  });

  @override
  Widget build(BuildContext context) {
    final stepsCount = steps.length;
    List<Widget> stepsVerticalItem = steps.asMap().entries.map((item){
      return GMStepsVerticalItem(
        index: item.key,
        data: item.value,
        stepsCount: stepsCount,
        activeIndex: activeIndex,
        status: status,
        simple: simple,
        readOnly: readOnly,
        verticalSelect: verticalSelect,
      );
    }).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: stepsVerticalItem,
    );
  }

}

