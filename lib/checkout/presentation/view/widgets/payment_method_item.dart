import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isActive = false, required this.image,
  });
  final bool isActive;
  final String image ;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 63,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: isActive ? const Color(0xff34A853) : Colors.grey,
            width: 1.50,
          ),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? const Color(0xff34A853) : Colors.white,
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: SvgPicture.asset(
        image,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
