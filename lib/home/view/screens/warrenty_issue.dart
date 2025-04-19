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
  // Declare text controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  // Declare selected values
  String? selectedValue1;
  String? selectedValue2;

  File? _selectedImage;
  String? _selectedRole;

  List<String> dropdownValues1 = [
    'SV Hub',
    'No-Hub',
    'PVC Coupling',
    'ABS Elbow',
    'Copper Tee',
  ];

  List<String> dropdownValues2 = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Lakshadweep',
    'Delhi',
    'Puducherry',
    'Ladakh',
    'Jammu and Kashmir'
  ];

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

  @override
  void dispose() {
    // Dispose the controllers to free up resources
    nameController.dispose();
    emailController.dispose();
    telephoneController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 254, 253),
      appBar: AppBar(
        title: const Text('Product Issue / Complaint'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double paddingValue; // Default padding value
          double radius;
          if (constraints.maxWidth > 600 &&
              MediaQuery.of(context).orientation == Orientation.landscape) {
            paddingValue = 200.0;
            radius = 20;
          } else {
            paddingValue = 20;
            radius = 10;
          }
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: paddingValue, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomTextFormField(
                      labelText: 'Name',
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      radius: radius,
                    ),
                    SizedBox(height: 12.h),
                  CustomTextFormField(
                      labelText: 'Email',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        // RegEx to validate email format
                        String pattern =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        RegExp regExp = RegExp(pattern);
                        if (!regExp.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      radius: radius,
                    ),

                    SizedBox(height: 12.h),
                    DropdownButtonFormField<String>(
                      value: selectedValue1,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue1 = newValue;
                        });
                      },
                      items: dropdownValues1.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Product",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a product';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.h),
                    const Text(
                      "Source of information",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Constant.scaffoldBackground),
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
                          activeColor: Constant.scaffoldBackground,
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
                    SizedBox(height: 12.h),
                    DropdownButtonFormField<String>(
                      value: selectedValue2,
                      onChanged: (newValue) {
                        setState(() {
                          selectedValue2 = newValue;
                        });
                      },
                      items: dropdownValues2.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "State",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a state';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.h),
                    CustomTextFormField(
                      labelText: 'Telephone',
                      controller: telephoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your telephone number';
                        }
                        return null;
                      },
                      radius: radius,
                    ),
                    SizedBox(height: 12.h),
                    CustomTextFormField(
                      labelText: 'Details',
                      controller: detailsController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter details';
                        }
                        return null;
                      },
                      radius: radius,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Attachment",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Constant.scaffoldBackground),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Select Image Source'),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Camera'),
                                    onPressed: () {
                                      _pickImage(ImageSource.camera);
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Gallery'),
                                    onPressed: () {
                                      _pickImageFromGallery();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: _selectedImage == null
                            ? const Text(
                                "No file selected",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              )
                            : SizedBox(
                                height: 150.h,
                                child: Image.file(_selectedImage!),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Constant.scaffoldBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(radius),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // Handle form submission logic here
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}








// import 'dart:typed_data';
// import 'package:catalogue/home/utils/constant.dart';
// import 'package:catalogue/home/view/widget/custom_text_box.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:image/image.dart' as img;

// class WarrentyIssue extends StatefulWidget {
//   const WarrentyIssue({super.key});
//   @override
//   State<WarrentyIssue> createState() => _WarrentyIssueState();
// }

// class _WarrentyIssueState extends State<WarrentyIssue> {
//   File? _selectedImage;

//   String? selectedValue1;
//   String? selectedValue2;

//   List<String> dropdownValues1 = [
//     'SV Hub',
//     'No-Hub',
//     'PVC Coupling',
//     'ABS Elbow',
//     'Copper Tee',
//   ];

//   List<String> dropdownValues2 = [
//     'Andhra Pradesh',
//     'Arunachal Pradesh',
//     'Assam',
//     'Bihar',
//     'Chhattisgarh',
//     'Goa',
//     'Gujarat',
//     'Haryana',
//     'Himachal Pradesh',
//     'Jharkhand',
//     'Karnataka',
//     'Kerala',
//     'Madhya Pradesh',
//     'Maharashtra',
//     'Manipur',
//     'Meghalaya',
//     'Mizoram',
//     'Nagaland',
//     'Odisha',
//     'Punjab',
//     'Rajasthan',
//     'Sikkim',
//     'Tamil Nadu',
//     'Telangana',
//     'Tripura',
//     'Uttar Pradesh',
//     'Uttarakhand',
//     'West Bengal',
//     'Andaman and Nicobar Islands',
//     'Chandigarh',
//     'Lakshadweep',
//     'Delhi',
//     'Puducherry',
//     'Ladakh',
//     'Jammu and Kashmir'
//   ];

//   Future<void> _pickImageFromGallery() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (returnImage != null) {
//       File selectedImage = File(returnImage.path);

//       // Resize the image to 200x200 pixels
//       selectedImage = await _resizeImage(selectedImage, 200, 200);

//       if (mounted) {
//         setState(() {
//           _selectedImage = selectedImage;
//         });
//         Navigator.of(context).pop(); // Pop the dialog
//       }
//     }
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final returnImage = await ImagePicker().pickImage(source: source);

//     if (returnImage != null) {
//       File selectedImage = File(returnImage.path);

//       // Resize the image to 200x200 pixels
//       selectedImage = await _resizeImage(selectedImage, 200, 200);

//       if (mounted) {
//         setState(() {
//           _selectedImage = selectedImage;
//         });
//         Navigator.of(context).pop(); // Pop the dialog
//       }
//     }
//   }

//   Future<File> _resizeImage(
//       File originalImage, int targetWidth, int targetHeight) async {
//     // Decode the image
//     var originalBytes = await originalImage.readAsBytes();
//     img.Image? decodedImage =
//         img.decodeImage(Uint8List.fromList(originalBytes));

//     // Resize the image
//     img.Image resizedImage = img.copyResize(
//       decodedImage!,
//       width: targetWidth,
//       height: targetHeight,
//     );

//     // Save the resized image to a new file
//     File resizedFile =
//         File(originalImage.path.replaceAll('.png', '_resized.png'));
//     await resizedFile.writeAsBytes(img.encodePng(resizedImage));

//     return resizedFile;
//   }

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String name = '';
//   String email = '';
//   String selectedProduct = '';
//   String state = '';
//   String telephone = '';
//   String details = '';
//   String _selectedRole = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 254, 254, 253),
//       appBar: AppBar(
//         title: const Text('Product Issue / Complaint'),
//         centerTitle: true,
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           double paddingValue; // Default padding value
//           double radius;
//           if (constraints.maxWidth > 600 &&
//               MediaQuery.of(context).orientation == Orientation.landscape) {
//             paddingValue = 200.0;
//             radius = 20;
//           } else {
//             paddingValue = 20;
//             radius = 10;
//           }
//           return SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: paddingValue, vertical: 20.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     CustomTextFormField(
//                       labelText: 'Name',
//                       onSaved: (value) {
//                         name = value!;
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your name';
//                         }
//                         return null;
//                       },
//                       radius: radius,
//                     ),
//                     SizedBox(
//                        height: 12.h,
//                     ),
//                     CustomTextFormField(
//                       labelText: 'Email',
//                       onSaved: (value) {
//                         email = value!;
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your email';
//                         }
//                         // You can add email validation logic here
//                         return null;
//                       },
//                       radius: radius,
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     DropdownButtonFormField<String>(
//                       value: selectedValue1,
//                       onChanged: (newValue) {
//                         setState(() {
//                           selectedValue1 = newValue;
//                         });
//                       },
//                       items: dropdownValues1.map((value) {
//                         return DropdownMenuItem(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         filled: true,
//                         hintText: "Product",
//                         border: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10.sp),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a product';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                        height: 12.h,
//                     ),
//                     const Text(
//                       "Source of information",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Constant.scaffoldBackground),
//                     ),
//                     Row(
//                       children: [
//                         Radio(
//                           value: 'Whole Seller',
//                           groupValue: _selectedRole,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedRole = value.toString();
//                             });
//                           },
//                           activeColor: Constant.scaffoldBackground,
//                         ),
//                         const Text(
//                           'Whole Seller',
//                           style: TextStyle(color: Constant.scaffoldBackground),
//                         ),
//                         Radio(
//                           value: 'Contractor',
//                           groupValue: _selectedRole,
//                           onChanged: (value) {
//                             setState(() {
//                               _selectedRole = value.toString();
//                             });
//                           },
//                           activeColor: Constant.scaffoldBackground,
//                         ),
//                         const Text(
//                           'Contractor',
//                           style: TextStyle(color: Constant.scaffoldBackground),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                        height: 12.h,
//                     ),
//                     DropdownButtonFormField<String>(
//                       value: selectedValue2,
//                       onChanged: (newValue) {
//                         setState(() {
//                           selectedValue2 = newValue;
//                         });
//                       },
//                       items: dropdownValues2.map((value) {
//                         return DropdownMenuItem(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         fillColor: Colors.white,
//                         filled: true,
//                         hintText: "State",
//                         border: OutlineInputBorder(
//                           borderSide: const BorderSide(color: Colors.black),
//                           borderRadius: BorderRadius.circular(10.sp),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a state';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                        height: 12.h,
//                     ),
//                     CustomTextFormField(
//                       labelText: 'Telephone',
//                       onSaved: (value) {
//                         telephone = value!;
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your telephone number';
//                         }
//                         return null;
//                       },
//                       radius: radius,
//                     ),
//                     SizedBox(
//                        height: 12.h,
//                     ),
//                     CustomTextFormField(
//                       labelText: 'Details',
//                       onSaved: (value) {
//                         details = value!;
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter details';
//                         }
//                         return null;
//                       },
//                       radius: radius,
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       "Attachment",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Constant.scaffoldBackground),
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.add_a_photo,
//                           color: Constant.scaffoldBackground),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: const Text("Choose Option"),
//                               content: SingleChildScrollView(
//                                 child: ListBody(
//                                   children: [
//                                     GestureDetector(
//                                       child: const Text("Take a picture"),
//                                       onTap: () {
//                                         // Navigator.of(context)
//                                         //     .pop(); // Pop the dialog first
//                                         _pickImage(ImageSource.camera);
//                                       },
//                                     ),
//                                     const Padding(
//                                       padding: EdgeInsets.only(top: 10.0),
//                                     ),
//                                     GestureDetector(
//                                       child: const Text("Select from gallery"),
//                                       onTap: () {
//                                         // Navigator.of(context)
//                                         //     .pop(); // Pop the dialog first
//                                         _pickImageFromGallery();
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     _selectedImage != null
//                         ? Container(
//                             width: 200,
//                             height: 200,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: FileImage(_selectedImage!),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           )
//                         : Container(
//                             width: 200,
//                             height: 200,
//                             color: Colors.grey[200],
//                             child: const Center(
//                               child: Text("No Image Selected"),
//                             ),
//                           ),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             _formKey.currentState!.save();
//                             // Process the form data here
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Constant.scaffoldBackground,
//                         ),
//                         child: Text(
//                           'Submit',
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
