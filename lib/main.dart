import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_app/ui/users_view.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter User Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BrowseScreen(),  // Set the initial screen to BrowseScreen
      debugShowCheckedModeBanner: false,
    );
  }
}



