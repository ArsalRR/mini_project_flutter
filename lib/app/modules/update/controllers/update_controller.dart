import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateController extends GetxController {
  late TextEditingController namaController;
  late TextEditingController emailController;
  late TextEditingController no_hpController;
  late TextEditingController fotoController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  File? _image;

  File? get image => _image;

  @override
  void onInit() {
    namaController = TextEditingController();
    emailController = TextEditingController();
    no_hpController = TextEditingController();
    fotoController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaController.dispose();
    emailController.dispose();
    no_hpController.dispose();
    fotoController.dispose();
    super.onClose();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      update();
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('data_diri').doc(docID);
    DocumentSnapshot<Object?> snapshot = await docRef.get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    namaController.text = data['nama'];
    emailController.text = data['email'];
    no_hpController.text = data['phone_number'];
    fotoController.text = data['foto'];

    return snapshot;
  }

  void updateData(String docID, String nama, String email, String phone_number, String foto) async {
    try {
      String newFoto = _image != null ? _image!.path : foto;

      await firestore.collection('data_diri').doc(docID).update({
        'nama': nama,
        'email': email,
        'phone_number': phone_number,
        'foto': newFoto,
      });

      Get.back();
      Get.snackbar(
        'Success',
        'Data Berhasil Diedit',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Gagal Mengedit Data',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }
}
