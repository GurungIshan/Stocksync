String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Name required';
  }
  if (value.trim().length < 2) {
    return 'Name must be at least 2 characters';
  }
  String pattern = r'^[a-zA-Z ]+$';
  if (!RegExp(pattern).hasMatch(value)) {
    return 'Name can only contain letters and spaces';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) return 'Email required';
  String pattern = r'^[^@]+@[^@]+\.[^@]+';
  if (!RegExp(pattern).hasMatch(value)) return 'Enter valid email';
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Password required';
  if (value.length < 6) return 'Password must be at least 6 characters';
  String pattern = r'^(?=.*[0-9])(?=.*[!@#$%^&*]).{6,}$';
  if (!RegExp(pattern).hasMatch(value)) return 'Include number & special char';
  return null;
}

String? validateConfirmPassword(String? password, String? confirm) {
  if (confirm == null || confirm.isEmpty) return 'Confirm your password';
  if (password != confirm) return 'Passwords do not match';
  return null;
}
