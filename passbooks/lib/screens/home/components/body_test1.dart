import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:passbooks/constants/colors.dart';

class BodyComponent extends StatefulWidget {
  const BodyComponent({Key? key}) : super(key: key);

  @override
  _BodyComponentState createState() => _BodyComponentState();
}

class _BodyComponentState extends State<BodyComponent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height,
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                DefaultTabController(
                    initialIndex: 1,
                    length: 2,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(color: MaterialColors.drawerHeader))

                                  
                                      ),
                              child: const TabBar(
                                  indicatorColor: MaterialColors.active,
                                  padding: EdgeInsets.only(
                                      top: 3, left: 10, right: 10),
                                  tabs: [
                                    Tab(
                                      icon: FaIcon(
                                        FontAwesomeIcons.smile,
                                        color: MaterialColors.appBar,
                                        size: 35,
                                      ),
                                      
                                    ),
                                    Tab(
                                      icon: FaIcon(
                                        FontAwesomeIcons.slideshare,
                                        color: MaterialColors.appBar,
                                        size: 35,
                                      ),
                                      
                                    ),
                                  ]))
                           ,Container(
                              //Add this to give height
                              height: MediaQuery.of(context).size.height,
                              child: TabBarView(children: [
                                view(1),
                                view(2)

                              ]))
                        ]))
              ],
            ),
          )
        ]));
  }

  Widget view(int tabIndex) {
    return  ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return Card(
           shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
          child: const ListTile(
            leading: FaIcon(
              FontAwesomeIcons.handHoldingUsd,
              color: MaterialColors.drawerHeader,
              size: 35,
              ),
            minLeadingWidth: 70.0,
            title: Text('5,000฿', style: TextStyle(),),
            subtitle: Text('04-12-2021 17:00'),
            // trailing: Icon(Icons.more_vert),
            selectedTileColor: MaterialColors.monday,
          ),
        );
      },
      padding: EdgeInsets.only(top: 15, left: 10, right: 10),
    );
  }
 

}
