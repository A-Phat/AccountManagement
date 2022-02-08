import 'package:flutter/material.dart';
import 'package:passbooks/constants/colors.dart';

class Profile extends StatelessWidget {
  final String image;
  final String name;
  final String balance;

  Profile(
      {
      required this.image,
      required this.name,
      required this.balance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
      child: Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            color: MaterialColors.signEndGradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: MaterialColors.caption,
                  offset: Offset(3, 1),
                  blurRadius: 7,
                  spreadRadius: 2)
            ]),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 18.0, left: 18.0),
                  child: CircleAvatar( backgroundImage: AssetImage("images/murako.png"), radius: 25,)
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(text: "Name: xxxx xxxxxxx\n"),
                    TextSpan(text: "Balance: 10000฿")
                  ], style: TextStyle(fontSize: 18)))),
            ])
          ],
        ),
      ),
    );
  }
}
