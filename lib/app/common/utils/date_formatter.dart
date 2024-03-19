import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  static String monthFromNumber(
    int month, {
    String? locale,
    bool isShort = false,
  }) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat(isShort ? 'MMM' : 'MMMM', locale);
    final dateTime = DateTime(2000, month);
    return format.format(dateTime);
  }

  static String dateFromNow(String date, {String? locale}) {
    // make like 1 minute ago makx only day and month
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy', locale);
    final dateTime = DateTime.parse(date);
    final diff = DateTime.now().difference(dateTime);
    // make like 1 minute ago makx only day and month
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes} menit yang lalu';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} jam yang lalu';
    } else if (diff.inDays < 7) {
      return '${diff.inDays} hari yang lalu';
    } else {
      return format.format(dateTime);
    }
  }

  static String timeFromNow(String time, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('HH:mm', locale);
    final dateTime = DateTime.parse(time);
    return format.format(dateTime);
  }

  static String ddMMyyyy(String date, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy', locale);
    final dateTime = DateTime.parse(date);
    return format.format(dateTime);
  }

  static String ddMMMMyyyy(String date, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy', locale);
    final dateTime = DateTime.parse(date);
    return format.format(dateTime);
  }

  static String ddMMyyyyHHmm(String date, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy HH:mm', locale);
    final dateTime = DateTime.parse(date);
    return format.format(dateTime);
  }

  static String ddMMyyyyHHmmss(String date, {String? locale}) {
    initializeDateFormatting(locale ?? 'en');
    final format = DateFormat('dd MMMM yyyy HH:mm:ss', locale);
    final dateTime = DateTime.parse(date);
    return format.format(dateTime);
  }
}
