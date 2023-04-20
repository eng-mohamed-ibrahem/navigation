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
  void updateUserState(User user) {
    state = user;
  }

  /// create method for getting user and set state provider
  _setUserState() {
    ref.read(sharedPreferenceProvider).whenData((shared) async {
      await Future(() {
        if (!shared.getKeys().contains(Constants.key)) {
          return null;
        } else {
          return User.fromJson(jsonUser: shared.getString('user')!);
        }
      }).then((user) => state = user);
    });
  }
}
