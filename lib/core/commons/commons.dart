import 'package:flutter/material.dart';

void navigateScreen({required BuildContext context, required Widget screen}) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => screen,
    ),
  );
}


void navigatePushScreen({required BuildContext context, required Widget screen}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => screen,
    ),
  );
}
