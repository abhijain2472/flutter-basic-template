import 'dart:io';
import 'package:basic_template/common/app_widget/app_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../app_import.dart';

/// common image selection widget used in pick image functionality
class ImageSelectionWidget extends StatefulWidget {
  final Function(File) onImageSelect;
  final bool allowCropImage;

  // final List<CropAspectRatioPreset> aspectRatioPresets;

  const ImageSelectionWidget({
    Key? key,
    required this.onImageSelect,
    this.allowCropImage = true,
    // this.aspectRatioPresets = const [
    //   CropAspectRatioPreset.square,
    //   CropAspectRatioPreset.ratio3x2,
    //   CropAspectRatioPreset.original,
    //   CropAspectRatioPreset.ratio4x3,
    //   CropAspectRatioPreset.ratio16x9
    // ],
  }) : super(key: key);

  @override
  _ImageSelectionWidgetState createState() => _ImageSelectionWidgetState();
}

class _ImageSelectionWidgetState extends State<ImageSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Gallery'),
          leading: Icon(Icons.image),
          onTap: () {
            Navigator.of(context).pop();
            _pickImage(source: ImageSource.gallery);
          },
        ),
        ListTile(
          title: Text('Camera'),
          leading: Icon(Icons.camera_alt),
          onTap: () {
            Navigator.of(context).pop();
            _pickImage(source: ImageSource.gallery);
          },
        ),
      ],
    );
  }

  /// used for if permission is granted or not for camera & gallery
  Future<void> checkCameraPermission() async {
    // var status = await Permission.camera.status;
    var status = await Permission.camera.request();
    if (status.isGranted) {
      _pickImage(source: ImageSource.camera);
    } else if (status.isDenied) {
      // NOTE : no need to do this other wise dialogue will show two time after deny permission
      // if (await Permission.camera.request().isGranted) {
      //   _pickImage(source: ImageSource.camera);
      // }
    } else if (status.isPermanentlyDenied && mounted) {
      /// need to check mounted property otherwise throw exception because the screen from which context is used was closed
      bool result = await showAppAlertDialog(
            context: context,
            content:
                'You have permanently denied camera permission, now grant the permission from app settings.',
            title: 'Grant Permission',
            defaultActionText: 'Open Setting',
            cancelActionText: 'Cancel',
          ) ??
          false;
      if (result) {
        openAppSettings();
      }
    } else if (status.isRestricted) {
      if (await Permission.camera.request().isGranted) {
        _pickImage(source: ImageSource.camera);
      }
    } else if (status.isLimited) {
      if (await Permission.camera.request().isGranted) {
        _pickImage(source: ImageSource.camera);
      }
    }
  }

  /// method used for picking image
  Future<void> _pickImage({required ImageSource source}) async {
    var imageFile = await Utility.getImagesFromImagePicker(
      source: source,
      allowCrop: widget.allowCropImage,
      // aspectRatioPresets: widget.aspectRatioPresets,
    );
    if (imageFile != null) {
      widget.onImageSelect(imageFile);
    }
  }
}
