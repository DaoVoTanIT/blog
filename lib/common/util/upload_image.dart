// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';

// Future<String> uploadProfilePhotoToFirebase(Uint8List? uint8list,String? fileName) async {
//   print(uint8list);
//   print(fileName);
//   Reference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName!);
//   TaskSnapshot uploadTask = await firebaseStorageRef.putData(uint8list!);
//   String url = await uploadTask.ref.getDownloadURL(); //Get URL
//   return url;
// }