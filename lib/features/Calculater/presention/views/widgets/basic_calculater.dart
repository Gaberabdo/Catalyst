import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../generated/l10n.dart';
import '../../../../Home/presention/manager/metals_cubit/cubit.dart';
import 'calc_button.dart';
import 'calc_field.dart';

class BasicCalculater extends StatefulWidget {
  const BasicCalculater({super.key});

  @override
  State<BasicCalculater> createState() => _BasicCalculaterState();
}

class _BasicCalculaterState extends State<BasicCalculater> {

  late dynamic c1t1;
  late dynamic c1t2;
  late dynamic c1t3;
  late dynamic c1t4;


  final TextEditingController pdController = TextEditingController();
  final TextEditingController ptController = TextEditingController();
  final TextEditingController rhController = TextEditingController();
  final TextEditingController exchhangeController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController pdppmController = TextEditingController();
  final TextEditingController ptppmController = TextEditingController();
  final TextEditingController rhppmController = TextEditingController();
  final TextEditingController ptReturnController = TextEditingController();
  final TextEditingController pdReturnController = TextEditingController();
  final TextEditingController rhReturnController = TextEditingController();




  dynamic pricetext = "";
  dynamic pricedollartext = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    c1t1 = BlocProvider.of<MetalsCubit>(context).model?.pt ?? 0;
    c1t2 = BlocProvider.of<MetalsCubit>(context).model?.pd ?? 0;
    c1t3 = BlocProvider.of<MetalsCubit>(context).model?.rh ?? 0;
    c1t4 = 0;
    ptController.text = c1t1.toStringAsFixed(2);
    pdController.text = c1t2.toStringAsFixed(2);
    rhController.text = c1t3.toStringAsFixed(2);
    ptReturnController.text = "0.98";
    pdReturnController.text = "0.98";
    rhReturnController.text = "0.90";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .27,
                child: CalculaterField(
                  hintText: "pt return",
                  icon: FontAwesomeIcons.percent,
                  controller: ptReturnController,
                )),
            const Spacer(),
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .27,
                child: CalculaterField(
                  hintText: "pd return",
                  icon: Icons.percent,
                  controller: pdReturnController,
                )),
            const Spacer(),
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .27,
                child: CalculaterField(
                  hintText: "rh return",
                  icon: Icons.percent,
                  controller: rhReturnController,
                )),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            S.of(context).Calculator,
            style: const TextStyle(
              color: Color(0xFFFBC821),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey[400],
          ),
        ),
        Row(
          children: [
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .42,
                child: CalculaterField(
                  hintText: "PD/Gram",
                  icon: FontAwesomeIcons.dollarSign,
                  controller: pdController,
                )),
            const Spacer(),
            SizedBox(
                width: MediaQuery.sizeOf(context).width * .42,
                child: CalculaterField(
                  hintText: "PT/Gram",
                  icon: FontAwesomeIcons.dollarSign,
                  controller: ptController,
                )),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .42,
              child: CalculaterField(
                hintText: "RH/Gram",
                icon: FontAwesomeIcons.dollarSign,
                controller: rhController,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .42,
              child: CalculaterField(
                hintText: "Exchange",
                icon: Icons.currency_exchange,
                controller: exchhangeController,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CalculaterField(
            hintText: S.of(context).WeightKG,
            icon: Icons.monitor_weight_rounded,
            controller: weightController),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 10),
        //   child: CalculaterField(
        //       hintText: 'pt return',
        //       icon: FontAwesomeIcons.dollarSign,
        //       controller: ptReturnController),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 10),
        //   child: CalculaterField(
        //       hintText: 'pd return',
        //       icon: FontAwesomeIcons.dollarSign,
        //       controller: pdReturnController),
        // ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 10),
        //   child: CalculaterField(
        //       hintText: 'rh return',
        //       icon: FontAwesomeIcons.dollarSign,
        //       controller: rhReturnController),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CalculaterField(
              hintText: 'PD/ppm',
              icon: Icons.list,
              controller: pdppmController),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CalculaterField(
              hintText: 'PT/ppm',
              icon: Icons.list,
              controller: ptppmController),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CalculaterField(
              hintText: 'RH/ppm',
              icon: Icons.list,
              controller: rhppmController),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Center(
                child: Text("${S.of(context).PriceDollar}=${pricedollartext}")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Center(child: Text("${S.of(context).Price}=${pricetext}")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 33, top: 40),
          child: CalculatorButton(
            ontab: () {
              if (exchhangeController.text.isEmpty) {
                pricedollartext = getPriceDollar(
                        pdppn: double.parse(pdppmController.text),
                        pdgram: double.parse(pdController.text),
                        pdreturn: double.parse(pdReturnController.text),
                        ptreturn: double.parse(ptReturnController.text),
                        rhreturn: double.parse(rhReturnController.text),
                        weight: double.parse(weightController.text),
                        ptppn: double.parse(ptppmController.text),
                        ptgram: double.parse(ptController.text),
                        rhppn: double.parse(rhppmController.text),
                        rhgram: double.parse(rhController.text))
                    .toString();
                setState(() {});
              } else {
                pricetext = getPrice(
                        pdppn: double.parse(pdppmController.text),
                        rhreturn: double.parse(rhReturnController.text),
                        ptreturn: double.parse(ptReturnController.text),
                        pdreturn: double.parse(pdReturnController.text),
                        pdgram: double.parse(pdController.text),
                        weight: double.parse(weightController.text),
                        ptppn: double.parse(ptppmController.text),
                        ptgram: double.parse(ptController.text),
                        rhppn: double.parse(rhppmController.text),
                        rhgram: double.parse(rhController.text),
                        exchange: double.parse(exchhangeController.text))
                    .toString();
                pricedollartext = getPriceDollar(
                        pdppn: double.parse(pdppmController.text),
                        pdgram: double.parse(pdController.text),
                        pdreturn: double.parse(pdReturnController.text),
                        ptreturn: double.parse(ptReturnController.text),
                        rhreturn: double.parse(rhReturnController.text),
                        weight: double.parse(weightController.text),
                        ptppn: double.parse(ptppmController.text),
                        ptgram: double.parse(ptController.text),
                        rhppn: double.parse(rhppmController.text),
                        rhgram: double.parse(rhController.text))
                    .toString();
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}

double getPriceDollar({
  required pdppn,
  required pdgram,
  required pdreturn,
  required ptreturn,
  required rhreturn,
  required weight,
  required ptppn,
  required ptgram,
  required rhppn,
  required rhgram,
}) {
  return ((pdppn * weight / 1000 * pdreturn * pdgram) +
      (ptppn * weight / 1000 * ptreturn * ptgram) +
      (rhppn * weight / 1000 * rhreturn * rhgram));
}

double getPrice({
  required pdppn,
  required pdgram,
  required exchange,
  required pdreturn,
  required ptreturn,
  required rhreturn,
  required weight,
  required ptppn,
  required ptgram,
  required rhppn,
  required rhgram,
}) {
  return ((pdppn * weight / 1000 * pdreturn * pdgram) +
          (ptppn * weight / 1000 * ptreturn * ptgram) +
          (rhppn * weight / 1000 * rhreturn * rhgram)) *
      exchange;
}
