import 'package:flutter/material.dart';
import 'package:cat_price/features/cat-price-feature/presentation/price_list/price_list_screen.dart';
import 'package:cat_price/features/chart/presention/views/chart_view.dart';
import 'package:cat_price/generated/l10n.dart';

import '../../../../Calculater/presention/views/calculater_view.dart';
import '../../../../Catlog-feature/presentation/views/home_category.dart';
import '../../../../electronics/presention/views/electronics_view.dart';
import 'ToolsItem.dart';

class ToolsList extends StatelessWidget {
  const ToolsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ToolsItem(
          image: "assets/flat-color-icons_calculator.png",
          text: S.of(context).Calculator,
          ontab: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CalculaterView(),
                ));
          },
        ),
        const Spacer(),
        ToolsItem(
          image: "assets/twemoji_clipboard.png",
          text: S.of(context).PriceList,
          ontab: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PriceListScreen(),
                ));

          },
        ),
        const Spacer(),
        ToolsItem(
          image: "assets/twemoji_open-book.png",
          text: S.of(context).MyCatalog,
          ontab: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeCategory(),
                ));
            //HomeCategory
          },
        ),
        const Spacer(),
        ToolsItem(
          image: "assets/Group 510.png",
          text: S.of(context).Charts,
          ontab: () {
            //ChartView
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChartView(),
                ));
          },
        ),
        const Spacer(),
        ToolsItem(
          image: "assets/flat-color-icons_electronics.png",
          text: S.of(context).electronics,
          ontab: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ElectronicsView(),
                ));
          },
        )
      ],
    );
  }
}
