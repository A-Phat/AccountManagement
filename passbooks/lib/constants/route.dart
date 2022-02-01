import 'package:flutter/material.dart';
import 'package:passbooks/screens/authen/sign_in_screen.dart';
import 'package:passbooks/screens/home/home_screen.dart';

import '../screens/authen/login_openid.dart';

Map<String, Widget Function(dynamic)> appRoute = {
    // '/': (context) => const LoginByOpenId(),
    // '/home': (context) => const HomeScreen(),
    '/': (context) => const HomeScreen(),

};
