
import 'package:buildup_flutter/widget/post_item.dart';
import 'package:flutter/material.dart';

class WantPeopleScreen extends StatefulWidget {
  const WantPeopleScreen({Key? key}) : super(key: key);

  @override
  State<WantPeopleScreen> createState() => _WantPeopleScreenState();
}

class _WantPeopleScreenState extends State<WantPeopleScreen> {
  List<String> tabList = ['기술자', '관리자', '보조자'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [

              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return PostItem();
                  }
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
