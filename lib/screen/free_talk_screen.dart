
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widget/post_item.dart';

class FreeTalkScreen extends StatefulWidget {
  const FreeTalkScreen({Key? key, required this.tabList}) : super(key: key);

  final List<String> tabList;

  @override
  State<FreeTalkScreen> createState() => _FreeTalkScreenState();
}

class _FreeTalkScreenState extends State<FreeTalkScreen> {

  RefreshController refreshController = RefreshController(initialRefresh: false);

  // 새로고침
  void onRefresh() async {
    setState(() {});
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    log('${widget.tabList}');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: PageView.builder(
        itemCount: widget.tabList.length,
        itemBuilder: (BuildContext context, int index) {
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
        },
      ),
    );
  }
}
