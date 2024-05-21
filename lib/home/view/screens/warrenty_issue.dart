import 'dart:typed_data';
import 'package:catalogue/home/utils/constant.dart';
import 'package:catalogue/home/view/widget/custom_text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class WarrentyIssue extends StatefulWidget {
  const WarrentyIssue({super.key});
  @override
  State<WarrentyIssue> createState() => _WarrentyIssueState();
}

class _WarrentyIssueState extends State<WarrentyIssue> {
  File? _selectedImage;

  Future<void> _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage != null) {
      File selectedImage = File(returnImage.path);

      // Resize the image to 200x200 pixels
      selectedImage = await _resizeImage(selectedImage, 200, 200);

      if (mounted) {
        setState(() {
          _selectedImage = selectedImage;
        });
        Navigator.of(context).pop(); // Pop the dialog
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final returnImage = await ImagePicker().pickImage(source: source);

    if (returnImage != null) {
      File selectedImage = File(returnImage.path);

      // Resize the image to 200x200 pixels
      selectedImage = await _resizeImage(selectedImage, 200, 200);

      if (mounted) {
        setState(() {
          _selectedImage = selectedImage;
        });
        Navigator.of(context).pop(); // Pop the dialog
      }
    }
  }

  Future<File> _resizeImage(
      File originalImage, int targetWidth, int targetHeight) async {
    // Decode the image
    var originalBytes = await originalImage.readAsBytes();
    img.Image? decodedImage =
        img.decodeImage(Uint8List.fromList(originalBytes));

    // Resize the image
    img.Image resizedImage = img.copyResize(
      decodedImage!,
      width: targetWidth,
      height: targetHeight,
    );

    // Save the resized image to a new file
    File resizedFile =
        File(originalImage.path.replaceAll('.png', '_resized.png'));
    await resizedFile.writeAsBytes(img.encodePng(resizedImage));

    return resizedFile;
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String selectedProduct = '';
  String state = '';
  String telephone = '';
  String details = '';
  String _selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 254, 254, 253),
      appBar: AppBar(
        title: const Text('Product Issue / Complaint'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomTextFormField(
                  labelText: 'Name',
                  onSaved: (value) {
                    name = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  labelText: 'Email',
                  onSaved: (value) {
                    email = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add email validation logic here
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  labelText: 'Select Product',
                  onSaved: (value) {
                    selectedProduct = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a product';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Text(
                  "Source of information",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Whole Seller',
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value.toString();
                        });
                      },
                      activeColor:Constant.scaffoldBackground,
                    ),
                    const Text(
                      'Whole Seller',
                      style: TextStyle(color: Constant.scaffoldBackground),
                    ),
                    Radio(
                      value: 'Contractor',
                      groupValue: _selectedRole,
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value.toString();
                        });
                      },
                       activeColor: Constant.scaffoldBackground,
                    ),
                    const Text(
                      'Contractor',
                      style: TextStyle(color: Constant.scaffoldBackground),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  labelText: 'State',
                  onSaved: (value) {
                    state = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  labelText: 'Telephone',
                  onSaved: (value) {
                    telephone = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your telephone number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  labelText: 'Details',
                  onSaved: (value) {
                    details = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter details';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  "Attachment",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(Icons.add_a_photo, color: Colors.white),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Choose Option"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                GestureDetector(
                                  child: const Text("Take a picture"),
                                  onTap: () {
                                    // Navigator.of(context)
                                    //     .pop(); // Pop the dialog first
                                    _pickImage(ImageSource.camera);
                                  },
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),
                                GestureDetector(
                                  child: const Text("Select from gallery"),
                                  onTap: () {
                                    // Navigator.of(context)
                                    //     .pop(); // Pop the dialog first
                                    _pickImageFromGallery();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                _selectedImage != null
                    ? Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        color: Colors.grey[200],
                        child: const Center(
                          child: Text("No Image Selected"),
                        ),
                      ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Process the form data here
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[900],
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
