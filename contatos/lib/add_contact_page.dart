import 'package:contatos/contatos_model.dart';
import 'package:contatos/contatos_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  File? _image;
  var filePath = "";

  Future<String?> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    return pickedFile?.path.toString() ?? "";
  }

  Future<String?> _cameraImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
    }
    return photo?.path.toString() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_image != null)
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(_image!),
                ),
              ),
            TextButton(
              onPressed: () async {
                showModalBottomSheet(context: context, 
                builder: (_) {
                  return Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.camera),
                          title: const Text("Camera"),
                          onTap: () {
                            filePath = _cameraImage() as String;
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.image),
                          title: const Text("Galeria"),
                          onTap: () {
                            filePath = _getImage() as String;
                          },
                        )]
                  );
                });   
              },
              child: const Text('Pick an Image from Gallery'),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final phoneNumber = phoneNumberController.text;
                final email = emailController.text;
                final photoPath = filePath;

                // Perform contact addition or storage here with the image file (_image)
                ContatosRepository().post(Contato(name, phoneNumber, email, photoPath));

                Navigator.pop(context);
                
              },
              child: const Text('Add Contact'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }
}

