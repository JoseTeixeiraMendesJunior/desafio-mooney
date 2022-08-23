import 'package:flutter/material.dart';

import 'global_color.dart';

class ButtonFull extends StatelessWidget {
  const ButtonFull({
    Key? key,
    required this.text,
    required this.function,
  }) : super(key: key);

  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              primary: GlobalColor.active,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: function,
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
