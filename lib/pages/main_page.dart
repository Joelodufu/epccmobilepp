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
  List <Widget> pages = [
    HomePage(),
    BibbleStudyPage(),
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
       var requiredAspect =MediaQuery.of(context).textScaleFactor > MediaQuery.of(context).textScaleFactor? 1: MediaQuery.of(context).textScaleFactor;
        
        var requiredPadding =MediaQuery.of(context).padding.top ;
        var requiredWidth =MediaQuery.of(context).size.width -requiredPadding;
        var requiredHeight =MediaQuery.of(context).size.height > MediaQuery.of(context).size.height? 1: MediaQuery.of(context).size.height/548;


    return Scaffold(
      body:IndexedStack(
        index:currentIndex,
        children:pages
      ),
      bottomNavigationBar: SafeArea(
        bottom:true,
        child:BottomNavigationBar(
          iconSize:requiredWidth/10,
        unselectedFontSize:requiredAspect* 2,
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
            BottomNavigationBarItem(  icon: Icon(Icons.my_library_books_outlined), label: "Bible Study", tooltip: "Bible Stydy "),
            BottomNavigationBarItem(  icon: Icon(Icons.dynamic_form_outlined), label: "Bible", tooltip: "Msg ")
          ],
      )
      ),
    );
  }
}
