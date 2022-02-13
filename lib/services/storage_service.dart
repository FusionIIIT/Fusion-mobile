import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/models/academic.dart';
import 'package:fusion/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService with ChangeNotifier {
  static StorageService? _instance;
  static SharedPreferences? _sharedPreferences;
  //This is the database key, do not change this
  static const String UserKey = "user";
  static const String ProfileKey = "ProfileKey";

  User? get userInDB {
    var userJson = _getFromDisk(UserKey);

    return userJson == null ? null : User.fromJson(jsonDecode(userJson));
  }

  ProfileData get profileData {
    var profileJson = _getFromDisk(ProfileKey);
    print(jsonDecode(profileJson));
    return ProfileData.fromJson(jsonDecode(profileJson));
  }

  AcademicData get academicData {
    var profileJson = _getFromDisk(ProfileKey);
    print(jsonDecode(profileJson));
    return AcademicData.fromJson(jsonDecode(profileJson));
  }

  void saveUserInDB(User userToSave) {
    saveStringToDisk(UserKey, json.encode(userToSave.toJson()));
    notifyListeners();
  }

  void saveProfileInDB(ProfileData data) {
    saveStringToDisk(ProfileKey, jsonEncode(data.toJson()));
  }

  static Future<StorageService?> getInstance() async {
    if (_instance == null) {
      _instance = StorageService();
    }
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
    return _instance;
  }

  dynamic _getFromDisk(String key) {
    var value = _sharedPreferences?.get(key);
    // print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void saveStringToDisk(String key, String content) {
    print('(TRACE) StorageService:_saveStringToDisk. key: $key');
    _sharedPreferences!.setString(key, content);
  }

  void deleteKey(String key) {
    print(
        '(TRACE) StorageService: deleteKey. key: $key value: ${_getFromDisk(key)}');
    _sharedPreferences!.remove(key);
  }

  void saveToDisk<T>(String key, T content) {
    print('(TRACE) StorageService:_saveStringToDisk. key: $key');
    if (content is String) {
      _sharedPreferences!.setString(key, content);
    }
    if (content is bool) {
      _sharedPreferences!.setBool(key, content);
    }
    if (content is int) {
      _sharedPreferences!.setInt(key, content);
    }
    if (content is double) {
      _sharedPreferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _sharedPreferences!.setStringList(key, content);
    }
  }
}
