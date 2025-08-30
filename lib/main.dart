import 'package:assestment_restaurant_app/themes/restaurant_theme.dart';
import 'package:assestment_restaurant_app/util/text_theme_util/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyRestaurantApp());
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
      
    );
  }
}
