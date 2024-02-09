
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson/core/config/app_consts.dart';
import 'package:flutter_lesson/core/config/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    routing();
    super.initState();
  }

  Future<void> routing() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isFirstEnter = prefs.getBool(AppConsts.isFirstEnter) ?? true;
    if (isFirstEnter) {
      //ignore: use_build_context_synchronously
      context.router.push(const InfoRoute());
    } else {
      //ignore: use_build_context_synchronously
      context.router.push(const LoginRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}