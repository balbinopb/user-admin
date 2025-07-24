import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_admin/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController c = Get.find();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("LOGIN"),
              SizedBox(height: 15),
              TextField(
                controller: c.emailController,
                decoration: InputDecoration(
                  hintText: "email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: c.pwController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  c.login();
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
