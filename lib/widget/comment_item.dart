
import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('작성자', style: TextStyle(fontSize: 16),),
            SizedBox(height: 8,),
            Text('내용'),
            SizedBox(height: 6,),
            Text('시간', style: TextStyle(fontSize: 12),)
          ],
        ),
      ),
    );
  }
}
