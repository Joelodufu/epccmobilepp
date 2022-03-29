import 'package:flutter/material.dart';
import 'package:flutter_app/misc/colors.dart';
import 'package:flutter_app/navpages/bar_items_page.dart';
import 'package:flutter_app/navpages/bibble_study_page.dart';
import 'package:flutter_app/navpages/home_page.dart';
import 'package:flutter_app/navpages/home_page_tut.dart';
import 'package:flutter_app/navpages/messages_page.dart';
import 'package:flutter_app/navpages/search_page.dart';
import 'package:flutter_app/navpages/sunday_school_page.dart';
import 'package:flutter_app/navpages/test_drop_down.dart';
import 'package:flutter_app/pages/bible_study_page.dart';
import 'package:flutter_app/pages/detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BibbleStudyPage(),
    SundaySchool(),
    MessagePage(),
    BarItemsPage()
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex =index;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 2,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          elevation: 2,
          items: const [
            BottomNavigationBarItem(  icon: Icon(Icons.home_outlined), label: "Home", tooltip: "Home "),
            BottomNavigationBarItem(  icon: Icon(Icons.my_library_books_outlined), label: "BS", tooltip: "Bible Stydy "),
            BottomNavigationBarItem(  icon: Icon(Icons.school_outlined), label: "SS", tooltip: "sunday school"),
            BottomNavigationBarItem(  icon: Icon(Icons.dynamic_form_outlined), label: "MSG", tooltip: "Msg ")
          ],
      ),
    );
  }
}
