import 'package:cat_price/features/electronics/presention/views/widgets/electronics_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_price/features/electronics/presention/views/product_details_view.dart';

import '../manager/electronics/electronics_cubit.dart';
import 'electronics_view.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key, required this.title, required this.type})
      : super(key: key);
  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {
    ElectronicsCubit.get(context).getItems(type: type!);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading:IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ElectronicsView(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),

          elevation: 0,
        ),
        body: BlocBuilder<ElectronicsCubit, ElectronicsState>(
          builder: (context, state) {
            if (state is ElectronicsInitial) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is GetItemsFailure) {
              return Center(
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
                            builder: (context) => ProductListView(
                              title: title,
                              type: type,
                            ),
                          ));
                        },
                        child: const Icon(Icons.restart_alt_outlined))
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: ElectronicsCubit.get(context).items.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetailsView(
                        title: title,
                        product: ElectronicsCubit.get(context).items[index],
                        type: type,
                        itemIndex: index,
                      ),
                    ));
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    color: Colors.white,
                    shadowColor: Colors.white,
                    elevation: 0.4,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(15),
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            image: ElectronicsCubit.get(context)
                                        .items[index]
                                        .image !=
                                    null
                                ? DecorationImage(
                                    image: NetworkImage(
                                        ElectronicsCubit.get(context)
                                            .items[index]
                                            .image!),
                                    fit: BoxFit.cover)
                                : const DecorationImage(
                                    image:
                                        AssetImage('assets/details_image.png'),
                                    fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15),
                            // shape: BoxShape.circle
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ElectronicsCubit.get(context).items[index].name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                                "${ElectronicsCubit.get(context).items[index].price} \$",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.yellow)),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
