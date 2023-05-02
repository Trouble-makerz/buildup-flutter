import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../screen/event_screen.dart';
import '../screen/free_talk_screen.dart';
import '../screen/setting_screen.dart';
import '../screen/want_job_screen.dart';
import '../screen/want_people_screen.dart';
import 'notification_page.dart';
import 'write_post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIdx = 0;
  Map<String, List<String>> typeList = {
    '구인/구직': ['기술자', '관리자', '보조자'],
    '사담': ['자유', '매매', '건설업', '조선업'],
  };

  onItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      WantPeopleScreen(tabList: typeList['구인/구직']!),
      WantJobScreen(tabList: typeList['구인/구직']!),
      FreeTalkScreen(tabList: typeList['사담']!),
      EventScreen(),
      SettingScreen(),
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Text(
            'BUILDUP',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()),
                  );
                },
                icon: Icon(Icons.notifications_outlined)),
          ],
        ),
        drawer: Container(
          width: 150,
          child: Drawer(),
        ),
        body: screens[_selectedIdx],
        floatingActionButton: floatingButtons(context, typeList),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIdx,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_search_outlined), label: '구인'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.content_paste_search_outlined), label: '구직'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.forum_outlined), label: '사담'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.celebration_outlined), label: '이벤트'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: '내정보'),
            ],
            onTap: onItemTapped,
          ),
        ),
      ),
    );
  }
}

Widget? floatingButtons(context, typeList) {
  return SpeedDial(
    overlayOpacity: 0.1,
    overlayColor: Colors.black12.withOpacity(0.1),
    icon: Icons.add,
    visible: true,
    curve: Curves.bounceIn,
    children: [
      SpeedDialChild(
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.person_search_outlined, color: Colors.white),
        labelWidget: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child:
              Text('구인', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WritePostPage(category: '구인', typeList: typeList)),
          );
        },
      ),
      SpeedDialChild(
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.content_paste_search_outlined, color: Colors.white),
        labelWidget: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child:
              Text('구직', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WritePostPage(category: '구직', typeList: typeList)),
          );
        },
      ),
      SpeedDialChild(
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.forum_outlined, color: Colors.white),
        labelWidget: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child:
              Text('사담', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WritePostPage(category: '사담', typeList: typeList)),
          );
        },
      ),
    ],
  );
}
