import 'package:cat_price/features/subscripation-feature/subscription_view/subscription_reques.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core-price-cat/resources/assets_manager.dart';
import '../../../core/core-price-cat/resources/color_manager.dart';
import '../../../core/core-price-cat/resources/font_manager.dart';
import '../../../core/core-price-cat/resources/navigation.dart';
import '../../../core/core-price-cat/resources/value_manager.dart';
import '../../../generated/l10n.dart';
import '../subscriptinon_cubit/subscription_cubit.dart';

class SubscriptionHomePage extends StatefulWidget {
  const SubscriptionHomePage({Key? key}) : super(key: key);

  @override
  State<SubscriptionHomePage> createState() => _SubscriptionHomePageState();
}

class _SubscriptionHomePageState extends State<SubscriptionHomePage> {
  bool broPriceLit=false;
  bool myCatalog=false;
  bool calculator=false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscriptionCubit, SubscriptionState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SubscriptionCubit.get(context);
        if(cubit.allSubscriptionPrices.isEmpty) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator(color: ColorManager.primary)),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            title: Text(S.of(context).Subscriptions),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: AppPadding.p20, right: AppPadding.p20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(),
                                    backgroundColor: ColorManager.white,
                                  ),
                                  onPressed: () {
                                    cubit.changeSubYearly(state: true);
                                  },
                                  child: Text(
                                    S.of(context).yearly,
                                    style: TextStyle(
                                        color: (cubit.subYearly)
                                            ? ColorManager.primary
                                            : ColorManager.grey),
                                  )),
                            ),
                            Container(
                                height: 3,
                                color: (cubit.subYearly)
                                    ? ColorManager.primary
                                    : ColorManager.grey)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(),
                                    backgroundColor: ColorManager.white,
                                  ),
                                  onPressed: () {
                                    cubit.changeSubYearly(state: false);
                                  },
                                  child: Text(
                                    S.of(context).monthly,
                                    style: TextStyle(
                                        fontFamily: 'Hacen Tunisia',
                                        color: (cubit.subYearly == false)
                                            ? ColorManager.primary
                                            : ColorManager.grey),
                                  )),
                            ),
                            Container(
                                height: 3,
                                color: (cubit.subYearly == false)
                                    ? ColorManager.primary
                                    : ColorManager.grey)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s24,
                  ),
                  SizedBox(
                    height: 290,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: 270,
                            child: Card(
                              elevation: 1,
                              color: ColorManager.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: AppPadding.p12,
                                    left: AppPadding.p12,
                                    bottom: AppPadding.p12,
                                    top: AppPadding.p40),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                        S.of(context).goldSubscription,
                                        style: const TextStyle(
                                            fontSize: FontSize.s14,
                                            fontFamily: 'assets/font/Hacen Tunisia.ttf',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s16,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Image(
                                                  image: AssetImage(
                                                      ImageAssets.search)),
                                              const SizedBox(
                                                width: AppSize.s4,
                                              ),
                                              Text(
                                                S.of(context).fullSearch,
                                                style: const TextStyle(
                                                    fontSize: FontSize.s12,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Image(
                                                  image: AssetImage(
                                                      ImageAssets.calculator)),
                                              const SizedBox(
                                                width: AppSize.s4,
                                              ),
                                              Text(
                                                S.of(context).calculator,
                                                style: const TextStyle(
                                                    fontSize: FontSize.s12,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: AppSize.s12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Image(
                                                image: AssetImage(
                                                    IconAssets.listIcon),
                                                width: 16,
                                                height: 16,
                                              ),
                                              const SizedBox(
                                                width: AppSize.s4,
                                              ),
                                              Text(
                                                S.of(context).priceList,
                                                style: const TextStyle(
                                                    fontSize: FontSize.s12,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Image(
                                                  image: AssetImage(
                                                      ImageAssets.book)),
                                              const SizedBox(
                                                width: AppSize.s4,
                                              ),
                                              Text(
                                                S.of(context).MyCatalog,
                                                style: const TextStyle(
                                                    fontSize: FontSize.s12,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: AppSize.s12,
                                      ),
                                      Row(
                                        children: [
                                          const Image(
                                              image:
                                                  AssetImage(ImageAssets.user)),
                                          const SizedBox(
                                            width: AppSize.s4,
                                          ),
                                          Text(
                                            '2 ${S.of(context).users}',
                                            style: const TextStyle(
                                                fontSize: FontSize.s12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: AppSize.s12,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          (cubit.subYearly)?'${cubit.allSubscriptionPrices[2].totalYearlyPrice}/${S.of(context).yearly}':
                                          '${cubit.allSubscriptionPrices[2].totalMonthlyPrice}/${S.of(context).monthly}',
                                          style: TextStyle(
                                              fontSize: FontSize.s14,
                                              fontWeight: FontWeight.bold,
                                              color: ColorManager.primary),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s16,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8))),
                                              backgroundColor:
                                                  ColorManager.primary,
                                            ),
                                            onPressed: () {
                                              cubit.createDataRequest['subscriptionType']='Gold';
                                              if(cubit.subYearly)
                                                {
                                                  cubit.cost=cubit.allSubscriptionPrices[2].totalYearlyPrice??0;
                                                }
                                              else
                                                {
                                                  cubit.cost=cubit.allSubscriptionPrices[2].totalMonthlyPrice??0;
                                                }
                                              cubit.createDataRequest['cost']=cubit.cost;
                                              Navigation.navigatorTo(context, const SubscriptionRequestPage());
                                            },
                                            child: Text(
                                              S.of(context).payNow,
                                              style: TextStyle(
                                                  color: ColorManager.white),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Image(image: AssetImage(ImageAssets.subLogo)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  SizedBox(
                    height: 290,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: 270,
                            child: Card(
                              elevation: 1,
                              color: ColorManager.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: AppPadding.p12,
                                    left: AppPadding.p12,
                                    bottom: AppPadding.p12,
                                    top: AppPadding.p40),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(
                                        S.of(context).platinumSubscription,
                                        style: const TextStyle(
                                            fontSize: FontSize.s14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s16,
                                      ),
                                      Row(
                                        children: [
                                          const Image(
                                              image:
                                                  AssetImage(ImageAssets.search)),
                                          const SizedBox(
                                            width: AppSize.s4,
                                          ),
                                          Text(
                                            S.of(context).fullSearch,
                                            style: const TextStyle(
                                                fontSize: FontSize.s12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: AppSize.s12,
                                      ),
                                      Row(
                                        children: [
                                          const Image(
                                            image:
                                                AssetImage(IconAssets.listIcon),
                                            width: 16,
                                            height: 16,
                                          ),
                                          const SizedBox(
                                            width: AppSize.s4,
                                          ),
                                          Text(
                                            S.of(context).priceList,
                                            style: const TextStyle(
                                                fontSize: FontSize.s12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: AppSize.s12,
                                      ),
                                      Row(
                                        children: [
                                          const Image(
                                              image:
                                                  AssetImage(ImageAssets.user)),
                                          const SizedBox(
                                            width: AppSize.s4,
                                          ),
                                          Text(
                                            '1 ${S.of(context).users}',
                                            style: const TextStyle(
                                                fontSize: FontSize.s12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: AppSize.s12,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          (cubit.subYearly)?'${cubit.allSubscriptionPrices[1].totalYearlyPrice}/${S.of(context).yearly}':
                                          '${cubit.allSubscriptionPrices[1].totalMonthlyPrice}/${S.of(context).monthly}',
                                          style: TextStyle(
                                              fontSize: FontSize.s14,
                                              fontWeight: FontWeight.bold,
                                              color: ColorManager.grey),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s16,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8))),
                                              backgroundColor: ColorManager.grey,
                                            ),
                                            onPressed: () {
                                              cubit.createDataRequest['subscriptionType']='Platinum';
                                              if(cubit.subYearly)
                                              {
                                                cubit.cost=cubit.allSubscriptionPrices[1].totalYearlyPrice??0;
                                              }
                                              else
                                              {
                                                cubit.cost=cubit.allSubscriptionPrices[1].totalMonthlyPrice??0;
                                              }
                                              cubit.createDataRequest['cost']=cubit.cost;
                                              Navigation.navigatorTo(context, const SubscriptionRequestPage());
                                            },
                                            child: Text(
                                              S.of(context).payNow,
                                              style: TextStyle(
                                                  color: ColorManager.white),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Image(
                            image: const AssetImage(ImageAssets.subLogo),
                            color: ColorManager.grey),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  SizedBox(
                    height: 450,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: 430,
                            child: Card(
                              elevation: 1,
                              color: ColorManager.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: AppPadding.p12,
                                    left: AppPadding.p12,
                                    bottom: AppPadding.p12,
                                    top: AppPadding.p40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        S.of(context).broSubscription,
                                        style: const TextStyle(
                                            fontSize: FontSize.s14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSize.s16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 12,
                                          width: 12,
                                          child: Checkbox(
                                            value: true,
                                            onChanged: (v) {},
                                            activeColor: ColorManager.broColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: AppSize.s4,
                                        ),
                                        Text(
                                          S.of(context).fullSearch,
                                          style: const TextStyle(
                                              fontSize: FontSize.s12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: AppSize.s8,
                                    ),
                                    Wrap(
                                      runSpacing: 10,
                                      spacing: 10,
                                      children: [
                                        SizedBox(
                                          height: 22,
                                          width: 60,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              cubit.changeBroSearch(index: 0);
                                              cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape:  RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    color: ColorManager.broColor
                                                  ),
                                                    borderRadius: const BorderRadiusDirectional.all(Radius.circular(8))),
                                                backgroundColor:(cubit.chooseFullBroSearch[0])?ColorManager.broColor:ColorManager.white,
                                                padding:
                                                    const EdgeInsets.all(0)),
                                            child: Text(
                                              '500 ${S.of(context).search}',
                                              style: TextStyle(
                                                  fontSize: FontSize.s8,
                                                  color: (cubit.chooseFullBroSearch[0])?ColorManager.white:ColorManager.broColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 22,
                                          width: 60,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              cubit.changeBroSearch(index: 1);
                                              cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape:  RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: ColorManager.broColor
                                                    ),
                                                    borderRadius:
                                                        const BorderRadiusDirectional
                                                            .all(
                                                                Radius.circular(
                                                                    8))),
                                                backgroundColor:(cubit.chooseFullBroSearch[1])?ColorManager.broColor:ColorManager.white,
                                                padding:
                                                    const EdgeInsets.all(0)),
                                            child: Text(
                                              '1000 ${S.of(context).search}',
                                              style: TextStyle(
                                                  fontSize: FontSize.s8,
                                                  color: (cubit.chooseFullBroSearch[1])?ColorManager.white:ColorManager.broColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 22,
                                          width: 60,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              cubit.changeBroSearch(index: 2);
                                              cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape:  RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: ColorManager.broColor
                                                    ),
                                                    borderRadius:
                                                        const BorderRadiusDirectional
                                                            .all(
                                                                Radius.circular(
                                                                    8))),
                                                backgroundColor:(cubit.chooseFullBroSearch[2])?ColorManager.broColor:ColorManager.white,
                                                padding:
                                                    const EdgeInsets.all(0)),
                                            child: Text(
                                              '2000 ${S.of(context).search}',
                                              style: TextStyle(
                                                  fontSize: FontSize.s8,
                                                  color: (cubit.chooseFullBroSearch[2])?ColorManager.white:ColorManager.broColor,),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 22,
                                          width: 60,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              cubit.changeBroSearch(index: 3);
                                              cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                shape:  RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: ColorManager.broColor
                                                    ),
                                                    borderRadius:
                                                        const BorderRadiusDirectional
                                                            .all(
                                                                Radius.circular(
                                                                    8))),
                                                backgroundColor:
                                                (cubit.chooseFullBroSearch[3])?ColorManager.broColor:ColorManager.white,
                                                padding:
                                                    const EdgeInsets.all(0)),
                                            child: Text(
                                              '3000 ${S.of(context).search}',
                                              style: TextStyle(
                                                  fontSize: FontSize.s8,
                                                  color: (cubit.chooseFullBroSearch[3])?ColorManager.white:ColorManager.broColor,),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          (cubit.subYearly)? '${cubit.broFullSearchPriceYear}\$'
                                              :'${cubit.broFullSearchPriceMonth}\$',
                                          style: TextStyle(
                                              fontSize: FontSize.s14,
                                              color: ColorManager.black),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: AppSize.s12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 12,
                                          width: 12,
                                          child: Checkbox(
                                            value: true,
                                            onChanged: (v) {},
                                            activeColor: ColorManager.broColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: AppSize.s4,
                                        ),
                                        Text(
                                          '1 ${S.of(context).users}',
                                          style: const TextStyle(
                                              fontSize: FontSize.s12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: AppSize.s12,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 22,
                                                width: 60,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    cubit.changeUsersBroSubscription(index: 0);
                                                    cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      shape: RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: ColorManager.broColor
                                                          ),
                                                          borderRadius:
                                                              const BorderRadiusDirectional
                                                                  .all(Radius
                                                                      .circular(
                                                                          8))),
                                                      backgroundColor:
                                                      (cubit.chooseUsersBroSubscription[0])?ColorManager.broColor:ColorManager.white,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0)),
                                                  child: Text(
                                                    '500 ${S.of(context).search}',
                                                    style: TextStyle(
                                                        fontSize: FontSize.s8,
                                                        color:
                                                        (cubit.chooseUsersBroSubscription[0])?ColorManager.white:ColorManager.broColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: AppSize.s10,
                                              ),
                                              SizedBox(
                                                height: 22,
                                                width: 60,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    cubit.changeUsersBroSubscription(index: 1);
                                                    cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      shape:  RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: ColorManager.broColor
                                                          ),
                                                          borderRadius:
                                                              const BorderRadiusDirectional
                                                                  .all(Radius
                                                                      .circular(
                                                                          8))),
                                                      backgroundColor:
                                                      (cubit.chooseUsersBroSubscription[1])?ColorManager.broColor:ColorManager.white,

                                                      padding:
                                                          const EdgeInsets.all(
                                                              0)),
                                                  child: Text(
                                                    '1000 ${S.of(context).search}',
                                                    style: TextStyle(
                                                        fontSize: FontSize.s8,
                                                        color:
                                                        (cubit.chooseUsersBroSubscription[1])?ColorManager.white:ColorManager.broColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: AppSize.s10,
                                              ),
                                              SizedBox(
                                                height: 22,
                                                width: 60,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    cubit.changeUsersBroSubscription(index: 2);
                                                    cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      shape:  RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              color: ColorManager.broColor
                                                          ),
                                                          borderRadius:
                                                              const BorderRadiusDirectional
                                                                  .all(Radius
                                                                      .circular(
                                                                          8))),
                                                      backgroundColor:
                                                      (cubit.chooseUsersBroSubscription[2])?ColorManager.broColor:ColorManager.white,

                                                      padding:
                                                          const EdgeInsets.all(
                                                              0)),
                                                  child: Text(
                                                    '2000 ${S.of(context).search}',
                                                    style: TextStyle(
                                                        fontSize: FontSize.s8,
                                                        color:
                                                        (cubit.chooseUsersBroSubscription[2])?ColorManager.white:ColorManager.broColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            (cubit.subYearly)? '${cubit.broCountUsersPriceYear}\$'
                                                :'${cubit.broCountUsersPriceMonth}\$',
                                            style: TextStyle(
                                                fontSize: FontSize.s14,
                                                color: ColorManager.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSize.s12,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          broPriceLit=!broPriceLit;
                                        });
                                        cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 12,
                                                width: 12,
                                                child: Checkbox(
                                                  value: broPriceLit,
                                                  onChanged: (value) {
                                                  },
                                                  activeColor:
                                                  ColorManager.broColor,
                                                  side: MaterialStateBorderSide.resolveWith(
                                                          (states) => BorderSide(width: 2.0, color: ColorManager.broColor),),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: AppSize.s8,
                                              ),
                                              Text(
                                                S.of(context).priceList,
                                                style: const TextStyle(
                                                    fontSize: FontSize.s14,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            (cubit.subYearly)?'${cubit.allSubscriptionPrices[0].year?.priceList}\$':'${cubit.allSubscriptionPrices[0].month?.priceList}\$',
                                            style: TextStyle(
                                                fontSize: FontSize.s14,
                                                color: ColorManager.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSize.s12,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          myCatalog=!myCatalog;
                                        });
                                        cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 12,
                                                width: 12,
                                                child: Checkbox(
                                                  value: myCatalog,
                                                  onChanged: (value) {},
                                                  activeColor:
                                                      ColorManager.broColor,
                                                  side: MaterialStateBorderSide.resolveWith(
                                                        (states) => BorderSide(width: 2.0, color: ColorManager.broColor),),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: AppSize.s8,
                                              ),
                                              Text(
                                                S.of(context).MyCatalog,
                                                style: const TextStyle(
                                                    fontSize: FontSize.s14,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            (cubit.subYearly)?'${cubit.allSubscriptionPrices[0].year?.myCatalog}\$':'${cubit.allSubscriptionPrices[0].month?.myCatalog}\$',
                                            style: TextStyle(
                                                fontSize: FontSize.s14,
                                                color: ColorManager.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSize.s12,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          calculator=!calculator;
                                        });
                                        cubit.calculateTotalBroPrice(other: [broPriceLit,myCatalog,calculator]);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 12,
                                                width: 12,
                                                child: Checkbox(
                                                  value: calculator,
                                                  onChanged: (value) {},
                                                  activeColor:
                                                      ColorManager.broColor,
                                                  side: MaterialStateBorderSide.resolveWith(
                                                        (states) => BorderSide(width: 2.0, color: ColorManager.broColor),),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: AppSize.s8,
                                              ),
                                              Text(
                                                S.of(context).calculator,
                                                style: const TextStyle(
                                                    fontSize: FontSize.s14,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            (cubit.subYearly)?'${cubit.allSubscriptionPrices[0].year?.calculator}\$':'${cubit.allSubscriptionPrices[0].month?.calculator}\$',
                                            style: TextStyle(
                                                fontSize: FontSize.s14,
                                                color: ColorManager.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSize.s12,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            S.of(context).totalPrice,
                                            style: TextStyle(
                                                fontSize: FontSize.s14,
                                                fontWeight: FontWeight.bold,
                                                color: ColorManager.broColor),
                                            textAlign: TextAlign.end,
                                          ),
                                          Text(
                                            '${cubit.totalBroPrice}\$',
                                            style: TextStyle(
                                                fontSize: FontSize.s14,
                                                fontWeight: FontWeight.bold,
                                                color: ColorManager.grey),
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSize.s16,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8))),
                                            backgroundColor: ColorManager.broColor,
                                          ),
                                          onPressed: () {
                                            cubit.createDataRequest['subscriptionType']='Bro';
                                            if(cubit.subYearly)
                                            {
                                              cubit.cost=cubit.totalBroPrice;
                                            }
                                            else
                                            {
                                              cubit.cost=cubit.totalBroPrice;
                                            }
                                            cubit.createDataRequest['cost']=cubit.cost;
                                            Navigation.navigatorTo(context, const SubscriptionRequestPage());
                                          },
                                          child: Text(
                                            S.of(context).payNow,
                                            style: TextStyle(
                                                color: ColorManager.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Image(
                            image: const AssetImage(ImageAssets.subLogo),
                            color: ColorManager.broColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
