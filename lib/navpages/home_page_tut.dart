import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/app_large_text.dart';

class HomePageTut extends StatefulWidget {
  const HomePageTut({Key? key}) : super(key: key);

  @override
  _HomePageTutState createState() => _HomePageTutState();
}

class _HomePageTutState extends State<HomePageTut> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:  EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children:  [
                Icon(Icons.menu, size: 30, color: Colors.black,),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)

                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Dsv", color: Colors.black87,),
          ),
          SizedBox(height: 40,),
          Container(

            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black.withOpacity(.5),
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Enspiration",),
                  Tab(text: "Emotions",),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 300,
            width: double.maxFinite,
            child:  TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                    itemCount:3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                  return  Container(
                    margin: EdgeInsets.only(right: 15, top: 10),
                    width: 200,
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                                "./img/another.jpg"
                            )
                        )
                    ),
                  );
                }),

                Text("hi"),
                Text("good")
              ],
            ),
          )


        ],
      ),
    );
  }
}
