import 'dart:async';
import 'dart:convert';
import 'package:fusion/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:fusion/api.dart';
// import 'package:fusion/constants.dart';
import 'package:fusion/models/central_mess.dart';
import 'package:fusion/services/service_locator.dart';
import 'package:fusion/services/storage_service.dart';
import 'package:fusion/models/profile.dart';
import 'package:fusion/services/profile_service.dart';

class CentralMessService {

  ProfileService _profileService = ProfileService();

  Future<dynamic> getDesignations() async {
    try {
      // var storageService = locator<StorageService>();
      // if (storageService.userInDB?.token == null) {
      //   throw Exception('Token error');
      // }
      //
      // http.Response response2 = await _profileService.getProfile();
      // ProfileData _profileData =
      // await ProfileData.fromJson(jsonDecode(response2.body));
      //
      // Map<String, String> body = {
      //   'username': await _profileData.user!['username'],
      //   'password': 'user@123'
      // };
      //
      // http.Response response0 = await http.post(
      //   Uri.http(
      //     getLink(),
      //     kAuthLogin, //constant api EndPoint
      //   ),
      //   body: body,
      // );
      // var designations = json.decode(response0.body)['designations'];
      // print('Designations: $designations');
      //
      // return designations;
      var storageService = await StorageService.getInstance();
      var designations = storageService!.getFromDisk('designations');
      print(designations);
      return designations;

    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response> initAuth() async {
    try {
      var storageService = locator<StorageService>();
      if (storageService.userInDB?.token == null) {
        throw Exception('Token error');
      }


      http.Response response2 = await _profileService.getProfile();
      ProfileData _profileData = await ProfileData.fromJson(jsonDecode(response2.body));

      Map<String, String> body = {
        'username': await _profileData.user!['username'],
        'password': 'user@123'
      };

      http.Response response0 = await http.post(
        Uri.http(
          kCentralMess,
          kAuthLogin, //constant api EndPoint
        ),
        body: body,
      );

      return response0;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<MessFeedback>> getFeedback() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching feedbacks");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kFeedbackEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable feedbackList = json.decode(response.body)['payload'];
          return feedbackList.map((model) => MessFeedback.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load feedback');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> sendFeedback(MessFeedback data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          // 'student_id': '21BCS064',
          'mess': data.mess,
          'feedback_type': data.feedbackType,
          'fdate': data.fdate.toString().substring(0, 10),
          'description': data.description,
          'mess_rating': 5,
        };

        print("Sending Feedback");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kFeedbackEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Feedback sent successfully');
          return response;
        } else {
          print(response.statusCode);
          print(json.decode(response.body));
          throw Exception('Failed to send feedback');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateFeedbackRequest(MessFeedback data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'mess': data.mess,
          'feedback_type': data.feedbackType,
          'fdate': data.fdate.toString().substring(0, 10),
          'description': data.description,
          'mess_rating': 5,
          'feedback_remark': data.feedbackRemark,
        };

        print("Updating Feedback Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kFeedbackEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Feedback Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update feedback request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MessMenu>> getMenu() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Menus");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kMenuEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable menuList = json.decode(response.body)['payload'];
          return menuList.map((model) => MessMenu.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load menu');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateMenu(MessMenu data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, String> body = {
          'mess_option': data.messOption,
          'meal_time': data.mealTime,
          'dish': data.dish,
        };

        print("Updating Menu");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kMenuEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Menu updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update menu');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MessBillBase>> getMessBillBase() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Bill Amount");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kMessBillBase, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable billList = json.decode(response.body)['payload'];
          return billList.map((model) => MessBillBase.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load Bill Amount');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateMessBillBase(MessBillBase data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'bill_amount' : data.billAmount,
          'app_date' : data.timestamp.toString().substring(0, 10)
        };

        print("Updating Bill Amount");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kMessBillBase, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Bill Amount updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update bill amount');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MonthlyBill>> getMonthlyBill() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Bill");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kMonthlyBillEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable billList = json.decode(response.body)['payload'];
          return billList.map((model) => MonthlyBill.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load Bill');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateMonthlyBill(MonthlyBill data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };
        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'amount' : data.amount,
          'month': data.month,
          'year' : data.year,
          'rebate_count' : data.rebateCount,
          'rebate_amount' : data.rebateAmount,
          'paid': true,
        };

        print("updating student Bill");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kMonthlyBillEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          return response;
        }else if(response.statusCode == 404) {
          print(response.statusCode);
          print(json.decode(response.body).toString());
          throw Exception('Invalid Student Id.');
        }
          else {
          print(response.statusCode);
          print(json.decode(response.body).toString());
          throw Exception('Failed to update Bill');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<List<Payment>> getPayments() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Payment");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kMonthlyPaymentEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable paymentList = json.decode(response.body)['payload'];
          return paymentList.map((model) => Payment.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load payments');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<List<Rebate>> getRebate() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching rebate");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kRebateEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable rebateList = json.decode(response.body)['payload'];
          return rebateList.map((model) => Rebate.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load rebate');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> sendRebateRequest(Rebate data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          // 'student_id': '21BCS064',
          'leave_type' : data.leaveType,
          'rebate_remark': '',
          'app_date' : data.appDate.toString().substring(0, 10),
          'status' : data.status,
          'purpose' : data.purpose,
          'start_date': data.startDate.toString().substring(0, 10),
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Sending Rebate Request");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kRebateEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Rebate Request sent successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to send rebate request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateRebateRequest(Rebate data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'leave_type' : data.leaveType,
          'rebate_remark': data.rebateRemark,
          'app_date' : data.appDate.toString().substring(0, 10),
          'status' : data.status,
          'purpose' : data.purpose,
          'start_date': data.startDate.toString().substring(0, 10),
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Updating Rebate Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kRebateEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Rebate Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update rebate request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SpecialRequest>> getSpecialRequest() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching special request");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kSpecialRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable specialRequestList = json.decode(response.body)['payload'];
          return specialRequestList.map((model) => SpecialRequest.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load special request');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> sendSpecialRequest(SpecialRequest data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          // 'student_id': '21BCS064',
          'item1': data.item1,
          'item2': data.item2,
          'app_date': data.appDate.toString().substring(0, 10),
          'status': data.status,
          'request': data.request,
          'start_date': data.startDate.toString().substring(0, 10),
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Sending Special Request");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kSpecialRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Special Request sent successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to send special request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateSpecialRequest(SpecialRequest data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'item1' : data.item1,
          'item2' : data.item2,
          'app_date' : data.appDate.toString().substring(0, 10),
          'status' : data.status,
          'request' : data.request,
          'start_date': data.startDate.toString().substring(0, 10),
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Updating Special Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kSpecialRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Special Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update special request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VacationFood>> getVacationFoodRequest() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Vacation Food request");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kVacationFoodRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable VacationFoodRequestList = json.decode(response.body)['payload'];
          return VacationFoodRequestList.map((model) => VacationFood.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load vacation food request');
        }

      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }

    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> sendVacationFoodRequest(VacationFood data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          // 'student_id': '21BCS064',
          'app_date': data.appDate.toString().substring(0, 10),
          'status': data.status,
          'purpose': data.purpose,
          'start_date': data.startDate.toString().substring(0, 10),
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Sending Vacation Food Request");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kVacationFoodRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Vacation Food Request sent successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to send vacation food request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateVacationFoodRequest(VacationFood data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'app_date' : data.appDate.toString().substring(0, 10),
          'status' : data.status,
          'purpose' : data.purpose,
          'start_date': data.startDate.toString().substring(0, 10),
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Updating Vacation Food Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kVacationFoodRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Vacation Food Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update vacation food request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RegistrationRequest>> getRegistrationRequest() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Registration request");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kRegistrationRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable RegistrationRequestList =
          json.decode(response.body)['payload'];
          return RegistrationRequestList.map(
                  (model) => RegistrationRequest.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load registration request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> sendRegistrationRequest(RegistrationRequest data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {

        http.Response response2 = await _profileService.getProfile();
        ProfileData _profileData = await ProfileData.fromJson(jsonDecode(response2.body));

        var uri = Uri.https(kCentralMess, kRegistrationRequestEndpoint);
        var request = http.MultipartRequest('POST', uri);

        request.headers.addAll({
          'Authorization': 'Token ${json.decode(response0.body)['token']}',
        });

        // Add form fields
        request.fields['start_date'] = data.startDate.toString().substring(0, 10);
        request.fields['payment_date'] = data.paymentDate.toString().substring(0, 10);
        request.fields['Txn_no'] = data.txnNo.toString();
        request.fields['amount'] = data.amount.toString();
        request.fields['student_id'] = await _profileData.user!['username'];

        // Add file
        if (data.img != null) {
          var file = await http.MultipartFile.fromPath('img', data.img!,contentType: MediaType('image', 'jpeg'));
          request.files.add(file);
        }

        var response = await request.send();

        if (response.statusCode == 200) {
          print('Registration Request sent successfully');
          return await http.Response.fromStream(response);
        } else {
          print(response.statusCode);
          response.stream.transform(utf8.decoder).listen((value) {
            print(value);});
          throw Exception('Failed to send registration request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateRegistrationRequest(RegistrationRequest data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'Txn_no': data.txnNo,
          'amount': data.amount,
          'img': data.img,
          'start_date': data.startDate.toString().substring(0, 10),
          'registration_remark': data.registrationRemark,
          'status': data.status,
          'mess_option': data.messOption,
          'payment_date': data.paymentDate.toString().substring(0, 10),
        };

        print("Updating Vacation Food Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kRegistrationRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Registration Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update registration request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }
  
  Future<List<DeregistrationRequest>> getDeregistrationRequest() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Deregistration request");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kDeregistrationRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable DeregistrationRequestList =
          json.decode(response.body)['payload'];
          return DeregistrationRequestList.map(
                  (model) => DeregistrationRequest.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load deregistration request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> sendDeregistrationRequest(DeregistrationRequest data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {

        http.Response response2 = await _profileService.getProfile();
        ProfileData _profileData = await ProfileData.fromJson(jsonDecode(response2.body));

        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': await _profileData.user!['username'],
          'end_date': data.endDate.toString().substring(0, 10),
        };

        print("Sending Deregistration Request");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kDeregistrationRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Deregistration Request sent successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to send deregistration request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateDeregistrationRequest(DeregistrationRequest data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {

        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'end_date': data.endDate.toString().substring(0, 10),
          'status': data.status,
          'deregistration_remark': data.deregistrationRemark,
        };

        print("Updating Deregistration Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kDeregistrationRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Deregistration Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update deregistration request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RegMain>> getRegMain(Map<String, String> data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'type': data['type'],
          'status': data['status'],
          'program': data['program'],
          'mess_option': data['mess_option'],
          'student_id': data?['student_id'],
        };

        print("fetching Main Registration records");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kRegMainEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          Iterable RegMainList;
          if (data['type'] == 'search') {
            print(json.decode(response.body)['payload']);
            List<dynamic> resData= [];
            resData.add(json.decode(response.body)['payload']);
            RegMainList = resData;
          } else {
            RegMainList = json.decode(response.body)['payload'];
          }
          return RegMainList.map(
                  (model) => RegMain.fromJson(model)).toList();
        }else if(response.statusCode == 404){
          throw Exception('Invalid Student Id!');
        }
        else {
          print(response.statusCode);
          print(response.body.toString());
          throw Exception('Failed to load main registration records');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAllDetails(String studentId) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': studentId,
        };

        print("fetching all details of $studentId");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kStudentAllDetails, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          Map<String, dynamic> allDetails = json.decode(response.body)['payload'];
          List<dynamic> tempStudentDetails = [];
          tempStudentDetails.add(allDetails["student_details"]);
          Map<String, dynamic> result = {
            "payment": allDetails["payment"].map((model) => Payment.fromJson(model)).toList() ,
            "bill":  allDetails["bill"].map((model) => MonthlyBill.fromJson(model)).toList(),
            "reg_records": allDetails["reg_records"].map((model)=> RegRecords.fromJson(model)).toList(),
            "student_details": tempStudentDetails.map((model)=>RegMain.fromJson(model)).toList(),
          };
          return result;
        } else {
          print(response.statusCode);
          print(response.body.toString());
          throw Exception('Failed to load all details of $studentId');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<RegRecords>> getRegRecords(String studentId) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': studentId,
        };

        print("fetching registration records of $studentId");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kStudentRegRecords, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          Iterable RegRecordsList =
              json.decode(response.body)['payload'];
          
          return RegRecordsList.map(
              (model) => RegRecords.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load reg records');
        }
      } else {
        print(response0.statusCode);
        throw Exception(
            'Failed to Authorize ${json.decode(response0.body).toString()}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> deregister(Map<String, dynamic> data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {

        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data["student_id"],
          'end_date': data["end_date"].toString().substring(0, 10),
        };

        print("Updating Registration Record");
        http.Response response = await http.post(
          Uri.http(
            kCentralMess,
            kDeregistrationEndpoint,
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Registration Record updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update registration record');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UpdatePaymentRequest>> getUpdatePaymentRequest() async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token']
        };

        print("fetching Update Payment request");
        http.Response response = await http.get(
          Uri.http(
            kCentralMess,
            kUpdatePaymentRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
        );

        if (response.statusCode == 200) {
          Iterable UpdatePaymentRequestList =
          json.decode(response.body)['payload'];
          return UpdatePaymentRequestList.map(
                  (model) => UpdatePaymentRequest.fromJson(model)).toList();
        } else {
          print(response.statusCode);
          throw Exception('Failed to load update payment request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> sendUpdatePaymentRequest(UpdatePaymentRequest data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {

        http.Response response2 = await _profileService.getProfile();
        ProfileData _profileData = await ProfileData.fromJson(jsonDecode(response2.body));

        var uri = Uri.https(kCentralMess, kUpdatePaymentRequestEndpoint);
        var request = http.MultipartRequest('POST', uri);

        request.headers.addAll({
          'Authorization': 'Token ${json.decode(response0.body)['token']}',
        });

        // Add form fields
        request.fields['payment_date'] = data.paymentDate.toString().substring(0, 10);
        request.fields['Txn_no'] = data.txnNo.toString();
        request.fields['amount'] = data.amount.toString();
        request.fields['student_id'] = await _profileData.user!['username'];

        // Add file
        if (data.img != null) {
          var file = await http.MultipartFile.fromPath('img', data.img!,contentType: MediaType('image', 'jpeg'));
          request.files.add(file);
        }

        var response = await request.send();

        if (response.statusCode == 200) {
          print('Update Payment Request sent successfully');
          return await http.Response.fromStream(response);
        } else {
          print(response.statusCode);
          response.stream.transform(utf8.decoder).listen((value) {
            print(value);});
          throw Exception('Failed to send update payment request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateUpdatePaymentRequest(UpdatePaymentRequest data) async {
    try {
      http.Response response0 = await initAuth();

      if (response0.statusCode == 200) {
        Map<String, String> headers = {
          'Authorization': 'Token ' + json.decode(response0.body)['token'],
          'Content-Type': 'application/json; charset=UTF-8'
        };

        Map<String, dynamic> body = {
          'student_id': data.studentId,
          'Txn_no': data.txnNo,
          'amount': data.amount,
          'img': data.img,
          'Update Payment_remark': data.updatePaymentRemark,
          'status': data.status,
          'mess_option': data.messOption,
          'payment_date': data.paymentDate.toString().substring(0, 10),
        };

        print("Updating Update Payment Request");
        http.Response response = await http.put(
          Uri.http(
            kCentralMess,
            kUpdatePaymentRequestEndpoint, //constant api EndPoint
          ),
          headers: headers,
          body: json.encode(body),
        );

        if (response.statusCode == 200) {
          print('Update Payment Request updated successfully');
          return response;
        } else {
          print(response.statusCode);
          throw Exception('Failed to update update payment request');
        }
      } else {
        print(response0.statusCode);
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      rethrow;
    }
  }





// Future<List<MessInfo>> getMessInfo() async {
//   try {
//     http.Response response0 = await initAuth();

//     if (response0.statusCode == 200) {
//       Map<String, String> headers = {
//         'Authorization': 'Token ' + json.decode(response0.body)['token']
//       };

//       print("fetching Mess Info");
//       http.Response response = await http.get(
//         Uri.http(
//           kCentralMess,
//           kMessInfoEndpoint, //constant api EndPoint
//         ),
//         headers: headers,
//       );

//       if (response.statusCode == 200) {
//         Iterable MessInfoList =
//             json.decode(response.body)['payload'];
//         return MessInfoList.map(
//             (model) => MessInfo.fromJson(model)).toList();
//       } else {
//         print(response.statusCode);
//         throw Exception('Failed to load mess info');
//       }
//     } else {
//       print(response0.statusCode);
//       throw Exception('Failed to Authorize ${json.decode(response0.body).toString()}');
//     }
//   } catch (e) {
//     rethrow;
//   }
// }

}