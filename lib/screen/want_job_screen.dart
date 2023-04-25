
import 'package:buildup_flutter/widget/post_item.dart';
import 'package:flutter/material.dart';

class WantJobScreen extends StatelessWidget {
  const WantJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return PostItem();
        }
      ),
    );
  }
}
