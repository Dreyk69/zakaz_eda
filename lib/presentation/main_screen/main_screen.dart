import 'package:auto_route/auto_route.dart';
import 'package:eda_gotova/infrastructure/navigation_service/router/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> _tabIndexNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        InfoRoute(),
        OrderRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return ValueListenableBuilder<int>(
          valueListenable: _tabIndexNotifier,
          builder: (context, value, child) {
            return BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                _tabIndexNotifier.value = index;
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Главная',
                    backgroundColor: Color.fromRGBO(196, 223, 230, 1)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.restaurant),
                    label: 'Подробнее',
                    backgroundColor: Color.fromRGBO(196, 223, 230, 1)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_basket),
                    label: 'Заказ',
                    backgroundColor: Color.fromRGBO(196, 223, 230, 1)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Профиль',
                    backgroundColor: Color.fromRGBO(196, 223, 230, 1)),
              ],
              selectedItemColor: Colors.grey,
              unselectedItemColor: Colors.black,
            );
          },
        );
      },
    );
  }
}
