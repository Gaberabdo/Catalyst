import 'package:admin_task/admin-create-feature/cubit/Create-cubit.dart';
import 'package:admin_task/admin-create-feature/cubit/Create-states.dart';
import 'package:admin_task/admin-feature/comoponents/Text%20from-component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminCreateScreen extends StatelessWidget {
  AdminCreateScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateCubit(),
      child: BlocConsumer<CreateCubit, CreateStates>(
        listener: (context, state) {
          if (state is BrandSucess) {
            print('donnnnnne');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade600,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(child: Text('Brand created successfully')))));
          }
          if (state is ProductSucess) {
            print('donnnnnne');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade600,
                        borderRadius: BorderRadius.circular(12)),
                    child:
                        Center(child: Text('Product created successfully')))));
          }
          if (state is CatalyistSucess) {
            print('donnnnnne');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade600,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text('Catalyistic created successfully')))));
          }
        },
        builder: (context, state) {
          var cubit = CreateCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Admin Create',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create New Brand',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        MyTextField(
                          hintText: 'Create New Brand',
                          emailController: nameController,
                          validator: (p0) {
                            return "";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            cubit.CreateBrand(name: nameController.text);
                            nameController.clear();
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.yellow.shade600,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                'Add New Brand',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create New Product',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        MyTextField(
                          hintText: 'Create New Product',
                          emailController: nameController1,
                          validator: (p0) {
                            return "";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            cubit.CreateProduct(name: nameController1.text);
                            nameController1.clear();
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.yellow.shade600,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                'Add New Product',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create New Catalytics',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        MyTextField(
                          hintText: 'Create New Catalytics',
                          emailController: nameController2,
                          validator: (p0) {
                            return "";
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            cubit.CreateCatalytics(name: nameController2.text);
                            nameController2.clear();
                          },
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.yellow.shade600,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                'Add New Catalytics',
                                style: GoogleFonts.poppins(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
