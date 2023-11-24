import 'package:animate_do/animate_do.dart';
import 'package:cat_price/features/settings/controller/setting_cubit.dart';
import 'package:cat_price/features/settings/controller/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:shimmer/shimmer.dart';

import '../../../../generated/l10n.dart';
import '../../../Home/data/models/search_item_model.dart';
import '../../components/models/brand_model.dart';

class ScreenDetailsBrand extends StatelessWidget {
  ScreenDetailsBrand({
    super.key,
    required this.name,
    required this.brand,
    required this.index,
  });

  String name;
  Brand brand;
  dynamic index;

  @override
  Widget build(BuildContext context) {
    List<Brand> item = [];
    return BlocProvider(
      create: (context) => SettingCubit()
        ..getDetailsBrand(
          name: name,
        ),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          if (state is GetBrandSuccess) {
            item.addAll(state.brand);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return ListView(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: ShapeDecoration(
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
                            image: DecorationImage(
                              image: NetworkImage(
                                brand.image == null
                                    ? "https://img.freepik.com/premium-vector/flat-design-no-photo-sign_23-2149259324.jpg?w=740"
                                    : brand.image is String
                                        ? brand.imageString.toString()
                                        : brand.image!.url.toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${brand.name}     ${brand.details}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                              height: 1,
                              width: 60,
                              child: Divider(
                                color: Colors.yellow,
                                thickness: 3,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            S.of(context).BrandDeta,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          (state is GetBrandLoading)
                              ? SizedBox(
                                  height: MediaQuery.sizeOf(context).height,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      mainAxisExtent: 250.0,
                                      maxCrossAxisExtent: 190.0,
                                    ),
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FadeIn(
                                          duration:
                                              const Duration(milliseconds: 400),
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey.shade700,
                                            highlightColor:
                                                Colors.grey.shade600,
                                            child: Card(
                                              elevation: 3,
                                              shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
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
                                  ),
                                )
                              : SizedBox(
                                  height: MediaQuery.sizeOf(context).height,
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      mainAxisExtent: 250.0,
                                      maxCrossAxisExtent: 190.0,
                                    ),
                                    itemCount: item.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Container(
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                shadows: const [
                                                  BoxShadow(
                                                    color: Color(0x14000000),
                                                    blurRadius: 10,
                                                    offset: Offset(0, 0),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    item[index].image == null
                                                        ? "https://img.freepik.com/premium-vector/flat-design-no-photo-sign_23-2149259324.jpg?w=740"
                                                        : item[index].image
                                                                is String
                                                            ? item[index]
                                                                .imageString
                                                                .toString()
                                                            : item[index]
                                                                .image!
                                                                .url
                                                                .toString(),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: ShapeDecoration(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                shadows: const [
                                                  BoxShadow(
                                                    color: Color(0x14000000),
                                                    blurRadius: 10,
                                                    offset: Offset(0, 0),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      item[index]
                                                          .price
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.amber,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      item[index]
                                                          .name
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),


                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
