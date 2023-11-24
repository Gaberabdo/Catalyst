import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core-price-cat/resources/color_manager.dart';
import '../../../core/core-price-cat/resources/value_manager.dart';
import '../../../generated/l10n.dart';
import '../subscriptinon_cubit/subscription_cubit.dart';

class SubscriptionRequestPage extends StatefulWidget {
  const SubscriptionRequestPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionRequestPage> createState() =>
      _SubscriptionRequestPageState();
}

class _SubscriptionRequestPageState extends State<SubscriptionRequestPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _paymentHistoryController =
      TextEditingController();
  String selectedGroup = 'Zain cash';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscriptionCubit, SubscriptionState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SubscriptionCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              title: Text(S.of(context).payNow),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: AppPadding.p20, right: AppPadding.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).username,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey1,
                      // Set the background color here
                      borderRadius: BorderRadius.circular(
                          8.0), // Optional: Add border radius
                    ),
                    child: TextFormField(
                      controller: _userNameController,
                      keyboardType: TextInputType.text,
                      cursorColor: ColorManager.primary,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsetsDirectional.only(
                            start: AppPadding.p12),
                        hintText: S.of(context).username,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  Text(
                    S.of(context).subscriptionType,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey1,
                      // Set the background color here
                      borderRadius: BorderRadius.circular(
                          8.0), // Optional: Add border radius
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.none,
                      cursorColor: ColorManager.primary,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsetsDirectional.only(
                            start: AppPadding.p12),
                        hintText:
                            '${cubit.createDataRequest['subscriptionType']} ${S.of(context).subscription}',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  Text(
                    S.of(context).paymentMethod,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey1,
                      // Set the background color here
                      borderRadius: BorderRadius.circular(
                          8.0), // Optional: Add border radius
                    ),
                    child: DropdownButtonFormField(
                      dropdownColor: Colors.white,
                      elevation: 0,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorManager.lightGrey1)),
                      ),
                      value: selectedGroup,
                      icon: const Icon(Icons.expand_more),
                      items: <String>[
                        'Zain cash',
                        'Orange wallet',
                        'Umniah uwallet',
                        'Paybal',
                        'Visa card',
                        'Master card'
                      ].map((value) {
                        return DropdownMenuItem(
                          onTap: () {
                            FocusScope.of(context).nextFocus();
                          },
                          value: value,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  value,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedGroup = value.toString();
                          print(selectedGroup);
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  Text(
                    S.of(context).accountNumberOrName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey1,
                      // Set the background color here
                      borderRadius: BorderRadius.circular(
                          8.0), // Optional: Add border radius
                    ),
                    child: TextFormField(
                      controller: _accountNumberController,
                      keyboardType: TextInputType.number,
                      cursorColor: ColorManager.primary,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsetsDirectional.only(start: AppPadding.p12),
                        hintText: '000-000-000',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  Text(
                    S.of(context).paymentHistory,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey1,
                      // Set the background color here
                      borderRadius: BorderRadius.circular(
                          8.0), // Optional: Add border radius
                    ),
                    child: TextFormField(
                      controller: _paymentHistoryController,
                      keyboardType: TextInputType.datetime,
                      cursorColor: ColorManager.primary,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsetsDirectional.only(
                              start: AppPadding.p12, top: AppPadding.p12),
                          hintText: 'Dd/Mm/yyyy',
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.date_range_outlined,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  Text(
                    S.of(context).cost,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.lightGrey1,
                      // Set the background color here
                      borderRadius: BorderRadius.circular(
                          8.0), // Optional: Add border radius
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.none,
                      cursorColor: ColorManager.primary,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsetsDirectional.only(
                              start: AppPadding.p12, top: AppPadding.p12),
                          hintText: '${cubit.cost}\$',
                          border: InputBorder.none,
                          suffixIcon: const Icon(
                            Icons.date_range_outlined,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s40,
                  ),
                  ConditionalBuilder(
                    condition:
                        state is CreateSubscriptionRequestLodingPricesEmitState,
                    builder: (context) => Center(
                        child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    )),
                    fallback: (context) => SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            backgroundColor: ColorManager.primary,
                          ),
                          onPressed: () {
                            if (_userNameController.text.isNotEmpty &&
                                _paymentHistoryController.text.isNotEmpty &&
                                _accountNumberController.text.isNotEmpty) {
                              cubit.createDataRequest['userName'] =
                                  _userNameController.text;
                              cubit.createDataRequest['paymentMethod'] =
                                  selectedGroup;
                              cubit.createDataRequest['accountNumber'] =
                                  _accountNumberController.text;
                              cubit.createDataRequest['paymentHistory'] =
                                  _paymentHistoryController.text;
                              cubit.createDataRequest['cost'] = cubit.cost;
                              cubit.createSubscriptionRequest(context);
                            }
                          },
                          child: Text(
                            S.of(context).submit,
                            style: TextStyle(color: ColorManager.white),
                          )),
                    ),
                  )
                ],
              ),
            )));
      },
    );
  }
}
