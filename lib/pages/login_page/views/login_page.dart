import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.blueAccent[100]),
          width: 380,
          height: 680,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('hello world')],
          ),
        ),
      ),
    );
  }
}
