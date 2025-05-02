import 'package:flutter/material.dart';

/// This extension adds two getters to the `double` class to easily create `SizedBox`
/// widgets with either a vertical or horizontal dimension equal to the value of the `double`.
extension XDouble on num {
  /// Returns a `SizedBox` widget with a height equal to the value of the `double`.
  Widget get vertical {
    return SizedBox(height: toDouble());
  }

  /// Returns a `SizedBox` widget with a width equal to the value of the `double`.
  Widget get horizontal {
    return SizedBox(width: toDouble());
  }
}

/// An extension on [BuildContext] that adds a method to show a [SnackBar] widget.
// extension BuildContextSnackBarExtension on BuildContext {
//   /// Shows a [SnackBar] widget with the given [message] and [duration].
//   ///
//   /// The default value for [duration] is 2 seconds.
//   void showSnackBar({
//     required String message,
//     Duration duration = const Duration(seconds: 2),
//   }) {
//     ScaffoldMessenger.of(this).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           style: textTheme.titleSmall,
//         ),
//         backgroundColor: colors.secondary,
//         duration: duration,
//       ),
//     );
//   }
// }

extension ContextExtension on BuildContext {
  void unFocusKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

extension FunctionExtension<T> on T {
  Function get function => () {};
}
