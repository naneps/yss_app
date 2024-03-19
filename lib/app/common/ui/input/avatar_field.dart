import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yss_app/app/common/themes/default_theme.dart';

class AvatarField extends StatefulWidget {
  Function(File) onChange;
  String? networkImage;
  AvatarField({
    super.key,
    required this.onChange,
    this.networkImage,
  });

  @override
  State<AvatarField> createState() => _AvatarFieldState();
}

class _AvatarFieldState extends State<AvatarField> {
  XFile? _image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: DefaultTheme.primaryColor,
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: _image != null
                ? FileImage(File(_image!.path)) as ImageProvider<Object>?
                : NetworkImage(
                    widget.networkImage ??
                        'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png',
                  ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: showBottomSheet,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: DefaultTheme.primaryColor,
                ),
                child: Icon(
                  MdiIcons.camera,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showBottomSheet() {
    Get.bottomSheet(Container(
      constraints: const BoxConstraints(
        maxHeight: 200,
        minHeight: 100,
        maxWidth: double.infinity,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose Image',
            style: Get.textTheme.labelMedium,
          ),
          ListTile(
            leading: Icon(MdiIcons.camera),
            title: const Text('Camera'),
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                setState(() {
                  _image = image;
                });
                widget.onChange(File(image.path));
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(MdiIcons.image),
            title: const Text('Gallery'),
            onTap: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                setState(() {
                  _image = image;
                });
                widget.onChange(File(image.path));
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ));
  }
}
