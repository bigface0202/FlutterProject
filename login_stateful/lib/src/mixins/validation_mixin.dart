class ValidationMixin {
  validateEmail(String value) {
    //return null if valid
    //otherwise return error
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }

    return null;
  }

  validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }

    return null;
  }
}
