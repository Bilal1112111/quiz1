import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:training/helper/date_time_manager.dart';
import 'package:training/helper/function_helper.dart';

part 'freezed_model.freezed.dart';
part 'freezed_model.g.dart';

@Freezed()
class Company with _$Company {
  factory Company({
    @JsonKey(readValue: FunctionHelper.checkIsActive) required int isActive,
    required String name,
    required Address address,
    @JsonKey(
        fromJson: DateTimeManager.fromUTC, toJson: DateTimeManager.fromLocal)
    required DateTime established,
    @Default([]) List<Department> departments,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

@Freezed()
class Address with _$Address {
  factory Address({
    required String street,
    required String city,
    required String state,
    required String postalCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@Freezed()
class Department with _$Department {
  factory Department({
    required String deptId,
    required String name,
    required String manager,
    required double budget,
    required int year,
    required Availability availability,
    @JsonKey(name: 'meeting_time') required String meetingTime,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}

@Freezed()
class Availability with _$Availability {
  factory Availability({
    required bool online,
    required bool inStore,
  }) = _Availability;

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
}
