import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future<String> addUser(Map<String, dynamic> json,String name) async{
    try {
      await users.doc(name).set(json);
      return 'Success';
    } on FirebaseException catch (e) {
      if (e.code == 'storage/unknown') {
        return 'unknown error';
      } else if (e.code == 'storage/object-not-found') {
        return 'No object exists at the desired reference.';
      } else if (e.code == 'storage/quota-exceeded') {
        return 'Quota on your Cloud Storage bucket has been exceeded. If you\'re on the no-cost tier, upgrade to a paid plan. If you\'re on a paid plan, reach out to Firebase support.';
      } else if (e.code == 'storage/bucket-not-found') {
        return 'No project is configured for Cloud Storage';
      } else if (e.code == 'storage/unauthenticated') {
        return 'User is unauthenticated, please authenticate and try again.';
      } else if (e.code == 'storage/unauthorized') {
        return 'User is not authorized to perform the desired action, check your security rules to ensure they are correct.';
      } else if (e.code == 'storage/retry-limit-exceeded') {
        return 'The maximum time limit on an operation (upload, download, delete, etc.) has been excceded. Try uploading again.';
      } else if (e.code == 'storage/invalid-checksum') {
        return 'File on the client does not match the checksum of the file received by the server. Try uploading again.';
      } else if (e.code == 'storage/canceled') {
        return '	User canceled the operation.';
      } else if (e.code == 'storage/invalid-event-name') {
        return 'Invalid event name provided. Must be one of [running, progress, pause]';
      } else if (e.code == 'storage/invalid-url') {
        return '	Invalid URL provided to refFromURL(). Must be of the form: gs://bucket/object or https://firebasestorage.googleapis.com/v0/b/bucket/o/object?token=<TOKEN>';
      } else if (e.code == 'storage/invalid-argument') {
        return '	The argument passed to put() must be File, Blob, or UInt8 Array. The argument passed to putString() must be a raw, Base64, or Base64URL string.';
      } else if (e.code == 'storage/no-default-bucket') {
        return 'No bucket has been set in your config\'s storageBucket property.';
      } else if (e.code == 'storage/cannot-slice-blob') {
        return 'Commonly occurs when the local file has changed (deleted, saved again, etc.). Try uploading again after verifying that the file hasn\'t changed.';
      } else if (e.code == 'storage/server-file-wrong-size') {
        return 'File on the client does not match the size of the file recieved by the server. Try uploading again.';
      }
    }
    return '';
  }
}
