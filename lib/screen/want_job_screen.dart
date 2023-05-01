
import 'dart:developer';

import 'package:buildup_flutter/widget/post_item.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WantJobScreen extends StatefulWidget {
  const WantJobScreen({Key? key, required this.tabList}) : super(key: key);

  final List<String> tabList;

  @override
  State<WantJobScreen> createState() => _WantJobScreenState();
}

class _WantJobScreenState extends State<WantJobScreen> {

  RefreshController refreshController = RefreshController(initialRefresh: false);
  int _selectedTabIndex = 0; // 선택된 탭 인덱스


  // 새로고침
  void onRefresh() async {
    setState(() {});
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.tabList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: _selectedTabIndex == index ? Colors.white : Colors.black,
                        backgroundColor: _selectedTabIndex == index ? Colors.blue : Colors.white,
                        textStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _selectedTabIndex = index; // 탭 인덱스 업데이트
                        });
                      },
                      child: Text(index == 0 ? '전체' : widget.tabList[index-1]),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              onRefresh: onRefresh,
              header: WaterDropHeader(),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PostItem();
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
