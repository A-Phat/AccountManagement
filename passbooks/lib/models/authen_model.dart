class AuthenModel {
  final String subject;
  final String accessToken;
  final String fullname;
  final String? fname;
  final String? lname;
  final String logoutUrl;

  AuthenModel(
      {required this.subject,
      required this.accessToken,
      required this.fullname,
      this.fname,
      this.lname,
      required this.logoutUrl});

  factory AuthenModel.fromJson(Map<String, dynamic> json) {
    return AuthenModel(
        subject: json['subject'],
        accessToken: json['accessToken'],
        fullname: json['name'],
        fname: json['givenName'],
        lname: json['familyName'],
        logoutUrl: json['logoutUrl']);
  }

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();
    m['subject'] = subject;
    m['accessToken'] = accessToken;
    m['name'] = fullname;
    m['givenName'] = fname;
    m['familyName'] = lname;
    m['logoutUrl'] = logoutUrl;
    return m;
  }
}
