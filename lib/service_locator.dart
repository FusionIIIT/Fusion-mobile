import 'package:fusion/services/storage_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  var instance = await StorageService.getInstance();
  locator.registerSingleton<StorageService>(instance!);
}
