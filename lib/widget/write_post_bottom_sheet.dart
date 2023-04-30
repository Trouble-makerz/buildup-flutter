
import 'dart:developer';

import 'package:flutter/material.dart';

class WritePostBottomSheet extends StatelessWidget {
  const WritePostBottomSheet({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    List<String> jobType = ['기술자', '관리자', '보조자'];
    List<String> jobTypeDescription = [
      '조공 / 준기공 / 기공 / 전공 등 실제 현장 기술 담담',
      '안전 / 품질 / 공사 등 관리 담당',
      '화재감시 / 신호수 / 유도 등 보조업무 담당'
    ];

    List<String> talkType = ['자유', '매매', '건설업', '조선업'];

    var type = [];

    if (category == '구인/구직') {
      type = jobType;
    } else {
      type = talkType;
    }
    log('$type');

    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              type.length,
              (index) => ListTile(
                title: Text('${type[index]}', style: TextStyle(fontSize: 18),),
                subtitle: category != '사담' ? Text('${jobTypeDescription[index]}') : null,
                onTap: () {
                  log('${type[index]}');
                  Navigator.pop(context);
                },
              ),
            )
          ),
        ],
      ),
    );
  }
}

