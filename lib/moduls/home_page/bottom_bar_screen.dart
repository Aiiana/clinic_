import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_lesson/core/config/routes/app_router.dart';

@RoutePage()
class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DoctorsRoute(),
        ProfileRoute(),
        ProfileRoute(),
         ProfileRoute(),
        
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {},
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
           
              tabsRouter.setActiveIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Доктора',
                icon: Icon(
                  Icons.person_add_sharp,
                  
                ),
              ),
              BottomNavigationBarItem(
                label: 'Статьи',
                icon: Icon(
                  Icons.article,
                ),
              ),
               BottomNavigationBarItem(
                label: 'Статьи',
                icon: Icon(
                  Icons.article,
                ),
              ),BottomNavigationBarItem(
                label: 'Статьи',
                icon: Icon(
                  Icons.article,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}