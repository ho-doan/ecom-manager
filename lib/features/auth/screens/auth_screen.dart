import 'package:clean_arc/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName='/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Xin chào!!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),),
              ListTile(
                title: const Text('Tạo tài khoản',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ],
          ),
        )
         ),
    );
  }
}