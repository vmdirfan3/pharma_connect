import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharma_connect/modules/dashboard/controller/dashboard_controller.dart';
import 'package:pharma_connect/modules/dashboard/view/dashboard_screen.dart';
import 'package:pharma_connect/modules/home/controller/home_controller.dart';
import 'package:pharma_connect/modules/my_orders/controller/order_controller.dart';
import 'package:pharma_connect/modules/profile/controller/profile_controller.dart';
import 'package:provider/provider.dart';

import 'modules/product_details/controller/product_detail_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => OrderController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
        ChangeNotifierProvider(create: (_) => ProductDetailController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pharma Connect',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: DashboardScreen(),
      ),
    );
  }
}

