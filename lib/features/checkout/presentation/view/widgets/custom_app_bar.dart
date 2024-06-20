import 'package:checkout_app/core/utiles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.title,
  });
  final String  title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: SvgPicture.asset(
        'assets/images/arrowBack.svg',
        fit: BoxFit.scaleDown,
      ),
      centerTitle: true,
      title:   Text(
        title,
        style: Styles.style25,
      ),
    );
  }
  
  @override
   Size get preferredSize =>const Size.fromHeight(56);
}
