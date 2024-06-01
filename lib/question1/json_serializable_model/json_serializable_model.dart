import 'package:json_annotation/json_annotation.dart';
import 'package:training/helper/date_time_manager.dart';
import 'package:training/helper/function_helper.dart';

part 'json_serializable_model.g.dart';

@JsonSerializable()
class Company {
  @JsonKey(readValue: FunctionHelper.checkIsActive)
  final int isActive;
  final String name;
  final Address address;
  @JsonKey(fromJson: DateTimeManager.fromUTC, toJson: DateTimeManager.fromLocal)
  final DateTime established;
  final List<Department> departments;

  Company({
    required this.isActive,
    required this.name,
    required this.address,
    required this.established,
    required this.departments,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Address {
  final String street;
  final String city;
  final String state;
  final String postalCode;

  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Department {
  final String deptId;
  final String name;
  final String manager;
  final double budget;
  final int year;
  final Availability availability;
  @JsonKey(name: 'meeting_time')
  final String meetingTime;

  Department({
    required this.deptId,
    required this.name,
    required this.manager,
    required this.budget,
    required this.year,
    required this.availability,
    required this.meetingTime,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class Availability {
  final bool online;
  final bool inStore;

  Availability({
    required this.online,
    required this.inStore,
  });
  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
  Map<String, dynamic> toJson() => _$AvailabilityToJson(this);
}
