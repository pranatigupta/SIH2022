// TODO : remove this months constant and use intl

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

enum LeaveStatus {
  AWAITING, APPROVED, DECLINED
}

enum LeaveType{
  CASUAL("Casual"), SICK("Sick");
  final String name;
  const LeaveType(this.name);
}

enum AppealType{
  MANN("Mann"), RAHUL("Rahul");
  final String name;
  const AppealType(this.name);
}
