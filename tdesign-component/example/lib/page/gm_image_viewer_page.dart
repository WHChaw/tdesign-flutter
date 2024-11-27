import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../annotation/demo.dart';
import '../base/example_widget.dart';

class GMImageViewerPage extends StatefulWidget {
  const GMImageViewerPage({Key? key}) : super(key: key);

  @override
  State<GMImageViewerPage> createState() => _GMImageViewerPageState();
}

class _GMImageViewerPageState extends State<GMImageViewerPage> {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      backgroundColor: const Color(0xFFF0F2F5),
      title: tdTitle(),
      desc: '用于图片内容的缩略展示与查看。',
      exampleCodeGroup: 'image_viewer',
      children: [
        ExampleModule(title: '组件类型', children: [
          ExampleItem(desc: '基础图片预览', builder: _basicImageViewer),
          ExampleItem(desc: '带操作图片预览', builder: _actionImageViewer)
        ]),
      ],
      test: [
        ExampleItem(desc: '长按图片', builder: _longPressImageViewer),
        ExampleItem(desc: '图片超宽情况', builder: _ultraWidthImageViewer),
        ExampleItem(desc: '图片超高情况', builder: _ultraHeightImageViewer),
      ],
    );
  }

  var images = [
    'https://tdesign.gtimg.com/mobile/demos/swiper1.png',
    'https://tdesign.gtimg.com/mobile/demos/swiper2.png',
  ];

  @Demo(group: 'image_viewer')
  Widget _basicImageViewer(BuildContext context) {
    return GMButton(
      type: GMButtonType.ghost,
      theme: GMButtonTheme.primary,
      isBlock: true,
      size: GMButtonSize.large,
      text: '基础图片预览',
      onTap: () {
        GMImageViewer.showImageViewer(context: context, images: images);
      },
    );
  }

  @Demo(group: 'image_viewer')
  Widget _actionImageViewer(BuildContext context) {
    var delImages = [
      'https://tdesign.gtimg.com/mobile/demos/swiper1.png',
      'https://tdesign.gtimg.com/mobile/demos/swiper2.png',
    ];
    return GMButton(
      type: GMButtonType.ghost,
      theme: GMButtonTheme.primary,
      isBlock: true,
      size: GMButtonSize.large,
      text: '带操作图片预览',
      onTap: () {
        GMImageViewer.showImageViewer(
          context: context,
          images: delImages,
          showIndex: true,
          deleteBtn: true,
        );
      },
    );
  }

  @Demo(group: 'image_viewer')
  Widget _longPressImageViewer(BuildContext context) {
    return GMButton(
      type: GMButtonType.ghost,
      theme: GMButtonTheme.primary,
      isBlock: true,
      size: GMButtonSize.large,
      text: '长按图片',
      onTap: () {
        GMImageViewer.showImageViewer(
          context: context,
          images: images,
          deleteBtn: true,
          showIndex: true,
          onLongPress: (index) {
            Navigator.of(context).push(GMSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.bottom,
              builder: _getSheetItem,
            ));
          },
        );
      },
    );
  }

  @Demo(group: 'image_viewer')
  Widget _ultraWidthImageViewer(BuildContext context) {
    return GMButton(
      type: GMButtonType.ghost,
      theme: GMButtonTheme.primary,
      isBlock: true,
      size: GMButtonSize.large,
      text: '图片超宽情况',
      onTap: () {
        GMImageViewer.showImageViewer(
          context: context,
          images: images,
          showIndex: true,
          height: 140,
          onLongPress: (index) {
            Navigator.of(context).push(GMSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.bottom,
              builder: _getSheetItem,
            ));
          },
        );
      },
    );
  }

  @Demo(group: 'image_viewer')
  Widget _ultraHeightImageViewer(BuildContext context) {
    return GMButton(
      type: GMButtonType.ghost,
      theme: GMButtonTheme.primary,
      isBlock: true,
      size: GMButtonSize.large,
      text: '图片超高情况',
      onTap: () {
        GMImageViewer.showImageViewer(
          context: context,
          images: images,
          showIndex: true,
          width: 180,
          onLongPress: (index) {
            Navigator.of(context).push(GMSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.bottom,
              builder: _getSheetItem,
            ));
          },
        );
      },
    );
  }

  Widget _getSheetItem(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text(
            '保存图片',
            style: TextStyle(
              color: GMTheme.of(context).fontGyColor1,
              decoration: TextDecoration.none,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const GMDivider(margin: EdgeInsets.symmetric(vertical: 10),),
          Text(
            '删除图片',
            style: TextStyle(
              color: GMTheme.of(context).fontGyColor1,
              decoration: TextDecoration.none,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
