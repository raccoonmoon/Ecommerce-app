import 'package:ecommerce_app_hackathon/controllers/cart_provider.dart';
import 'package:ecommerce_app_hackathon/pages/cart_page.dart';
import 'package:ecommerce_app_hackathon/pages/login_signup_page.dart';
import 'package:ecommerce_app_hackathon/pages/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: LoginSignupScreen(),
      routes: {
        '/main': (context) => const MainScreen(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}
