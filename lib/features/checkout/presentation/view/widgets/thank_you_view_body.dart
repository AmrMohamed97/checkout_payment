import 'package:checkout_app/features/checkout/presentation/view/widgets/dashed_line.dart';
import 'package:checkout_app/features/checkout/presentation/view/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

import 'custom_check_icon.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            left: 30,
            right: 30,
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            child: const DashedLine(),
          ),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}

