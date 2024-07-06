import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
class BOT_NAV extends StatefulWidget {
  const BOT_NAV({super.key});

  @override
  State<BOT_NAV> createState() => _BOT_NAVState();
}

class _BOT_NAVState extends State<BOT_NAV> {
  int currentTabIndex =0;
  late List<Widget>Homes_page=[const HOME_PAGE()];
  void updateIndex(int newindex){
    setState(() {
      currentTabIndex=newindex;
    });
  }
  @override
  void initState(){
    currentTabIndex =0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Homes_page[currentTabIndex],
        bottomNavigationBar:CurvedNavigationBar(
        height: 60,
        animationDuration: Duration(milliseconds: 500),
          items: [Icon(Icons.home)],
          onTap: (index){
            updateIndex(index);

          },
          backgroundColor: Colors.lightBlue,



        )


    );
  }
}
