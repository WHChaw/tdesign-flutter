import 'package:flutter/material.dart';

import '../theme/resource_delegate.dart';

/// Context的扩展,方便使用
extension ContextExtension on BuildContext {
  GMResourceDelegate get resource => GMResourceManager.instance.delegate(this);
}