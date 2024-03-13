import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:csv/csv.dart';
import 'google_mlkit_barcode_scanning';

class FaceRecognition extends StatefulWidget {
  @override
  _FaceRecognitionState createState() =>
      _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {
  late CameraController _cameraController;
  late FaceDetector faceDetector;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _cameraController = CameraController(firstCamera, ResolutionPreset.medium);
    await _cameraController.initialize();

    // Initialize the FaceDetector
    faceDetector = FaceDetector(options: FaceDetectorOptions());
  }

  @override
  void dispose() {
    _cameraController.dispose();
    faceDetector.close();
    super.dispose();
  }

  Future<void> _takePictureAndSave() async {
    try {
      final XFile picture = await _cameraController.takePicture();
      final File imageFile = File(picture.path);
      final inputImage = InputImage.fromFilePath(imageFile.path);

      final List<Face> faces = await faceDetector.processImage(inputImage);

      for (Face face in faces) {
        print('Face detected: ${face.boundingBox}');
      }

      await _saveImagePathToCSV(imageFile.path);
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _saveImagePathToCSV(String imagePath) async {
    final csvFile = File('${(await getExternalStorageDirectory())!.path}/images.csv');
    if (!csvFile.existsSync()) {
      csvFile.createSync(recursive: true);
    }
    List<List<dynamic>> rows = [];
    rows.add([imagePath]);
    String csv = const ListToCsvConverter().convert(rows);
    csvFile.writeAsStringSync(csv, mode: FileMode.append);
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(title: Text('Face Recognition')),
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(_cameraController),
          ),
          ElevatedButton(
            onPressed: _takePictureAndSave,
            child: Text('Take Picture'),
          ),
        ],
      ),
    );
  }
}
