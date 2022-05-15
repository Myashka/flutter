import 'package:bloc_hive/dashboard/model/user_model.dart';
import 'package:hive/hive.dart';

class UserRepository {
  late final Box _userBox;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _userBox = await Hive.openBox<User>('users');
  }

  Box get userBox => _userBox;

  //get users from hive database
  List<User> getUsers() {
    final userList = _userBox.values.toList();
    return userList as List<User>;
  }

  // adding user to hive db
  Future<List<User>> addUser(User newUser) async {
    await _userBox.add(newUser);
    return getUsers();
  }

  // remove user from hive db
  Future<List<User>> removeUser(String id) async {
    final userToDelete =
        await _userBox.values.firstWhere((element) => element.id == id);
    await userToDelete.delete();
    return getUsers();
  }

  // update user info
  Future<List<User>> updateUserInfo(User user) async {
    final userToUpdate = await _userBox.values.firstWhere((element) {
      return element.id == user.id;
    });
    final index = userToUpdate.key;
    await _userBox.put(index, user);

    return getUsers();
  }
}
