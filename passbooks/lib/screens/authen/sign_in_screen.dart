import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:passbooks/constants/colors.dart';
import 'package:openid_client/openid_client.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/authentication.service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usrCtrl = TextEditingController(); //text: '480209'
  final _pwdCtrl = TextEditingController();
  late bool inValid = false;
  late bool isObscureText = true;


  final String _clientId = 'flutterClient';
  static const String _issuer = 'https://identity-server-4213.herokuapp.com';
  final List<String> _scopes = <String>[
    'openid',
    'profile',
    'defaultApi',
    'roles',
  ];
  String logoutUrl = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body:
          // SafeArea(
          //   child:
          Container(
        width: double.infinity,
        height: size.height,
        decoration: const BoxDecoration(
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
        child: SafeArea(
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
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              SingleChildScrollView(
                child: Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      // Container(

                      // ),
                      const SizedBox(height: 70),
                      Text(
                        "Passbook",
                        style: TextStyle(
                          color: const Color(0xfff9f9f9),
                          fontSize: size.width * 0.09,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.54,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.05),
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.1),
                        child: buildForm(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _usrCtrl,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
              filled: true,
              labelText: 'Username',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: MaterialColors.primary),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: MaterialColors.primary),
              ),
              errorStyle: TextStyle(fontSize: 12, height: 0.5),
            ),
            style: const TextStyle(
              color: MaterialColors.tuesday,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.54,
            ),
            validator: compose([
              required('Please enter username'),
              //Validators.email('invalid email'),
            ]),
          ),
          const SizedBox(
            height: 45,
          ),
          TextFormField(
            controller: _pwdCtrl,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: isObscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.vpn_key,
                color: Colors.white,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
              filled: true,
              labelText: 'Password',
              labelStyle: const TextStyle(color: Colors.white),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: MaterialColors.primary),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 1, color: MaterialColors.primary),
              ),
              suffixIconConstraints: const BoxConstraints(maxHeight: 32),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                icon: FaIcon(
                  isObscureText
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  size: 18,
                  color: Colors.grey,
                ),
              ),
              errorStyle: const TextStyle(fontSize: 12, height: 0.5),
            ),
            style: const TextStyle(
              color: MaterialColors.tuesday,
              fontSize: 18,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              letterSpacing: 0.54,
            ),
            validator: required('Please enter password'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: MaterialColors.primary,
                minimumSize: Size(MediaQuery.of(context).size.width, 50)),
            child: const Text(
              'Login',
              style: TextStyle(color: Color(0xfff9f9f9), fontSize: 18),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
          
                  var tokenInfo = await AuthenticationService.authenticate();
                
              }
            },
          ),
        ],
      ),
    );
  }

  login() {
    EasyLoading.show();
    Timer(const Duration(seconds: 1), () {
      EasyLoading.dismiss();
      Navigator.pushNamed(context, '/home');
    });
  }

  static FormFieldValidator<String> required(String errorMessage) {
    return (value) {
      if (value == null || value.isEmpty)
        return errorMessage;
      else
        return null;
    };
  }

  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }


    Future<TokenResponse> authenticate(
      Uri uri, String clientId, List<String> scopes) async {
    // create the client
    var issuer = await Issuer.discover(uri);
    var client = new Client(issuer, clientId);

    // create a function to open a browser with an url
    urlLauncher(String url) async {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true, enableJavaScript: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = new Authenticator(
      client,
      scopes: scopes,
      urlLancher: urlLauncher,
      port: 3000,
    );

    // starts the authentication
    var c = await authenticator.authorize();
    // close the webview when finished
    closeWebView();

    var res = await c.getTokenResponse();
    var userInfo = await  c.getUserInfo();
    setState(() {
      logoutUrl = c.generateLogoutUrl().toString();
    });
    print(res.accessToken);
    return res;
  }

  Future<void> logout() async {
    if (await canLaunch(logoutUrl)) {
      await launch(logoutUrl, forceWebView: true);
    } else {
      throw 'Could not launch $logoutUrl';
    }
    await Future.delayed(Duration(seconds: 3));
    closeWebView();
  }
}
