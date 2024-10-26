import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mi_store/firebase_options.dart';
import 'package:mi_store/providers/admin_provider.dart';
import 'package:mi_store/providers/cart_provider.dart';
import 'package:mi_store/providers/homepage_provider.dart';
import 'package:mi_store/providers/payment_provider.dart';
import 'package:mi_store/providers/user_provider.dart';
import 'package:mi_store/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'providers/signin_provider.dart';
import 'providers/signup_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");

  Stripe.publishableKey = dotenv.env["PUBLISHABLE_KEY"]!;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SignUpProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SigninProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HomepageProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AdminProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => PaymentProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mi Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen());
  }
}
