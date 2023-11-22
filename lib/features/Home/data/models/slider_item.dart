class SliderList {
  bool success;
  int code;
  List<SliderItem> sliders;

  SliderList({
    required this.success,
    required this.code,
    required this.sliders,
  });

  factory SliderList.fromJson(Map<String, dynamic> json) {
    return SliderList(
      success: json['success'],
      code: json['code'],
      sliders: (json['sliders'] as List)
          .map((slider) => SliderItem.fromJson(slider))
          .toList(),
    );
  }
}

class SliderItem {
  List<String> listOfSliders;

  SliderItem({
    required this.listOfSliders,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) {
    return SliderItem(
      listOfSliders: json['listOfSliders'] == null
          ? List.empty()
          : List<String>.from(json['listOfSliders']),
    );
  }
}
