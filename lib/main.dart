import 'package:assestment_restaurant_app/data/api/api_services.dart';
import 'package:assestment_restaurant_app/provider/add_review/add_review_provider.dart';
import 'package:assestment_restaurant_app/provider/bottom_nav/bottom_nav_provider.dart';
import 'package:assestment_restaurant_app/provider/restaurant_detail/restaurant_detail_provider.dart';
import 'package:assestment_restaurant_app/provider/restaurant_list/restaurant_list_provider.dart';
import 'package:assestment_restaurant_app/routes/navigation_route.dart';
import 'package:assestment_restaurant_app/screens/detail/detail_screen.dart';
import 'package:assestment_restaurant_app/screens/main/main_screen.dart';
import 'package:assestment_restaurant_app/screens/splash/splash_screen.dart';
import 'package:assestment_restaurant_app/themes/restaurant_theme.dart';
import 'package:assestment_restaurant_app/util/text_theme_util/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        Provider(create: (context) => ApiServices()),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantListProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantDetailProvider(context.read<ApiServices>()),
        ),
        ChangeNotifierProvider(
          create: (context) => AddReviewProvider(context.read<ApiServices>()),
        ),
      ],
      child: MyRestaurantApp(),
    ),
  );
}

class MyRestaurantApp extends StatelessWidget {
  const MyRestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, 'Montserrat', 'Montserrat');

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Application',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: NavigationRoute.splash.name,
      routes: {
        NavigationRoute.splash.name: (context) => SplashScreen(),
        NavigationRoute.main.name: (context) => MainScreen(),
        NavigationRoute.detail.name: (context) => DetailScreen(
          restaurantId: ModalRoute.of(context)?.settings.arguments as String,
        ),
      },
    );
  }
}
