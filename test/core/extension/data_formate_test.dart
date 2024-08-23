import 'package:flutter_test/flutter_test.dart';
import 'package:movie/core/extension/date_formate.dart';

void main() {
  const String dateFormatYYYYMMDD = "2024-02-15";
  test("Should return yyyy-mm-dd from Date", () {
    final date = DateTime(2024, 2, 15).convertYYYYMMDD;
    expect(date, dateFormatYYYYMMDD);
  });
}
