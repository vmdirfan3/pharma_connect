String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Name cannot be empty";
  }
  if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
    return "Enter a valid name (letters only)";
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone number cannot be empty";
  }
  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
    return "Enter a valid 10-digit phone number";
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Email cannot be empty";
  }
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return "Enter a valid email address";
  }
  return null;
}

// Validator for Practitioner ID
String? idValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "ID cannot be empty";
  }
  return null;
}

// Validator for Billing Address
String? addressValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Address cannot be empty";
  }
  return null;
}