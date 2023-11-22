import 'package:animate_do/animate_do.dart';
import 'package:cat_price/features/settings/screens/brand/brand_de.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';

import 'package:cat_price/features/settings/controller/setting_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../generated/l10n.dart';

import '../../controller/setting_cubit.dart';

class BrandScreen extends StatelessWidget {
  BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit()..getBrand(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: const Color(0xffffffff),
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              title: Text(
                S.of(context).Brands,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              centerTitle: true,
            ),
            body: (state is GetBrandSuccess)
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 280.0,
                      maxCrossAxisExtent: 222.0,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ScreenDetailsBrand(name: state.brand[index].name!);
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      const BorderRadiusDirectional.only(
                                    topEnd: Radius.circular(12),
                                    topStart: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    state.brand[index].image == null
                                        ? "https://img.freepik.com/premium-vector/flat-design-no-photo-sign_23-2149259324.jpg?w=740"
                                        : state.brand[index].image is String
                                            ? state.brand[index].imageString
                                                .toString()
                                            : state.brand[index].image!.url
                                                .toString(),
                                    height: 188,
                                    width: 188,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      state.brand[index].name.toString(),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),

                                // const SizedBox(
                                //   height: 10,
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: SizedBox(
                                //     width: double.infinity,
                                //     child: Text(
                                //       state.brand[index].name.toString(),
                                //       textAlign: TextAlign.center,
                                //       maxLines: 2,
                                //       overflow: TextOverflow.ellipsis,
                                //       style: const TextStyle(
                                //         color: Colors.black,
                                //         fontSize: 16,
                                //         fontFamily: 'Poppins',
                                //         fontWeight: FontWeight.w500,
                                //         height: 0,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: state.brand.length,
                  )
                : GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: 280.0,
                      maxCrossAxisExtent: 222.0,
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FadeIn(
                          duration: const Duration(milliseconds: 400),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade600,
                            child: Card(
                              elevation: 3,
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  style: BorderStyle.none,
                                ),
                              ),
                              child: const SizedBox(
                                height: 150,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
          );
        },
      ),
    );
  }
}
