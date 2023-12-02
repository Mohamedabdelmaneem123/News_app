import 'package:figma/news%20app/News_app/AppCubit/Appcubit.dart';
import 'package:figma/news%20app/News_app/Cubit.dart';
import 'package:figma/news%20app/News_app/Home_news.dart';
import 'package:figma/news%20app/layout/dio_peackage.dart';
import 'package:figma/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma/utils.dart';
import 'package:figma/presentation/calorie-management.dart';
import 'package:hexcolor/hexcolor.dart';

import 'design/home.dart';
import 'news app/News_app/AppCubit/Appstates.dart';
import 'news app/News_app/helper/CacheHelper.dart';
import 'news app/News_app/helper/observe.dart';
// import 'package:myapp/design/home.dart';
// import 'package:myapp/design/search.dart';
// import 'package:myapp/design/scan-result.dart';
// import 'package:myapp/design/landing-page.dart';
// import 'package:myapp/design/landing-page2.dart';
// import 'package:myapp/design/landing-page3.dart';
// import 'package:myapp/design/log-in.dart';
// import 'package:myapp/design/enter-code.dart';
// import 'package:myapp/design/enter-code-7pT.dart';
// import 'package:myapp/design/sign-up.dart';
// import 'package:myapp/design/select.dart';
// import 'package:myapp/design/select-2.dart';
// import 'package:myapp/design/enter-weight.dart';
// import 'package:myapp/design/slecting-unit.dart';
// import 'package:myapp/design/salads.dart';
// import 'package:myapp/design/yoga.dart';
// import 'package:myapp/design/plus-button.dart';
// import 'package:myapp/design/notification.dart';
// import 'package:myapp/design/foods.dart';
// import 'package:myapp/design/veg-food-.dart';
// import 'package:myapp/design/salad-details.dart';
// import 'package:myapp/design/ditailed-food.dart';
// import 'package:myapp/design/detailes-food.dart';
// import 'package:myapp/design/settings.dart';
// import 'package:myapp/design/settings-UVm.dart';
// import 'package:myapp/design/settings-t87.dart';
// import 'package:myapp/design/yoga-video.dart';
// import 'package:myapp/design/yoga-start.dart';
// import 'package:myapp/design/component-2.dart';
// import 'package:myapp/design/excercises.dart';
// import 'package:myapp/design/favourites.dart';
// import 'package:myapp/design/remove-popup.dart';
// import 'package:myapp/design/daily-stats.dart';
// import 'package:myapp/design/i-button-toggle.dart';
// import 'package:myapp/design/eaten-meal.dart';
// import 'package:myapp/design/congrats-window.dart';

void main() async {
	// to ensure running all async await functions before runApp
	WidgetsFlutterBinding.ensureInitialized();

	Bloc.observer = MyBlocObserver();
	Diohelper.init();

	await CacheHelper.init();
	bool? isdark = CacheHelper.getBoolData(key: 'isdark');

	runApp(MyApp( isdark: isdark,));
}


class MyApp extends StatelessWidget {
	final bool? isdark;
	const MyApp({Key? key, required this.isdark}) : super(key: key);
	@override
	Widget build(BuildContext context) {
	return  MultiBlocProvider(
			providers: [
				BlocProvider(
					create: (BuildContext context) => cubiit()..getBusiness(),
				),
				BlocProvider(
					create: (BuildContext context) =>
					Appcubiit()..changemode(isDarkFromShared: isdark),
				)
			],
		child: BlocConsumer<Appcubiit,Appstates>(
				listener: (context, state) {} ,
				builder: (context, state) {
					return MaterialApp(
						title: 'Flutter',
						debugShowCheckedModeBanner: false,
						scrollBehavior: MyCustomScrollBehavior(),
						theme: ThemeData(
							primarySwatch: Colors.blue,
							scaffoldBackgroundColor: Colors.white,
							appBarTheme: AppBarTheme(

									elevation: 0,
									titleSpacing: 20,
									// backwardsCompatibility: false, to edit status bar

									backgroundColor: Colors.white,
									titleTextStyle: TextStyle(
										color: Colors.black,
										fontSize: 20,
										fontWeight: FontWeight.bold,
									),
									iconTheme: IconThemeData(color: Colors.black),
									systemOverlayStyle: SystemUiOverlayStyle(
											statusBarIconBrightness: Brightness.dark,
											statusBarColor: Colors.black26,
											statusBarBrightness: Brightness.light
									)),
							bottomNavigationBarTheme: BottomNavigationBarThemeData(
								selectedItemColor: Colors.blue,
								backgroundColor: Colors.white,
								unselectedItemColor: Colors.grey,
							),

						),
						darkTheme: ThemeData(
								primarySwatch: Colors.blue,
								scaffoldBackgroundColor:HexColor('333739'),
								appBarTheme: AppBarTheme(

										elevation: 0,
										titleSpacing: 20,
										// backwardsCompatibility: false, to edit status bar

										backgroundColor: HexColor('333739'),
										titleTextStyle: TextStyle(
											color: Colors.white,
											fontSize: 20,
											fontWeight: FontWeight.bold,
										),
										iconTheme: IconThemeData(color: Colors.white),
										systemOverlayStyle: SystemUiOverlayStyle(
												statusBarIconBrightness: Brightness.dark,
												statusBarColor: HexColor('333739'),
												statusBarBrightness: Brightness.dark
										)),
								bottomNavigationBarTheme: BottomNavigationBarThemeData(
									selectedItemColor: Colors.blue,
									backgroundColor: HexColor('333739'),
									unselectedItemColor: Colors.grey,
								),
								textTheme: TextTheme(bodyText1: TextStyle(
										fontWeight:FontWeight.w900,
										color: Colors.white
								))

						),
						themeMode: Appcubiit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
						home: app_news(),
					);
				}, )

	);
	}
}
