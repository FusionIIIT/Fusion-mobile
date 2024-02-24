class LTCApplication {
  final String name;
  final String designation;
  final String department;
  final String blockYear;
  final String amount;
  final String leaveRequired;
  final String durationOfLeave;
  final String natureOfLeave;
  final String purposeOfLeave;
  final String addressDuringLeave;
  final String modeOfTravel;
  final String detailsOfFamilyLTC;
  final String detailsOfFamilyToBeClaimed;
  final String advanceAmount;

  LTCApplication({
    required this.name,
    required this.designation,
    required this.department,
    required this.blockYear,
    required this.amount,
    required this.leaveRequired,
    required this.durationOfLeave,
    required this.natureOfLeave,
    required this.purposeOfLeave,
    required this.addressDuringLeave,
    required this.modeOfTravel,
    required this.detailsOfFamilyLTC,
    required this.detailsOfFamilyToBeClaimed,
    required this.advanceAmount,
  });
}

class CPDAAdvanceApplication {
  final String name;
  final String designation;
  final String pfNumber;
  final String amountRequired;
  final String purpose;
  final String advanceDueForAdjustment;

  CPDAAdvanceApplication({
    required this.name,
    required this.designation,
    required this.pfNumber,
    required this.amountRequired,
    required this.purpose,
    required this.advanceDueForAdjustment,
  });
}

class CPDAReimbursementApplication {
  final String name;
  final String designation;
  final String pfNumber;
  final String advanceTaken;
  final String purpose;
  final String adjustmentOrReimbursementSubmitted;

  CPDAReimbursementApplication({
    required this.name,
    required this.designation,
    required this.pfNumber,
    required this.advanceTaken,
    required this.purpose,
    required this.adjustmentOrReimbursementSubmitted,
  });
}
