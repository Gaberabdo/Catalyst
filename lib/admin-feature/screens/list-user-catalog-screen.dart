import 'package:admin_task/admin-feature/Controller/Models/catalog_model.dart';
import 'package:admin_task/admin-feature/Controller/cubit/category-cubit.dart';
import 'package:admin_task/admin-feature/Controller/cubit/category-state.dart';
import 'package:admin_task/admin-feature/screens/show-item-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../comoponents/Listview-of category-component.dart';
import '../comoponents/my-table.dart';
import '../comoponents/Text from-component.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getAdminCategory(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = CategoryCubit.get(context);
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(70),
                  child: buildTabBarItem(),
                ),
                elevation: 0,
                title: Text(
                  'List Users Catlalog',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu_sharp,
                        color: Colors.black87,
                        size: 36,
                      )),
                ),
                centerTitle: true,
              ),
              body: TabBarView(
                children: [
                  _buildTabContent(
                    searchController,
                    cubit,
                    state,
                  ),
                  _buildTabContentPending(
                    searchController,
                    cubit,
                    state,
                  ),
                  _buildTabContentRefused(
                    searchController,
                    cubit,
                    state,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildAction({required BuildContext context, required Catalogs model}) {
  return Row(
    children: [
      Expanded(
        child: IconButton(
            onPressed: () async {
              print(model.id!);
              await CategoryCubit.get(context)
                  .deleteCatalog(id: model.id!, state: model.status!);
            },
            icon: Icon(
              Icons.delete_outline,
              color: Colors.red,
            )),
      ),
      Expanded(
        child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ShowItemScreen(
                  model: model,
                );
              }));
            },
            icon: Icon(
              Icons.edit,
              color: Colors.yellow,
            )),
      ),
      Expanded(
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.grey,
            )),
      ),
    ],
  );
}

Widget _buildTabContent(
  TextEditingController key,
  CategoryCubit cubit,
  CategoryState state,
) {
  if (cubit.approvedList != null && state is HomeSucess) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyTextField(
              emailController: key,
              hintText: 'Search',
              prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              validator: (p0) {
                return "";
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 52,
                  width: 164,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    '${cubit.approvedList!.catalogs!.length}',
                    style: GoogleFonts.poppins(fontSize: 12),
                  )),
                ),
                Text(
                  'Recordes Per Page',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            if (cubit.approvedList != null)
              MyTable(model: cubit.approvedList!.catalogs),
          ],
        ),
      ),
    );
  } else {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.yellow.shade600,
        ),
      ),
    );
  }
}

Widget _buildTabContentPending(
  TextEditingController key,
  CategoryCubit cubit,
  CategoryState state,
) {
  if (cubit.pendingList != null && state is HomeSucess) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyTextField(
              emailController: key,
              hintText: 'Search',
              prefixIcon:
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              validator: (p0) {
                return "";
              },
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 52,
                  width: 164,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    '${cubit.pendingList!.catalogs.length}',
                    style: GoogleFonts.poppins(fontSize: 12),
                  )),
                ),
                Text(
                  'Recordes Per Page',
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            if (cubit.pendingList != null)
              MyTable(model: cubit.pendingList!.catalogs!),
          ],
        ),
      ),
    );
  } else {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.yellow.shade600,
        ),
      ),
    );
  }
}

Widget _buildTabContentRefused(
  TextEditingController key,
  CategoryCubit cubit,
  CategoryState state,
) {
  if (cubit.refusedList != null && state is HomeSucess) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyTextField(
              emailController: key,
              validator: (p0) {
                return "";
              },
              hintText: 'Search',
              prefixIcon:
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 52,
                  width: 164,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    '${cubit.refusedList!.catalogs.length}',
                    style: GoogleFonts.poppins(fontSize: 12),
                  )),
                ),
                Text(
                  'Recordes Per Page',
                  style: GoogleFonts.poppins(
                      fontSize: 17, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            MyTable(model: cubit.refusedList!.catalogs),
          ],
        ),
      ),
    );
  } else {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.yellow.shade600,
        ),
      ),
    );
  }
}

Widget buildTabBarItem() {
  return TabBar(
    labelColor: Colors.yellow.shade700,
    unselectedLabelColor: Colors.grey,
    labelStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    indicatorColor: Colors.yellow.shade700,
    isScrollable: true,
    tabs: const [
      Text(
        'Approved',
      ),
      Text(
        'Pending',
      ),
      Text(
        'Refused',
      ),
    ],
  );
}
