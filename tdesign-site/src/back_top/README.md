---
title: BackTop 返回顶部
description: 用于当页面过长往下滑动时，帮助用户快速回到页面顶部。
spline: base
isComponent: true
---

<span class="coverages-badge" style="margin-right: 10px"><img src="https://img.shields.io/badge/coverages%3A%20lines-100%25-blue" /></span><span class="coverages-badge" style="margin-right: 10px"><img src="https://img.shields.io/badge/coverages%3A%20functions-100%25-blue" /></span><span class="coverages-badge" style="margin-right: 10px"><img src="https://img.shields.io/badge/coverages%3A%20statements-100%25-blue" /></span><span class="coverages-badge" style="margin-right: 10px"><img src="https://img.shields.io/badge/coverages%3A%20branches-83%25-blue" /></span>
## 引入

在gmdesign_flutter/gmdesign_flutter.dart中有所有组件的路径。

```dart
import 'package:gmdesign_flutter/gmdesign_flutter.dart';
```

## 代码演示

### 1 组件类型

圆形返回顶部
            
<td-code-block panel="Dart">

  <pre slot="Dart" lang="javascript">
  Widget _buildCircleBackTop(BuildContext context) {
    return getCustomButton(context, '圆形返回顶部', () {
      setState(() {
        showBackTop = true;
        if (controller.hasClients) {
          controller.jumpTo(500);
        }
        style = TDBackTopStyle.circle;
      });
    });
  }</pre>

</td-code-block>
                                  

半圆形返回顶部
            
<td-code-block panel="Dart">

  <pre slot="Dart" lang="javascript">
  Widget _buildHalfCircleBackTop(BuildContext context) {
    return Column(
      children: [
        getCustomButton(context, '半圆形返回顶部', () {
          setState(() {
            showBackTop = true;
            if (controller.hasClients) {
              controller.jumpTo(500);
            }
            style = TDBackTopStyle.halfCircle;
          });
        }),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
          child: Wrap(
            spacing: 16,
            runSpacing: 24,
            children: [
              getDemoBox(context),
              getDemoBox(context),
              getDemoBox(context),
              getDemoBox(context),
              getDemoBox(context),
              getDemoBox(context),
            ],
          ),
        )
      ],
    );
  }</pre>

</td-code-block>
                                  


## API
### TDBadge
#### 默认构造方法

| 参数 | 类型 | 默认值 | 说明 |
| --- | --- | --- | --- |
| controller | ScrollController? | - | 页面滚动的控制器 |
| theme | TDBackTopTheme | TDBackTopTheme.light | 主题 |
| style | TDBackTopStyle | TDBackTopStyle.circle | 样式，圆形和半圆 |
| showText | bool | false | 是否展示文字 |
| onClick | VoidCallback? | - | 按钮点击事件 |

#### 工厂构造方法

| 名称  | 说明 |
| --- |  --- |
| TDBackTopTheme.light | 明亮主题 |
| TDBackTopTheme.dark  | 暗黑主题 |
| TDBackTopStyle.circle  | 圆形 |
| TDBackTopStyle.halfCircle  | 半圆形 |

  