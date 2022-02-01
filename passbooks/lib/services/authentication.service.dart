import 'dart:convert';

import 'package:localstorage/localstorage.dart';
import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/authen_model.dart';

class AuthenticationService {
  static const String _clientId = 'flutterClient';
  static const String _issuer = 'https://identity-server-4213.herokuapp.com';
  static const List<String> _scopes = <String>[
    'openid',
    'profile',
    'defaultApi',
    'roles',
  ];
  String logoutUrl = "";  //format 2021-12-1


  static Future<AuthenModel> authenticate() async {
    Uri uri = Uri.parse(_issuer);
    // create the client
    var issuer = await Issuer.discover(uri);
    var client = Client(issuer, _clientId);

    // create a function to open a browser with an url
    urlLauncher(String url) async {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true, enableJavaScript: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = Authenticator(
      client,
      scopes: _scopes,
      urlLancher: urlLauncher,
      port: 3000,
    );

    // starts the authentication
    var c = await authenticator.authorize();
    // close the webview when finished
    closeWebView();

    final TokenResponse res = await c.getTokenResponse();
    final UserInfo userInfo = await c.getUserInfo();
    final String logoutUrl = c.generateLogoutUrl().toString();
    var result =  mapResponse( res,  userInfo, logoutUrl);
    var setss = setAuthData(result, 'auth');

    return result;
  }

  
   static AuthenModel mapResponse(TokenResponse res, UserInfo userInfo, logoutUrl) {
     return AuthenModel ( 
       subject: userInfo.subject,
       accessToken: res.accessToken!,
       fullname: userInfo.name!,
       fname: userInfo.givenName,
       lname: userInfo.familyName,
       logoutUrl: logoutUrl
       );
  }
 


  static Future<bool> setAuthData(AuthenModel item, authKey) async {
    try {
      final LocalStorage storage = new LocalStorage('passbooks_app');
      final isReady = await storage.ready;
      if (isReady) {
        await storage.setItem(authKey, jsonEncode(item.toJSONEncodable()));
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  
  static Future<AuthenModel?> getAuthData(authKey) async {
    try {
      final LocalStorage storage = new LocalStorage('passbooks_app');
      final isReady = await storage.ready;
      if (isReady) {
        Map<String, dynamic> data = jsonDecode(storage.getItem(authKey));
        return AuthenModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

    static Future<void> clearAuthData() async {
    try {
      final LocalStorage storage = new LocalStorage('passbooks_app');
      final isReady = await storage.ready;
      if (isReady) {
        storage.clear();
      } 
    } catch (e) {
    }
  }
}
