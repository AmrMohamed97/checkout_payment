import 'package:checkout_app/custom_app_bar.dart';
import 'package:checkout_app/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'My Cart',
      ),
      body: MyCartViewBody(),
    );
  }
}
