import 'package:flutter/material.dart';

import 'package:gmdesign_flutter/gmdesign_flutter.dart';

import '../../base/example_widget.dart';
import '../annotation/demo.dart';
import 'dart:io';
class GMImagePage extends StatefulWidget {
  const GMImagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => GMImageState();
}

class GMImageState extends State<GMImagePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation = Tween(begin: 0.0, end: 4.0).animate(animationController);
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(),
        exampleCodeGroup: 'image',
        desc: '用于展示效果，主要为上下左右居中裁切、拉伸、平铺等方式。',
        children: [
          ExampleModule(
            title: '组件类型',
            children: [
              ExampleItem(desc: '', builder: _imageClip),
              ExampleItem(desc: '', builder: _imageFitWidth),
              ExampleItem(desc: '', builder: _imageSquare),
            ],
          ),
          ExampleModule(
            title: '组件状态',
            children: [
              ExampleItem(desc: '', builder: _loading),
              ExampleItem(desc: '', builder: _fail),
            ],
          )
        ],
     test: [
       ExampleItem(desc: '加载本地文件', builder: _imageFile),
     ],);
  }
  @Demo(group: 'image')
  Widget _imageClip(BuildContext context)  {

    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GMText(
                '裁剪',
                font: GMTheme.of(context).fontBodyMedium,
                textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
              ),
            ),
             const GMImage(
               assetUrl: 'assets/img/image.png',
               type: GMImageType.clip,
            ),
          ],
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GMText(
                '适应高',
                font: GMTheme.of(context).fontBodyMedium,
                textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
              ),
            ),
            Container(
              width: 89,
              height: 72,
              color: Colors.black,
              child: const GMImage(
                assetUrl: 'assets/img/image.png',
                type: GMImageType.fitHeight,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GMText(
                '拉伸',
                font: GMTheme.of(context).fontBodyMedium,
                textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
              ),
            ),
            Container(
              color: Colors.black,
              width: 121,
              height: 72,
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  GMImage(
                    assetUrl: 'assets/img/image.png',
                    width: 121,
                    height: 50,
                    type: GMImageType.stretch,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  @Demo(group: 'image')
  Widget _imageFitWidth(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GMText(
                  '适应宽',
                  font: GMTheme.of(context).fontBodyMedium,
                  textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
                ),
              ),
              Container(
                width: 72,
                height: 89,
                color: Colors.black,
                child: const GMImage(
                  assetUrl: 'assets/img/image.png',
                  type: GMImageType.fitWidth,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @Demo(group: 'image')
  Widget _imageSquare(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GMText(
                  '方形',
                  font: GMTheme.of(context).fontBodyMedium,
                  textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
                ),
              ),
              const GMImage(
                assetUrl: 'assets/img/image.png',
                type: GMImageType.square,
              ),
            ],
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GMText(
                  '圆角方形',
                  font: GMTheme.of(context).fontBodyMedium,
                  textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
                ),
              ),
              const GMImage(
                assetUrl: 'assets/img/image.png',
                type: GMImageType.roundedSquare,
                width: 72,
                height: 72,
              ),
            ],
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GMText(
                  '圆形',
                  font: GMTheme.of(context).fontBodyMedium,
                  textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
                ),
              ),
              const GMImage(
                assetUrl: 'assets/img/image.png',
                width: 72,
                height: 72,
                type: GMImageType.circle,
              ),
            ],
          )
        ],
      ),
    );
  }

  @Demo(group: 'image')
  Widget _loading(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GMText(
                '加载默认提示',
                font: GMTheme.of(context).fontBodyMedium,
                textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
              ),
            ),
            Container(
                height: 72,
                width: 72,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(GMTheme.of(context).radiusDefault)),
                child: Container(
                    alignment: Alignment.center,
                    color: GMTheme.of(context).grayColor2,
                    child: Icon(
                      GMIcons.ellipsis,
                      size: 22,
                      color: GMTheme.of(context).fontGyColor3,
                    )
                )
            ),
            // 实际组件写法如下：上面仅为加载展示
            // const GMImage(
            //   imgUrl:
            //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            //   type: GMImageType.roundedSquare,
            // ),
          ],
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GMText(
                '加载自定义提示',
                font: GMTheme.of(context).fontBodyMedium,
                textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
              ),
            ),
            Container(
                height: 72,
                width: 72,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(GMTheme.of(context).radiusDefault)),
                child: Container(
                    alignment: Alignment.center,
                    color: GMTheme.of(context).grayColor2,
                    child: RotationTransition(
                        turns: animation,
                        alignment: Alignment.center,
                        child: GMCircleIndicator(
                          color: GMTheme.of(context).brandNormalColor,
                          size: 18,
                          lineWidth: 3,
                        ))
                )
            ),
            // 实际组件写法如下：上面仅为加载展示
            // GMImage(
            //   imgUrl:
            //       'https://images.pexels.com/photos/842711/pexels-photo-842711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            //   loadingWidget: RotationTransition(
            //       turns: animation,
            //       alignment: Alignment.center,
            //       child: GMCircleIndicator(
            //         color: GMTheme.of(context).brandNormalColor,
            //         size: 18,
            //         lineWidth: 3,
            //       )),
            //   type: GMImageType.roundedSquare,
            // ),
          ],
        ),
        const SizedBox(
          width: 24,
        ),
      ],
    );
  }

  @Demo(group: 'image')
  Widget _fail(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GMText(
                  '失败默认提示',
                  font: GMTheme.of(context).fontBodyMedium,
                  textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
                ),
              ),
              const GMImage(
                imgUrl: 'error',
                type: GMImageType.roundedSquare,
              ),
            ],
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GMText(
                  '失败自定义提示',
                  font: GMTheme.of(context).fontBodyMedium,
                  textColor: GMTheme.of(context).fontGyColor2.withOpacity(0.6),
                ),
              ),
              GMImage(
                imgUrl: 'error',
                errorWidget: GMText(
                  '加载失败',
                  forceVerticalCenter: true,
                  font: GMTheme.of(context).fontBodyExtraSmall,
                  fontWeight: FontWeight.w500,
                  textColor: GMTheme.of(context).fontGyColor3,
                ),
                type: GMImageType.roundedSquare,
              ),
            ],
          ),
          const SizedBox(
            width: 24,
          ),
        ],
      ),
    );
  }

  Widget _imageFile(BuildContext context) {

    return Container(
      width: 72,
      height: 72,
      child:  GMImage(
        imageFile: File('/sdcard/td/test.jpg'),
        type: GMImageType.fitWidth,
      ),
    );
  }
}
