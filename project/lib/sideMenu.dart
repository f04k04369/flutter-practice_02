import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          child: Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text('ドロワーヘッダー'),
          ),
        ),
        ListTile(
          title: Text('リストタイルA'),
          onTap: () {
            debugPrint('リストタイルAをタップしました');
          },
        ),

        ListTile(
          title: Text('リストタイルB'),
          onTap: () {
            debugPrint('リストタイルBをタップしました');
          },
        ),


        ListTile(
          title: Text('リストタイルC'),
          onTap: () {
            debugPrint('リストタイルCをタップしました');
          },
        ),
      ],


    );

  }
}

