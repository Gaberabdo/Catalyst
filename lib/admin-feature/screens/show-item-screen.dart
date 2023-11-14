import 'package:admin_task/admin-feature/Controller/Models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/utiles/app_functions.dart';
import '../../Core/utiles/colors.dart';
import '../../Core/utiles/stayles.dart';
import '../Controller/Models/brand_model.dart';
import '../Controller/Models/catalog_model.dart';
import '../Controller/cubit/category-cubit.dart';
import '../Controller/cubit/category-state.dart';
import '../comoponents/Text from-component.dart';

class ShowItemScreen extends StatefulWidget {
  CatalogModel model;

  ShowItemScreen({required this.model});

  @override
  State<ShowItemScreen> createState() => _ShowItemScreenState();
}

class _ShowItemScreenState extends State<ShowItemScreen> {
  String? dropdownValueBreed;
  String? dropdownValueProduct;

  @override
  void initState() {
    print(widget.model.details);
    print(widget.model.weight);
    dropdownValueBreed = widget.model.brand.toString();
    dropdownValueProduct = widget.model.product.toString();

    print('**********');
    nameController!.text = widget.model.name!;
    detailsController!.text = widget.model.details!;
    palladiumController!.text = widget.model.pd.toString()!;
    weightController!.text = widget.model.weight.toString()!;
    platinumController!.text = widget.model.pt.toString()!;
    rhodiumController!.text = widget.model.rh.toString()!;
    super.initState();
  }

  String selectedValue = 'Option 1';
  String? id;

  String? brandDropValue;

  String? productDropValue;

  String? catalyticDropValue;

  var nameController = TextEditingController();

  var detailsController = TextEditingController();

  var weightController = TextEditingController();

  var palladiumController = TextEditingController();

  var platinumController = TextEditingController();

  var rhodiumController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<Brand> brand = [];
  List<ProductModel> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()
        ..getBrand()
        ..getProduct(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {
          if (state is GetBrandSuccess) {
            brand.addAll(state.brand);
          }
          if (state is GetProductSuccess) {
            products.addAll(state.brand);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = CategoryCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.model.name.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product image',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(6.88),
                      child: Image.network(
                        // widget.model.image ??
                        'https://tse2.mm.bing.net/th?id=OIP.z-bE3VGJQux72dFc4n6BhQHaFU&pid=Api&P=0&h=220',
                        height: 153,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Name',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MyTextField(
                      onTap: () {
                        nameController!.text = widget.model.name!;
                        print(widget.model.name);
                        print('nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee');
                      },
                      emailController: nameController,
                      hintText: 'Name',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Details',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    MyTextField(
                      emailController: detailsController,
                      hintText: 'Details',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Weight/gr',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    MyTextField(
                      emailController: weightController,
                      hintText: 'Weight',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Platinum/ppm',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    MyTextField(
                      emailController: platinumController,
                      hintText: 'Platinum/ppm',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Rhodium/ppm',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    MyTextField(
                      emailController: rhodiumController,
                      hintText: 'Rhodium/ppm',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Brand',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    buildDropDownBreed(brand),
                    const SizedBox(
                      height: 12,
                    ),

                    Text(
                      'Product',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    buildDropDownProduct(products),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Catalytic Manufacturer',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    MyTextField(
                      emailController: nameController,
                      hintText: 'Catalytic Manufacturer',
                      suffixIcon: DropdownButton<String>(
                        items: ['Option 1', 'Option 2', 'Option 3']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {},
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Status',
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    MyTextField(
                      emailController: nameController,
                      hintText: 'Status',
                      suffixIcon: DropdownButton<String>(
                        items: ['Option 1', 'Option 2', 'Option 3']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {},
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    //IS
                    Text(
                      'Is',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: RadioListTile(
                            fillColor:
                                MaterialStatePropertyAll(AppColors.yellowColor),
                            hoverColor: AppColors.yellowColor,
                            activeColor: AppColors.yellowColor,
                            //tileColor: AppColors.yellowColor,
                            title: Text(
                              'Hyprid',
                              style: AppStyles.textStyle16
                                  .copyWith(color: AppColors.grayColor),
                            ),
                            value: 'Hyprid',
                            groupValue: selectedValue,
                            onChanged: (value) {
                              selectedValue = value!;
                              setState(() {});
                              print(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: RadioListTile(
                            fillColor:
                                MaterialStatePropertyAll(AppColors.yellowColor),
                            activeColor: AppColors.yellowColor,
                            //tileColor: AppColors.yellowColor,
                            title: Text(
                              'Diesel',
                              style: AppStyles.textStyle16
                                  .copyWith(color: AppColors.grayColor),
                            ),
                            value: 'Diesel',
                            groupValue: selectedValue,
                            onChanged: (value) {
                              selectedValue = value!;
                              setState(() {});
                              print(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: RadioListTile(
                            fillColor:
                                MaterialStatePropertyAll(AppColors.yellowColor),
                            activeColor: AppColors.yellowColor,
                            title: Text(
                              'Petrol',
                              style: AppStyles.textStyle16
                                  .copyWith(color: AppColors.grayColor),
                            ),
                            value: 'Petrol',
                            groupValue: selectedValue,
                            onChanged: (value) {
                              selectedValue = value!;
                              setState(() {});
                              print(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.43,
                          child: RadioListTile(
                            fillColor:
                                MaterialStatePropertyAll(AppColors.yellowColor),
                            activeColor: AppColors.yellowColor,
                            title: Text(
                              'Industry',
                              style: AppStyles.textStyle16
                                  .copyWith(color: AppColors.grayColor),
                            ),
                            value: 'Industry',
                            groupValue: selectedValue,
                            onChanged: (value) {
                              selectedValue = value!;
                              setState(() {});
                              print(value);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.6,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      surfaceTintColor: Colors.white,
                                      shape: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.86)),
                                      title: Row(
                                        children: [
                                          const Spacer(),
                                          Text(
                                            "Add Note",
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.close),
                                          )
                                        ],
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Add Note",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          MyTextField(
                                            emailController:
                                                TextEditingController(),
                                            hintText: 'Add your Note',
                                          ),
                                          const SizedBox(
                                            height: 14,
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 48,
                                            child: ElevatedButton(
                                              onPressed: () async {
                                                await cubit.refuseRequest(id: widget.model.id!);
                                                Navigator.pop(context);

                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: const Color.fromRGBO(
                                                    251, 200, 33, 1),
                                                onPrimary: Colors.white,
                                                elevation: 3,
                                                shape: (RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                )),
                                              ),
                                              child:  const Text(
                                                      "Add",
                                                      style: TextStyle(
                                                          fontFamily: 'medium'),
                                                    ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 52,
                              width: 157.5,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(6.86),
                                  border: Border.all(
                                      color: Colors.yellow.shade600)),
                              child: Center(
                                child: Text(
                                  'Refuse',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.yellow.shade600),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              await CategoryCubit.get(context)
                                  .approveRequest(id: widget.model.id!);
                            },
                            child: Container(
                              height: 52,
                              width: 157.5,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(6.86),
                                  color: Colors.yellow.shade600,
                                  border: Border.all(
                                      color: Colors.yellow.shade600)),
                              child: Center(
                                child: (state is RequestAdminStateLoading)
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        'Approve',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                              ),
                            ),
                          ),
                        ),
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

  Widget buildDropDownBreed(List<Brand> breedData) {
    return Container(
      width: MediaQuery.of(context).size.width * .99,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Set shadow color
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 1), // Set shadow offset
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<Brand>(
          underline: const SizedBox(),
          iconSize: 18,
          menuMaxHeight: 300,
          iconEnabledColor: Colors.black,
          borderRadius: BorderRadius.circular(8),
          hint: SizedBox(
            width: MediaQuery.of(context).size.width / 2.6,
            child: Text(
              dropdownValueBreed!,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onChanged: (newValue) {
            setState(() {
              dropdownValueBreed = newValue!.name;
              print('${newValue.id}555555555555555555555555555');
            });
          },
          items: breedData.map((Brand value) {
            return DropdownMenuItem<Brand>(
              value: value,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.6,
                child: Text(
                  value.name,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildDropDownProduct(List<ProductModel> breedData) {
    return Container(
      width: MediaQuery.of(context).size.width * .99,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Set shadow color
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 1), // Set shadow offset
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<ProductModel>(
          underline: const SizedBox(),
          iconSize: 18,
          menuMaxHeight: 300,
          iconEnabledColor: Colors.black,
          borderRadius: BorderRadius.circular(8),
          hint: SizedBox(
            width: MediaQuery.of(context).size.width / 2.6,
            child: Text(
              dropdownValueProduct!,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onChanged: (newValue) {
            setState(() {
              dropdownValueProduct = newValue!.name;
              print('${newValue.id}555555555555555555555555555');
            });
          },
          items: breedData.map((ProductModel value) {
            return DropdownMenuItem<ProductModel>(
              value: value,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.6,
                child: Text(
                  value.name,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
