import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../models/authen_model.dart';
import '../../services/authentication.service.dart';

class LoginByOpenId extends StatefulWidget {
  const LoginByOpenId({Key? key}) : super(key: key);

  @override
  _LoginByOpenIdState createState() => _LoginByOpenIdState();
}

class _LoginByOpenIdState extends State<LoginByOpenId> {
  @override
  void initState() {
     EasyLoading.show(status: 'loading...');
    var result = AuthenticationService.authenticate();
    result.then((value) => {
          if (value.accessToken != null) {
           
            Navigator.pushReplacementNamed(context, "/home"),
            EasyLoading.dismiss(),
          }
        });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}
