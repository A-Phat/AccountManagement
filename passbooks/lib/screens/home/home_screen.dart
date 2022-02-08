import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:passbooks/constants/colors.dart';
import 'package:passbooks/models/passbooks_model.dart';
import 'package:passbooks/screens/deposit/deposit_screen.dart';
import 'package:passbooks/screens/home/components/body.dart';
import 'package:passbooks/widgets/drawer_screen.dart';

import 'components/app_bar.dart';
import 'components/body_test1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late double money = 5000.00;
  late PassBooksModel passBooks;

  @override
  void initState() {
     EasyLoading.show(status: 'loading...');
     List<DepositModel> depositList = [
      new DepositModel(
        name: "ice",
        createdDate: DateTime.now(),
        amount: 5000.0,
      ), 
      new DepositModel(
        name: "nart",
        createdDate: DateTime.now(),
        amount: 5000.0,
      )
    ];
     List<ProfileModel> profileList = [
      new ProfileModel(
        name: "ice",
        totalBalance: 10000.0,
      ), 
      new ProfileModel(
        name: "nart",
        totalBalance: 10000.0,
      )
    ];
     passBooks = new PassBooksModel(
       id: 1,
       totalBalance: 20000.0,
       depositList: depositList,
       profileList: profileList
     );
    // var result = AuthenticationService.authenticate();
    // result.then((value) => {
    //       if (value.accessToken != null) {
           
    //         Navigator.pushReplacementNamed(context, "/home"),
    //         EasyLoading.dismiss(),
    //       }
    //     });

    EasyLoading.dismiss();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // _appBar(height) => PreferredSize(
    //       preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
    //       child: AppBarComponent(scaffoldKey: scaffoldKey)
    //     );
    return Scaffold(
      // key: scaffoldKey,
      // appBar: _appBar(AppBar().preferredSize.height),
      backgroundColor: MaterialColors.bgColorScreen,
      body: Body(passBooks: passBooks,),
      // drawer: const DrawerScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        tooltip: 'Deposit',
        backgroundColor: MaterialColors.drawerHeader,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(builder: (context, state) {
            return Container(
              decoration: const BoxDecoration(
                  color: MaterialColors.bgColorScreen,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Wrap(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("images/murako.png"),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Ice",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Amount to save"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                            onTap: () {
                              if (money > 5000) {
                                state(() {
                                  money -= 500;
                                 });
                              }
                            },
                            child: const CircleAvatar(
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              radius: 20,
                              backgroundColor: Colors.grey,
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("$money",style: const TextStyle(fontSize: 38, fontWeight: FontWeight.bold), ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                            onTap: () {
                              state(() {
                                money += 500;
                              });
                            },
                            child: const CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              radius: 20,
                              backgroundColor: Colors.grey,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MaterialColors.drawerHeader,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              "Save Money",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
