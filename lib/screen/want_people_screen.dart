
import 'dart:developer';

import 'package:buildup_flutter/widget/post_item.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WantPeopleScreen extends StatefulWidget {
  const WantPeopleScreen({Key? key, required this.tabList}) : super(key: key);

  final List<String> tabList;

  @override
  State<WantPeopleScreen> createState() => _WantPeopleScreenState();
}

class _WantPeopleScreenState extends State<WantPeopleScreen> {

  RefreshController refreshController = RefreshController(initialRefresh: false);

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
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.tabList.length,
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text(widget.tabList[index]),
                );
              },
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
