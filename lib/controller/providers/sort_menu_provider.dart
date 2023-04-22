import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../model/utility/constants.dart';

final sortMenuProvider = StateProvider(
  (ref) {
    return SortItemType.none;
  },
);
