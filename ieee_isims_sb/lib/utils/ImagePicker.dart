import 'package:image_picker/image_picker.dart';

Future getImages() async {
  final ImagePicker picker = ImagePicker();
  XFile? file = await picker.pickImage(source: ImageSource.gallery);
  if (file != null) {
    return await file.readAsBytes();
  }
}
