import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_buttons/custom_button1.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';
import 'package:mi_store/components/custom_textFiled/custom_textfield.dart';
import 'package:mi_store/providers/profile_provider.dart';
import 'package:provider/provider.dart';

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
      child: Consumer<ProfileProvider>(builder: (context, value, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
              width: 100,
              height: 100,
            ),
            const CustomPoppinsText(
              text: "ishan@gmail.com",
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
                ontap: () {})
          ],
        );
      }),
    );
  }
}
