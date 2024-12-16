import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProfileController with ChangeNotifier {
  ProfileController(){
  fetchData();
  }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isEditing = false;

  String? _documentId;

  bool get isEditing => _isEditing;

  set isEditing(bool value) {
    _isEditing = value;
    notifyListeners();
  }

  Future<void> fetchData() async {
    try {
      final querySnapshot = await _firestore.collection('users').get();

      if (querySnapshot.docs.isNotEmpty) {
        final doc = querySnapshot.docs.first;
        _documentId = doc.id; // Store document ID for updates

        final data = doc.data();
        print("object $data");
        nameController.text = data['name'] ?? '';
        phoneController.text = data['phone'] ?? '';
        emailController.text = data['email'] ?? '';
        idController.text = data['practitionerId'] ?? '';
        addressController.text = data['billingAddress'] ?? '';
      } else {
        // No document exists, set fields to empty
        _documentId = null;
        nameController.clear();
        phoneController.clear();
        emailController.clear();
        idController.clear();
        addressController.clear();
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    notifyListeners();
  }

  // Update the existing document
  Future<void> updateData() async {
    if (_documentId == null) {
      print('No document ID available to update.');
      return;
    }

    try {
      await _firestore.collection('users').doc(_documentId).update({
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'practitionerId': idController.text,
        'billingAddress': addressController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      isEditing = false;
      notifyListeners();
    } catch (e) {
      print('Error updating data: $e');
    }
  }
}
