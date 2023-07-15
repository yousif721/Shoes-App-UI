import 'package:flutter/material.dart';
import '../../../../../constant.dart';
import '../../../../../core/widgets/custom_app_theme.dart';


class CustomDetailsViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomDetailsViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title:const Center(
        child:  Text('Nike Shoes',
          style: AppThemes.detailsAppBar,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios,
          color: AppConstantsColor.darkTextColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border,
            color: AppConstantsColor.darkTextColor,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
