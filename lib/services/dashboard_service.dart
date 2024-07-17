import 'package:http/http.dart' as http;
import 'package:fusion/api.dart';
import 'package:fusion/constants.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';

class DashboardService {
   getDashboard() async {
    try {
      final storageService = locator<StorageService>();
      final token = storageService.userInDB?.token;
      if (token == null) {
        throw Exception('Token Error');
      }

      final headers = {'Authorization': 'Token $token'};
      final response = await http.get(
        Uri.http(
          getLink(),
          kDashboard,
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("Dashboard loaded successfully");
        return response;
      } else {
        throw Exception('Failed to load dashboard');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response?> getNotification() async {
    try {

      final storageService = locator<StorageService>();
      final token = storageService.userInDB?.token;
      if (token == null) {

        throw Exception('Token Error');
      }


      final headers = {'Authorization': 'Token $token'};
      final response = await http.get(

        Uri.http(
          getLink(),
          kNotification,
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("Notifications loaded successfully");
        print("success");
        print(response);
        return response;
      }
      throw Exception('Can\'t load');
    } catch (e) {
      rethrow;
    }
  }





  Future<http.Response?> markNotificationAsRead(String id) async {
    try {
      final storageService = locator<StorageService>();
      final token = storageService.userInDB?.token;
      if (token == null) {
        throw Exception('Token Error');
      }

      final headers = {'Authorization': 'Token $token'};
      final uri = Uri.http(
        getLink(),
        kNotificationRead,
        {'id': id}, // Pass id as a query parameter
      );
      final response = await http.put( // Change HTTP method to PUT
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("Notification marked as read successfully");
        return response;
      } else {
        throw Exception('Failed to mark notification as read');
      }
    } catch (e) {
      rethrow;
    }
  }




  Future<http.Response?> deleteNotification(String id) async {
    try {
      final storageService = locator<StorageService>();
      final token = storageService.userInDB?.token;
      if (token == null) {
        throw Exception('Token Error');
      }


      final headers = {'Authorization': 'Token $token'};
      final response = await http.delete(

        Uri.http(
          getLink(),
          kNotificationDelete,
          {'id': id}, // Add query parameter for notification id
        ),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print("Notification deleted successfully");
        return response;
      } else {
        throw Exception('Failed to delete notification');
      }
    } catch (e) {
      rethrow;
    }
  }
}