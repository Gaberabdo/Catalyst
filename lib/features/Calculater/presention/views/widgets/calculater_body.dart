import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Home/presention/manager/metals_cubit/cubit.dart';
import '../../../../Home/presention/manager/metals_cubit/state.dart';
import 'basic_calculater.dart';
import 'metals_table.dart';

class CalculaterBody extends StatelessWidget {
  const CalculaterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetalsCubit, MetalsState>(
      builder: (context, state) {
        return const SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              children: [
                 MetalsTable(),
                 SizedBox(height: 20),
                 BasicCalculater(),
              ],
            ),
          ),
        );
      },
    );
  }
}
