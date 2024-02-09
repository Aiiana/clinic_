// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BottomNavBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNavBarScreen(),
      );
    },
    CodeRoute.name: (routeData) {
      final args = routeData.argsAs<CodeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CodePage(
          key: args.key,
          code: args.code,
        ),
      );
    },
    DoctorsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DoctorsScreen(),
      );
    },
    InfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InfoPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    ProfRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [BottomNavBarScreen]
class BottomNavBarRoute extends PageRouteInfo<void> {
  const BottomNavBarRoute({List<PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CodePage]
class CodeRoute extends PageRouteInfo<CodeRouteArgs> {
  CodeRoute({
    Key? key,
    required int code,
    List<PageRouteInfo>? children,
  }) : super(
          CodeRoute.name,
          args: CodeRouteArgs(
            key: key,
            code: code,
          ),
          initialChildren: children,
        );

  static const String name = 'CodeRoute';

  static const PageInfo<CodeRouteArgs> page = PageInfo<CodeRouteArgs>(name);
}

class CodeRouteArgs {
  const CodeRouteArgs({
    this.key,
    required this.code,
  });

  final Key? key;

  final int code;

  @override
  String toString() {
    return 'CodeRouteArgs{key: $key, code: $code}';
  }
}

/// generated route for
/// [DoctorsScreen]
class DoctorsRoute extends PageRouteInfo<void> {
  const DoctorsRoute({List<PageRouteInfo>? children})
      : super(
          DoctorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DoctorsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InfoPage]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute({List<PageRouteInfo>? children})
      : super(
          InfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfPage]
class ProfRoute extends PageRouteInfo<void> {
  const ProfRoute({List<PageRouteInfo>? children})
      : super(
          ProfRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
