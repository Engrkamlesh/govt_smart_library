import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:govt_smart_library/util/custom_nav_bar.dart';
import '../screen/login_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  var currentUserData = {}.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    loadCurrentUser();
  }

  Future<void> loadCurrentUser() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();
        currentUserData.value = userDoc.data() as Map<String, dynamic>;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to load user data: $e');
    }
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => CustomBottomBar());
    }
  }

  void register(String email, String password, String name, String nickname,
      String phone) async {
    try {
      isLoading.value = true;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _userSetup(name, nickname, email, phone);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void login(String email, String password) async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(email: email, password: password);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void forgotPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Password reset email sent",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void signOut() async {
    await auth.signOut();
  }

  Future<void> _userSetup(
      String name, String nickname, String email, String phone) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set({
      'name': name,
      'nickname': nickname,
      'phone': phone,
      'email': email,
      'picture': "",
      'uid': auth.currentUser!.uid
    });
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      isLoading.value = false;
      showCustomDialog(
          'Please check your email. We have sent a mail to reset your password.');
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to send password reset email: $e');
    }
  }

  void showCustomDialog(String message) {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Password Reset',
          style: TextStyle(color: Colors.black),
        ),
        content: Text(
          message,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<DocumentSnapshot> getUserData() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
  }

  var profileImagePath = ''.obs;

  Future<void> getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;
    }
  }

  Future<void> uploadProfilePicture(
      File imageFile, String name, String nickName, String phone) async {
    try {
      isLoading.value = true;
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Map<String, dynamic> updatedData = {};
        if (name.isNotEmpty) updatedData['name'] = name;
        if (nickName.isNotEmpty) updatedData['nickname'] = nickName;
        if (phone.isNotEmpty) updatedData['phone'] = phone;
        if (profileImagePath.isNotEmpty) {
          String fileName = '${user.uid}_profile.jpg';
          Reference storageRef =
              FirebaseStorage.instance.ref().child('picture').child(fileName);

          UploadTask uploadTask = storageRef.putFile(imageFile);
          await uploadTask.whenComplete(() => null);

          String downloadURL = await storageRef.getDownloadURL();
          updatedData['picture'] = downloadURL;
        }

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update(updatedData);
            loadCurrentUser();
        Get.back();

        isLoading.value = false;
        Get.snackbar('Success', 'Profile updated successfully');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Failed to update profile: $e');
    }
  }
}
