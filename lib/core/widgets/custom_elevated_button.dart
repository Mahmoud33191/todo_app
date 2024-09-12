import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, required this.onPressed, this.color});
  final String text;
  final VoidCallback onPressed ;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
        backgroundColor: WidgetStateProperty.all(color),
      ),
      child:Text(
        text,
      ),
    );
  }
}
