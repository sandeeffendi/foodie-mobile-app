import 'package:assestment_restaurant_app/core/provider/add_review/add_review_provider.dart';
import 'package:assestment_restaurant_app/core/provider/bottom_nav/bottom_nav_provider.dart';
import 'package:assestment_restaurant_app/core/provider/favorites/favorites_icon_provider.dart';
import 'package:assestment_restaurant_app/core/provider/favorites/favorites_provider.dart';
import 'package:assestment_restaurant_app/core/provider/restaurant_detail/detail_description_provider.dart';
import 'package:assestment_restaurant_app/core/provider/restaurant_detail/restaurant_detail_provider.dart';
import 'package:assestment_restaurant_app/core/provider/restaurant_list/restaurant_list_provider.dart';
import 'package:assestment_restaurant_app/core/data/api/api_services.dart';
import 'package:assestment_restaurant_app/core/provider/themes/themes_provider.dart';
import 'package:assestment_restaurant_app/routes/navigation_route.dart';
import 'package:assestment_restaurant_app/screens/detail/detail_screen.dart';
import 'package:assestment_restaurant_app/screens/main/main_screen.dart';
import 'package:assestment_restaurant_app/screens/splash/splash_screen.dart';
import 'package:assestment_restaurant_app/core/themes/restaurant_theme.dart';
import 'package:assestment_restaurant_app/util/fonts/restaurant_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemesProvider();
  await themeProvider.loadThemeMode();

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
        ChangeNotifierProvider(
          create: (context) => DetailDescriptionProvider(),
        ),
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
        ChangeNotifierProvider(create: (context) => FavoritesIconProvider()),
        ChangeNotifierProvider(create: (context) => ThemesProvider()),
      ],
      child: MyRestaurantApp(),
    ),
  );
}

class MyRestaurantApp extends StatelessWidget {
  const MyRestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemesProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Application',
      theme: MaterialTheme(RestaurantTextStyle.lightTextTheme).light(),
      darkTheme: MaterialTheme(RestaurantTextStyle.darkTextTheme).dark(),
      themeMode: themeProvider.themeMode,
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
