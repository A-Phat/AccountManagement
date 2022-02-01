import 'package:flutter/material.dart';
import 'package:passbooks/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/authentication.service.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
        child: Stack(
      children: [
        if (MediaQuery.of(context).viewInsets.bottom == 0)
          Positioned(
            bottom: 20,
            child: Container(
              width: size.width,
              alignment: Alignment.center,
              child: const Text(
                'Application Version: 1.0.0',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 8,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MaterialColors.signStartGradient,
                    MaterialColors.signEndGradient,
                  ],
                  stops: [0.3, 0.8],
                  begin: FractionalOffset.topRight,
                  end: FractionalOffset.bottomLeft,
                ),
              ),
              child: Text(
                'Accounts',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
              onTap: () async {
                await logout();
              },
            ),
          ],
        )
      ],
    ));
  }

  Future<void> logout() async {
    var auth = await AuthenticationService.getAuthData('auth');
    var logoutUrl = auth!.logoutUrl;
    if (await canLaunch(logoutUrl)) {
      await launch(logoutUrl, forceWebView: true);
    } else {
      throw 'Could not launch $logoutUrl';
    }
    await Future.delayed(Duration(seconds: 2));
    closeWebView();
    AuthenticationService.clearAuthData();
    Navigator.pushNamed(context, '/');
  }
}
