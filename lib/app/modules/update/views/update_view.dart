import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Edit Informasi Profil'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white],
              ),
            ),
          ),
          Positioned(
            right: -100,
            top: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white, Color(0xFFE0ADF5)],
                ),
              ),
            ),
          ),
          Positioned(
            left: -100,
            bottom: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [Colors.white, Color(0xFFE0ADF5)],
                ),
              ),
            ),
          ),
          FutureBuilder<DocumentSnapshot<Object?>>(
            future: controller.getData(Get.arguments),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data!;
                controller.namaController.text = data['nama'];
                controller.emailController.text = data['email'];
                controller.no_hpController.text = data['phone_number'];
                controller.fotoController.text = data['foto'];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: controller.pickImage,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: controller.image != null ? FileImage(controller.image!) : null,
                          child: controller.image == null ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[800]) : null,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.namaController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Nama Peserta',
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: TextField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Email Anda',
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.no_hpController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Nomer Handphone',
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    
              Container(
  height: 50,
  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.purpleAccent,
      elevation: 0,
      shadowColor: Colors.transparent,
    ),
    onPressed: () {
      controller.updateData(
        Get.arguments,
        controller.namaController.text,
        controller.emailController.text,
        controller.no_hpController.text,
        controller.fotoController.text,
      );
    },
    child: Text(
      'Simpan Perubahan',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold, 
      ),
    ),
  ),
),


                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
