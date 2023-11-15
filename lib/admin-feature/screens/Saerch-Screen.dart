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

