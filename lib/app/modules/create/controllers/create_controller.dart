import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateController extends GetxController {
  late TextEditingController namaController;
  late TextEditingController emailController;
  late TextEditingController phone_numberController;
  File? _image;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  File? get image => _image;

  @override
  void onInit() {
    namaController = TextEditingController();
    emailController = TextEditingController();
    phone_numberController = TextEditingController();
    super.onInit();
  }

  get formKey => null;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      update();
    }
  }

  void addData(String nama, String email, String phone_number) async {
    try {
      String foto = _image != null ? _image!.path : '';

      await firestore.collection('data_diri').add({
        'nama': nama,
        'email': email,
        'phone_number': phone_number,
        'foto': foto
      });

      Get.back();
      Get.snackbar(
        'Success',
        'Data added successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
      namaController.clear();
      emailController.clear();
      phone_numberController.clear();
      _image = null;
    } catch (e) {
      print(e);
    }
  }
}
