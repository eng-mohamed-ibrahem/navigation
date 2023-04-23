import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:navigation/controller/providers/shared_preference_provider.dart';
import 'package:navigation/model/utility/constants.dart';
import '../../model/objects/user.dart';

/// user state provider which store and handle user state over all app
final userStateProvider =
    StateNotifierProvider<_UserState, User?>((ref) => _UserState(ref));

class _UserState extends StateNotifier<User?> {
  final Ref ref;

  _UserState(this.ref) : super(null) {
    _setUserState();
  }
  

  /// update user stateprovider
  void updateUserState(User user) async {
    await ref.watch(sharedPreferenceProvider.future).then((shared) async {
      await shared.setString(Constants.key, user.toJson()).whenComplete(() {
        state = user;
      });
    });
  }

  /// create method for getting user and set state provider
  _setUserState() async {
    await ref.watch(sharedPreferenceProvider.future).then((shared) async {
      await Future(() async {
        if (!shared.getKeys().contains(Constants.key)) {
          return null;
        } else {
          return User.fromJson(jsonUser: shared.getString('user')!);
        }
      }).then((user) => state = user);
    });
  }
}
