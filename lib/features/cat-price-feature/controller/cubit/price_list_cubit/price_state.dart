part of 'price_cubit.dart';

@immutable
abstract class PriceState {}

class PriceInitial extends PriceState {}
class SearchForItemLodingState extends PriceState {}
class SearchForItemSuccessState extends PriceState {}
class SearchForItemErrorState extends PriceState {}


class CreateNewListLodingState extends PriceState {}
class CreateNewListSuccessState extends PriceState {}
class CreateNewListErrorState extends PriceState {}

class GetAllListsLodingState extends PriceState {}
class GetAllListsSuccessState extends PriceState {}
class GetAllListsErrorState extends PriceState {}

class DeleteListLodingState extends PriceState {}
class DeleteListSuccessState extends PriceState {}
class DeleteListErrorState extends PriceState {}


class SelectItemImageLodingState extends PriceState {}
class SelectItemImageSuccessState extends PriceState {}
class SelectItemImageErrorState extends PriceState {}


class UploadImageItemLodingState extends PriceState {}
class UploadImageItemSuccessState extends PriceState {}
class UploadImageItemErrorState extends PriceState {}

class UpdateListLodingState extends PriceState {}
class UpdateListSuccessState extends PriceState {}
class UpdateListErrorState extends PriceState {}

class CreateItemLodingState extends PriceState {}
class CreateItemSuccessState extends PriceState {}
class CreateItemErrorState extends PriceState {}


class AddNewPriceItemState extends PriceState {}
class IncreaseQuantityState extends PriceState {}
class DecreaseQuantityState extends PriceState {}
