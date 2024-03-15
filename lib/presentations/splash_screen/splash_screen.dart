// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
// import 'package:timbo/utils/preferences/local_preferences.dart';
import 'package:timbo/utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navigateScreen() async {
    context.pushReplacement(Routes.optionScreen);
  }
  // Future<void> navigateScreen() async {
  //   var user = await LocalStorage.fetchToken();
  //   if (user?.isNotEmpty ?? false) {
  //     context.push(Routes.homeScreen);
  //   } else {
  //     context.pushReplacement(Routes.optionScreen);
  //     // context.pushReplacement(Routes.verifyNumberScreen);
  //   }
  // }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 100), () {
      navigateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.sw,
        height: 100.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/baap_experience.png",
              width: 141.w,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/Marketplaceforconstruction.png",
              width: 141.w,
            ),
          ],
        ),
      ),
    );
  }
}
