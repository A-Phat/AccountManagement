import 'package:flutter/material.dart';
import 'package:passbooks/screens/deposit/components/appbar_background.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({ Key? key }) : super(key: key);

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deposit"),
         centerTitle: true,
          flexibleSpace: const AppBarBackground(),

      ),
      
    );
  }
}