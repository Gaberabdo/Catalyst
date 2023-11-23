import 'package:cat_price/core/core-price-cat/network/remote/dio_helper.dart';
import 'package:cat_price/features/Authentication/presention/manager/Auth_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:cat_price/generated/l10n.dart';
import 'core/SharedPreference.dart';
import 'core/core-brand/utiles/service_locator.dart';
import 'core/services/dio_helper.dart';
import 'core/services/preferences.dart';
import 'features/Authentication/presention/views/onboarding_view.dart';
import 'features/Home/presention/manager/metals_cubit/cubit.dart';
import 'features/Home/presention/views/home_view.dart';
import 'features/cat-price-feature/controller/cubit/price_list_cubit/price_cubit.dart';
import 'features/electronics/presention/manager/electronics/electronics_cubit.dart';
import 'features/settings/controller/setting_cubit.dart';
import 'features/settings/controller/setting_state.dart';
import 'features/splash-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  await Preference.init();
  await Preferences.init();
  await Diohelper.init();
  await Preference.init();
  await DioFinalHelper.init();
  dynamic token;
  token = Preference.getData(key: "token");
  late Widget widget;

  if (token == null) {
    widget = const OnBoardingView();
  } else {
    widget = const HomeView();
  }
  runApp(MyApp(
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MetalsCubit()
            ..TimerGetMetals()
            ..GetMostSearched(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => PriceCubit(),
        ),
        BlocProvider(
          create: (context) => ElectronicsCubit(),
        ),
      ],
      child: BlocProvider(
        create: (context) => SettingCubit()
          ..changeAppLang(
            fromSharedLang: Preference.getData(key: 'language'),
          ),
        child: BlocConsumer<SettingCubit, SettingState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = SettingCubit.get(context);
            return GetMaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  color: Colors.white,
                  foregroundColor: Colors.black
                )
              ),
              locale: cubit.language == 'en'
                  ? const Locale('en')
                  : const Locale('ar'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: SplashScreen(widget: widget),
            );
          },
        ),
      ),
    );
  }
}
