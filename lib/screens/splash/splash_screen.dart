import 'package:assestment_restaurant_app/routes/navigation_route.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Column(
        children: [
          /// Image buger splash screen
          Align(
            alignment: Alignment.topCenter,
            child: FractionalTranslation(
              translation: Offset(-0.5, 0.1),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    width: 600,
                    child: Image.asset('assets/images/burger.png'),
                  ),
                ),
              ),
            ),
          ),

          SizedBox.square(dimension: 50),

          /// Title & Subtitle splash screen
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Title Splash Screen
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Foodies',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              /// Subtitle Spalsh Screen
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'We Help You Find The Best Restaurant In Indonesia',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),

      /// Bottom Button Bar
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, NavigationRoute.main.name);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Continue',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_right, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
