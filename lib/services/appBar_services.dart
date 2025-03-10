import 'package:fusion/services/storage_service.dart';

class appBarServices {
  getDesignations() async {
    try {
      var storageService = await StorageService.getInstance();
      List<String>? designations = storageService!.getFromDisk('designations');

      return designations;
    } catch (e) {
      rethrow;
    }
  }
}