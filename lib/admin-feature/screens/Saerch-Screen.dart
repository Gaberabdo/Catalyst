import 'package:admin_task/admin-feature/Controller/Models/catalog_model.dart';
import 'package:admin_task/admin-feature/Controller/cubit/category-cubit.dart';
import 'package:admin_task/admin-feature/Controller/cubit/category-state.dart';
import 'package:admin_task/admin-feature/screens/show-item-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../comoponents/my-table.dart';
import '../comoponents/Text from-component.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  List<Catalogs> search = [];

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is SearchSuccessState) {
            search.addAll(state.searchResults);
          }
        },
        builder: (context, state) {
          var cubit = CategoryCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              title: Text(
                'Search Result',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MyTextField(
                      onChanged: (p0) {
                        cubit.searchCatlog(name: p0);
                      },
                      onSubmited: (p0) {
                        cubit.searchCatlog(name: p0);
                      },
                      emailController: searchController,
                      hintText: 'Search',
                      prefixIcon: IconButton(
                        onPressed: () {
                          cubit.searchCatlog(name: searchController.text);
                        },
                        icon: const Icon(
                          Icons.search,
                        ),
                      ),
                      validator: (p0) {
                        return "";
                      },
                    ),
                    if (state is SearchLoadingState) const LinearProgressIndicator(),
                    if (state is HomeInial)
                      Image.network('https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-10730.jpg?w=740&t=st=1700081268~exp=1700081868~hmac=d7bd9972931dcdaaca18cdf45e1f47e71514a3676bb09a73c2ef08618971ac10'),

                    SizedBox(height: 20,),
                    if (state is SearchSuccessState && state.searchResults.isNotEmpty)
                      MyTable(model: state.searchResults),

                    const SizedBox(height: 122,),
                    if (state is SearchSuccessState && state.searchResults.isEmpty)
                    Image.network('https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?w=740&t=st=1700081073~exp=1700081673~hmac=55f4f18bf809a7d2c9e9ae204866c3b7e5308ec18fe5caebb138f5e1ed565c64'),

                  ],
                ),
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
            icon: const Icon(
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
            icon: const Icon(
              Icons.edit,
              color: Colors.yellow,
            )),
      ),
      Expanded(
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
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
              onChanged: (p0) {
                // cubit.performSearch(
                //   searchTerm: '%${p0}%',
                //   state: "approved"
                // );
              },
              emailController: key,
              hintText: 'Search',
              prefixIcon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
