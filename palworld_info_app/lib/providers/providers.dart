import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants.dart';

final palSortTypeProvider = StateProvider<SortBy>(
      (ref) => SortBy.Name,
);