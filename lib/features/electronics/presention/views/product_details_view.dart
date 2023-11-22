import 'package:cat_price/features/electronics/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import '../manager/electronics/electronics_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView(
      {Key? key,
      required this.title,
      required this.product,
      required this.itemIndex})
      : super(key: key);
  final String title;
  final int itemIndex;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: product.image != null
                    ? DecorationImage(
                        image: NetworkImage(product.image!.url),
                        fit: BoxFit.cover)
                    : const DecorationImage(
                        image: AssetImage('assets/details_image.png'),
                        fit: BoxFit.cover),
                // shape: BoxShape.circle
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
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
                '${product.name} $title',
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
              const Divider(),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: S.of(context).price,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.amber)),
                  TextSpan(
                      text: ': ${product.price} AED',
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black)),
                ]),
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              Text(
                S.of(context).Similar_Products,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              BlocBuilder<ElectronicsCubit, ElectronicsState>(
                builder: (context, state) {
                  if (state is GetItemsSuccess) {
                    return SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ElectronicsCubit.get(context).items.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              index == itemIndex
                                  ? null
                                  : Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailsView(
                                          title: title,
                                          itemIndex: index,
                                          product: ElectronicsCubit.get(context)
                                              .items[index],
                                        ),
                                      ),
                                    );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: product.image != null
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                  product.image!.url),
                                              fit: BoxFit.cover)
                                          : const DecorationImage(
                                              image: AssetImage(
                                                  'assets/details_image.png'),
                                              fit: BoxFit.cover),
                                      // shape: BoxShape.circle
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8.0,
                                    left: 8.0,
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      color: Colors.black.withOpacity(0.5),
                                      child: Text(
                                        ElectronicsCubit.get(context)
                                            .items[index]
                                            .name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is GetItemsFailure) {
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.error,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductDetailsView(
                                    title: title,
                                    itemIndex: itemIndex,
                                    product: product,
                                  ),
                                ));
                              },
                              child: Icon(Icons.restart_alt_outlined))
                        ],
                      ),
                    );
                  }
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                },
              )
            ],
          ),
        )
      ],
    ));
  }
}
