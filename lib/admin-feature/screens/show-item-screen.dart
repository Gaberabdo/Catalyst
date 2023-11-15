import 'package:admin_task/admin-feature/Controller/Models/product_model.dart';
import 'package:admin_task/admin-feature/screens/list-user-catalog-screen.dart';
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
  Catalogs model;

  ShowItemScreen({required this.model});

  @override
  State<ShowItemScreen> createState() => _ShowItemScreenState();
}

class _ShowItemScreenState extends State<ShowItemScreen> {
  String? dropdownValueBreed;
  String? dropdownValueProduct;
  String? dropdownValueState;

  @override
  void initState() {
    dropdownValueBreed = widget.model.brand.toString();
    dropdownValueProduct = widget.model.product.toString();
    dropdownValueState = widget.model.status.toString();
    nameController.text = widget.model.name;
    detailsController.text = widget.model.details;
    palladiumController.text = widget.model.pd.toString();
    weightController.text = widget.model.weight.toString();
    platinumController.text = widget.model.pt.toString();
    rhodiumController.text = widget.model.rh.toString();
    manufacturerController.text = widget.model.manufacturer;
    super.initState();
  }

  String selectedValue = 'Option 1';


  var nameController = TextEditingController();

  var detailsController = TextEditingController();
  var catalyticController = TextEditingController();

  var weightController = TextEditingController();

  var palladiumController = TextEditingController();

  var platinumController = TextEditingController();

  var rhodiumController = TextEditingController();
  var manufacturerController = TextEditingController();
  var noteController = TextEditingController();

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
          if (state is UpdateSucess) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return ListScreen();
              },
            ), (route) => false);
          }
          if (state is RequestAdminStateLSuccess) {
            CategoryCubit.get(context).getAdminCategory();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return ListScreen();
              },
            ), (route) => false);
          }
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
                child: Form(
                  key: _formKey,
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
                          widget.model.image == null
                              ? "https://tse2.mm.bing.net/th?id=OIP.z-bE3VGJQux72dFc4n6BhQHaFU&pid=Api&P=0&h=220"
                              : widget.model.image is String
                                  ? widget.model.imageString.toString()
                                  : widget.model.image!.url.toString(),
                          height: 153,
                          width: double.infinity,
                          fit: BoxFit.fill,
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
                          nameController.text = widget.model.name;
                        },
                        emailController: nameController,
                        onChanged: (p0) {
                          nameController.text = p0;
                          setState(() {});
                        },
                        hintText: 'Name',
                        validator: (p0) {
                          return "";
                        },
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
                        onChanged: (p0) {
                          setState(() {
                            detailsController.text = p0;
                          });
                        },
                        validator: (p0) {
                          return "";
                        },
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
                        onChanged: (p0) {
                          setState(() {
                            weightController.text = p0;
                          });
                        },
                        validator: (p0) {
                          return "";
                        },
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
                        onChanged: (p0) {
                          setState(() {
                            platinumController.text = p0;
                          });
                        },
                        validator: (p0) {
                          return "";
                        },
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
                        onChanged: (p0) {
                          setState(() {
                            rhodiumController.text = p0;
                          });
                        },
                        validator: (p0) {
                          return "";
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Brand',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
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
                        emailController: manufacturerController,
                        onChanged: (p0) {
                          setState(() {
                            manufacturerController.text = p0;
                          });
                        },
                        hintText: 'Catalytic Manufacturer',
                        validator: (p0) {
                          return "";
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Status',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      buildDropDownState([
                        "approved",
                        "refused",
                        "pending",
                      ]),
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
                              fillColor: MaterialStatePropertyAll(
                                  AppColors.yellowColor),
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
                              fillColor: MaterialStatePropertyAll(
                                  AppColors.yellowColor),
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
                              fillColor: MaterialStatePropertyAll(
                                  AppColors.yellowColor),
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
                              fillColor: MaterialStatePropertyAll(
                                  AppColors.yellowColor),
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
                      if (dropdownValueBreed != widget.model.brand.toString() ||
                          dropdownValueState != widget.model.status ||

                          dropdownValueProduct !=
                              widget.model.product.toString() ||
                          nameController.text != widget.model.name ||
                          detailsController.text != widget.model.details ||
                          palladiumController.text !=
                              widget.model.pd.toString() ||
                          weightController.text !=
                              widget.model.weight.toString() ||
                          platinumController.text !=
                              widget.model.pt.toString() ||
                          rhodiumController.text !=
                              widget.model.rh.toString() ||
                          manufacturerController.text !=
                              widget.model.manufacturer)
                        Text(
                          'Note',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      const SizedBox(
                        height: 10,
                      ),

                      if (dropdownValueBreed != widget.model.brand.toString() ||
                          dropdownValueProduct !=
                              widget.model.product.toString() ||
                          dropdownValueState != widget.model.status ||
                          nameController.text != widget.model.name ||
                          detailsController.text != widget.model.details ||
                          palladiumController.text !=
                              widget.model.pd.toString() ||
                          weightController.text !=
                              widget.model.weight.toString() ||
                          platinumController.text !=
                              widget.model.pt.toString() ||
                          rhodiumController.text !=
                              widget.model.rh.toString() ||
                          manufacturerController.text !=
                              widget.model.manufacturer)
                        MyTextField(
                          height: 85,
                          emailController: noteController,
                          hintText: 'Add Your Note',
                          validator: (p0) {
                            return "";
                          },
                        ),
                      const SizedBox(
                        height: 10,
                      ),

                      (dropdownValueBreed != widget.model.brand.toString() ||
                              dropdownValueProduct !=
                                  widget.model.product.toString() ||
                              nameController.text != widget.model.name ||
                              dropdownValueState != widget.model.status ||
                              detailsController.text != widget.model.details ||
                              palladiumController.text !=
                                  widget.model.pd.toString() ||
                              weightController.text !=
                                  widget.model.weight.toString() ||
                              platinumController.text !=
                                  widget.model.pt.toString() ||
                              rhodiumController.text !=
                                  widget.model.rh.toString() ||
                              manufacturerController.text !=
                                  widget.model.manufacturer)
                          ? SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: ElevatedButton(
                                onPressed: () {
                                  cubit.updateItem(
                                    id: widget.model.id,
                                    context: context,
                                    status: dropdownValueState,
                                    manufacturer: manufacturerController.text,
                                    pd: int.parse(
                                      palladiumController.text,
                                    ),
                                    pt: int.parse(
                                      platinumController.text,
                                    ),
                                    note: noteController.text,
                                    name: nameController.text,
                                    userId: widget.model.userId,
                                    brand: dropdownValueBreed,
                                    details: detailsController.text,
                                    product: dropdownValueProduct,
                                    rh: int.parse(rhodiumController.text),
                                    weight: int.parse(weightController.text),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromRGBO(251, 200, 33, 1),
                                  onPrimary: Colors.white,
                                  elevation: 3,
                                  shape: (RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                                ),
                                child: const Text(
                                  "Send To User",
                                  style: TextStyle(fontFamily: 'medium'),
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.white,
                                            surfaceTintColor: Colors.white,
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        6.86)),
                                            title: Row(
                                              children: [
                                                const Spacer(),
                                                Text(
                                                  "Add Note",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
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
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                MyTextField(
                                                  emailController:
                                                      noteController,
                                                  hintText: 'Add your Note',
                                                  onChanged: (p0) {
                                                    setState(() {
                                                      noteController.text = p0;
                                                    });
                                                    print(noteController.text);
                                                  },
                                                  validator: (p0) {
                                                    return "Add Your Note Please";
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 14,
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  height: 48,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      if (noteController
                                                          .text.isEmpty) {
                                                        AppFunction
                                                            .showErrorORWarningDialog(
                                                          context: context,
                                                          subtitle:
                                                              'Add Your Note Please',
                                                          fct: () {},
                                                        );
                                                      } else {
                                                        cubit.refuseRequest(
                                                          id: widget.model.id,
                                                          note: noteController
                                                              .text,
                                                        );
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary:
                                                          const Color.fromRGBO(
                                                              251, 200, 33, 1),
                                                      onPrimary: Colors.white,
                                                      elevation: 3,
                                                      shape:
                                                          (RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      )),
                                                    ),
                                                    child: const Text(
                                                      "Add",
                                                      style: TextStyle(
                                                          fontFamily: 'medium'),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                                              BorderRadiusDirectional.circular(
                                                  6.86),
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
                                    onTap: () {
                                      CategoryCubit.get(context)
                                          .approveRequest(id: widget.model.id);
                                    },
                                    child: Container(
                                      height: 52,
                                      width: 157.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  6.86),
                                          color: Colors.yellow.shade600,
                                          border: Border.all(
                                              color: Colors.yellow.shade600)),
                                      child: Center(
                                        child: (state
                                                is RequestAdminStateLoading)
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

  Widget buildDropDownState(List<String> breedData) {
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
        child: DropdownButton<String>(
          underline: const SizedBox(),
          iconSize: 18,
          menuMaxHeight: 300,
          iconEnabledColor: Colors.black,
          borderRadius: BorderRadius.circular(8),
          hint: SizedBox(
            width: MediaQuery.of(context).size.width / 2.6,
            child: Text(
              dropdownValueState!,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onChanged: (newValue) {
            setState(() {
              dropdownValueState = newValue!;
            });
          },
          items: breedData.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.6,
                child: Text(
                  value,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
