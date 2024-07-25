import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:govt_smart_library/controller/auth_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Image.asset(
                'assets/images/logo.jpeg',
                height: 160,
              ),
              const SizedBox(height: 30),
              Text(
                'Govt Smart Library',
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 25),
              const Text(
                'Forgot Password',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 30),
              const Text(
                'Enter your email address to receive a password reset link.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                style: TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email is required'),
                  EmailValidator(errorText: 'Enter a valid email address'),
                ]).call,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (emailController.text.isNotEmpty) {
                    controller.sendPasswordResetEmail(emailController.text);
                  } else {
                    Get.snackbar('Error', 'Please enter your email address');
                  }
                },
                child:Obx(()=> controller.isLoading.value?Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),): Text('Send Reset Link')),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
