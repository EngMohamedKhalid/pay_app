import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pay_app/app/utils/consts.dart';
import 'package:pay_app/features/payment_feature/presentation/cubit/payment_cubit.dart';
import 'app/themes/get_theme.dart';
import 'app/utils/bloc_observer.dart';
import 'app/utils/get_it_injection.dart';
import 'app/utils/language_manager.dart';
import 'app/utils/navigation_helper.dart';
import 'app/widgets/carousel_widget/carousel_cubit/carousel_cubit.dart';
import 'features/payment_feature/presentation/screens/cart_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await init();
  Stripe.publishableKey = kPublishKey;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CarouselCubit>(
          create: (BuildContext context) => CarouselCubit(),
        ),
        BlocProvider<PaymentCubit>(
          create: (BuildContext context) => PaymentCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        english_local,
        arabic_local,
      ],
      saveLocale: true,
      startLocale: english_local,
      path: assets_path_localisations,
      fallbackLocale: english_local,
      //
      //* OverlaySupport
      //
      child: OverlaySupport.global(
        //
        //* ScreenUtilInit
        //
        child: ScreenUtilInit(
          designSize: const Size(428, 926),
          minTextAdapt: true,
          splitScreenMode: true,
          //
          //* MaterialApp
          //
          builder: (context, child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            // locale: CookieManagerService.getLocale,
            locale: context.locale,
            title: 'Payment App',
            theme: PayTheme(),
            debugShowCheckedModeBanner: false,
            navigatorKey: getIt<NavHelper>().navigatorKey,
            builder: EasyLoading.init(
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
            ),
            home:const CartScreen(),
          ),
        ),
      ),
    );
  }
}
//seckret key
//sk_test_51NcYZ1IFBuxSP4IyHPxRBxM7hwSNclM111B2vACftn35lmmhIw1Lyu1A1UkJ4AT08DWRULN37gUyZAXSdRKRnQ2v00hPaFnFsX


// publish key
// pk_test_51NcYZ1IFBuxSP4IyHk35qI4RSKdmWyWl40XRt6T2SPc9OPo35cwnMJY0um0DwCChfDfyMD9Hiq7Ecn8PRttdrHP100XAw4bhFL