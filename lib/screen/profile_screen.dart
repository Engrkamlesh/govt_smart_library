import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:govt_smart_library/controller/book_controller.dart';
import 'package:govt_smart_library/screen/login_screen.dart';
import '../controller/auth_controller.dart';
import 'edit_profilescreen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthController authController = Get.find();
  
  final BookController controller = Get.put(BookController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Center(
                child: FutureBuilder(
                  future: authController.getUserData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error fetching data'));
                    } else {
                      var userData = snapshot.data;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          Stack(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                height: 150.h,
                                width: 150.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(130.0),
                                    color: const Color(0xff0089FB).withOpacity(0.09),
                                    ),
                                        child: userData['picture'] !=null && userData['picture'] !=""?Image.network(userData['picture'],fit: BoxFit.cover,):Image.asset('assets/images/profile.jpg',fit: BoxFit.cover),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(EditProfileScreen());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40.0),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Theme.of(context)
                                                  .shadowColor
                                                  .withOpacity(0.25),
                                              blurRadius: 12,
                                              spreadRadius: 2,
                                              offset: const Offset(0, 4))
                                        ]),
                                    child: CircleAvatar(
                                      radius: 18.0,
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.edit, color: Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.person_outline, color: Theme.of(context).primaryColor),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            subtitle: Text(
                              userData['name'] ?? 'Name not available',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Theme.of(context).hintColor),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Divider(
                              color: Color(0xffE8E8E8),
                              thickness: 1.3,
                            ),
                          ),
                          const SizedBox(width: 3.0),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.person_4_outlined, color: Theme.of(context).primaryColor),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Nick Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            subtitle: Text(
                              userData['nickname'] ?? 'Nickname not available',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Theme.of(context).hintColor),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Divider(
                              color: Color(0xffE8E8E8),
                              thickness: 1.3,
                            ),
                          ),
                          const SizedBox(width: 3.0),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.email_outlined, color: Theme.of(context).primaryColor),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            subtitle: Text(
                              userData['email'] ?? 'Email not available',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Theme.of(context).hintColor),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Divider(
                              color: Color(0xffE8E8E8),
                              thickness: 1.3,
                            ),
                          ),
                          const SizedBox(width: 3.0),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.phone_outlined, color: Theme.of(context).primaryColor),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Phone',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            subtitle: Text(
                              userData['phone'] ?? 'Phone not available',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: Theme.of(context).hintColor),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Divider(
                              color: Color(0xffE8E8E8),
                              thickness: 1.3,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          ListTile(
                            onTap: (){
                              controller.clearFavorites();
                              authController.signOut();
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.logout_outlined, color: Theme.of(context).primaryColor),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                           
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Divider(
                              color: Color(0xffE8E8E8),
                              thickness: 1.3,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ));
  }
}
