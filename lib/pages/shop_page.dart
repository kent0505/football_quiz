import 'package:flutter/material.dart';

import '../widgets/ads_card.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/hint_card.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          Appbar(),
          SizedBox(height: 8),
          HintCard(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 8),
                AdsCard(id: 1, amount: 200),
                SizedBox(height: 8),
                AdsCard(id: 2, amount: 200 * 2),
                SizedBox(height: 8),
                AdsCard(id: 3, amount: 200 * 3),
                SizedBox(height: 8),
                AdsCard(id: 4, amount: 200 * 4),
                SizedBox(height: 8),
                AdsCard(id: 5, amount: 200 * 5),
                SizedBox(height: 8),
                AdsCard(id: 6, amount: 200 * 6),
                SizedBox(height: 8),
                AdsCard(id: 7, amount: 200 * 7),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
