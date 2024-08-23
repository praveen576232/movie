import 'package:intl/intl.dart';

extension DateFormateUtils on DateTime {
  // ignore: non_constant_identifier_names
  static final DateFormat _yyyy_mm_dd = DateFormat('yyyy-MM-dd');

  String get convertYYYYMMDD => _yyyy_mm_dd.format(this);
}
