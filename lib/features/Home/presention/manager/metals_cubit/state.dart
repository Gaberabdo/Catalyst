import '../../../data/models/metals_model.dart';
import '../../../data/models/search_item_model.dart';
import '../../../data/models/slider_item.dart';

abstract class MetalsState {}

class intialState extends MetalsState {}

class loadingState extends MetalsState {}

class successState extends MetalsState {
  final MetalItem item ;

  successState(this.item);
}

class errorState extends MetalsState {
  final String errMessage;

  errorState(this.errMessage);
}

class successMostSearcedState extends MetalsState {}

class ErrorMostSearcedState extends MetalsState {
  final String errMessage;

  ErrorMostSearcedState(this.errMessage);
}

class LoadingMostSearcedState extends MetalsState {}

class SearchLoadingState extends MetalsState {}

class SearchSuccessState extends MetalsState {
  final List<Item> searchResults;

  SearchSuccessState(this.searchResults);
}

class SearchErrorState extends MetalsState {
  final String errorMessage;

  SearchErrorState(this.errorMessage);
}

class FavLoadingState extends MetalsState {}

class FavSuccessState extends MetalsState {
  final List<Item> favResults;

  FavSuccessState(this.favResults);
}

class FavActionSuccessState extends MetalsState {}


class FavErrorState extends MetalsState {
  final String errorMessage;

  FavErrorState(this.errorMessage);
}

class GetSliderLoadingState extends MetalsState {}

class GetSliderSuccessState extends MetalsState {
  final SliderList item ;

  GetSliderSuccessState(this.item);
}

class GetSliderErrorState extends MetalsState {}