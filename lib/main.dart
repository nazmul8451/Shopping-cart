import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_cart/data/service/product_controller.dart';
import 'package:shoping_cart/view/presentation/screens/home_screen.dart';
import 'package:shoping_cart/view/presentation/screens/my_cart.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductController())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
      routes:{
        HomeScreen.name:(context) => const HomeScreen(),
        MyCart.name:(context) => const MyCart(),
      }
    );
  }
}
