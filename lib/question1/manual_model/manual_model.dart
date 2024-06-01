import '../../helper/date_time_manager.dart';

class Company {
  final int isActive;
  final String name;
  final Address? address;
  final DateTime established;
  final List<Department> departments;

  Company({
    required this.isActive,
    required this.name,
    this.address,
    required this.established,
    required this.departments,
  });
  factory Company.fromJson(Map<String, dynamic> json) => Company(
        isActive: json.containsKey('is_active')
            ? json['company']['is_active']
            : json['company']['isActive'],
        name: json['company']['name'],
        address: Address.fromJson(json['company']['address']),
        established: DateTimeManager.fromUTC(json['company']['established']),
        departments: List<Department>.from(
          json['company']['departments'].map(
            (department) => Department.fromJson(department),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        'is_active': isActive,
        'name': name,
        'address': address?.toJson(),
        'established': DateTimeManager.fromLocal(established),
        'departments':
            departments.map((department) => department.toJson()).toList(),
      };
}

class Address {
  final String? street;
  final String? city;
  final String? state;
  final String? postalCode;

  Address({
    this.street,
    this.city,
    this.state,
    this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        city: json['city'],
        state: json['state'],
        postalCode: json['postalCode'],
      );
  Map<String, dynamic> toJson() => {
        'street': street,
        'city': city,
        'state': state,
        'postalCode': postalCode,
      };
}

class Department {
  final String deptId;
  final String name;
  final String manager;
  final double budget;
  final int year;
  final Availability availability;
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

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        deptId: json['deptId'],
        name: json['name'],
        manager: json['manager'],
        budget: json['budget'].toDouble(),
        year: json['year'],
        availability: Availability.fromJson(json['availability']),
        meetingTime: json['meeting_time'],
      );
  Map<String, dynamic> toJson() => {
        'deptId': deptId,
        'name': name,
        'manager': manager,
        'budget': budget,
        'year': year,
        'availability': availability.toJson(),
        'meeting_time': meetingTime,
      };
}

class Availability {
  final bool online;
  final bool inStore;

  Availability({
    required this.online,
    required this.inStore,
  });
  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        online: json['online'],
        inStore: json['inStore'],
      );

  Map<String, dynamic> toJson() => {
        'online': online,
        'inStore': inStore,
      };
}
