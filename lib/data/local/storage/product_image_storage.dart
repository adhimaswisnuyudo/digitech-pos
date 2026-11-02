import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ProductImageStorage {
  ProductImageStorage({ImagePicker? picker}) : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  Future<File?> resolveFile(String? relativePath) async {
    if (relativePath == null || relativePath.isEmpty) {
      return null;
    }
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, relativePath));
    return file.existsSync() ? file : null;
  }

  Future<String?> saveFromXFile(XFile file, String productId) async {
    final dir = await getApplicationDocumentsDirectory();
    final folder = Directory(p.join(dir.path, 'product_images'));
    if (!folder.existsSync()) {
      await folder.create(recursive: true);
    }
    final extension = p.extension(file.path);
    final ext = extension.isEmpty ? '.jpg' : extension;
    final relativePath = p.join('product_images', '$productId$ext');
    final target = File(p.join(dir.path, relativePath));
    await File(file.path).copy(target.path);
    return relativePath;
  }

  Future<void> deleteIfExists(String? relativePath) async {
    if (relativePath == null || relativePath.isEmpty) {
      return;
    }
    final file = await resolveFile(relativePath);
    if (file != null) {
      await file.delete();
    }
  }

  Future<XFile?> pickFromGallery() {
    return _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1200,
      imageQuality: 85,
    );
  }

  Future<XFile?> captureFromCamera() {
    return _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1200,
      imageQuality: 85,
    );
  }
}
