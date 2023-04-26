
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
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            }, icon: Icon(Icons.notifications_outlined)),
          ],
        ),
        drawer: Drawer(),
        body: screens[_selectedIdx],
        floatingActionButton: floatingButtons(context),
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

Widget? floatingButtons(context) {
  return SpeedDial(
    icon: Icons.add,
    visible: true,
    curve: Curves.bounceIn,
    children: [
      SpeedDialChild(
        child: Icon(Icons.search),
        label: '구인/구직',
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WritePostPage(category: '구인/구직')),
          );
        },
      ),
      SpeedDialChild(
        child: Icon(Icons.chat),
        label: '사담',
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WritePostPage(category: '사담')),
          );
        },
      ),
    ],
  );
}
