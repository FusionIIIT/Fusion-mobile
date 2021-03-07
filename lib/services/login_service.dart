import 'package:fusion/models/user.dart';
import 'package:fusion/services/storage_service.dart';

class LoginService {
  User? user;

  void login(String username, String password) async {
    var prefs = await StorageService.getInstance();
    print(username);
    prefs!.saveUserInDB(User(username));
  }

  void logout() async {
    var prefs = await StorageService.getInstance();
    prefs!.deleteKey("user");
  }
}
