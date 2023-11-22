import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cat_price/features/Home/presention/views/widgets/drawer_body.dart';
import 'package:cat_price/features/Home/presention/views/widgets/home_view_body.dart';

import '../manager/metals_cubit/cubit.dart';
import '../manager/metals_cubit/state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MetalsCubit, MetalsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color(0xffFBC821),
            elevation: 0,
            title: const Text(
              'Cat price',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.white,
                  ))
            ],
          ),
          drawer: const Drawer(
            child: DrawerBody(),
          ),
          body: const HomeViewBody(),
        );
      },
    );
  }
}
