class FunctionHelper {
  FunctionHelper();

  static String checkIsActive(Map<dynamic, dynamic> json, String name) {
    if (json.containsKey('is_active')) {
      return json['is_active'];
    }
    return json['isActive'];
  }
}
