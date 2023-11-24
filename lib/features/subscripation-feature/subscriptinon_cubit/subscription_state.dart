part of 'subscription_cubit.dart';

@immutable
abstract class SubscriptionState {}

class SubscriptionInitial extends SubscriptionState {}
class ChangeSubYearlyEmitState extends SubscriptionState {}
class ChangeBroSearchEmitState extends SubscriptionState {}
class ChangeUsersBroSubscriptionEmitState extends SubscriptionState {}
class CalculateTotalBroPriceEmitState extends SubscriptionState {}

class GetAllSubscriptionLodingPricesEmitState extends SubscriptionState {}
class GetAllSubscriptionSuccessPricesEmitState extends SubscriptionState {}
class GetAllSubscriptionErrorPricesEmitState extends SubscriptionState {}

class CreateSubscriptionRequestLodingPricesEmitState extends SubscriptionState {}
class CreateSubscriptionRequestSuccessPricesEmitState extends SubscriptionState {}
class CreateSubscriptionRequestErrorPricesEmitState extends SubscriptionState {}



