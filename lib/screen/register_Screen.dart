import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
import 'login_screen.dart';
import '../util/custom_divider.dart';
import '../util/textfiled.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formkey = GlobalKey<FormState>();
  final AuthController authController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
                const SizedBox(height: 50),
                Text(
                  'Govt Smart Library',
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Create a New Account',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'NickName',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                buildTextField(
                    'your nickname',
                    MultiValidator([RequiredValidator(errorText: 'Required')]),
                    false,
                    TextInputType.text,
                     nicknameController),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'User Name',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                buildTextField(
                    'your Username',
                    MultiValidator([RequiredValidator(errorText: 'Required')]),
                    false,
                    TextInputType.name, nameController),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                buildTextField(
                    'your Phone Number',
                    MultiValidator([RequiredValidator(errorText: 'Required')]),
                    false,
                    TextInputType.number,
                     phoneController),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email Address',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                buildTextField(
                    'yourmail@gmail.com',
                    MultiValidator([
                      EmailValidator(errorText: 'Invalid Email'),
                      RequiredValidator(errorText: 'Required')
                    ]),
                    false,
                    TextInputType.emailAddress, emailController),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                buildTextField(
                    'Password(min 6 characters)',
                    MultiValidator([
                      RequiredValidator(errorText: 'Password is required'),
                      MinLengthValidator(6, errorText: 'At least 6 characters'),
                      MaxLengthValidator(15, errorText: 'At most 15 characters'),
                      PatternValidator(r'(?=.*?[!@#$%^&*?-])',
                          errorText: 'Use at least one special character')
                    ]),
                    true,
                    TextInputType.visiblePassword, passwordController),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      authController.register(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        nameController.text.trim(),
                        nicknameController.text.trim(),
                        phoneController.text.trim(),
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
                    child: Obx(()=> Center(
                      child: authController.isLoading.value?CircularProgressIndicator(color: Colors.white,): Text(
                        'Create Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                ),
                const SizedBox(height: 20),
                const OrDivider(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    custom_social_login(Colors.redAccent, 'assets/images/google.png'),
                    custom_social_login(Colors.blue, 'assets/images/facebook.png'),
                    custom_social_login(Colors.black, 'assets/images/apple.png')
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        ' Login',
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
