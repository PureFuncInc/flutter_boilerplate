import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: '歡迎'.text.headline1(context).make(),
    );
  }
}
