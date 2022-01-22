import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_base_project/global_controllers/loading_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = "/cart_screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bgImage.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Cart Screen"),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.find<LoadingController>().showCustomNotifcation(context);
              },
              child: const Text("Show"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.find<LoadingController>().stop();
              },
              child: const Text("Stop"),
            )
          ],
        ),
      ),
    );
  }
}
