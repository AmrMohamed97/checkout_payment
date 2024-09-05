import 'package:checkout_app/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
  });
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: SvgPicture.asset(
        'assets/images/arrowBack.svg',
        fit: BoxFit.scaleDown,
      ),
      centerTitle: true,
      title: Text(
        title ?? '',
        style: Styles.style25,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
