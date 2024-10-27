import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mi_store/providers/home_slider_provider.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_text/custom_poppins_text.dart';

class UpdateSlider extends StatefulWidget {
  const UpdateSlider({super.key});

  @override
  State<UpdateSlider> createState() => _UpdateSliderState();
}

class _UpdateSliderState extends State<UpdateSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: CustomPoppinsText(
          text: "Update-Slider",
          color: Colors.white,
          fontSize: 18,
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black87, Colors.amber.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Consumer<HomeSliderProvider>(builder: (context, value, child) {
        return Center(
            child: Wrap(
          children: List.generate(
              6,
              (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        value.pickImage(context, index);
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: value.sliderImages[index] != ""
                              ? value.sliderImages[index].contains(
                                      "https://firebasestorage.googleapis.com")
                                  ? Image.network(
                                      value.sliderImages[index],
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(value.sliderImages[index]),
                                      fit: BoxFit.cover,
                                    )
                              : const Icon(Icons.add_a_photo),
                        ),
                      ),
                    ),
                  )),
        ));
      }),
    );
  }
}
