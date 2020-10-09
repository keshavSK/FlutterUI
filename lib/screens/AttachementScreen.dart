import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AttachementScreen extends StatefulWidget {
  final ValueChanged valueChanged;

  const AttachementScreen({Key key, this.valueChanged}) : super(key: key);

  @override
  _AttachementScreenState createState() => _AttachementScreenState();
}

class _AttachementScreenState extends State<AttachementScreen> {
  PickedFile _pickedFile;
  final ImagePicker _picker = new ImagePicker();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Make a Choice'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              getImageFromCameraGallery(true, context);
            },
            child: Icon(
              Icons.camera_alt,
              size: 50.0,
            ),
          ),
          InkWell(
            onTap: () {
              getImageFromCameraGallery(false, context);
            },
            child: Icon(
              Icons.camera,
              size: 50.0,
            ),
          )
        ],
      ),
    );
  }

  void getImageFromCameraGallery(bool isCamera, BuildContext context) async {
    var image = await _picker.getImage(
        source: (isCamera == true) ? ImageSource.camera : ImageSource.gallery);
    setState(() {
      _pickedFile = image;
      widget.valueChanged(_pickedFile);
    });
    Navigator.pop(context);
  }
}
