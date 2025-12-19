import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  Future<void> saveSession(String email, String name, String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('name', name);
    await prefs.setString('token', token);
  }

  Future<Map<String, String>?> getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final name = prefs.getString('name');
    final token = prefs.getString('token');
    if (email != null && name != null && token != null) {
      return {'email': email, 'name': name, 'token': token};
    }
    return null;
  }

  Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
