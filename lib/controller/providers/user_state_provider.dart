import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/controller/providers/shared_preference_provider.dart';
import 'package:navigation/model/utility/constants.dart';
import '../../model/objects/user.dart';

/// user state provider which store and handle User state over all app
final userStateProvider =
    StateNotifierProvider<_UserState, User?>((ref) => _UserState(ref));

class _UserState extends StateNotifier<User?> {
  final Ref ref;

  _UserState(this.ref) : super(null);

  /// changed in runtime state and in sharedPreference
  Future<bool> updateOnly(
      {String? email,
      String? lifeStory,
      String? name,
      String? phone,
      String? password,
      num? salary,
      bool? isLoggedin}) async {
    bool isDone = false;
    try {
      if (state != null) {
        email != null ? state!.email = email : null;
        lifeStory != null ? state!.lifeStory = lifeStory : null;
        name != null ? state!.name = name : null;
        phone != null ? state!.phone = phone : null;
        password != null ? state!.password = password : null;
        salary != null ? state!.salary = salary : null;
        isLoggedin != null ? state!.isLoggedin = isLoggedin : null;

        await updateUserState(state!).then((value) {
          value ? isDone = true : isDone = false;
        });
      }
    } catch (e) {
      isDone = false;
      rethrow;
    }
    return isDone;
  }

  /// update user state provider
  /// changed in sharedpreference
  Future<bool> updateUserState(User user) async {
    bool isDone = false;
    try {
      await ref.watch(sharedPreferenceProvider.future).then((shared) async {
        await shared.setString(Constants.key, user.toJson()).whenComplete(() {
          state = user;
          isDone = true;
        });
      });
    } catch (e) {
      isDone = false;
      rethrow;
    }
    log('$state');
    return isDone;
  }

  /// create method for getting user and set state provider
  Future<User?> getUserState() async {
    await ref.watch(sharedPreferenceProvider.future).then((shared) async {
      await Future(() async {
        if (!shared.getKeys().contains(Constants.key)) {
          return null;
        } else {
          return User.fromJson(jsonUser: shared.getString(Constants.key)!);
        }
      }).then((user) => state = user);
    });
    return state;
  }
}
