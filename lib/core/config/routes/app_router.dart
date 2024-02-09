import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lesson/moduls/authorization/presentation/screens/code_page.dart';

import 'package:flutter_lesson/moduls/authorization/presentation/screens/info_page.dart';
import 'package:flutter_lesson/moduls/authorization/presentation/screens/login_page.dart';
import 'package:flutter_lesson/moduls/authorization/presentation/screens/prof_page.dart';
import 'package:flutter_lesson/moduls/home_page/bottom_bar_screen.dart';
import 'package:flutter_lesson/moduls/home_page/feature/doctors/presentation/screens/doctors_screen.dart';

import 'package:flutter_lesson/moduls/home_page/feature/profile_page/presentation/screens/profile_screen.dart';

import '../../../moduls/splash_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: InfoRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: SplashRoute.page,
        ),
        AutoRoute(
          page: CodeRoute.page,
        ),
        AutoRoute(
          page: ProfRoute.page,
        ),
       
        AutoRoute(
          page: BottomNavBarRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: ProfileRoute.page,
              initial: true,
            ),
              AutoRoute(
          page: DoctorsRoute.page,
        ),
          ],
        ),
     
      ];
}
