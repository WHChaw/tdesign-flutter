import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMAvatarPage extends StatefulWidget {
  const GMAvatarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GMAvatarPageState();
}

class _GMAvatarPageState extends State<GMAvatarPage> {
  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      backgroundColor: GMTheme.of(context).whiteColor1,
      title: tdTitle(),
      exampleCodeGroup: 'avatar',
      desc: '用于告知用户，该区域的状态变化或者待处理任务的数量。',
      children: [
        ExampleModule(title: '组件类型', children: [
          ExampleItem(
              desc: '图片头像',
              builder: _buildImageAvatar),
          ExampleItem(
              desc: '字符头像',
              builder: _buildTextAvatar),
          ExampleItem(
              desc: '图标头像',
              builder: _buildIconAvatar),
          ExampleItem(
              desc: '带徽标头像',
              builder: _buildBadgeAvatar),
        ]),
        ExampleModule(title: '特殊类型', children: [
          ExampleItem(
              desc: '纯展示的头像组',
              builder: _buildDisplayAvatar),
          ExampleItem(
              desc: '带操作的头像组',
              builder: _buildOperationAvatar),
        ]),
        ExampleModule(title: '组件尺寸', children: [
          ExampleItem(
              desc: '大尺寸 :64px',
              builder: _buildLargeAvatar),
          ExampleItem(
              desc: '中尺寸 :48px',
              builder: _buildMediumAvatar),
          ExampleItem(
              desc: '小尺寸 :40px',
              builder: _buildSmallAvatar),
        ])
      ],
    );
  }

  /// 图片头像
  @Demo(group: 'avatar')
  Widget _buildImageAvatar(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: const [
          GMAvatar(
            size: GMAvatarSize.medium,
            type: GMAvatarType.normal,
            defaultUrl: 'assets/img/td_avatar_1.png',),
          SizedBox(width: 32,),
          GMAvatar(
            size: GMAvatarSize.medium,
            type: GMAvatarType.normal,
            shape: GMAvatarShape.square,
            defaultUrl: 'assets/img/td_avatar_1.png',),
        ],
      ),
    );
  }

  /// 字符头像
  @Demo(group: 'avatar')
  Widget _buildTextAvatar(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: const [
          GMAvatar(
              size: GMAvatarSize.medium,
              type: GMAvatarType.customText,
              text: 'A'),
          SizedBox(width: 32,),
          GMAvatar(
              size: GMAvatarSize.medium,
              type: GMAvatarType.customText,
              shape: GMAvatarShape.square,
              text: 'A'),
        ],
      ),
    );
  }

  /// 图标头像
  @Demo(group: 'avatar')
  Widget _buildIconAvatar(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: const [
          GMAvatar(
            size: GMAvatarSize.medium,
            type: GMAvatarType.icon,),
          SizedBox(width: 32,),
          GMAvatar(
            size: GMAvatarSize.medium,
            type: GMAvatarType.icon,
            shape: GMAvatarShape.square,
          ),
        ],
      ),
    );
  }

  /// 带徽标头像
  @Demo(group: 'avatar')
  Widget _buildBadgeAvatar(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          SizedBox(
            height: 51,
            width: 51,
            child: Stack(
              alignment:Alignment.bottomLeft,
              children: const [
                GMAvatar(
                  size: GMAvatarSize.medium,
                  type: GMAvatarType.normal,
                  defaultUrl: 'assets/img/td_avatar_1.png',),
                Positioned(child: GMBadge(GMBadgeType.redPoint), right: 0, top: 0)
              ],
            ),
          ),
          const SizedBox(width: 32,),
          SizedBox(
            height: 51,
            width: 51,
            child: Stack(
              alignment:Alignment.bottomLeft,
              children: const [
                GMAvatar(
                    size: GMAvatarSize.medium,
                    type: GMAvatarType.customText,
                    text: 'A'),
                Positioned(child: GMBadge(GMBadgeType.message,count: '8',), right: 0, top: 0)
              ],
            ),
          ),
          const SizedBox(width: 32,),
          SizedBox(
            width: 51,
            height: 51,
            child: Stack(
              alignment:Alignment.bottomLeft,
              children: const [
                GMAvatar(
                  size: GMAvatarSize.medium,
                  type: GMAvatarType.icon,),
                Positioned(child: GMBadge(GMBadgeType.message,count: '12',), right: 0, top: 0,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 纯展示的头像组
  @Demo(group: 'avatar')
  Widget _buildDisplayAvatar(BuildContext context){
    var assetUrl = 'assets/img/td_avatar_1.png';
    var assetUrl2 = 'assets/img/td_avatar_2.png';
    var avatarList = [assetUrl, assetUrl2, assetUrl, assetUrl2, assetUrl];
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16),
      child: GMAvatar(
        size: GMAvatarSize.medium,
        type: GMAvatarType.display,
        displayText: '+5',
        avatarDisplayListAsset: avatarList,),
    );
  }

  /// 带操作的头像组
  @Demo(group: 'avatar')
  Widget _buildOperationAvatar(BuildContext context){
    var assetUrl = 'assets/img/td_avatar_1.png';
    var assetUrl2 = 'assets/img/td_avatar_2.png';
    var avatarList = [assetUrl, assetUrl2, assetUrl, assetUrl2, assetUrl];
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16),
      child: GMAvatar(
          size: GMAvatarSize.medium,
          type: GMAvatarType.operation,
          avatarDisplayListAsset: avatarList,
          onTap: () {
            GMToast.showText('点击了操作', context: context);
          }),
    );
  }

  /// 组件尺寸 大尺寸
  @Demo(group: 'avatar')
  Widget _buildLargeAvatar(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: const [
          GMAvatar(
            size: GMAvatarSize.large,
            type: GMAvatarType.normal,
            defaultUrl: 'assets/img/td_avatar_1.png',),
          SizedBox(width: 32,),
          GMAvatar(
              size: GMAvatarSize.large,
              type: GMAvatarType.customText,
              text: 'A'),
          SizedBox(width: 32,),
          GMAvatar(
            size: GMAvatarSize.large,
            type: GMAvatarType.icon,),
        ],
      ),
    );
  }

  /// 组件尺寸 中尺寸
  @Demo(group: 'avatar')
  Widget _buildMediumAvatar(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: const [
          GMAvatar(
            size: GMAvatarSize.medium,
            type: GMAvatarType.normal,
            defaultUrl: 'assets/img/td_avatar_1.png',),
          SizedBox(width: 48,),
          GMAvatar(
              size: GMAvatarSize.medium,
              type: GMAvatarType.customText,
              text: 'A'),
          SizedBox(width: 48,),
          GMAvatar(
            size: GMAvatarSize.medium,
            type: GMAvatarType.icon,),
        ],
      ),
    );
  }

  /// 组件尺寸 小尺寸
  @Demo(group: 'avatar')
  Widget _buildSmallAvatar(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: const [
          GMAvatar(
            size: GMAvatarSize.small,
            type: GMAvatarType.normal,
            defaultUrl: 'assets/img/td_avatar_1.png',),
          SizedBox(width: 56,),
          GMAvatar(
              size: GMAvatarSize.small,
              type: GMAvatarType.customText,
              text: 'A'),
          SizedBox(width: 56,),
          GMAvatar(
            size: GMAvatarSize.small,
            type: GMAvatarType.icon,),
        ],
      ),
    );
  }
}
