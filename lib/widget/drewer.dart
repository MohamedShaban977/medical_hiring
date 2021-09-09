import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class DrawerView extends StatefulWidget {
  final List<Widget> screens;
  DrawerView({this.screens});

  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  Widget currentScreen;
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return buildDrawer2(context);
  }

  Widget buttonItem(
      {@required IconData iconData,
      @required String text,
      @required Function onTap}) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: kMainColor,
            size: 30,
          ),
          SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: kMainColor,
              // letterSpacing: 1.2,
            ),
          )
        ],
      ),
    );
  }

  Drawer buildDrawer2(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
              ),
              SizedBox(width: 10),
              Text(
                'Amr Eltohamy',
                style: TextStyle(
                    fontSize: 20,
                    color: kMainColor,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          SizedBox(height: 20),
          Divider(
            height: 10,
            endIndent: 20,
            indent: 20,
            color: Colors.black54,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              children: [
                buttonItem(
                    onTap: () {
                      setState(() {
                        currentScreen = widget.screens[0];
                        currentTab = 0;
                      });

                      print(widget.screens[0].toString());
                      Navigator.pop(context);
                    },
                    text: 'Home',
                    iconData: Icons.home),
                SizedBox(height: 10),
                buttonItem(
                  onTap: () {
                    setState(() {
                      currentScreen = widget.screens[3];
                      currentTab = 3;
                    });

                    print(widget.screens[3].toString());
                    Navigator.pop(context);
                  },
                  text: 'My jobs',
                  iconData: Icons.shopping_bag_rounded,
                ),
                SizedBox(height: 10),
                buttonItem(
                  onTap: () {
                    setState(() {
                      currentScreen = widget.screens[2];
                      currentTab = 2;
                    });

                    print('adf');
                    Navigator.pop(context);
                  },
                  text: 'Messages',
                  iconData: Icons.markunread,
                ),
                SizedBox(height: 10),
                buttonItem(
                  onTap: () {
                    setState(() {
                      currentScreen = widget.screens[1];
                      currentTab = 1;
                    });

                    print('adf');
                    Navigator.pop(context);
                  },
                  text: 'Notification',
                  iconData: Icons.notifications,
                ),
                SizedBox(height: 10),
                buttonItem(
                  text: 'Saved',
                  iconData: Icons.bookmark,
                ),
                SizedBox(height: 10),
                buttonItem(
                  onTap: () {},
                  text: 'Settings',
                  iconData: Icons.settings,
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(
            height: 10,
            endIndent: 20,
            indent: 20,
            color: Colors.black54,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black38,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(FontAwesomeIcons.facebookF),
                  ),
                ),
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black38,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(FontAwesomeIcons.twitter),
                  ),
                ),
                CircleAvatar(
                  radius: 27,
                  backgroundColor: Colors.black38,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      color: Color.lerp(Colors.yellow, Colors.red, 0.9),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
