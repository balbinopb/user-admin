import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_admin/screens/login_screen.dart';
import 'firebase_options.dart';


final logger = Logger();
void main() async{
   logger.d("Before App started");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  // logger.d("App started");
  runApp(const MyApp());
  // logger.d("App Before");
  // Get.put(AuthController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'only admin can register user',      
      home: LoginScreen(),
    );
  }
}
