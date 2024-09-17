import 'package:flutter/material.dart';
//ignore: depend_on_referenced_packages;
import 'package:get/get.dart'; // Import GetX package
import 'package:tinder_clone/controllers/authentification_controller.dart';
import 'authentification/login_screen.dart'; // Import the LoginScreen file
import 'package:firebase_core/firebase_core.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value){
    Get.put(AuthentificationController());
  });

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tinder Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
