import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/cubit.dart';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/state.dart';
import 'package:cat_price/features/Home/presention/views/widgets/pgm_table.dart';
import 'package:cat_price/features/Home/presention/views/widgets/tools_list.dart';
import 'package:cat_price/generated/l10n.dart';

import '../../../../../core/SharedPreference.dart';
import '../../manager/metals_cubit/cubit.dart';
import '../../manager/metals_cubit/state.dart';
import '../search_view.dart';
import 'most_searched_list.dart';
import 'moving_text.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MetalsCubit, MetalsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xffFBC821),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(28),
                        bottomLeft: Radius.circular(28))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi ${Preference.getData(key: 'name')}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      S.of(context).LetsStartNow,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: SearchBar(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchView()));
                        },
                        leading: const Icon(FontAwesomeIcons.magnifyingGlass,
                            color: Color(0xff9094A0)),
                        hintText: S.of(context).Search,
                        hintStyle: const MaterialStatePropertyAll(TextStyle(
                          color: Color(0xFF9094A0),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                        trailing: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.image_outlined,
                              color: Color(0Xff9094A0),
                            ),
                          )
                        ],
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 20)),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 15.5),
                child: Text(
                  S.of(context).MyTools,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const ToolsList(),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 24),
                child: Text(
                  S.of(context).PGMPrices,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24, top: 5),
                child: Text(
                  '20 February 2023',
                  style: TextStyle(
                    color: Color(0xFF9094A0),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const PGMTable(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.5, horizontal: 24),
                child: Text(
                  S.of(context).TheMostSearched,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ConditionalBuilder(
                condition: BlocProvider.of<MetalsCubit>(context)
                        .mostSearchedModel
                        ?.items !=
                    null,
                builder: (context) => const MostSearchedList(),
                fallback: (context) => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: const MovingText(),
              ),
            ],
          ),
        );
      },
    );
  }
}
