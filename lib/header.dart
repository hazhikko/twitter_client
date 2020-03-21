import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: UserIcon(),
      ),
      title: Center(
        child: Text('ホーム'),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class UserIcon extends StatefulWidget {
  @override
  _UserIcon createState() => _UserIcon();
}

class _UserIcon extends State{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('images/user_icon.jpg'),
          radius: 60.0,
        ),
        RawMaterialButton(
          child: Container(
            width: 120.0,
            height: 120.0,
          ),
          shape: CircleBorder(),
          elevation: 0.0,
          onPressed: () {},
        ),
      ],
    );
  }
}