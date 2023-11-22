import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_price/features/Home/presention/manager/metals_cubit/state.dart';
import 'package:cat_price/features/Home/presention/views/widgets/up_down_column.dart';
import 'package:cat_price/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Calculater/presention/views/widgets/metal_column.dart';
import '../../manager/metals_cubit/cubit.dart';

class PGMTable extends StatefulWidget {
  const PGMTable({super.key});

  @override
  State<PGMTable> createState() => _PGMTableState();
}

class _PGMTableState extends State<PGMTable> {
  SharedPreferences? preferences;

  @override
  Widget build(BuildContext context) {
    late dynamic c1t1;
    late dynamic c1t2;
    late dynamic c1t3;
    late dynamic c1t4;

    return BlocBuilder<MetalsCubit, MetalsState>(
      builder: (context, state) {
        c1t1 = BlocProvider.of<MetalsCubit>(context).model?.metal?.pt ?? 0;
        c1t2 = BlocProvider.of<MetalsCubit>(context).model?.metal?.pd ?? 0;
        c1t3 = BlocProvider.of<MetalsCubit>(context).model?.metal?.rh ?? 0;
        c1t4 = 0;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      S.of(context).Category,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      S.of(context).UpDown,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      S.of(context).PerOunce,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      S.of(context).PerGram,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[400],
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    const MetalsColumn(
                      text1: "pt",
                      text2: "pd",
                      text3: "rh",
                      text4: "Au",
                    ),
                    const Spacer(),
                    const Up_DownCalumn(),
                    const Spacer(),
                    MetalsColumn(
                      text1: c1t1.toStringAsFixed(2),
                      text2: c1t2.toStringAsFixed(2),
                      text3: c1t3.toStringAsFixed(2),
                      text4: c1t4.toStringAsFixed(2),
                    ),
                    const Spacer(),
                    MetalsColumn(
                      text1: (c1t1 / 31.105).toStringAsFixed(2),
                      text2: (c1t2 / 31.9).toStringAsFixed(2),
                      text3: (c1t3 / 35.8).toStringAsFixed(2),
                      text4: (c1t4 / 31.10).toStringAsFixed(2),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
