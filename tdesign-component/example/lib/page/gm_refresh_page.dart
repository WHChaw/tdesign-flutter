/*
 * Created by haozhicao@tencent.com on 6/28/22.
 * gm_loading_page.dart
 * 
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMPullDownRefreshPage extends StatefulWidget {
  const GMPullDownRefreshPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GMPullDownRefreshPageState();
}

class _GMPullDownRefreshPageState extends State<GMPullDownRefreshPage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(),
        exampleCodeGroup: 'refresh',
        desc: '用于快速刷新页面信息，刷新可以是整页刷新也可以是页面的局部刷新。',
        showSingleChild: true,
        singleChild: CodeWrapper(builder: _buildRefresh),
    );
  }

  @Demo(group: 'refresh')
  Widget _buildRefresh(BuildContext context) {
    return EasyRefresh(
      // 下拉样式
      header: GMRefreshHeader(),
      child: Column(
        children: [
          Container(
            height: 171,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: GMTheme.of(context).grayColor1,
                borderRadius: BorderRadius.all(
                    Radius.circular(GMTheme.of(context).radiusLarge))),
            margin: const EdgeInsets.only(left: 16, right: 16),
            child: GMText(
              PlatformUtil.isWeb ? 'Web暂不支持下拉，请下载安装apk体验' : '拖拽该区域演示 顶部下拉刷新',
              font: GMTheme.of(context).fontBodyLarge,
              textColor: GMTheme.of(context).fontGyColor4,
            ),
          ),
          Container(
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: GMTheme.of(context).grayColor1,
                borderRadius: BorderRadius.all(
                    Radius.circular(GMTheme.of(context).radiusLarge))),
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: GMText(
              '下拉刷新次数：${count}',
              font: GMTheme.of(context).fontBodyLarge,
              textColor: GMTheme.of(context).fontGyColor4,
            ),
          ),
        ],
      ),
      // 下拉刷新回调
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            count++;
          });
        });
      },
    );
  }
}
