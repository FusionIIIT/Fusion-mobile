
class MessInfo {
  final String studentId;
  final String messOption;

  MessInfo({
    required this.studentId,
    required this.messOption,
  });

  factory MessInfo.fromJson(Map<String, dynamic> json) {
    return MessInfo(
      studentId: json['student_id'],
      messOption: json['mess_option'],
    );
  }
}

class MessReg {
  final int sem;
  final DateTime startReg;
  final DateTime endReg;

  MessReg({
    required this.sem,
    required this.startReg,
    required this.endReg,
  });

  factory MessReg.fromJson(Map<String, dynamic> json) {
    return MessReg(
      sem: json['sem'],
      startReg: DateTime.parse(json['start_reg']),
      endReg: DateTime.parse(json['end_reg']),
    );
  }
}

class MessBillBase {
  final int billAmount;
  final DateTime timestamp;

  MessBillBase({
    required this.billAmount,
    required this.timestamp,
  });

  factory MessBillBase.fromJson(Map<String, dynamic> json) {
    return MessBillBase(
      billAmount: json['bill_amount'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

class MonthlyBill {
  final String studentId;
  final String month;
  final int year;
  final int amount;
  final int rebateCount;
  final int rebateAmount;
  final int? totalBill;
  final bool? paid;

  MonthlyBill({
    required this.studentId,
    required this.month,
    required this.year,
    required this.amount,
    required this.rebateCount,
    required this.rebateAmount,
    this.totalBill,
    this.paid,
  });

  factory MonthlyBill.fromJson(Map<String, dynamic> json) {
    return MonthlyBill(
      studentId: json['student_id'],
      month: json['month'],
      year: json['year'],
      amount: json['amount'],
      rebateCount: json['rebate_count'],
      rebateAmount: json['rebate_amount'],
      totalBill: json['total_bill'],
      paid: json['paid'],
    );
  }

  List<String> getKeysToDisplay() {
    return [
      'Student Id',
      'Month',
      'Year',
      'Amount',
      'Rebate Count',
      'Rebate Amount',
      'Total Bill',
      'Paid',
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'month': month,
      'year': year,
      'amount': amount,
      'rebateCount': rebateCount,
      'rebateAmount': rebateAmount,
      'totalBill': totalBill,
      'paid': paid,
    };
  }
}


class Payment {
  final String studentId;
  final String paymentMonth;
  final int paymentYear;
  final DateTime paymentDate;
  final int amountPaid;

  Payment({
    required this.studentId,
    required this.paymentMonth,
    required this.paymentYear,
    required this.paymentDate,
    required this.amountPaid,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      studentId: json['student_id'],
      paymentMonth: json['payment_month'],
      paymentYear: json['payment_year'],
      paymentDate: DateTime.parse(json['payment_date']),
      amountPaid: json['amount_paid'],
    );
  }

  List<String> getKeysToDisplay() {
    return [
      'Student Id',
      'Payment Month',
      'Payment Year',
      'Payment Date',
      'Amount Paid',
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'paymentMonth': paymentMonth,
      'paymentYear': paymentYear,
      'paymentDate': paymentDate.toString(),
      'amountPaid': amountPaid,
    };
  }
}

class MessMenu {
  late final String messOption;
  late final String mealTime;
  late final String dish;

  MessMenu({
    required this.messOption,
    required this.mealTime,
    required this.dish,
  });

  factory MessMenu.fromJson(Map<String, dynamic> json) {
    return MessMenu(
      messOption: json['mess_option'],
      mealTime: json['meal_time'],
      dish: json['dish'],
    );
  }
}

class Rebate {
  final String? studentId;
  final DateTime startDate;
  final DateTime endDate;
  final String purpose;
  final String status;
  final DateTime appDate;
  final String leaveType;
  final String rebateRemark;

  Rebate({
    this.studentId,
    required this.startDate,
    required this.endDate,
    required this.purpose,
    required this.status,
    required this.appDate,
    required this.leaveType,
    required this.rebateRemark,
  });

  factory Rebate.fromJson(Map<String, dynamic> json) {
    return Rebate(
      studentId: json['student_id'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      purpose: json['purpose'],
      status: json['status'],
      appDate: DateTime.parse(json['app_date']),
      leaveType: json['leave_type'],
      rebateRemark: json['rebate_remark']
    );
  }
}

class VacationFood {
  final String? studentId;
  final DateTime startDate;
  final DateTime endDate;
  final String? purpose;
  final String? status;
  final DateTime appDate;

  VacationFood({
    this.studentId,
    required this.startDate,
    required this.endDate,
    required this.purpose,
    required this.status,
    required this.appDate,
  });

  factory VacationFood.fromJson(Map<String, dynamic> json) {
    return VacationFood(
      studentId: json['student_id'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      purpose: json['purpose'],
      status: json['status'],
      appDate: DateTime.parse(json['app_date']),
    );
  }
}

class SpecialRequest {
  final String? studentId;
  final DateTime startDate;
  final DateTime endDate;
  final String? request;
  final String? status;
  final String? item1;
  final String? item2;
  final DateTime appDate;

  SpecialRequest({
    this.studentId,
    required this.startDate,
    required this.endDate,
    required this.request,
    required this.status,
    required this.item1,
    required this.item2,
    required this.appDate,
  });

  factory SpecialRequest.fromJson(Map<String, dynamic> json) {
    return SpecialRequest(
      studentId: json['student_id'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      request: json['request'],
      status: json['status'],
      item1: json['item1'],
      item2: json['item2'],
      appDate: DateTime.parse(json['app_date']),
    );
  }
}

class MessMeeting {
  final DateTime meetDate;
  final String agenda;
  final String venue;
  final String meetingTime;

  MessMeeting({
    required this.meetDate,
    required this.agenda,
    required this.venue,
    required this.meetingTime,
  });

  factory MessMeeting.fromJson(Map<String, dynamic> json) {
    return MessMeeting(
      meetDate: DateTime.parse(json['meet_date']),
      agenda: json['agenda'],
      venue: json['venue'],
      meetingTime: json['meeting_time'],
    );
  }
}

class MessMinutes {
  final DateTime meetingDate;
  final String messMinutes;

  MessMinutes({
    required this.meetingDate,
    required this.messMinutes,
  });

  factory MessMinutes.fromJson(Map<String, dynamic> json) {
    return MessMinutes(
      meetingDate: DateTime.parse(json['meeting_date']),
      messMinutes: json['mess_minutes'],
    );
  }
}

class MenuChangeRequest {
  final int id;
  final MessMenu dish;
  final String studentId;
  final String reason;
  final String request;
  final String status;
  final DateTime appDate;

  MenuChangeRequest({
    required this.id,
    required this.dish,
    required this.studentId,
    required this.reason,
    required this.request,
    required this.status,
    required this.appDate,
  });

  factory MenuChangeRequest.fromJson(Map<String, dynamic> json) {
    return MenuChangeRequest(
      id: json['id'],
      dish: MessMenu.fromJson(json['dish']),
      studentId: json['student_id'],
      reason: json['reason'],
      request: json['request'],
      status: json['status'],
      appDate: DateTime.parse(json['app_date']),
    );
  }
}

class MessFeedback {
  late final String? studentId;
  late final String mess;
  late final int messRating;
  late final DateTime fdate;
  late final String description;
  late final String feedbackType;
  late final String? feedbackRemark;

  MessFeedback({
    this.studentId,
    required this.mess,
    required this.messRating,
    required this.fdate,
    required this.description,
    required this.feedbackType,
    this.feedbackRemark,
  });

  factory MessFeedback.fromJson(Map<String, dynamic> json) {
    return MessFeedback(
      studentId: json['student_id'],
      mess: json['mess'],
      messRating: json['mess_rating'],
      fdate: DateTime.parse(json['fdate']),
      description: json['description'],
      feedbackType: json['feedback_type'],
      feedbackRemark: json['feedback_remark'],
    );
  }
}

class RegistrationRequest {
  final String? studentId;
  final String txnNo;
  final String? img;
  final int amount;
  final String? status;
  String? registrationRemark;
  String? messOption;
  final DateTime startDate;
  final DateTime paymentDate;

  RegistrationRequest({
    this.studentId,
    required this.txnNo,
    this.img,
    required this.amount,
    this.status,
    this.registrationRemark,
    this.messOption,
    required this.startDate,
    required this.paymentDate,
  });

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) {
    return RegistrationRequest(
      studentId: json['student_id'],
      txnNo: json['Txn_no'],
      img: json['img'],
      amount: json['amount'],
      status: json['status'],
      registrationRemark: json['registration_remark'],
      messOption: json['mess_option'],
      startDate: DateTime.parse(json['start_date']),
      paymentDate: DateTime.parse(json['payment_date']),
    );
  }

  List<String> getKeysToDisplay() {
    return [
      'Student Id',
      'Transaction No',
      'Image',
      'Amount',
      'Start Date',
      'Payment Date',
      'Remark',
      'Mess',
      'Status',
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'txnNo': txnNo,
      'img': img,
      'amount': amount,
      'startDate': startDate,
      'paymentDate': paymentDate,
      'registrationRemark': registrationRemark,
      'messOption': messOption,
      'status': status,
    };
  }
}

class RegMain {
  final String? studentId;
  final String program;
  final String currentMessStatus;
  final int balance;
  final String messOption;
  final String? firstName, lastName;

  RegMain({
    this.studentId,
    this.firstName,
    this.lastName,
    required this.program,
    required this.currentMessStatus,
    required this.balance,
    required this.messOption,
  });

  factory RegMain.fromJson(Map<String, dynamic> json) {
    return RegMain(
      studentId: json['student_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      program: json['program'],
      currentMessStatus: json['current_mess_status'],
      balance: json['balance'],
      messOption: json['mess_option'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'student_id': studentId,
      'first_name': firstName,
      'last_name': lastName,
      'program': program,
      'current_mess_status': currentMessStatus,
      'balance': balance,
      'mess_option': messOption,
    };
  }
}

class RegRecords {
  final String? studentId;
  final DateTime startDate;
  final DateTime? endDate;

  RegRecords({
    this.studentId,
    required this.startDate,
    required this.endDate,
  });

  factory RegRecords.fromJson(Map<String, dynamic> json) {
    return RegRecords(
      studentId: json['student_id'],
      startDate: DateTime.parse(json['start_date']),
      endDate:
          json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
    );
  }
}

class DeregistrationRequest {
  final String? studentId;
  final String? status;
  final DateTime endDate;
  String? deregistrationRemark;

  DeregistrationRequest({
    this.studentId,
    this.status,
    required this.endDate,
    this.deregistrationRemark,
  });

  factory DeregistrationRequest.fromJson(Map<String, dynamic> json) {
    return DeregistrationRequest(
      studentId: json['student_id'],
      status: json['status'],
      endDate: DateTime.parse(json['end_date']),
      deregistrationRemark: json['deregistration_remark'],
    );
  }

  List<String> getKeysToDisplay() {
    return [
      'Student Id',
      'End Date',
      'Remark',
      'Status',
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'endDate': endDate,
      'deregistrationRemark': deregistrationRemark,
      'status': status,
    };
  }
}

class SemDates {
  final DateTime startDate;
  final DateTime endDate;

  SemDates({
    required this.startDate,
    required this.endDate,
  });

  factory SemDates.fromJson(Map<String, dynamic> json) {
    return SemDates(
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
    );
  }
}

class UpdatePaymentRequest {
  final String? studentId;
  final String txnNo;
  final String? img;
  final int amount;
  final String? status;
  String? updatePaymentRemark;
  String? messOption;
  final DateTime paymentDate;

  UpdatePaymentRequest({
    this.studentId,
    required this.txnNo,
    this.img,
    required this.amount,
    this.status,
    this.updatePaymentRemark,
    this.messOption,
    required this.paymentDate,
  });

  factory UpdatePaymentRequest.fromJson(Map<String, dynamic> json) {
    return UpdatePaymentRequest(
      studentId: json['student_id'],
      txnNo: json['Txn_no'],
      img: json['img'],
      amount: json['amount'],
      status: json['status'],
      updatePaymentRemark: json['registration_remark'],
      messOption: json['mess_option'],
      paymentDate: DateTime.parse(json['payment_date']),
    );
  }

  List<String> getKeysToDisplay() {
    return [
      'Student Id',
      'Transaction No',
      'Image',
      'Amount',
      'Payment Date',
      'Remark',
      'Mess',
      'Status',
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'txnNo': txnNo,
      'img': img,
      'amount': amount,
      'paymentDate': paymentDate,
      'updatePaymentRemark': updatePaymentRemark,
      'messOption': messOption,
      'status': status,
    };
  }
}

