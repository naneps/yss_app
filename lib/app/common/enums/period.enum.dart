enum Period { day, week, month, year }

extension PeriodX on Period {
  String get title {
    switch (this) {
      case Period.day:
        return 'Hari';
      case Period.week:
        return 'Minggu';
      case Period.month:
        return 'Bulan';
      case Period.year:
        return 'Tahun';
      default:
        return '';
    }
  }

  String get val {
    switch (this) {
      case Period.day:
        return 'day';
      case Period.week:
        return 'week';
      case Period.month:
        return 'month';
      case Period.year:
        return 'year';
      default:
        return '';
    }
  }
}
