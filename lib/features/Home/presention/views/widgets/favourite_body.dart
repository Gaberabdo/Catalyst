import 'package:animate_do/animate_do.dart';
import 'package:cat_price/features/Home/presention/manager/metals_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:shimmer/shimmer.dart';

import '../../../data/models/search_item_model.dart';
import '../../manager/metals_cubit/cubit.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> item = [];

    return BlocProvider(
      create: (context) => MetalsCubit()..getFavorites(),
      child: BlocConsumer<MetalsCubit, MetalsState>(
        listener: (context, state) {
          if (state is FavSuccessState) {
            item.addAll(state.favResults);
          }
          if(state is FavActionSuccessState){
            item.clear();
            MetalsCubit.get(context).getFavorites();
          }
        },
        builder: (context, state) {
          var cubit = MetalsCubit.get(context);
          if (state is FavLoadingState) {
            return ListView.builder(
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
                          height: 118,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 10,
            );
          } else if (state is FavSuccessState && item.isNotEmpty) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: item.length,
              itemBuilder: (context, index) {
                return FavouriteItem(
                  item: item[index],
                  cubit: cubit,
                );
              },
            );
          } else {
            return Center(
              child: Image.network(
                "https://img.freepik.com/free-vector/social-network-profile-famous-blogger-influencer-cartoon-color-character-photo-likes-reposts-internet-popularity-fame-celebrity-vector-isolated-concept-metaphor-illustration_335657-2706.jpg?w=740&t=st=1700581598~exp=1700582198~hmac=3683de98d538d74123a5ca0dbe40a859bc7f40f457e04893451388e0d0e7e984",
              ),
            );
          }
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
