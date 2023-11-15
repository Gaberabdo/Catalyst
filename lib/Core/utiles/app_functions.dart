import 'package:admin_task/Core/utiles/stayles.dart';
import 'package:flutter/material.dart';

import 'app_variables.dart';
import 'assets_manager.dart';
import 'colors.dart';

class AppFunction {
  static Future<void> pushAndRemove(
    BuildContext context,
    Widget screen,
  ) async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }

  static Future<void> pushTo(
    BuildContext context,
    Widget screen,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static Future<void> showErrorORWarningDialog({
    required BuildContext context,
    required String subtitle,
    required Function fct,
    bool isError = true,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.warning,
                  size: 30,
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  subtitle,
                  style: AppStyles.textStyle20,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          subtitle,
                          style: AppStyles.textStyle16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        fct();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Ok",
                        style: AppStyles.textStyle16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  static String priceCalculate({
    String? pd,
    double? weight,
    String? pt,
    String? rh,
  }) {
    // Safe parsing function
    double safeParse(String? value) {
      try {
        return double.parse(value ?? '0');
      } catch (_) {
        return 0;
      }
    }

    // Ensure non-null values and provide default values if needed
    double pdValue = safeParse(pd);
    double weightValue = weight ?? 0;
    double ptValue = safeParse(pt);
    double rhValue = safeParse(rh);

    // Check if weight is null or less than or equal to zero
    if (weightValue <= 0) {
      return "Invalid weight";
    }

    var ptt = (ptValue / 31.105).toStringAsFixed(2);
    var pdd = (pdValue / 31.9).toStringAsFixed(2);
    var rhh = (rhValue / 35.8).toStringAsFixed(2);

    var price = (double.parse(pdd) * weightValue / 1000 * 0.98) +
        (double.parse(ptt) * weightValue / 1000 * 0.98) +
        (double.parse(rhh) * weightValue / 1000 * 0.90);

    return price.toString();
  }

  static Future<void> imagePickerDialog({
    required BuildContext context,
    required Function cameraFCT,
    required Function galleryFCT,
    required Function removeFCT,
  }) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(
              child: Text(
                "Choose option",
                style: AppStyles.textStyle20,
              ),
            ),
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                TextButton.icon(
                  onPressed: () {
                    cameraFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text(
                    "Camera",
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    galleryFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.image),
                  label: const Text(
                    "Gallery",
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    removeFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text(
                    "Remove",
                  ),
                ),
              ],
            )),
          );
        });
  }

  static loadingPage({required context}) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(
            color: AppColors.yellowColor,
          ),
        ),
      );

  static List<DropdownMenuItem<String>>? get brandDropDownList {
    List<DropdownMenuItem<String>>? menuItems =
        List<DropdownMenuItem<String>>.generate(
      AppVariables.brandList.length,
      (index) => DropdownMenuItem(
        value: AppVariables.brandList[index],
        child: Text(
          AppVariables.brandList[index],
        ),
      ),
    );
    return menuItems;
  }

  static List<DropdownMenuItem<String>>? get productDropDownList {
    print(AppVariables.productList.length);
    print(AppVariables.productList);
    List<DropdownMenuItem<String>>? menuItems =
        List<DropdownMenuItem<String>>.generate(
      AppVariables.productList.length,
      (index) => DropdownMenuItem(
        value: AppVariables.productList[index],
        child: Text(
          AppVariables.productList[index],
        ),
      ),
    );
    return menuItems;
  }

  static List<DropdownMenuItem<String>>? get catalyticDropDownList {
    List<DropdownMenuItem<String>>? menuItems =
        List<DropdownMenuItem<String>>.generate(
      AppVariables.catalyticList.length,
      (index) => DropdownMenuItem(
        value: AppVariables.catalyticList[index],
        child: Text(
          AppVariables.catalyticList[index],
        ),
      ),
    );
    return menuItems;
  }
}
