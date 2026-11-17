/// TODO: pakai paket file_picker / image_picker saat mengerjakan unggah berkas.
class PickedFileInfo {
  const PickedFileInfo({required this.name, required this.path, this.size = 0});
  final String name;
  final String path;
  final int size;
}

class FilePickerHelper {
  FilePickerHelper._();

  static const int maxImageBytes = 5 * 1024 * 1024; // 5 MB

  static Future<PickedFileInfo?> pickDocument() async {
    // TODO: implementasi file_picker.
    return null;
  }

  static Future<PickedFileInfo?> pickImage() async {
    // TODO: implementasi image_picker.
    return null;
  }
}
