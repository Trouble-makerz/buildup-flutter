
import 'dart:developer';

import 'package:flutter/material.dart';

class WritePostBottomSheet extends StatelessWidget {
  const WritePostBottomSheet({Key? key, required this.category, required this.typeList}) : super(key: key);

  final String category;
  final Map<String, List<String>> typeList;

  @override
  Widget build(BuildContext context) {
    List<String> jobTypeDescription = [
      '조공 / 준기공 / 기공 / 전공 등 실제 현장 기술 담담',
      '안전 / 품질 / 공사 등 관리 담당',
      '화재감시 / 신호수 / 유도 등 보조업무 담당'
    ];

    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              typeList[category]!.length,
              (index) => ListTile(
                title: Text('${typeList[category]![index]}', style: TextStyle(fontSize: 18),),
                subtitle: category != '사담' ? Text('${jobTypeDescription[index]}') : null,
                onTap: () {
                  log('${typeList[category]![index]}');
                  Navigator.pop(context, typeList[category]![index]);
                },
              ),
            )
          ),
        ],
      ),
    );
  }
}

