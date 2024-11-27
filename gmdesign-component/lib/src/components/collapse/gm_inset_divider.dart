/*
 * Created by dorayhong@tencent.com on 6/8/23.
 */
import 'package:flutter/material.dart';

import '../../../gmdesign_flutter.dart';


class GMInsetDivider extends StatelessWidget {
  const GMInsetDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 1,
        child: Divider(
          color: GMTheme.of(context).grayColor3,
          indent: GMTheme.of(context).spacer16,
          endIndent: 0.0,
          height: 1,
          thickness: 0.5,
        ));
  }
}
