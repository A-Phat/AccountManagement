import 'package:flutter/material.dart';
import 'package:passbooks/constants/colors.dart';

class AppBarBackground extends StatelessWidget {
  const AppBarBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MaterialColors.signStartGradient,
            MaterialColors.signEndGradient,
          ],
          stops: [0.5, 1],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
    );
  }
}
