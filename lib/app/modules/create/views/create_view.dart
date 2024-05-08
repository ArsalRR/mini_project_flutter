import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Peserta '),
        centerTitle: true,
        backgroundColor: Colors.transparent, 
        elevation: 0, 
      ),
      extendBodyBehindAppBar: true, 
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFE0ADF5)],
          ),
        ),
        child: Stack(
          children: [
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: controller.pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: controller.image != null ? FileImage(controller.image!) : null,
                      child: controller.image == null ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[800]) : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1))),
                    ),
                    child: TextFormField(
                      controller: controller.namaController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nama Peserta',
                        hintStyle: TextStyle(color: Colors.grey[700]),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1))),
                    ),
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey[700]),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Alamat harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Color.fromRGBO(143, 148, 251, 1))),
                    ),
                    child: TextFormField(
                      controller: controller.phone_numberController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nomor Telepon',
                        hintStyle: TextStyle(color: Colors.grey[700]),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nomer Telephone harus diisi';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                 ElevatedButton(
  style: ElevatedButton.styleFrom(
    primary: Colors.purpleAccent, 
    onPrimary: Colors.white, 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32.0),
    ),
    elevation: 3,
  ),
  onPressed: () {
    controller.addData(
      controller.namaController.text,
      controller.emailController.text,
      controller.phone_numberController.text,
    );
  },
  child: Padding(
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    child: Text(
      'Tambah Data Profile ',
      style: TextStyle(
        fontSize: 18,
        color: Colors.white, 
      ),
    ),
  ),
),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
