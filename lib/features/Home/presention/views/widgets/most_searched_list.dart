import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/most_searched_model.dart';
import '../../manager/metals_cubit/cubit.dart';
import '../../manager/metals_cubit/state.dart';
import 'most_searched_item.dart';

class MostSearchedList extends StatelessWidget {
  const MostSearchedList({super.key, this.controller,});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetalsCubit, MetalsState>(builder: (context, state) {
      return ConditionalBuilder(
        condition: state is! successMostSearcedState,
        builder:(context) => SizedBox(
            height: 180,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: BlocProvider.of<MetalsCubit>(context).mostSearchedModel?.items?.length,
              itemBuilder: (context, index) => MostSearchedItem(items: BlocProvider.of<MetalsCubit>(context).mostSearchedModel!.items![index]),
            )),
        fallback:(context) => const Center(child: CircularProgressIndicator(color: Colors.black)));

    });
  }
}
