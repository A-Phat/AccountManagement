import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:passbooks/constants/colors.dart';
import 'package:passbooks/models/passbooks_model.dart';
import 'package:passbooks/screens/home/components/pofile.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.passBooks}) : super(key: key);
  final PassBooksModel passBooks;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
final oCcy = new NumberFormat("#,##0.00", "en_US");
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: 240,
              decoration: const BoxDecoration(
                  color: MaterialColors.drawerHeader,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(60),bottomLeft: Radius.circular(40),)
              ),
            ),
            SafeArea(
              child: ListView(
                children: <Widget>[

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "\nTotal Balance\n", style: TextStyle(color: MaterialColors.bgColorScreen.withOpacity(0.5), fontSize: 18)),
                            TextSpan(text: "\฿ ", style: TextStyle(color: MaterialColors.bgColorScreen.withOpacity(0.5), fontSize: 30)),
                            TextSpan(text: "${oCcy.format(widget.passBooks.totalBalance)} \n", style: TextStyle(color: MaterialColors.bgColorScreen, fontSize: 36)),
                          ]
                        )),
                      ),
                      IconButton(icon: FaIcon(
                                        FontAwesomeIcons.landmark,
                                        color: MaterialColors.appBar,
                                        size: 35,
                                      ), onPressed: (){})
                    ],
                  ),

                  SizedBox(height: 2,),
                  Container(
                    height: 160,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Profile(name: "XXXX XXXX", image: "murako.png", balance: "18000฿",),
                        Profile(name:  "XXXX XXXX", image: "murako.png", balance: "15000฿",),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  // Row(
                  //   children: <Widget>[
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text("Send money"),
                  //     ),
                  //   ],
                  // ),

                  // Container(
                  //   height: 50,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       Padding(
                  //         padding: const EdgeInsets.all(2.0),
                  //         child: CircleAvatar(child: Icon(Icons.add), radius: 25,),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(2.0),
                  //         child: CircleAvatar(backgroundImage: AssetImage("images/murako.png"),),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(2.0),
                  //         child: CircleAvatar(backgroundImage: AssetImage("images/murako.png"),),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(2.0),
                  //         child: CircleAvatar(backgroundImage: AssetImage("images/murako.png"),),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Recent transactions"),
                      ),
                    ],
                  ),
                  
                  ListTile(
                    onTap: (){
                      
                    },
                    leading: CircleAvatar(backgroundImage: AssetImage("images/murako.png"),),
                    title: RichText(text: TextSpan(children: [
                      TextSpan(text: 'Ice\n'),
                        TextSpan(text: 'Money Saved - Today 9AM', style: TextStyle(fontSize: 14, color: MaterialColors.caption))
                      ], style: TextStyle(color: Colors.black, fontSize: 18))),
                    trailing: Text("+ \$430", style: TextStyle(fontSize: 20),),
                  ),

                  ListTile(
                    onTap: (){
                      // _settingModalBottomSheet(context);
                    },
                    leading: CircleAvatar(backgroundImage: AssetImage("images/murako.png"),),
                    title: RichText(text: TextSpan(children: [
                      TextSpan(text: 'Nart\n'),
                      TextSpan(text: 'Money Saved - Today 12PM', style: TextStyle(fontSize: 14, color: MaterialColors.caption))
                    ], style: TextStyle(color: Colors.black, fontSize: 18))),
                    trailing: Text("+ \$220", style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }


}
