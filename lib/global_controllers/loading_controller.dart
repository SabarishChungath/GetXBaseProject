import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoadingController extends GetxController {
  bool isLoading = false;

  show() {
    if (!isLoading) {
      isLoading = true;
      update();
    }
  }

  stop() {
    if (isLoading) {
      isLoading = false;
      update();
    }
  }

  showCustomNotifcation(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => const Notification(),
    );
    overlayState?.insert(overlayEntry);
    await Future.delayed(const Duration(seconds: 4));
    overlayEntry.remove();
  }
}

class Notification extends StatefulWidget {
  const Notification({
    Key? key,
  }) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> topAnimation;
  late Animation<double> curve;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 2,
        ),
        animationBehavior: AnimationBehavior.normal);
    curve = CurvedAnimation(
        parent: controller,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.fastOutSlowIn);
    topAnimation = Tween<double>(begin: -70, end: 50).animate(curve)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
      });

    controller.forward();
    SystemSound.play(SystemSoundType.alert);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topAnimation.value,
      left: 10,
      right: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black.withOpacity(0.40)),
              child: const DefaultTextStyle(
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
                child: Center(
                  child: Text("Welcome to Ooty 🙏\nNice to meet you 👋"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
