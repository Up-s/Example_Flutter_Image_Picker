import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  File? _image;
  final picker = ImagePicker();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Camera'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.yellow,
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                    child: Text('Camera'),
                  ),
                  MaterialButton(
                    color: Colors.cyan,
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    child: Text('Gallery'),
                  ),
                ],
              ),
              showImage()
              ,
            ],
          ),
        ),
      ),
    );
  }

  Widget showImage() {
    if(_image == null) {
      return Container();
    } else {
      return Image.file(File(_image!.path));
    }
  }


  Future getImage(ImageSource source) async {
    var pickedImage = await picker.pickImage(source: source);

    setState(() {
      _image = File(pickedImage!.path);
    });
  }
}
