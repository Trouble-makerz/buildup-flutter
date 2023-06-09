
import 'dart:developer';

import 'package:buildup_flutter/widget/write_post_bottom_sheet.dart';
import 'package:flutter/material.dart';

class WritePostPage extends StatefulWidget {
  const WritePostPage({Key? key, required this.category, required this.typeList}) : super(key: key);

  final String category;
  final Map<String, List<String>> typeList;

  @override
  State<WritePostPage> createState() => _WritePostPageState();
}

class _WritePostPageState extends State<WritePostPage> {

  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('${widget.category} 글쓰기'),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('완료'),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12),
                      ListTile(
                        title: Text(selectedType == null ? '탭을 선택하세요' : selectedType!),
                        trailing: Icon(Icons.arrow_drop_down),
                        onTap: () async {
                          selectedType = await showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              if (widget.category == '구인' || widget.category == '구직')
                                return WritePostBottomSheet(category: '구인/구직', typeList: widget.typeList);
                              else return WritePostBottomSheet(category: '사담', typeList: widget.typeList);
                            }
                          );
                          log('selectedJobType $selectedType');
                          setState(() { });
                        },
                      )
                    ],
                  ),
                SizedBox(height: 20),
                // 입력 필드
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: '제목을 입력하세요',
                          hintStyle: TextStyle(fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                      Divider(),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '내용을 입력하세요',
                          hintStyle: TextStyle(fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
