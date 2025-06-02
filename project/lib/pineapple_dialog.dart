import 'package:flutter/material.dart';
import 'package:project/pineapple_dialog.dart';

class PineappleDialog extends StatelessWidget {
  const PineappleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('パイナップル'),
      content: const Text('ピザに乗せてもいいですか?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'A');
          }, 
          child: const Text('キャンセル')
        ),   
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'B');
          } ,
          child: const Text('OK'),
        )   
      ],
    );
  }
}