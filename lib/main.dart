import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:two_page_draft/pages/landing_page.dart';
import 'pages/Info_page.dart';
import 'NavItem.dart';
void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {

  int pageTracker=0;
  List<NavItem> navitem = <NavItem>[
    NavItem(color: Colors.white, backgroundColor: Colors.amber,buttonBackgroundColor: Colors.amberAccent),
    NavItem(color: Colors.blueGrey,backgroundColor: Color.fromARGB(0, 96, 96, 96),buttonBackgroundColor: Colors.grey),
  ];

  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  _onPageViewChange(int change){
    print("Current Page $change");
    setState(() {
    pageTracker=change;  
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          physics: BouncingScrollPhysics(),
          //TODO make this ^scrollable
          controller: _pageController,
          onPageChanged: _onPageViewChange,
          children: <Widget>[
            LandingPage(),
            InformationPage(),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 200),
            animationCurve: Curves.bounceInOut,
            backgroundColor: navitem[pageTracker].backgroundColor,
            buttonBackgroundColor: navitem[pageTracker].buttonBackgroundColor,
            index : pageTracker,
            color: navitem[pageTracker].color,
            height: 45,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 40,
              ),
              Icon(Icons.business, size: 40),
            ],
            onTap: (index) {
              if (index == 1) {
                _pageController.animateToPage(1,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.decelerate);
              }
              if (index == 0) {
                _pageController.animateToPage(0,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.decelerate);
              }
              debugPrint("Current index $index");
            }),
      ),
    );
  }
}
