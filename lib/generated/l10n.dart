// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign in`
  String get Signin {
    return Intl.message(
      'Sign in',
      name: 'Signin',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get EnterYourEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'EnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get EnterYourPassword {
    return Intl.message(
      'Enter Your Password',
      name: 'EnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Full Name`
  String get EnterYourFullName {
    return Intl.message(
      'Enter Your Full Name',
      name: 'EnterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get EnterYourPhoneNumber {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'EnterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Country`
  String get SelectYourCountry {
    return Intl.message(
      'Select Your Country',
      name: 'SelectYourCountry',
      desc: '',
      args: [],
    );
  }

  /// `Weight/KG`
  String get WeightKG {
    return Intl.message(
      'Weight/KG',
      name: 'WeightKG',
      desc: '',
      args: [],
    );
  }

  /// `Price Dollar`
  String get PriceDollar {
    return Intl.message(
      'Price Dollar',
      name: 'PriceDollar',
      desc: '',
      args: [],
    );
  }

  /// `Lets Start Now`
  String get LetsStartNow {
    return Intl.message(
      'Lets Start Now',
      name: 'LetsStartNow',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get Price {
    return Intl.message(
      'Price',
      name: 'Price',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get ForgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back ,We missed you`
  String get WelcomeBackWemissedyou {
    return Intl.message(
      'Welcome Back ,We missed you',
      name: 'WelcomeBackWemissedyou',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an account?`
  String get Donthaveanaccount {
    return Intl.message(
      'Dont have an account?',
      name: 'Donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get Alreadyhaveanaccount {
    return Intl.message(
      'Already have an account',
      name: 'Alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get Signup {
    return Intl.message(
      'Sign up',
      name: 'Signup',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `My lists`
  String get Mylists {
    return Intl.message(
      'My lists',
      name: 'Mylists',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Phone {
    return Intl.message(
      'Phone',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get Country {
    return Intl.message(
      'Country',
      name: 'Country',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'LetsStart Now' key

  /// `My Tools`
  String get MyTools {
    return Intl.message(
      'My Tools',
      name: 'MyTools',
      desc: '',
      args: [],
    );
  }

  /// `Calculator`
  String get Calculator {
    return Intl.message(
      'Calculator',
      name: 'Calculator',
      desc: '',
      args: [],
    );
  }

  /// `Price List`
  String get PriceList {
    return Intl.message(
      'Price List',
      name: 'PriceList',
      desc: '',
      args: [],
    );
  }

  /// `My Catalog`
  String get MyCatalog {
    return Intl.message(
      'My Catalog',
      name: 'MyCatalog',
      desc: '',
      args: [],
    );
  }

  /// `Charts`
  String get Charts {
    return Intl.message(
      'Charts',
      name: 'Charts',
      desc: '',
      args: [],
    );
  }

  /// `electronics`
  String get electronics {
    return Intl.message(
      'electronics',
      name: 'electronics',
      desc: '',
      args: [],
    );
  }

  /// `PGM Prices`
  String get PGMPrices {
    return Intl.message(
      'PGM Prices',
      name: 'PGMPrices',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Up/Down`
  String get UpDown {
    return Intl.message(
      'Up/Down',
      name: 'UpDown',
      desc: '',
      args: [],
    );
  }

  /// `Per Ounce`
  String get PerOunce {
    return Intl.message(
      'Per Ounce',
      name: 'PerOunce',
      desc: '',
      args: [],
    );
  }

  /// `Per Gram`
  String get PerGram {
    return Intl.message(
      'Per Gram',
      name: 'PerGram',
      desc: '',
      args: [],
    );
  }

  /// `The Most Searched`
  String get TheMostSearched {
    return Intl.message(
      'The Most Searched',
      name: 'TheMostSearched',
      desc: '',
      args: [],
    );
  }

  /// `Search items`
  String get Searchitems {
    return Intl.message(
      'Search items',
      name: 'Searchitems',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get Favourite {
    return Intl.message(
      'Favourite',
      name: 'Favourite',
      desc: '',
      args: [],
    );
  }

  /// `Brands`
  String get Brands {
    return Intl.message(
      'Brands',
      name: 'Brands',
      desc: '',
      args: [],
    );
  }

  /// `Brand Details`
  String get BrandDeta {
    return Intl.message(
      'Brand Details',
      name: 'BrandDeta',
      desc: '',
      args: [],
    );
  }

  /// `Inbox`
  String get Inbox {
    return Intl.message(
      'Inbox',
      name: 'Inbox',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get Contactus {
    return Intl.message(
      'Contact us',
      name: 'Contactus',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Share app`
  String get Shareapp {
    return Intl.message(
      'Share app',
      name: 'Shareapp',
      desc: '',
      args: [],
    );
  }

  /// `Subscriptions`
  String get Subscriptions {
    return Intl.message(
      'Subscriptions',
      name: 'Subscriptions',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `price list`
  String get priceList {
    return Intl.message(
      'price list',
      name: 'priceList',
      desc: '',
      args: [],
    );
  }

  /// `Search Item`
  String get searchItem {
    return Intl.message(
      'Search Item',
      name: 'searchItem',
      desc: '',
      args: [],
    );
  }

  /// `Add item`
  String get addItem {
    return Intl.message(
      'Add item',
      name: 'addItem',
      desc: '',
      args: [],
    );
  }

  /// `My list`
  String get myList {
    return Intl.message(
      'My list',
      name: 'myList',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `My Items`
  String get myItems {
    return Intl.message(
      'My Items',
      name: 'myItems',
      desc: '',
      args: [],
    );
  }

  /// `Total price`
  String get totalPrice {
    return Intl.message(
      'Total price',
      name: 'totalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `clear`
  String get clear {
    return Intl.message(
      'clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Show Photo`
  String get showPhoto {
    return Intl.message(
      'Show Photo',
      name: 'showPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Update List`
  String get update {
    return Intl.message(
      'Update List',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Save list`
  String get saveList {
    return Intl.message(
      'Save list',
      name: 'saveList',
      desc: '',
      args: [],
    );
  }

  /// `Item Name`
  String get itemName {
    return Intl.message(
      'Item Name',
      name: 'itemName',
      desc: '',
      args: [],
    );
  }

  /// `Item Price`
  String get itemPrice {
    return Intl.message(
      'Item Price',
      name: 'itemPrice',
      desc: '',
      args: [],
    );
  }

  /// `Upload  image`
  String get uploadImage {
    return Intl.message(
      'Upload  image',
      name: 'uploadImage',
      desc: '',
      args: [],
    );
  }

  /// `List Name`
  String get listName {
    return Intl.message(
      'List Name',
      name: 'listName',
      desc: '',
      args: [],
    );
  }

  /// `No Items`
  String get noItem {
    return Intl.message(
      'No Items',
      name: 'noItem',
      desc: '',
      args: [],
    );
  }

  /// `Drag the image or click to upload it...`
  String get selectImage {
    return Intl.message(
      'Drag the image or click to upload it...',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `My Catalog`
  String get title {
    return Intl.message(
      'My Catalog',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get items {
    return Intl.message(
      'Items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message(
      'In Progress',
      name: 'inProgress',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get approved {
    return Intl.message(
      'Approved',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `Refused`
  String get refused {
    return Intl.message(
      'Refused',
      name: 'refused',
      desc: '',
      args: [],
    );
  }

  /// `Edit Item`
  String get editeItem {
    return Intl.message(
      'Edit Item',
      name: 'editeItem',
      desc: '',
      args: [],
    );
  }

  /// ` Click to upload image`
  String get clickToUpload {
    return Intl.message(
      ' Click to upload image',
      name: 'clickToUpload',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Weight/gr`
  String get weight {
    return Intl.message(
      'Weight/gr',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Palladium/ppm`
  String get paladium {
    return Intl.message(
      'Palladium/ppm',
      name: 'paladium',
      desc: '',
      args: [],
    );
  }

  /// `Platinum/ppm`
  String get platinum {
    return Intl.message(
      'Platinum/ppm',
      name: 'platinum',
      desc: '',
      args: [],
    );
  }

  /// `Rhodium/ppm`
  String get rhodium {
    return Intl.message(
      'Rhodium/ppm',
      name: 'rhodium',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get product {
    return Intl.message(
      'Product',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `Catalytic Manufacturer`
  String get catalytic {
    return Intl.message(
      'Catalytic Manufacturer',
      name: 'catalytic',
      desc: '',
      args: [],
    );
  }

  /// `Is`
  String get Is {
    return Intl.message(
      'Is',
      name: 'Is',
      desc: '',
      args: [],
    );
  }

  /// `HYBIRD`
  String get HYBIRD {
    return Intl.message(
      'HYBIRD',
      name: 'HYBIRD',
      desc: '',
      args: [],
    );
  }

  /// `Diesel`
  String get Diesel {
    return Intl.message(
      'Diesel',
      name: 'Diesel',
      desc: '',
      args: [],
    );
  }

  /// `Petrol`
  String get Petrol {
    return Intl.message(
      'Petrol',
      name: 'Petrol',
      desc: '',
      args: [],
    );
  }

  /// `Industry`
  String get Industry {
    return Intl.message(
      'Industry',
      name: 'Industry',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get Resend {
    return Intl.message(
      'Resend',
      name: 'Resend',
      desc: '',
      args: [],
    );
  }

  /// `Create Item`
  String get createItem {
    return Intl.message(
      'Create Item',
      name: 'createItem',
      desc: '',
      args: [],
    );
  }

  /// `Send to Admin`
  String get sendToAdmin {
    return Intl.message(
      'Send to Admin',
      name: 'sendToAdmin',
      desc: '',
      args: [],
    );
  }

  /// `Item Details`
  String get itemDetails {
    return Intl.message(
      'Item Details',
      name: 'itemDetails',
      desc: '',
      args: [],
    );
  }

  /// `No Result`
  String get noResult {
    return Intl.message(
      'No Result',
      name: 'noResult',
      desc: '',
      args: [],
    );
  }

  /// `Price:`
  String get price {
    return Intl.message(
      'Price:',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Pick another image`
  String get pickAnotherImage {
    return Intl.message(
      'Pick another image',
      name: 'pickAnotherImage',
      desc: '',
      args: [],
    );
  }

  /// `Remove image`
  String get removeImage {
    return Intl.message(
      'Remove image',
      name: 'removeImage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message(
      'Currency',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Discount Margin`
  String get discountMargin {
    return Intl.message(
      'Discount Margin',
      name: 'discountMargin',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Connect Us`
  String get connects {
    return Intl.message(
      'Connect Us',
      name: 'connects',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Please Contact The administrator by sending an gmail`
  String get messageAdmin {
    return Intl.message(
      'Please Contact The administrator by sending an gmail',
      name: 'messageAdmin',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'addmessage ' key

  // skipped getter for the 'send ' key

  // skipped getter for the 'sendAdmin ' key

  /// `Day`
  String get Day {
    return Intl.message(
      'Day',
      name: 'Day',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get Week {
    return Intl.message(
      'Week',
      name: 'Week',
      desc: '',
      args: [],
    );
  }

  /// `Palladium`
  String get Palladium {
    return Intl.message(
      'Palladium',
      name: 'Palladium',
      desc: '',
      args: [],
    );
  }

  /// `Platinum`
  String get Platinum {
    return Intl.message(
      'Platinum',
      name: 'Platinum',
      desc: '',
      args: [],
    );
  }

  /// `Rhodium`
  String get Rhodium {
    return Intl.message(
      'Rhodium',
      name: 'Rhodium',
      desc: '',
      args: [],
    );
  }

  /// `Electronics`
  String get Electronics {
    return Intl.message(
      'Electronics',
      name: 'Electronics',
      desc: '',
      args: [],
    );
  }

  /// `Computer`
  String get Computer {
    return Intl.message(
      'Computer',
      name: 'Computer',
      desc: '',
      args: [],
    );
  }

  /// `Ram`
  String get Ram {
    return Intl.message(
      'Ram',
      name: 'Ram',
      desc: '',
      args: [],
    );
  }

  /// `CdRoom`
  String get CdRoom {
    return Intl.message(
      'CdRoom',
      name: 'CdRoom',
      desc: '',
      args: [],
    );
  }

  /// `PowerSupply`
  String get PowerSupply {
    return Intl.message(
      'PowerSupply',
      name: 'PowerSupply',
      desc: '',
      args: [],
    );
  }

  /// `Motherboard`
  String get Motherboard {
    return Intl.message(
      'Motherboard',
      name: 'Motherboard',
      desc: '',
      args: [],
    );
  }

  /// `piece`
  String get piece {
    return Intl.message(
      'piece',
      name: 'piece',
      desc: '',
      args: [],
    );
  }

  /// `Similar Products`
  String get Similar_Products {
    return Intl.message(
      'Similar Products',
      name: 'Similar_Products',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get Start {
    return Intl.message(
      'Get Started',
      name: 'Start',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Our App Cat price`
  String get Welcome {
    return Intl.message(
      'Welcome To Our App Cat price',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to a world of features that you will not find in other programs`
  String get Screen1 {
    return Intl.message(
      'Welcome to a world of features that you will not find in other programs',
      name: 'Screen1',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy and browse a huge amount of catalysts, brands, electronics and more to come`
  String get Screen2 {
    return Intl.message(
      'Enjoy and browse a huge amount of catalysts, brands, electronics and more to come',
      name: 'Screen2',
      desc: '',
      args: [],
    );
  }

  /// `We will provide you with a unique experience among the programs to see the best prices and the most powerful features with low subscriptions and sustainable development`
  String get Screen3 {
    return Intl.message(
      'We will provide you with a unique experience among the programs to see the best prices and the most powerful features with low subscriptions and sustainable development',
      name: 'Screen3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
