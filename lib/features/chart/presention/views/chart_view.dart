import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_price/features/chart/presention/views/widgets/chart_body.dart';

import '../../../../generated/l10n.dart';
import '../manager/chart_cubit/chart_cubit.dart';

class ChartView extends StatelessWidget {
  const ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChartCubit()..startFetchingData(),
      lazy: false,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.05,
          title: Text(S.of(context).Charts),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: const ChartBody(),
      ),
    );
  }
}
