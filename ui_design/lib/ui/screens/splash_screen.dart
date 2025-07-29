// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_design/ui/controllers/auth_controller.dart';
import 'package:ui_design/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:ui_design/ui/screens/sign_in_screen.dart';
import 'package:ui_design/ui/utils/asset_paths.dart';
import 'package:ui_design/ui/widgets/screen_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    bool isLoggedIn = await AuthController.isUserLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, MainNavBarHolderScreen.name);
    }
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(AssetPaths.logoSvg),
        ),
      ),
    );
  }
}
