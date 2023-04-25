
import 'package:flutter/material.dart';

import '../widget/post_item.dart';

class FreeTalkScreen extends StatelessWidget {
  const FreeTalkScreen({Key? key}) : super(key: key);

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
