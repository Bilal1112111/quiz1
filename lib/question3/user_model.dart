import 'package:faker/faker.dart';

class UserModel {
  static Map<int, UserModel> users = {};
  final int id;
  final String firstName;
  final String lastName;
  final String about;
  final String imageURL;
  UserModel({
    required this.id,
    required this.about,
    required this.firstName,
    required this.imageURL,
    required this.lastName,
  });
  static UserModel? getUserById(int? id) {
    if (id == null || id < 0) return null;
    if (users.containsKey(id)) {
      return users[id];
    } else {
      users[id] = UserModel(
        id: id,
        about: faker.lorem.words(3).join(' '),
        firstName: faker.person.firstName(),
        imageURL: faker.image.image(),
        lastName: faker.person.lastName(),
      );
      return users[id];
    }
  }
}
