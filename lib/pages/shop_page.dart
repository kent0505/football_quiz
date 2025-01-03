import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}
