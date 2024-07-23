import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:govt_smart_library/screen/forgor_password.dart';
import '../controller/auth_controller.dart';
import '../util/custom_divider.dart';
import '../util/textfiled.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 70),
                Image.asset('assets/images/books.png',height: 160,),
                SizedBox(height: 30),
                Text(
                  'Govt Smart Library',
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 25),
                Text(
                  'Login to Your Account',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email Address',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                buildTextField(
                    'yourmail@gmail.com',
                    MultiValidator([
                      EmailValidator(errorText: 'Invalid Email'),
                      RequiredValidator(errorText: 'Required')
                    ]),
                    false,
                    TextInputType.emailAddress,emailController),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 10),
                buildTextField(
                    'Password',
                    MultiValidator([
                      RequiredValidator(errorText: 'Password is required'),
                    ]),
                    true,
                    TextInputType.visiblePassword, passwordController),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      authController.login(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child:Obx(()=> Center(
                      child: authController.isLoading.value?CircularProgressIndicator(color: Colors.white,): Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                ),
                SizedBox(height: 20),
                OrDivider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    custom_social_login(Colors.redAccent, 'assets/images/google.png'),
                    custom_social_login(Colors.blue, 'assets/images/facebook.png'),
                    custom_social_login(Colors.black, 'assets/images/apple.png')
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        ' Register',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell custom_social_login(var color, String logo) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: 70,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: Image.asset(
          logo,
          width: 25,
          height: 25,
          color: Colors.white,
        )),
      ),
    );
  }
}
