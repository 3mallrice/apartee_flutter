import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_demo_02/apis/api_services.dart';
import 'package:logger/logger.dart';

final logger = Logger();
String _imgUrl = CallApi().getImage();

class FirebaseStorageHelper {
  static FirebaseStorage storage = FirebaseStorage.instance;

  FirebaseStorageHelper(String imageName);

  static Future<String> getImageUrl(String imagePath) async {
    Reference ref = storage.ref(_imgUrl + imagePath);
    return await ref.getDownloadURL();
  }

  static Future<String> getMobileAssetUrl(String assetName) async {
    return getImageUrl('mo_assets/$assetName');
  }

  static Future<String> getCommonAssetUrl(String assetName) async {
    return getImageUrl('common_assets/$assetName');
  }

  static Future<TaskSnapshot?> uploadProfileAvatar(
      File imageFile, String userCode) async {
    final String filePath = 'common_assets/avatars/$userCode.jpg';

    try {
      Reference ref = storage.ref(filePath);

      UploadTask uploadTask = ref.putFile(imageFile);

      TaskSnapshot? snapshot = await uploadTask;

      if (snapshot.state == TaskState.success) {
        return snapshot;
      } else {
        throw "Upload failed: ${snapshot.state}";
      }
    } on FirebaseException catch (e) {
      logger.e(e);
      rethrow;
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
