
import 'dart:developer';

import 'package:buildup_flutter/widget/post_item.dart';
import 'package:flutter/material.dart';

class WantJobScreen extends StatefulWidget {
  const WantJobScreen({Key? key, required this.tabList}) : super(key: key);

  final List<String> tabList;

  @override
  State<WantJobScreen> createState() => _WantJobScreenState();
}

class _WantJobScreenState extends State<WantJobScreen> {
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
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PostItem();
                }
            ),
          ),
        ],
      ),
    );
  }
}
