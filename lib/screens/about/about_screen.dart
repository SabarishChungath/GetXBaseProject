import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_project/screens/about/about_controller.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({Key? key}) : super(key: key);
  static const routeName = "/about_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.pink[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("About Screen"),
          ],
        ),
      ),
    );
  }
}
