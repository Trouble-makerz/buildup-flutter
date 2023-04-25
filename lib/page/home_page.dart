
import 'package:flutter/material.dart';

import '../screen/event_screen.dart';
import '../screen/free_talk_screen.dart';
import '../screen/setting_screen.dart';
import '../screen/want_job_screen.dart';
import '../screen/want_people_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIdx = 0;

  List<Widget> screens = [
    WantPeopleScreen(),
    WantJobScreen(),
    FreeTalkScreen(),
    EventScreen(),
    SettingScreen(),
  ];

  onItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          title: Text('BUILDUP', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_outlined),
            ),
          ],
        ),
        drawer: Drawer(),
        body: screens[_selectedIdx],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
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
              BottomNavigationBarItem(icon: Icon(Icons.person_search_outlined), label: '구인'),
              BottomNavigationBarItem(icon: Icon(Icons.content_paste_search_outlined), label: '구직'),
              BottomNavigationBarItem(icon: Icon(Icons.forum_outlined), label: '사담'),
              BottomNavigationBarItem(icon: Icon(Icons.celebration_outlined), label: '이벤트'),
              BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: '설정'),
            ],
            onTap: onItemTapped,
          ),
        ),
      ),
    );
  }
}

