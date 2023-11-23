import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';

import '../../../../Home/presention/manager/metals_cubit/cubit.dart';
import 'metal_column.dart';
import 'metal_row.dart';

class MetalsTable extends StatelessWidget {
  const MetalsTable({super.key});

  @override
  Widget build(BuildContext context) {
    late dynamic c1t1;
    late dynamic c1t2;
    late dynamic c1t3;
    late dynamic c1t4;
    c1t1 = BlocProvider.of<MetalsCubit>(context).model?.pt ?? 0;
    c1t2 = BlocProvider.of<MetalsCubit>(context).model?.pd ?? 0;
    c1t3 = BlocProvider.of<MetalsCubit>(context).model?.rh ?? 0;
    c1t4 = 0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: const Color(0xFFFBC821),
          width: 1,
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Row(
            children: [
              Spacer(),
              Text(
                'Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Spacer(),
              Text(
                'Per Ounce',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Spacer(),
              Text(
                'Per Gram',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Spacer(),
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
              ),
              const Spacer(),
              MetalsColumn(
                  text1: c1t1.toStringAsFixed(2),
                  text2: c1t2.toStringAsFixed(2),
                  text3: c1t3.toStringAsFixed(2),
                ),
              const Spacer(),
              MetalsColumn(
                  text1: (c1t1 / 31.105).toStringAsFixed(2),
                  text2: (c1t2 / 31.9).toStringAsFixed(2),
                  text3: (c1t3 / 35.8).toStringAsFixed(2),
                 ),
              const Spacer(),
            ],
          ),
          const MetalRow(
              text: "pt return 0.98",
              ounce: "pd return 0.98",
              gram: "rh return 0.90"),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
