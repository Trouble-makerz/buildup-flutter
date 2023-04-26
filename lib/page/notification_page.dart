
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('알림', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
