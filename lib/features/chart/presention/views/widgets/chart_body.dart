import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../manager/chart_cubit/chart_cubit.dart';

class ChartBody extends StatelessWidget {
  const ChartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26, left: 4),
      child: SingleChildScrollView(
        child: BlocBuilder<ChartCubit, ChartState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () =>
                          ChartCubit.get(context).changeChartData(0),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          ChartCubit.get(context).selectedIndex == 0
                              ? Colors.yellow
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        S.of(context).Day,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () =>
                          ChartCubit.get(context).changeChartData(1),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            side: const BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          ChartCubit.get(context).selectedIndex == 1
                              ? Colors.yellow
                              : Colors.white,
                        ),
                      ),
                      child: Text(
                        S.of(context).Week,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    S.of(context).Palladium,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                AspectRatio(
                  aspectRatio: 1.3,
                  child: LineChart(mainData(
                      spots: ChartCubit.get(context).currentDataXPD,
                      context: context)),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    S.of(context).Platinum,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                AspectRatio(
                  aspectRatio: .5,
                  child: LineChart(
                    mainData(
                      spots: ChartCubit.get(context).currentDataXPT,
                      context: context,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    S.of(context).Rhodium,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                AspectRatio(
                  aspectRatio: .5,
                  child: LineChart(mainData(
                    spots: ChartCubit.get(context).currentDataXRH,
                    context: context,
                  )),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  LineChartData mainData({required List<FlSpot> spots, required context}) {
    double minY = spots.isNotEmpty
        ? spots
            .map((spot) => spot.y)
            .reduce((min, current) => min < current ? min : current)
        : 0;
    double maxY = spots.isNotEmpty
        ? spots
            .map((spot) => spot.y)
            .reduce((max, current) => max > current ? max : current)
        : 0;
    return LineChartData(
      borderData: FlBorderData(
        show: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: const AxisTitles(
            sideTitles: SideTitles(
                reservedSize: 45,
                //interval: minY == 0 ? 1 : (maxY - minY) / 5,
                showTitles: true)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,

            //  getTitlesWidget: bottomTitleWidgets
            getTitlesWidget: (value, meta) {
              if (ChartCubit.get(context).selectedIndex == 0) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: ChartCubit.get(context).daysNames.isNotEmpty
                      ? Text(ChartCubit.get(context).daysNames[value.toInt()])
                      : const Text(""),
                );
              } else {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  angle: 370,
                  child: FittedBox(
                    child: Text(ChartCubit.get(context).weakDates.isEmpty
                        ? " "
                        : ChartCubit.get(context).weakDates[value.toInt()]),
                  ),
                );
              }
            },
          ),
        ),
        rightTitles: const AxisTitles(
          drawBelowEverything: false,
        ),
        topTitles: const AxisTitles(drawBelowEverything: false),
      ),
      minX: 0,
      maxX: spots.length.toDouble() - 1,
      minY: minY - 20,
      maxY: maxY + 30,
      // minY: minY,
      // maxY: 1300 + 100, // maxY == 0 ? 1 : (maxY + maxY / 5),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.yellow,
          barWidth: 4,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 255, 195, 5),
                const Color.fromARGB(255, 255, 195, 5),
              ].map((color) => color.withOpacity(0.5)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
