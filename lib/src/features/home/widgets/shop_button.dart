import 'package:flutter/material.dart';

import '../../../core/widgets/buttons/my_button.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../pages/shop_page.dart';

class ShopButton extends StatelessWidget {
  const ShopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MyButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ShopPage();
            },
          ),
        );
      },
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: Color(0xff97E10A),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: SvgWidget('assets/shop.svg'),
        ),
      ),
    );
  }
}
