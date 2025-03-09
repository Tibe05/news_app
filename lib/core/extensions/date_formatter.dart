import 'package:intl/intl.dart';

extension DateFormatter on String {
  String toFormattedDate() {
    DateTime parsedDate = DateTime.parse(this);
    return DateFormat("d MMM, yyyy").format(parsedDate);
  }
}