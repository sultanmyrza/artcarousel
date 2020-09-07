import 'package:flutter/material.dart';
import 'package:artcarousel/data/repository/art_repository.dart';
import 'package:artcarousel/ui/pages/first_tab_page.dart';
import 'package:artcarousel/ui/pages/second_tab_page.dart';
import 'package:artcarousel/ui/pages/third_tab_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter UI challenge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _tabCurrentIndex = 1;
  TabController _tabBarController;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(vsync: this, length: 3);
    _tabBarController.animateTo(
      _tabCurrentIndex,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _tabBarController,
        children: [
          FirstTabPage(),
          SecondTabPage(),
          ThirdTabPage(),
        ],
        //  physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabCurrentIndex,
        onTap: _onTapBottomNavBarItem,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            title: Text('Tab 1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Tab 2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Tab 3'),
          ),
        ],
      ),
    );
  }

  void _onTapBottomNavBarItem(int selectedIndex) {
    _tabBarController.animateTo(selectedIndex);
    setState(() => _tabCurrentIndex = selectedIndex);
  }
}
