import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

import '../../../features/bag/presentation/views/bag_view.dart';
import '../../../features/home/presentation/views/home_view.dart';
import '../../../constant.dart';



class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {

  PageController _pageController = PageController();
  int _selectedIndex=0;

  final List<Widget> _screens =[
    const HomeView(),
    const BagView(),
    Container(color: Colors.black38),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
    _pageController.animateToPage(
        _selectedIndex,
        duration:const Duration(milliseconds: 150),
        curve: Curves.linear,
    );
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 25.0,
        bubbleCurve: Curves.ease,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: Colors.black38,
        backgroundColor: Colors.white,
        scaleFactor: 0.4,
        items: [
          CustomNavigationBarItem(
            icon :const Icon(CupertinoIcons.home),
          ),
          CustomNavigationBarItem(
            icon : const Icon(CupertinoIcons.shopping_cart),
          ),
          CustomNavigationBarItem(
            icon : const Icon(CupertinoIcons.person),
          ),

        ],
      )
    );
  }
}
