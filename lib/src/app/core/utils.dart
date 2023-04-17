class Utils {
  static List listJson(dynamic json) {
    return (json ?? []) as List;
  }

  static String? stringJson(dynamic value) {
    return value?.toString();
  }

  static int? intJson(dynamic value) {
    if (value != null && value.toString().isNotEmpty) {
      if (value is double) {
        return value.toInt();
      } else if (value is int) {
        return value.toInt();
      } else {
        return int.tryParse(value.toString());
      }
    }
    return null;
  }

  static Map<String, dynamic> getMapJson(dynamic json) {
    return (json ?? <String, dynamic>{}) as Map<String, dynamic>;
  }
}
