import 'package:flutter/material.dart';
import 'package:mi_store/components/custom_text/custom_poppins_text.dart';
import 'package:mi_store/components/custom_textFiled/custom_textfield.dart';
import 'package:mi_store/providers/admin_provider.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_buttons/custom_button1.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Consumer<AdminProvider>(builder: (contex, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPoppinsText(text: "Add New Product"),
                const SizedBox(height: 10),
                InkWell(
                    onTap: () {
                      value.pickImage(context);
                    },
                    child: value.image.path != ""
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(value.image),
                          )
                        : Icon(
                            Icons.add_a_photo,
                            size: 100,
                            color: Colors.amber,
                          )),
                CustomTextField(
                  controller: value.nameController,
                  text: 'Item Name',
                  prefixIcon: Icons.production_quantity_limits,
                ),
                CustomTextField(
                  controller: value.descriptionController,
                  text: 'Item Description',
                  prefixIcon: Icons.description,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  controller: value.priceController,
                  text: 'Price',
                  prefixIcon: Icons.attach_money,
                ),
                CustomTextField(
                  controller: value.typeController,
                  text: 'Type',
                  prefixIcon: Icons.category,
                ),
                const SizedBox(height: 20),
                CustomButton1(
                    colors: [Colors.amber.shade600, Colors.amber.shade900],
                    text: "Add Product",
                    size: size,
                    ontap: () {
                      value.addProduct(context);
                    }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
