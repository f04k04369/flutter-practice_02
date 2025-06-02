import 'package:flutter/material.dart';

class LemonDialog extends StatelessWidget {
  const LemonDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('れもん'),
      content: Text('唐揚げにかけてもいいですか？'),
      actions: [
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'A'),
          }, 
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.pop(context, 'B'),
          },
          child: Text('OK') 
        ),
      ],
    );
  }
}