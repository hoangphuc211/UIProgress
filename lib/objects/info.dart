class UserInfo {
  String name;
  int cycle;
  DateTime periodStart;
  int periodRange;
  String deviceId;
  int userId;
  String addSymptomDate;
  String addSymptomLevel;
  UserInfo(
      {this.name,
      this.cycle,
      this.periodRange,
      this.periodStart,
      this.deviceId,
      this.userId,
      this.addSymptomDate,
      this.addSymptomLevel});
}

class SymptomInfo {
  String date;
  String symptomLevel;
  SymptomInfo(this.date, this.symptomLevel);
  @override
  String toString() {
    return date + " " + symptomLevel;
  }
}
