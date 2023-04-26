
import 'package:flutter/material.dart';

class WritePostPage extends StatefulWidget {
  const WritePostPage({Key? key, required this.category}) : super(key: key);

  final String category;
  @override
  State<WritePostPage> createState() => _WritePostPageState();
}

class _WritePostPageState extends State<WritePostPage> {
  @override
  Widget build(BuildContext context) {
    List<String> wantTypeList = ['구인', '구직'];
    String? selectedWantType;

    String? selectedJobType;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(widget.category),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.category == '구인/구직' ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: DropdownButton(
                          iconSize: 26,
                          value: selectedWantType,
                          hint: Text(
                            selectedWantType == null
                              ? '구인/구직'
                              : '$selectedWantType',
                            style: TextStyle(fontSize: 24),
                          ),
                          items: wantTypeList.map((String item) {
                            return DropdownMenuItem<String>(
                              child: Text('$item'),
                              value: item,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedWantType = value;
                              print(selectedWantType);
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Text('대상', style: TextStyle(fontSize: 18),),
                          SizedBox(width: 50),
                          GestureDetector(
                            child: Row(
                              children: [
                                Text('기술자 / 관리자 / 보조자', style: TextStyle(fontSize: 18, color: Colors.grey),),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => BottomSheet()
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  )
                : Text('사담', style: TextStyle(fontSize: 24),),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: '제목을 입력하세요',
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                  ),
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                    hintText: '내용을 입력하세요',
                    hintStyle: TextStyle(fontSize: 18),
                    border: InputBorder.none,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 70),
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text('등록하기'),
                    ),
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

// bottom sheet
class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> jobType = ['기술자', '관리자', '보조자'];
    List<String> jobTypeDescription = [
      '조공 / 준기공 / 기공 / 전공 등 실제 현장 기술 담담',
      '안전 / 품질 / 공사 등 관리 담당',
      '화재감시 / 신호수 / 유도 등 보조업무 담당'
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            jobType.length,
            (index) => GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${jobType[index]}', style: TextStyle(fontSize: 18),),
                    Text('${jobTypeDescription[index]}'),
                  ],
                ),
              ),
              onTap: () {
                print('${jobType[index]}');
                Navigator.pop(context);
              },
            )
          )
        ),
      ],
    );
  }
}
