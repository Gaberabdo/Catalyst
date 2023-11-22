// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../controllers/electronics/electronics_cubit.dart';
//
// class ProductDetailsViewBody extends StatelessWidget {
//   const ProductDetailsViewBody({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ElectronicsCubit, ElectronicsState>(
//       builder: (context, state) {
//         if (state is GetItemsSuccess) {
//           return ListView(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height * 0.4,
//                     decoration: BoxDecoration(
//                       image: product.image != null
//                           ? DecorationImage(
//                           image: NetworkImage(product.image!),
//                           fit: BoxFit.cover)
//                           : DecorationImage(
//                           image: AssetImage('assets/details_image.png'),
//                           fit: BoxFit.cover),
//                       // shape: BoxShape.circle
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => ProductListView(
//                             title: title,
//                           ),
//                         ),
//                       );
//                     },
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${product.name} $title',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                         height: 1,
//                         width: 60,
//                         child: Divider(
//                           color: Colors.yellow,
//                           thickness: 3,
//                         )),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       '${product.manufacturer}',
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey),
//                     ),
//                     Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         RichText(
//                           text: TextSpan(children: [
//                             TextSpan(
//                                 text: '${product.price} AED',
//                                 style: TextStyle(
//                                     fontSize: 18, color: Colors.black)),
//                             TextSpan(
//                                 text: ' /piece',
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.yellow)),
//                           ]),
//                         ),
//                         RichText(
//                           text: TextSpan(children: [
//                             TextSpan(
//                                 text: '999 AED',
//                                 style: TextStyle(
//                                     fontSize: 18, color: Colors.black)),
//                             TextSpan(
//                                 text: ' /kilo',
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.yellow)),
//                           ]),
//                         ),
//                       ],
//                     ),
//                     Divider(),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Text(
//                       'Similar Products',
//                       style: TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.w500),
//                     ),
//                     SizedBox(
//                       height: 250,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: ElectronicsCubit.get(context).items.length,
//                         itemBuilder: (context, index) {
//                           return InkWell(
//                             onTap: () {
//                               index == itemIndex
//                                   ? null
//                                   : Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       ProductDetailsView(
//                                         title: title,
//                                         itemIndex: index,
//                                         product:
//                                         ElectronicsCubit.get(context)
//                                             .items[index],
//                                       ),
//                                 ),
//                               );
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     width: 180,
//                                     height: 250,
//                                     decoration: BoxDecoration(
//                                       image: product.image != null
//                                           ? DecorationImage(
//                                           image: NetworkImage(
//                                               product.image!),
//                                           fit: BoxFit.cover)
//                                           : DecorationImage(
//                                           image: AssetImage(
//                                               'assets/details_image.png'),
//                                           fit: BoxFit.cover),
//                                       // shape: BoxShape.circle
//                                     ),
//                                   ),
//                                   Positioned(
//                                     bottom: 8.0,
//                                     left: 8.0,
//                                     child: Container(
//                                       padding: EdgeInsets.all(8.0),
//                                       color: Colors.black.withOpacity(0.5),
//                                       child: Text(
//                                         "${ElectronicsCubit.get(context).items[index].name}",
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     ),;
//   }
// }
