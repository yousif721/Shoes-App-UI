import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../../core/widgets/custom_app_theme.dart';

class HomeAppBar extends StatelessWidget implements  PreferredSizeWidget{
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
            'Discover',
            style: AppThemes.homeAppBar,
          ),

        actions: [
          IconButton(
            onPressed: (){},
            icon:  const Icon(CupertinoIcons.search,
                color: AppConstantsColor.darkTextColor,
                size: 25
            ),
          ),
          IconButton(
            onPressed: (){},
            icon:  const Icon(CupertinoIcons.bell,
                color: AppConstantsColor.darkTextColor,
                size: 25
            ),
          ),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(70);
}
