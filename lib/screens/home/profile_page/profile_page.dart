import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_buttons/custom_button1.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';
import 'package:mi_store/components/custom_textFiled/custom_textfield.dart';
import 'package:mi_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../controllers/auth_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Consumer<UserProvider>(builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  value.pickImage();
                },
                // ignore: unrelated_type_equality_checks
                child: value.image.path != ""
                    ? CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(value.image),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            NetworkImage(value.userData!.userImage),
                      )),
            CustomPoppinsText(
              text: Provider.of<UserProvider>(context).userData!.email,
              fontSize: 20,
            ),
            CustomTextField(
                text: "Name",
                controller: value.nameController,
                prefixIcon: Icons.person),
            const SizedBox(height: 20),
            CustomButton1(
                colors: [Colors.amber.shade600, Colors.amber.shade800],
                text: "Update",
                size: size,
                ontap: () {
                  value.updateProfileData(context);
                }),
            const SizedBox(height: 4),
            CustomButton1(
                colors: [Colors.grey.shade600, Colors.grey.shade900],
                text: "Logout",
                size: size,
                ontap: () {
                  AuthController.signOutUser(context);
                }),
          ],
        );
      }),
    );
  }
}
