
import 'package:flutter/material.dart';

import '../widget/comment_item.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('(구인/구직/사담)', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('제목', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('작성자 ㆍ 00:00'),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.remove_red_eye),
                      ),
                      Text('22'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite),
                      ),
                      Text('22'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.comment),
                      ),
                      Text('22'),
                    ],
                  ),
                  Divider(),
                ]
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('내용\n내용\n내용\n내용'),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text('신고하기')
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text('댓글'),
                ),
                Divider(),
              ],
            ),
          ),
          Column(
            children: List.generate(5, (index) => CommentItem()),
          )
        ],
      ),
    );
  }
}

