import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:cat_price/features/Authentication/presention/views/widgets/customTextField.dart';
import 'package:cat_price/features/Home/presention/views/widgets/favourite_body.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../generated/l10n.dart';
import '../../../conect us-feature/component/Text from-component.dart';
import '../../data/models/search_item_model.dart';
import '../manager/metals_cubit/cubit.dart';
import '../manager/metals_cubit/state.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  List<Item> items = [];
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MetalsCubit()..getFavorites(),
      child: BlocConsumer<MetalsCubit, MetalsState>(
        listener: (context, state) {
          if (state is SearchSuccessState) {
            items.addAll(state.searchResults);
          }

          if (state is FavActionSuccessState) {
            Fluttertoast.showToast(
              msg: "Add To Favorites SUCCESSFULLY",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        builder: (context, state) {
          var cubit = MetalsCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: const Color(0xffffffff),
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  MyTextField(
                    onChanged: (p0) {
                      items.clear();
                      cubit.searchCatlog(name: p0);
                    },
                    onSubmited: (p0) {
                      items.clear();
                      cubit.searchCatlog(name: p0);
                    },
                    emailController: searchController,
                    hintText: S.of(context).search,
                    prefixIcon: IconButton(
                      onPressed: () {
                        cubit.searchCatlog(name: searchController.text);
                      },
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                  if (state is SearchLoadingState)
                    const LinearProgressIndicator(),
                  if (state is intialState)
                    Image.network(
                        'https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-10730.jpg?w=740&t=st=1700081268~exp=1700081868~hmac=d7bd9972931dcdaaca18cdf45e1f47e71514a3676bb09a73c2ef08618971ac10'),
                  SizedBox(
                    height: 20,
                  ),
                  if (items.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialog(
                                    index: index,
                                    item: items,
                                    cubit: cubit,
                                  ); // Your custom dialog
                                },
                              );
                            },
                            child: FavouriteItem(
                              item: items[index],
                              cubit: cubit,
                            ),
                          );
                        },
                        itemCount: items.length,
                      ),
                    ),
                  if (state is SearchSuccessState && items.isEmpty)
                    Image.network(
                        'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?w=740&t=st=1700081073~exp=1700081673~hmac=55f4f18bf809a7d2c9e9ae204866c3b7e5308ec18fe5caebb138f5e1ed565c64'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({
    super.key,
    required this.item,
    required this.cubit,
  });
  final Item item;
  final MetalsCubit cubit;
  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Container(
        width: double.infinity,
        height: 118,
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 76,
              height: 94,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.item.image == null
                        ? "https://img.freepik.com/premium-vector/flat-design-no-photo-sign_23-2149259324.jpg?w=740"
                        : widget.item.image is String
                            ? widget.item.image
                            : widget.item.image!.url.toString(),
                  ),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.name.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xFF110317),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.item.price.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xFFFBC821),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: Text(
                    widget.item.brand.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xFF9094A0),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                print('object');
                widget.item.isFavorite = !widget.item.isFavorite!;
                print(widget.item.isFavorite);
                widget.cubit.addFav(
                  itemId: widget.item.id,
                  favListId: widget.cubit.idFavList,
                );
                setState(() {});
              },
              icon: Icon(
                widget.item.isFavorite == true
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: widget.item.isFavorite == true
                    ? Color(0xffFBC821)
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  CustomDialog({
    super.key,
    required this.item,
    required this.index,
    required this.cubit,
  });
  List<Item> item;
  dynamic index;
  final MetalsCubit cubit;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.item[widget.index].imageList.isEmpty
                ? Container(
                    width: double.infinity,
                    height: 200,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          widget.item[widget.index].image == null
                              ? "https://img.freepik.com/premium-vector/flat-design-no-photo-sign_23-2149259324.jpg?w=740"
                              : widget.item[widget.index].image is String
                                  ? widget.item[widget.index].image
                                  : widget.item[widget.index].image!.url
                                      .toString(),
                        ),
                      ),
                    ),
                  )
                : CarouselSlider(
                    items: widget.item[widget.index].imageList.map((e) {
                      return Container(
                        width: double.infinity,
                        height: 200,
                        alignment: AlignmentDirectional.center,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(e.url),
                        )),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.linear,
                      height: 200,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      enableInfiniteScroll: true,
                      initialPage: 0,
                      reverse: false,
                      viewportFraction: 1.0,
                    ),
                  ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item[widget.index].name.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Color(0xFF110317),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.item[widget.index].price.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Color(0xFFFBC821),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: Text(
                        widget.item[widget.index].brand.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xFF9094A0),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    print('object');
                    widget.item[widget.index].isFavorite =
                        !widget.item[widget.index].isFavorite!;
                    widget.cubit.addFav(
                      itemId: widget.item[widget.index].id,
                      favListId: widget.cubit.idFavList,
                    );
                    setState(() {});
                  },
                  icon: Icon(
                    widget.item[widget.index].isFavorite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.item[widget.index].isFavorite == true
                        ? Color(0xffFBC821)
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
                child: OutlinedButton(
              onPressed: () {
                widget.item[widget.index].isFavorite =
                    !widget.item[widget.index].isFavorite!;
                widget.cubit.addFav(
                  itemId: widget.item[widget.index].id,
                  favListId: widget.cubit.idFavList,
                );
                setState(() {});
                Navigator.pop(context);
              },
              child: Text(
                !widget.item[widget.index].isFavorite!
                    ? "Add to Favorite"
                    : "Remove from Favorite",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: !widget.item[widget.index].isFavorite!
                        ? Colors.black
                        : Colors.amber),
              ),
            )),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.red),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
