import 'dart:io';

import 'package:cat_price/core/core-brand/utiles/stayles.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/create_or_edite/image_border.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/create_or_edite/nameField.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/create_or_edite/palladiumField.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/create_or_edite/platinumField.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/create_or_edite/rhodiumField.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/create_or_edite/weightField.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/custom_button.dart';
import 'package:cat_price/features/Catlog-feature/presentation/views/widgets/subtitel_widget.dart';
import 'package:cat_price/features/settings/controller/setting_cubit.dart';
import 'package:cat_price/features/settings/controller/setting_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/core-brand/utiles/app_functions.dart';
import '../../../../core/core-brand/utiles/app_variables.dart';
import '../../../../core/core-brand/utiles/colors.dart';
import '../../../../core/core-brand/utiles/service_locator.dart';
import '../../../../core/core-brand/utiles/widgets/custom_snack_bar.dart';
import '../../../../generated/l10n.dart';
import '../../../settings/components/models/brand_model.dart';
import '../../data/models/catalog_model.dart';
import '../../data/models/catalytic_model.dart';
import '../../data/models/product_model.dart';
import '../../data/repos/category_repo_imp.dart';
import '../controller/category_cubit/category_cubit.dart';
import 'home_category.dart';
import 'widgets/create_or_edite/ImageButtons.dart';
import 'widgets/create_or_edite/detailsField.dart';
import 'widgets/dotted_border.dart';

class CreateOrEditeItem extends StatefulWidget {
  const CreateOrEditeItem({Key? key, required this.isEdite, this.itemModel})
      : super(key: key);
  final bool isEdite;
  final CatalogModel? itemModel;
  @override
  State<CreateOrEditeItem> createState() => _CreateOrEditeItemState();
}

class _CreateOrEditeItemState extends State<CreateOrEditeItem> {
  String selectedValue = 'Option 1';
  String? brandDropValue;
  String? productDropValue;
  String? catalyticDropValue;
  late TextEditingController nameController;
  late TextEditingController detailsController;
  late TextEditingController weightController;
  late TextEditingController palladiumController;
  late TextEditingController platinumController;
  late TextEditingController rhodiumController;
  final _formKey = GlobalKey<FormState>();
  XFile? _pickedImage;
  String? productNetworkImage;
  Future<void> localImagePicker() async {
    final ImagePicker picker = ImagePicker();
    await AppFunction.imagePickerDialog(
      context: context,
      cameraFCT: () async {
        _pickedImage = await picker.pickImage(
            source: ImageSource.camera, imageQuality: 50);
        setState(() {
          productNetworkImage = null;
        });
      },
      galleryFCT: () async {
        _pickedImage = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 50,
          requestFullMetadata: true,
        );
        setState(() {
          productNetworkImage = null;
        });
      },
      removeFCT: () {
        setState(() {
          _pickedImage = null;
        });
      },
    );
  }

  void removePickedImage() {
    setState(() {
      _pickedImage = null;
      productNetworkImage = null;
    });
  }

  Future<String> uploadImage(itemId, image) async {
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NTM2ZGZlNGIwNDdmYjFjYjMzOGE3NWMiLCJuYW1lIjoiWW91c3NlZiBRYXRyeSIsImVtYWlsIjoieW91c2VmcWF0cnkyMDAyQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MTQ3NzkyLCJleHAiOjE3Mjk2ODM3OTJ9.d3HGPahRS7ZdMASpzpZM5I-NJ-1q25ycxSktscEAvMY'
    };

    print("_pickedImage!.path------------------");
    print(image);
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        _pickedImage!.path,
        filename: image.split('/').last,
        contentType: MediaType('image', image.split('.').last),
      ),
    });

    var dio = Dio();
    var response = await dio.request(
      'https://catprice-588efcf30992.herokuapp.com/api/v1/user/catalog/image?_id=$itemId',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: formData,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Image response--------------");
      print(response.data);
      return response.data['image'];
    } else {
      print("Image response------------------");

      print(response.statusMessage);
      print(response.data);
      return "Error";
    }
  }

  Future<void> _createItem({
    required String userId,
    required String name,
    required int weight,
    required String details,
    required String manufacturer,
    required int rh,
    required int pt,
    required int pd,
  }) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    // if (_pickedImage == null) {
    //   AppFunction.showErrorORWarningDialog(
    //     context: context,
    //     subtitle: "Make sure to pick up an image",
    //     fct: () {},
    //   );
    //   return;
    // }
    if (brandDropValue == null ||
        productDropValue == null ||
        catalyticDropValue == null) {
      AppFunction.showErrorORWarningDialog(
        context: context,
        subtitle: "There is an empty value",
        fct: () {},
      );

      return;
    }
    if (isValid) {
      _formKey.currentState!.save();
      try {
        AppFunction.loadingPage(context: context);

        CategoryRepoImpl()
            .createItems(
          details: details,
          userId: userId,
          name: name,
          weight: weight,
          manufacturer: manufacturer,
          rh: rh,
          pt: pt,
          pd: pd,
          context: context,
        )
            .then((value) {
          String? itemId;
          value.fold((l) {
            print("Error when create ----------------------");
            print(l.message);
            print(l.toString());
          }, (r) {
            itemId = r.id;
            print("itemId after created ++++++");
            print(itemId);
          });
          if (_pickedImage != null) {
            print("is not nullllllllllllllllllllllll");
            uploadImage(itemId, _pickedImage!.path).then((value) {
              CategoryRepoImpl().fetchCatalog().then((value) {
                value.fold((l) {
                  return l;
                }, (r) {
                  CategoryCubit.searchItems = r;
                  print(CategoryCubit.searchPendingMyItems.last.name);
                });
              });
              CategoryRepoImpl()
                  .fetchCatalog(userId: AppVariables.userId, status: 'pending')
                  .then((value) {
                value.fold((l) {
                  return l;
                }, (r) {
                  CategoryCubit.searchPendingMyItems = r;
                  print(CategoryCubit.searchPendingMyItems.last.name);
                });
              });

              CategoryRepoImpl()
                  .fetchCatalog(userId: AppVariables.userId, status: 'approved')
                  .then((value) {
                value.fold((l) {
                  return l;
                }, (r) {
                  CategoryCubit.searchApprovedMyItems = r;
                });
              });

              CategoryRepoImpl()
                  .fetchCatalog(userId: AppVariables.userId, status: 'refused')
                  .then((value) {
                value.fold((l) {
                  return l;
                }, (r) {
                  CategoryCubit.searchRefusedMyItems = r;
                });
              });
              customSnackBar(context, "Created Successfully");
              AppFunction.pushAndRemove(context, const HomeCategory());
            });
          } else {
            print("is nullllllllllllllllllllllll");
            CategoryRepoImpl().fetchCatalog().then((value) {
              value.fold((l) {
                return l;
              }, (r) {
                CategoryCubit.searchItems = r;
                print(CategoryCubit.searchPendingMyItems.last.name);
              });
            });
            CategoryRepoImpl()
                .fetchCatalog(userId: AppVariables.userId, status: 'pending')
                .then((value) {
              value.fold((l) {
                return l;
              }, (r) {
                CategoryCubit.searchPendingMyItems = r;
                print(CategoryCubit.searchPendingMyItems.last.name);
              });
            });

            CategoryRepoImpl()
                .fetchCatalog(userId: AppVariables.userId, status: 'approved')
                .then((value) {
              value.fold((l) {
                return l;
              }, (r) {
                CategoryCubit.searchApprovedMyItems = r;
              });
            });

            CategoryRepoImpl()
                .fetchCatalog(userId: AppVariables.userId, status: 'refused')
                .then((value) {
              value.fold((l) {
                return l;
              }, (r) {
                CategoryCubit.searchRefusedMyItems = r;
              });
            });
            customSnackBar(context, "Created Successfully");
            AppFunction.pushAndRemove(context, const HomeCategory());
          }
        });

        if (!mounted) return;
      } catch (error) {
        await AppFunction.showErrorORWarningDialog(
          context: context,
          subtitle: "An error has been occured $error",
          fct: () {},
        );
      }
    }
  }

  Future<void> _updateProduct({
    required String itemId,
    required String name,
    required int weight,
    required String details,
    required int pd,
    required int pt,
    required int rh,
    String? price,
    required String brand,
    required String product,
    required String manufacturer,
    required String isHyprid,
  }) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    // if (_pickedImage == null && productNetworkImage == null) {
    //   AppFunction.showErrorORWarningDialog(
    //     context: context,
    //     subtitle: "Please pick up an image",
    //     fct: () {},
    //   );
    //   return;
    // }
    if (dropdownValueState == null ||
        dropdownValueProduct == null ||
        manufacturerController.text == null) {
      AppFunction.showErrorORWarningDialog(
        context: context,
        subtitle: "There is an empty value",
        fct: () {},
      );

      return;
    }
    if (isValid) {
      _formKey.currentState!.save();
      try {
        AppFunction.loadingPage(context: context);

        //uploadImage(widget.itemModel?.id);
        //_uploadImage(itemId);
        if (_pickedImage != null) {
          uploadImage(itemId, _pickedImage!.path).then((value) {
            productNetworkImage = value;

            CategoryRepoImpl()
                .updateItems(
              itemId: itemId,
              name: name,
              weight: weight,
              details: details,
              pd: pd,
              pt: pt,
              rh: rh,
              price: price!,
              brand: brand,
              product: product,
              manufacturer: manufacturer,
              isHyprid: isHyprid,
            )
                .then((value) {
              CategoryRepoImpl().fetchCatalog().then((value) {
                value.fold((l) {
                  return l;
                }, (r) {
                  CategoryCubit.searchItems = r;
                  print(CategoryCubit.searchPendingMyItems.last.name);
                });
              });
              CategoryRepoImpl()
                  .fetchCatalog(userId: AppVariables.userId, status: 'pending')
                  .then((value) {
                value.fold((l) {
                  return l;
                }, (r) {
                  CategoryCubit.searchPendingMyItems = r;
                  print(CategoryCubit.searchPendingMyItems.last.name);
                });
              });
              CategoryRepoImpl()
                  .fetchCatalog(userId: AppVariables.userId, status: 'approved')
                  .then((value) {
                value.fold((l) {
                  return l;
                }, (r) {
                  CategoryCubit.searchApprovedMyItems = r;
                });
              });
              CategoryRepoImpl()
                  .fetchCatalog(userId: AppVariables.userId, status: 'refused')
                  .then((value) {
                value.fold((l) {
                  return l;
                }, (r) {
                  CategoryCubit.searchRefusedMyItems = r;
                });
              });
              customSnackBar(context, "Updated Successfully");
              AppFunction.pushAndRemove(context, const HomeCategory());
            });
          });
        } else {
          CategoryRepoImpl()
              .updateItems(
            itemId: itemId,
            name: name,
            weight: weight,
            details: details,
            pd: pd,
            pt: pt,
            rh: rh,
            price: price!,
            brand: brand,
            product: product,
            manufacturer: manufacturer,
            isHyprid: isHyprid,
          )
              .then((value) {
            CategoryRepoImpl().fetchCatalog().then((value) {
              value.fold((l) {
                return l;
              }, (r) {
                CategoryCubit.searchItems = r;
                print(CategoryCubit.searchPendingMyItems.last.name);
              });
            });
            CategoryRepoImpl()
                .fetchCatalog(userId: AppVariables.userId, status: 'pending')
                .then((value) {
              value.fold((l) {
                return l;
              }, (r) {
                CategoryCubit.searchPendingMyItems = r;
                print(CategoryCubit.searchPendingMyItems.last.name);
              });
            });
            CategoryRepoImpl()
                .fetchCatalog(userId: AppVariables.userId, status: 'approved')
                .then((value) {
              value.fold((l) {
                return l;
              }, (r) {
                CategoryCubit.searchApprovedMyItems = r;
              });
            });
            CategoryRepoImpl()
                .fetchCatalog(userId: AppVariables.userId, status: 'refused')
                .then((value) {
              value.fold((l) {
                return l;
              }, (r) {
                CategoryCubit.searchRefusedMyItems = r;
              });
            });
            customSnackBar(context, "Updated Successfully");
            AppFunction.pushAndRemove(context, const HomeCategory());
          });
        }

        // print(_pickedImage?.path);
        // CategoryRepoImpl()
        //     .uploadImage(itemId: itemId, imageFile: File(image))
        //     .then((value) {
        //   value.fold((l) {
        //     print(l.message);
        //   }, (r) {
        //     print("r.imageUrl+++++++++");
        //     print(r.imageUrl);
        //     productNetworkImage = r.imageUrl;
        //   });
        // });

        if (!mounted) return;
      } catch (error) {
        await AppFunction.showErrorORWarningDialog(
          context: context,
          subtitle: "An error has been occured $error",
          fct: () {},
        );
      } finally {}
    }
  }

  @override
  void initState() {
    print(AppVariables.brandList);
    print(AppVariables.productList);
    print(AppVariables.catalyticList);
    print("_pickedImage");
    print(_pickedImage);
    print("productNetworkImage");
    print(productNetworkImage);
    print("widget.itemModel?.image");
    print(widget.itemModel?.image);
    if (widget.itemModel != null && widget.isEdite) {
      if ((widget.itemModel?.brand == "BMW" ||
              widget.itemModel?.brand == "BMWasdsa" ||
              widget.itemModel?.brand == "BMWasdasdsadsa") &&
          (widget.itemModel?.product == "New Product" ||
              widget.itemModel?.product == "Tea") &&
          (widget.itemModel?.manufacturer == "New Catalytic" ||
              widget.itemModel?.manufacturer == "New Test Catalytic")) {
        brandDropValue = widget.itemModel!.brand;
        productDropValue = widget.itemModel!.product;
        catalyticDropValue = widget.itemModel!.manufacturer;
        selectedValue = widget.itemModel!.isHybrid!;
        // print("brandDropValue");
        // print(brandDropValue);
        // print("productDropValue");
        // print(productDropValue);
        // print("catalyticDropValue");
        // print(catalyticDropValue);
      } else {
        brandDropValue = "BMW";
        productDropValue = "Tea";
        catalyticDropValue = "New Catalytic";
        selectedValue = widget.itemModel!.isHybrid!;
      }

      productNetworkImage = widget.itemModel?.image?['url'];
    }
    nameController = TextEditingController(text: widget.itemModel?.name);
    productNetworkImage = widget.itemModel?.image?['url'];
    detailsController = TextEditingController(text: widget.itemModel?.details);
    weightController =
        TextEditingController(text: widget.itemModel?.weight.toString());
    palladiumController =
        TextEditingController(text: widget.itemModel?.pd.toString());
    platinumController =
        TextEditingController(text: widget.itemModel?.pt.toString());
    rhodiumController =
        TextEditingController(text: widget.itemModel?.rh.toString());
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    detailsController.dispose();
    weightController.dispose();
    palladiumController.dispose();
    _pickedImage = null;
    super.dispose();
  }

  List<Brand> brand = [];

  @override
  Widget build(BuildContext context) {
    print(widget.itemModel?.id.toString());
    const double iconAppbar = 28;
    return BlocProvider(
      create: (context) => SettingCubit()..getBrand(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          if(state is GetBrandSuccess)
            {
              brand.addAll(state.brand);

            }
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: createOrEditeAppBar(context, iconAppbar),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubTitleWidget(
                        title: S.of(context).uploadImage,
                      ),
                      const SizedBox(height: 10),
                      if (widget.isEdite && productNetworkImage != null) ...[
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            ImageBorder(
                              imageWidget: Image.network(
                                productNetworkImage!,
                                alignment: Alignment.center,
                              ),
                            ),
                            Text(
                              "CAT PRICE",
                              style: AppStyles.textStyle20.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey[400]?.withOpacity(0.5)),
                            ),
                          ],
                        )
                      ] else if (_pickedImage == null) ...[
                        CustomDottedBorder(
                          fnc: () {
                            localImagePicker();
                          },
                        ),
                      ] else ...[
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            ImageBorder(
                              imageWidget: Image.file(
                                File(
                                  _pickedImage!.path,
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Text(
                              "CAT PRICE",
                              style: AppStyles.textStyle16.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey[400]?.withOpacity(0.5)),
                            ),
                          ],
                        )
                      ],
                      if ((_pickedImage != null ||
                              productNetworkImage != null) &&
                          widget.isEdite) ...[
                        ImageButtons(pickBtn: () {
                          localImagePicker();
                        }, removeBtn: () {
                          removePickedImage();
                        }),
                      ],
                      const SizedBox(height: 15),
                      //Name
                      NameField(
                        nameController: nameController,
                      ),
                      //Details
                      DetailsField(
                        detailsController: detailsController,
                      ),
                      //Weight/gr
                      WeightField(weightController: weightController),
                      //Palladium/ppm
                      PalladiumField(palladiumController: palladiumController),
                      //Platinum/ppm
                      PlatinumField(platinumController: platinumController),
                      //Rhodium/ppm
                      RhodiumField(rhodiumController: rhodiumController),
                      //Brand
                      SubTitleWidget(
                        title: S.of(context).brand,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildDropDownBreed(brand),
                      const SizedBox(
                        height: 15,
                      ),
                      //Product
                      SubTitleWidget(
                        title: S.of(context).product,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildDropDownProduct(AppFunction.productDropDownList!),
                      const SizedBox(
                        height: 15,
                      ),
                      //Catalytic Manufacturer
                      SubTitleWidget(
                        title: S.of(context).catalytic,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildDropDownCata(AppFunction.catalyticDropDownList!),
                      const SizedBox(
                        height: 15,
                      ),
                      //IS
                      SubTitleWidget(
                        title: S.of(context).Is,
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
                                S.of(context).HYBIRD,
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
                                S.of(context).Diesel,
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
                                S.of(context).Petrol,
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
                                S.of(context).Industry,
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
                        height: 15,
                      ),
                      CustomButton(
                        title: widget.isEdite
                            ? S.of(context).Resend
                            : S.of(context).createItem,
                        fnc: () {
                          if (widget.isEdite) {
                            _updateProduct(
                              name: nameController.text,
                              brand: brandDropValue!,
                              details: detailsController.text,
                              isHyprid: selectedValue,
                              itemId: widget.itemModel!.id.toString(),
                              manufacturer: catalyticDropValue!,
                              pd: int.parse(palladiumController.text),
                              product: productDropValue!,
                              pt: int.parse(platinumController.text),
                              rh: int.parse(rhodiumController.text),
                              weight: int.parse(weightController.text),
                              price: '',
                            );
                          } else {
                            if (weightController.text.isNotEmpty ||
                                rhodiumController.text.isNotEmpty ||
                                platinumController.text.isNotEmpty ||
                                palladiumController.text.isNotEmpty) {
                              _createItem(
                                weight: int.parse(weightController.text),
                                details: detailsController.text,
                                rh: int.parse(rhodiumController.text),
                                pt: int.parse(platinumController.text),
                                pd: int.parse(palladiumController.text),
                                name: nameController.text,
                                userId: AppVariables.userId,
                                manufacturer: catalyticDropValue!,
                              );
                            } else {
                              AppFunction.showErrorORWarningDialog(
                                  context: context,
                                  subtitle: "Some field is empty!",
                                  fct: () {});
                            }
                          }
                        },
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

  AppBar createOrEditeAppBar(BuildContext context, double iconAppbar) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          AppFunction.isArabic()
              ? Icons.keyboard_arrow_right
              : Icons.keyboard_arrow_left,
          color: Colors.black,
          size: iconAppbar,
        ),
      ),
      title: Text(
        widget.isEdite ? S.of(context).editeItem : S.of(context).createItem,
        style: AppStyles.textStyle18,
      ),
      centerTitle: true,
    );
  }

  var manufacturerController = TextEditingController();
  Widget buildDropDownCata(List<DropdownMenuItem<String>> breedData) {
    return Container(
      width: MediaQuery.of(context).size.width * .99,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          iconSize: 18,
          menuMaxHeight: 300,
          isExpanded: true,
          iconEnabledColor: Colors.black,
          borderRadius: BorderRadius.circular(8),
          hint: SizedBox(
            width: MediaQuery.of(context).size.width / 2.6,
            child: Text(
              manufacturerController.text.isEmpty
                  ? "Select  Catalytic"
                  : manufacturerController.text,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onChanged: (newValue) {
            setState(() {
              manufacturerController.text = newValue!;
            });
          },
          items: AppFunction.catalyticDropDownList,
        ),
      ),
    );
  }

  String? dropdownValueProduct;
  Widget buildDropDownProduct(List<DropdownMenuItem<String>> breedData) {
    return Container(
      width: MediaQuery.of(context).size.width * .99,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          underline: const SizedBox(),
          iconSize: 18,
          menuMaxHeight: 300,
          isExpanded: true,
          iconEnabledColor: Colors.black,
          borderRadius: BorderRadius.circular(8),
          hint: SizedBox(
            width: MediaQuery.of(context).size.width / 2.6,
            child: Text(
              dropdownValueProduct ?? "Select  Product",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onChanged: (newValue) {
            setState(() {
              dropdownValueProduct = newValue!;
            });
          },
          items: AppFunction.productDropDownList,
        ),
      ),
    );
  }

  String? dropdownValueState;
  Widget buildDropDownBreed(List<Brand> breedData) {
    return Container(
      width: MediaQuery.of(context).size.width * .99,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<Brand>(
          underline: const SizedBox(),
          isExpanded: true,
          iconSize: 18,
          menuMaxHeight: 300,
          iconEnabledColor: Colors.black,
          borderRadius: BorderRadius.circular(8),
          hint: SizedBox(
            width: MediaQuery.of(context).size.width / 2.6,
            child: Text(
              dropdownValueState ?? "Select Brand",
              overflow: TextOverflow.ellipsis,
            ),
          ),
          onChanged: (newValue) {
            setState(() {
              dropdownValueState = newValue!.name;
              print('${newValue.id}555555555555555555555555555');
            });
          },
          items: breedData.map((Brand value) {
            return DropdownMenuItem<Brand>(
              value: value,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.6,
                child: Text(
                  value.name.toString(),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
