import 'package:checkout_app/core/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.width,
    this.height,
    required this.borderRadius,
    this.color,
    this.onTap,
    this.isLoading = false,
  });
  final String title;
  final double? width, height;
  final BorderRadiusGeometry borderRadius;
  final Color? color;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 70,
        width: width ?? double.infinity,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          color: color ?? const Color(0xff34A853),
        ),
        child: Center(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : Text(
                  title,
                  style: Styles.style22,
                ),
        ),
      ),
    );
  }
}
