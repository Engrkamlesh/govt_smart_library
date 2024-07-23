import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:govt_smart_library/controller/auth_controller.dart';
import '../util/textfiled.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nickNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Obx(() {
          print(controller.currentUserData);
          if (controller.currentUserData.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          nameController.text = controller.currentUserData['name'] ?? '';
          nickNameController.text = controller.currentUserData['nickname'] ?? '';
          phoneController.text = controller.currentUserData['phone'] ?? '';

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: 120.h,
                          width: 120.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(130.0),
                            color: const Color(0xff0089FB).withOpacity(0.09),
                            image: controller.profileImagePath.value.isNotEmpty
                                ? DecorationImage(
                                    image: FileImage(File(controller.profileImagePath.value)),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: NetworkImage(controller.currentUserData['picture'] ?? ''),
                                    fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              controller.getImage();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context).shadowColor.withOpacity(0.25),
                                    blurRadius: 12,
                                    spreadRadius: 2,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 18.0,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'NickName',
                        style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      'your nickname',
                      MultiValidator([RequiredValidator(errorText: 'Required')]),
                      false,
                      TextInputType.name,
                      nickNameController,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'User Name',
                        style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      'your Username',
                      MultiValidator([RequiredValidator(errorText: 'Required')]),
                      false,
                      TextInputType.name,
                      nameController,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      '+923324093',
                      MultiValidator([RequiredValidator(errorText: 'Required')]),
                      false,
                      TextInputType.phone,
                      phoneController,
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        controller.uploadProfilePicture(
                          File(controller.profileImagePath.value),
                          nameController.text,
                          nickNameController.text,
                          phoneController.text,
                        );
                      },
                      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor)),
                      child: Obx(()=> controller.isLoading.value?const CircularProgressIndicator(color: Colors.white,): const Text('Save', style: TextStyle(fontSize: 15, color: Colors.white))),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
