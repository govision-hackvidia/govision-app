import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Future<T?> pushTransition<T>(
  BuildContext context,
  Widget page, {
  bool rootNavigator = false,
}) {
  return Navigator.of(
    context,
    rootNavigator: rootNavigator,
  ).push<T>(
    PageTransition(
      child: page,
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds: 100),
    ),
  );
}

Future<T?> pushReplacementTransition<T>(
  BuildContext context,
  Widget page, {
  bool rootNavigator = false,
}) {
  return Navigator.of(
    context,
    rootNavigator: rootNavigator,
  ).pushReplacement<T, T>(
    PageTransition<T>(
      child: page,
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds: 100),
    ),
  );
}

Future<T?> pushAndRemoveUntilTransition<T>(
  BuildContext context,
  Widget page, {
  bool rootNavigator = false,
}) {
  return Navigator.of(
    context,
    rootNavigator: rootNavigator,
  ).pushAndRemoveUntil<T>(
    PageTransition<T>(
      child: page,
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds: 100),
    ),
    (route) => false,
  );
}
