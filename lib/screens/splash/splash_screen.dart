import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_project/screens/splash/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.indigo[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Splash screen"),
          ],
        ),
      ),
    );
  }
}
