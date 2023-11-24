import 'package:cat_price/features/cat-price-feature/presentation/price_list/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/cubit.dart';
import 'package:cat_price/features/Home/presention/views/home_view.dart';
import 'package:cat_price/features/cat-price-feature/presentation/price_list/all_my_List_screen.dart';
import 'package:cat_price/features/conect%20us-feature/screens/conect-screen.dart';
import 'package:cat_price/features/inbox-feature/screens/inbox-screen.dart';
import 'package:cat_price/features/settings/screens/brand/brand_screen.dart';
import 'package:cat_price/features/settings/screens/setting/setting_screen.dart';
import 'package:cat_price/generated/l10n.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/SharedPreference.dart';
import '../../../../Calculater/presention/views/calculater_view.dart';
import '../../../../subscripation-feature/subscription_view/subscription_home_page.dart';
import '../Favourite_view.dart';
import '../search_view.dart';
import 'drawer_item.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 48, left: 24, top: 38, bottom: 102),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/splash_screen.png"),
                radius: 24,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${Preference.getData(key: 'name')}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${Preference.getData(key: 'email')}',
                    style: const TextStyle(
                      color: Color(0xFF9094A0),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 38, top: 10),
            child: Container(
              width: double.infinity,
              color: Colors.grey[400],
              height: 1,
            ),
          ),
          DrawerItem(
            icon: FontAwesomeIcons.magnifyingGlass,
            text: S.of(context).Searchitems,
            ontab: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchView(),
                  ));
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.favorite_border,
            text: S.of(context).Favourite,
            ontab: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouriteView(),
                  ));
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.calculate,
            text: S.of(context).Calculator,
            ontab: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalculaterView(),
                  ));
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.list_alt,
            text: S.of(context).Mylists,
            ontab: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyListScreen(),
                  ));
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.star,
            text: S.of(context).Brands,
            ontab: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BrandScreen();
              }));
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.move_to_inbox,
            text: S.of(context).Inbox,
            ontab: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const InboxScreen();
              }));
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.call,
            text: S.of(context).Contactus,
            ontab: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ConnectUsScreen();
              }));
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.settings,
            text: S.of(context).Settings,
            ontab: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SettingScreen();
              }));
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.share,
            text: S.of(context).Shareapp,
            ontab: () {
              Share.share(
                  "https://play.google.com/store/apps/details?id=com.example.cat_price");
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.subscriptions,
            text: S.of(context).Subscriptions,
            ontab: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SubscriptionHomePage();
                  },
                ),
              );
            },
          ),
          const Spacer(),
          DrawerItem(
            icon: Icons.logout,
            text: S.of(context).Logout,
            ontab: () async {
              await BlocProvider.of<AuthCubit>(context).logout(context);
            },
          )
        ],
      ),
    );
  }
}
