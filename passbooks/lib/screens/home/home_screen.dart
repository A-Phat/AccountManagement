import 'package:flutter/material.dart';
import 'package:passbooks/constants/colors.dart';
import 'package:passbooks/widgets/drawer_screen.dart';

import 'components/app_bar.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _appBar(height) => PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
          child: AppBarComponent(scaffoldKey: scaffoldKey)
        );
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(AppBar().preferredSize.height),
      body: BodyComponent(),
      drawer: const DrawerScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Deposit',
        backgroundColor: MaterialColors.drawerHeader,
        child: const Icon(Icons.add),
      ),
    );
  }
}
