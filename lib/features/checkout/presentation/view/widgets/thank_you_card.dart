import 'package:checkout_app/core/utiles/styles.dart';
import 'package:checkout_app/features/checkout/presentation/view/widgets/card_info_widget.dart';
import 'package:checkout_app/features/checkout/presentation/view/widgets/payment_item_info.dart';
import 'package:checkout_app/features/checkout/presentation/view/widgets/total_price_widget.dart';
 import 'package:flutter/material.dart';
 import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xffEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          children: [
            const SizedBox(
              height: 66,
            ),
            const Text(
              'Thank you!',
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              style: Styles.style20,
            ),
            const SizedBox(
              height: 42,
            ),
            const PaymentItemInfo(
              title: 'Date',
              value: '01/24/2023',
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              title: 'Time',
              value: '10:15 AM',
            ),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(
              title: 'To',
              value: 'Sam Louis',
            ),
            const Divider(
              thickness: 2,
              height: 60,
              color: Color(0xffC7C7C7),
            ),
            const TotalPriceWidget(title: 'Total', value: r'$50.97'),
            const SizedBox(
              height: 30,
            ),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color(0xff34A853),
                          width: 2,
                        )),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      style: Styles.style25.copyWith(
                        color: const Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: (MediaQuery.sizeOf(context).height * .2 + 20) / 2 - 30,
            ),
          ],
        ),
      ),
    );
  }
}
