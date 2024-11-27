import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../../base/example_widget.dart';
import '../annotation/demo.dart';

class GMTagPage extends StatelessWidget {
  const GMTagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
        title: tdTitle(context),
        desc: '用于表明主体的类目，属性或状态',
        exampleCodeGroup: 'tag',
        children: [
          ExampleModule(title: '组件类型', children: [
            ExampleItem(
                desc: '基础标签',
                ignoreCode: true,
                builder: (context) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildSimpleFillTag),
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildSimpleOutlineTag),
                    ],
                  );
                }),
            ExampleItem(
                desc: '圆弧标签',
                ignoreCode: true,
                builder: (context) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildCircleFillTag),
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildCircleOutlineTag),
                    ],
                  );
                }),
            ExampleItem(
                desc: 'Mark标签',
                ignoreCode: true,
                builder: (context) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildMarkFillTag),
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildMarkOutlineTag),
                    ],
                  );
                }),
            ExampleItem(
                desc: '带图标的标签',
                ignoreCode: true,
                builder: (context) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildIconFillTag),
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildIconOutlineTag),
                    ],
                  );
                }),
            ExampleItem(
                desc: '可关闭的标签',
                ignoreCode: true,
                builder: (context) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildCloseFillTag),
                      const SizedBox(
                        width: 16,
                      ),
                      CodeWrapper(builder: _buildCloseOutlineTag),
                    ],
                  );
                }),
            ExampleItem(
                desc: '可选中的标签',
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: Wrap(spacing: 8, direction: Axis.vertical, children: [
                      // 非浅色填充
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            child: GMText('dark'),
                          ),
                          CodeWrapper(builder: _buildDarkSelectTags)
                        ],
                      ),
                      // 浅色填充
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            child: GMText('light'),
                          ),
                          CodeWrapper(builder: _buildLightSelectTags)
                        ],
                      ),
                      // 非浅色描边
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            child: GMText('outline'),
                          ),
                          CodeWrapper(builder: _buildOutlineSelectTags)
                        ],
                      ),
                      // 浅色描边
                      Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            child: GMText('light-outline'),
                          ),
                          CodeWrapper(builder: _buildLightOutlineSelectTags)
                        ],
                      ),
                    ]),
                  );
                }),
          ]),
          ExampleModule(title: '组件状态（主题）', children: [
            ExampleItem(
                desc: '展示型标签',
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: Wrap(
                      spacing: 8,
                      direction: Axis.vertical,
                      children: [
                        // 浅色填充
                        CodeWrapper(builder: _buildLightShowTags),

                        // 非浅色填充
                        CodeWrapper(builder: _buildDarkShowTags),

                        // 非浅色描边
                        CodeWrapper(builder: _buildOutlineShowTags),

                        // 浅色描边
                        CodeWrapper(builder: _buildLightOutlineShowTags),
                      ],
                    ),
                  );
                }),
          ]),
          ExampleModule(title: '组件尺寸', children: [
            ExampleItem(
                ignoreCode: true,
                builder: (context) {
                  return Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 16),
                    child: Wrap(spacing: 8, direction: Axis.vertical, children: [
                      // 不带关闭
                      CodeWrapper(builder: _buildAllSizeTags),
                      // 带关闭
                      CodeWrapper(builder: _buildAllSizeCloseTags),
                    ]),
                  );
                })
          ])
        ],
        test: [
          ExampleItem(
              desc: '非浅色填充的各主题展示',
              ignoreCode: true,
              builder: (context) {
                return Wrap(
                  spacing: 8,
                  children: const [
                    GMTag(
                      '标签文字',
                    ),
                    GMTag(
                      '标签文字',
                      theme: GMTagTheme.primary,
                    ),
                    GMTag(
                      '标签文字',
                      theme: GMTagTheme.warning,
                    ),
                    GMTag(
                      '标签文字',
                      theme: GMTagTheme.danger,
                    ),
                    GMTag(
                      '标签文字',
                      theme: GMTagTheme.success,
                    ),
                  ],
                );
              }),
          ExampleItem(
              desc: '浅色填充的各主题展示',
              ignoreCode: true,
              builder: (context) {
                return Wrap(
                  spacing: 8,
                  children: const [
                    GMTag(
                      '标签文字',
                      isLight: true,
                    ),
                    GMTag(
                      '标签文字',
                      isLight: true,
                      theme: GMTagTheme.primary,
                    ),
                    GMTag(
                      '标签文字',
                      isLight: true,
                      theme: GMTagTheme.warning,
                    ),
                    GMTag(
                      '标签文字',
                      isLight: true,
                      theme: GMTagTheme.danger,
                    ),
                    GMTag(
                      '标签文字',
                      isLight: true,
                      theme: GMTagTheme.success,
                    ),
                  ],
                );
              }),
          ExampleItem(
              desc: '非浅色描边的各主题展示',
              ignoreCode: true,
              builder: (context) {
                return Wrap(
                  spacing: 8,
                  children: const [
                    GMTag(
                      '标签文字',
                      isOutline: true,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      theme: GMTagTheme.primary,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      theme: GMTagTheme.warning,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      theme: GMTagTheme.danger,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      theme: GMTagTheme.success,
                    ),
                  ],
                );
              }),
          ExampleItem(
              desc: '浅色描边的各主题展示',
              ignoreCode: true,
              builder: (context) {
                return Wrap(
                  spacing: 8,
                  children: const [
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      isLight: true,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      isLight: true,
                      theme: GMTagTheme.primary,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      isLight: true,
                      theme: GMTagTheme.warning,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      isLight: true,
                      theme: GMTagTheme.danger,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      isLight: true,
                      theme: GMTagTheme.success,
                    ),
                  ],
                );
              }),
          ExampleItem(
              desc: '各主题关闭图标颜色不会变',
              ignoreCode: true,
              builder: (context) {
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      needCloseIcon: true,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      needCloseIcon: true,
                      theme: GMTagTheme.primary,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      needCloseIcon: true,
                      theme: GMTagTheme.warning,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      needCloseIcon: true,
                      theme: GMTagTheme.danger,
                    ),
                    GMTag(
                      '标签文字',
                      isOutline: true,
                      needCloseIcon: true,
                      theme: GMTagTheme.success,
                    ),
                    GMTag(
                      '标签文字',
                      needCloseIcon: true,
                    ),
                    GMTag(
                      '标签文字',
                      needCloseIcon: true,
                      theme: GMTagTheme.primary,
                    ),
                    GMTag(
                      '标签文字',
                      needCloseIcon: true,
                      theme: GMTagTheme.warning,
                    ),
                    GMTag(
                      '标签文字',
                      needCloseIcon: true,
                      theme: GMTagTheme.danger,
                    ),
                    GMTag(
                      '标签文字',
                      needCloseIcon: true,
                      theme: GMTagTheme.success,
                    ),
                  ],
                );
              }),
          ExampleItem(
              desc: '带图标可关闭的标签',
              ignoreCode: true,
              builder: (context) {
                return Row(
                  children: const [
                    SizedBox(
                      width: 16,
                    ),
                    GMTag(
                      '标签文字',
                      icon: GMIcons.discount,
                      needCloseIcon: true,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    GMTag(
                      '标签文字',
                      icon: GMIcons.discount,
                      needCloseIcon: true,
                      isOutline: true,
                    ),
                  ],
                );
              }),
          ExampleItem(
              desc: '各尺寸测试',
              ignoreCode: true,
              builder: (context) {
                return Wrap(spacing: 8, direction: Axis.vertical, children: [
                  // 带图标和关闭
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMTag(
                        '加大尺寸',
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        size: GMTagSize.extraLarge,
                      ),
                      GMTag(
                        '大尺寸',
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        size: GMTagSize.large,
                      ),
                      GMTag(
                        '中尺寸',
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        size: GMTagSize.medium,
                      ),
                      GMTag(
                        '小尺寸',
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        size: GMTagSize.small,
                      ),
                    ]),
                  ),
                  // 带图标和关闭,描边
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMTag(
                        '加大尺寸',
                        isOutline: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        size: GMTagSize.extraLarge,
                      ),
                      GMTag(
                        '大尺寸',
                        isOutline: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        size: GMTagSize.large,
                      ),
                      GMTag(
                        '中尺寸',
                        isOutline: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        size: GMTagSize.medium,
                      ),
                      GMTag(
                        '小尺寸',
                        isOutline: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        size: GMTagSize.small,
                      ),
                    ]),
                  ),
                ]);
              }),
          ExampleItem(
              desc: '可选各状态测试',
              ignoreCode: true,
              builder: (context) {
                return Wrap(spacing: 8, direction: Axis.vertical, children: [
                  // Normal
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        shape: GMTagShape.mark,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isSelected: true,
                        shape: GMTagShape.mark,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        isSelected: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        disableSelect: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        disableSelect: true,
                        shape: GMTagShape.mark,
                      ),
                    ]),
                  ),
                  // Light
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isLight: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isLight: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        shape: GMTagShape.mark,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isLight: true,
                        isSelected: true,
                        shape: GMTagShape.mark,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        icon: GMIcons.discount,
                        isLight: true,
                        needCloseIcon: true,
                        isSelected: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isLight: true,
                        disableSelect: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isLight: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        disableSelect: true,
                        shape: GMTagShape.mark,
                      ),
                    ]),
                  ),
                  // Outline
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        shape: GMTagShape.mark,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        isSelected: true,
                        shape: GMTagShape.mark,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        icon: GMIcons.discount,
                        isOutline: true,
                        needCloseIcon: true,
                        isSelected: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        disableSelect: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        disableSelect: true,
                        shape: GMTagShape.mark,
                      ),
                    ]),
                  ),
                  // Outline-Light
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        isLight: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        isLight: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        shape: GMTagShape.mark,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        isLight: true,
                        isSelected: true,
                        shape: GMTagShape.mark,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        icon: GMIcons.discount,
                        isOutline: true,
                        isLight: true,
                        needCloseIcon: true,
                        isSelected: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        isLight: true,
                        disableSelect: true,
                      ),
                      GMSelectTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        isLight: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        disableSelect: true,
                        shape: GMTagShape.mark,
                      ),
                    ]),
                  ),
                ]);
              }),
          ExampleItem(
              desc: '展示各状态测试',
              ignoreCode: true,
              builder: (context) {
                return Wrap(spacing: 8, direction: Axis.vertical, children: [
                  // Normal
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        shape: GMTagShape.mark,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        shape: GMTagShape.round,
                        disable: true,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        disable: true,
                        shape: GMTagShape.mark,
                      ),
                    ]),
                  ),
                  // Light
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isLight: true,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isLight: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        shape: GMTagShape.mark,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        shape: GMTagShape.round,
                        isLight: true,
                        disable: true,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isLight: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        disable: true,
                        shape: GMTagShape.mark,
                      ),
                    ]),
                  ),
                  // Outline
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        shape: GMTagShape.mark,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        shape: GMTagShape.round,
                        isOutline: true,
                        disable: true,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        disable: true,
                        shape: GMTagShape.mark,
                      ),
                    ]),
                  ),
                  // Outline-Light
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Wrap(spacing: 8, runSpacing: 8, children: const [
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        isLight: true,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        isLight: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        shape: GMTagShape.mark,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        shape: GMTagShape.round,
                        isOutline: true,
                        isLight: true,
                        disable: true,
                      ),
                      GMTag(
                        'Tag',
                        theme: GMTagTheme.primary,
                        isOutline: true,
                        isLight: true,
                        icon: GMIcons.discount,
                        needCloseIcon: true,
                        disable: true,
                        shape: GMTagShape.mark,
                      ),
                    ]),
                  ),
                ]);
              }),
        ]);
  }

  @Demo(group: 'tag')
  GMTag _buildSimpleOutlineTag(BuildContext context) {
    return const GMTag(
      '标签文字',
      isOutline: true,
    );
  }

  @Demo(group: 'tag')
  GMTag _buildSimpleFillTag(BuildContext context) {
    return const GMTag('标签文字');
  }

  @Demo(group: 'tag')
  Widget _buildCircleFillTag(BuildContext context) {
    return const GMTag(
      '标签文字',
      shape: GMTagShape.round,
    );
  }

  @Demo(group: 'tag')
  Widget _buildCircleOutlineTag(BuildContext context) {
    return const GMTag(
      '标签文字',
      shape: GMTagShape.round,
      isOutline: true,
    );
  }

  @Demo(group: 'tag')
  Widget _buildMarkFillTag(BuildContext context) {
    return const GMTag(
      '标签文字',
      shape: GMTagShape.mark,
    );
  }

  @Demo(group: 'tag')
  Widget _buildMarkOutlineTag(BuildContext context) {
    return const GMTag(
      '标签文字',
      shape: GMTagShape.mark,
      isOutline: true,
    );
  }

  @Demo(group: 'tag')
  Widget _buildIconFillTag(BuildContext context) {
    return const GMTag(
      '标签文字',
      icon: GMIcons.discount,
    );
  }

  @Demo(group: 'tag')
  Widget _buildIconOutlineTag(BuildContext context) {
    return const GMTag(
      '标签文字',
      icon: GMIcons.discount,
      isOutline: true,
    );
  }

  @Demo(group: 'tag')
  Widget _buildCloseFillTag(BuildContext context) {
    return GMTag(
      '标签文字',
      needCloseIcon: true,
      onCloseTap: () {
        GMToast.showText('点击关闭', context: context);
      },
    );
  }

  @Demo(group: 'tag')
  Widget _buildCloseOutlineTag(BuildContext context) {
    return GMTag('标签文字', needCloseIcon: true, isOutline: true, onCloseTap: () {
      GMToast.showText('点击关闭', context: context);
    });
  }

  @Demo(group: 'tag')
  Widget _buildDarkSelectTags(BuildContext context) {
    return Wrap(spacing: 8, children: const [
      GMSelectTag(
        '未选中态',
        theme: GMTagTheme.primary,
      ),
      GMSelectTag(
        '已选中态',
        theme: GMTagTheme.primary,
        isSelected: true,
      ),
      GMSelectTag(
        '不可选态',
        theme: GMTagTheme.primary,
        disableSelect: true,
      ),
    ]);
  }

  @Demo(group: 'tag')
  Widget _buildLightSelectTags(BuildContext context) {
    return Wrap(spacing: 8, children: const [
      GMSelectTag(
        '未选中态',
        theme: GMTagTheme.primary,
        isLight: true,
      ),
      GMSelectTag(
        '已选中态',
        theme: GMTagTheme.primary,
        isLight: true,
        isSelected: true,
      ),
      GMSelectTag(
        '不可选态',
        theme: GMTagTheme.primary,
        isLight: true,
        disableSelect: true,
      ),
    ]);
  }

  @Demo(group: 'tag')
  Widget _buildOutlineSelectTags(BuildContext context) {
    return Wrap(spacing: 8, children: const [
      GMSelectTag(
        '未选中态',
        theme: GMTagTheme.primary,
        isOutline: true,
      ),
      GMSelectTag(
        '已选中态',
        theme: GMTagTheme.primary,
        isOutline: true,
        isSelected: true,
      ),
      GMSelectTag(
        '不可选态',
        theme: GMTagTheme.primary,
        isOutline: true,
        disableSelect: true,
      ),
    ]);
  }

  @Demo(group: 'tag')
  Widget _buildLightOutlineSelectTags(BuildContext context) {
    return Wrap(spacing: 8, children: const [
      GMSelectTag(
        '未选中态',
        theme: GMTagTheme.primary,
        isOutline: true,
        isLight: true,
      ),
      GMSelectTag(
        '已选中态',
        theme: GMTagTheme.primary,
        isOutline: true,
        isLight: true,
        isSelected: true,
      ),
      GMSelectTag(
        '不可选态',
        theme: GMTagTheme.primary,
        isOutline: true,
        isLight: true,
        disableSelect: true,
      ),
    ]);
  }

  @Demo(group: 'tag')
  Widget _buildLightShowTags(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: const [
        GMTag('默认', isLight: true),
        GMTag(
          '主要',
          isLight: true,
          theme: GMTagTheme.primary,
        ),
        GMTag(
          '警告',
          isLight: true,
          theme: GMTagTheme.warning,
        ),
        GMTag(
          '危险',
          isLight: true,
          theme: GMTagTheme.danger,
        ),
        GMTag(
          '成功',
          isLight: true,
          theme: GMTagTheme.success,
        ),
      ],
    );
  }

  @Demo(group: 'tag')
  Widget _buildDarkShowTags(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: const [
        GMTag('默认'),
        GMTag(
          '主要',
          theme: GMTagTheme.primary,
        ),
        GMTag(
          '警告',
          theme: GMTagTheme.warning,
        ),
        GMTag(
          '危险',
          theme: GMTagTheme.danger,
        ),
        GMTag(
          '成功',
          theme: GMTagTheme.success,
        ),
      ],
    );
  }

  @Demo(group: 'tag')
  Widget _buildOutlineShowTags(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: const [
        GMTag('默认', isOutline: true),
        GMTag(
          '主要',
          isOutline: true,
          theme: GMTagTheme.primary,
        ),
        GMTag(
          '警告',
          isOutline: true,
          theme: GMTagTheme.warning,
        ),
        GMTag(
          '危险',
          isOutline: true,
          theme: GMTagTheme.danger,
        ),
        GMTag(
          '成功',
          isOutline: true,
          theme: GMTagTheme.success,
        ),
      ],
    );
  }

  @Demo(group: 'tag')
  Widget _buildLightOutlineShowTags(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: const [
        GMTag('默认', isOutline: true, isLight: true),
        GMTag(
          '主要',
          isOutline: true,
          isLight: true,
          theme: GMTagTheme.primary,
        ),
        GMTag(
          '警告',
          isOutline: true,
          isLight: true,
          theme: GMTagTheme.warning,
        ),
        GMTag(
          '危险',
          isOutline: true,
          isLight: true,
          theme: GMTagTheme.danger,
        ),
        GMTag(
          '成功',
          isOutline: true,
          isLight: true,
          theme: GMTagTheme.success,
        ),
      ],
    );
  }

  @Demo(group: 'tag')
  Widget _buildAllSizeTags(BuildContext context) {
    return Wrap(spacing: 8, children: const [
      GMTag(
        '加大尺寸',
        size: GMTagSize.extraLarge,
      ),
      GMTag(
        '大尺寸',
        size: GMTagSize.large,
      ),
      GMTag(
        '中尺寸',
        size: GMTagSize.medium,
      ),
      GMTag(
        '小尺寸',
        size: GMTagSize.small,
      ),
    ]);
  }

  @Demo(group: 'tag')
  Widget _buildAllSizeCloseTags(BuildContext context) {
    return Wrap(spacing: 8, children: const [
      GMTag(
        '加大尺寸',
        needCloseIcon: true,
        size: GMTagSize.extraLarge,
      ),
      GMTag(
        '大尺寸',
        needCloseIcon: true,
        size: GMTagSize.large,
      ),
      GMTag(
        '中尺寸',
        needCloseIcon: true,
        size: GMTagSize.medium,
      ),
      GMTag(
        '小尺寸',
        needCloseIcon: true,
        size: GMTagSize.small,
      ),
    ]);
  }
}
