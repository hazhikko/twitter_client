import 'package:flutter/material.dart';

import 'routes/home_route.dart';
import 'routes/search_route.dart';
import 'routes/notice_route.dart';
import 'routes/message_route.dart';

class RootWidget extends StatefulWidget {
  @override
  _RootWidget createState() => _RootWidget();
}

class _RootWidget extends State<RootWidget> {
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  // アイコン情報
  final Map _rootWidgetIcons = {
    'ホーム' : {'icon': Icons.home, 'route': Home()},
    '検索' : {'icon': Icons.search, 'route': Search()},
    '通知' : {'icon': Icons.notifications, 'route': Notice()},
    'メッセージ' : {'icon': Icons.mail, 'route': Message()},
  };

  // アイコン順番
  final List _footerItemOrder = [
    'ホーム',
    '検索',
    '通知',
    'メッセージ',
  ];

  @override
  void initState() {
    super.initState();
    for ( var i = 0; i < _footerItemOrder.length; i++) {
      _bottomNavigationBarItems.add(_createIcon(_footerItemOrder[i]));
    }
  }

  // アイコンを作成する
  BottomNavigationBarItem _createIcon(String key) {
    return BottomNavigationBarItem(
      icon: Icon(_rootWidgetIcons[key]['icon']),
      title: Text(key),
    );
  }

  void _onItemTapped(int index) {
    setState( () {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : _rootWidgetIcons[_footerItemOrder.asMap()[_selectedIndex]]['route'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.black45,
      ),
    );
  }
}