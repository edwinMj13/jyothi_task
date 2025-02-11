import 'package:jyothi_test/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static saveUserData(LoginModel loginModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", "${loginModel.username}");
    prefs.setString("gender", "${loginModel.gender}");
    prefs.setString("email", "${loginModel.email}");
    prefs.setString("accessToken", "${loginModel.accessToken}");
  }

  static Future<LoginModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginModel userDetails = LoginModel(
      username: prefs.getString("username"),
      gender: prefs.getString("gender"),
      email: prefs.getString("email"),
      accessToken: prefs.getString("accessToken"),
    );
    return userDetails;
  }
}
