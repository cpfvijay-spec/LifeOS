extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  String capitalizeAll() {
    if (isEmpty) return this;
    return split(' ').map((str) => str.capitalize()).join(' ');
  }

  bool isValidEmail() {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  bool isValidPassword() {
    return length >= 6;
  }

  bool isValidPhoneNumber() {
    final RegExp phoneRegex = RegExp(r'^[0-9]{10,}$');
    return phoneRegex.hasMatch(this);
  }
}

extension IntExtension on int {
  String toFormattedString() {
    return toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  String toTimeString() {
    final hours = this ~/ 3600;
    final minutes = (this % 3600) ~/ 60;
    final seconds = this % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

extension DoubleExtension on double {
  String toStringWithFixedDecimals(int decimals) {
    return toStringAsFixed(decimals);
  }

  String toPercentageString() {
    return '${(this * 100).toStringAsFixed(2)}%';
  }
}

extension DateTimeExtension on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  String toFormattedString() {
    return '$day/$month/$year';
  }

  String toFormattedTimeString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String toFormattedDateTimeString() {
    return '$day/$month/$year ${toFormattedTimeString()}';
  }
}
