/// Fișier de utilitare pentru date mock / formatare date.
/// În acest moment păstrăm doar funcția [formatShortDate],
/// folosită pentru afișarea datei în cardurile de știri.

/// Formatează o dată de tip [DateTime] în stil scurt,
/// de forma "Jun 11" sau "Dec 3".
String formatShortDate(DateTime date) {
  const monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final month = monthNames[date.month - 1];
  final day = date.day.toString();

  return '$month $day';
}