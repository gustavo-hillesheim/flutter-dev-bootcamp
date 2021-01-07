import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

typedef ValueListenableWidgetBuilder<T> = Widget Function(
    BuildContext context, T value);

extension ValueListenableExtension<T> on ValueListenable<T> {
  ValueListenableBuilder<T> builder(ValueListenableWidgetBuilder<T> builder) {
    return ValueListenableBuilder(
      valueListenable: this,
      builder: (context, value, _) => builder(context, value),
    );
  }
}