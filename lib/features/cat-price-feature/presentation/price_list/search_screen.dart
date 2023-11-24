import 'package:cat_price/features/cat-price-feature/presentation/price_list/price_list_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/core-price-cat/models/search_model.dart';
import '../../../../core/core-price-cat/resources/color_manager.dart';
import '../../../../core/core-price-cat/resources/commen_widget/network_image.dart';
import '../../../../core/core-price-cat/resources/navigation.dart';
import '../../../../core/core-price-cat/resources/value_manager.dart';
import '../../../../generated/l10n.dart';
import '../../controller/cubit/price_list_cubit/price_cubit.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PriceCubit, PriceState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = PriceCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            title:  Text(S.of(context).searchItem),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: ColorManager.white,
                  elevation: 0.5,
                  child: TextFormField(
                    style: TextStyle(color: ColorManager.primary),
                    controller: _searchController,
                    cursorColor: ColorManager.primary,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: ColorManager.primary),
                        hintText: S.of(context).searchItem,
                        labelText: S.of(context).searchItem,
                        prefixIcon: const Icon(Icons.search),
                        border: InputBorder.none),
                    onChanged: (value) {
                      cubit.searchForItem(searchTerm: value.toString());
                    },
                  ),
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                    condition: cubit.searchModelList.isEmpty,
                    builder: (context)=> Center(child: Text(S.of(context).noItem)),
                    fallback: (context){
                      if(state is SearchForItemLodingState) {
                        return  Center(child: CircularProgressIndicator(color: ColorManager.primary,));
                      } else
                      {
                        return ListView.separated(
                            itemBuilder: (context, index) => itemSearchList(model: cubit.searchModelList[index]),
                            separatorBuilder: (context, index) => const SizedBox(
                              height: AppSize.s8,
                            ),
                            itemCount: cubit.searchModelList.length);
                      }
                    }
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget itemSearchList({required Items model}) {
    return Card(
      elevation: 1,
      color: ColorManager.white,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(5)),
              child: getImageFromNetwork(path: model.image?.url??''),
            ),
            const SizedBox(
              width: AppSize.s12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name.toString()),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                  Text(
                    model.price.toString(),
                    style: TextStyle(color: ColorManager.primary),
                  ),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: SizedBox(
                      height: 30,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.primary,
                              shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(5))),
                              padding: const EdgeInsets.only(
                                  right: 5, left: 5, top: 5, bottom: 5)),
                          onPressed: () {
                            PriceCubit.get(context).addNewPriceItem(item: model);
                            Navigation.navigatorTo(context, const PriceListScreen());
                          },
                          child: Text(
                            'Add To List',
                            style: TextStyle(
                                color: ColorManager.white, fontSize: 10),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
