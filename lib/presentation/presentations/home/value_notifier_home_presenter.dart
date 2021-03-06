import 'package:flutter/foundation.dart';

import '../../../ui/pages/home/home_presenter.dart';

class ValueNotifierHomePresenter implements HomePresenter {
  ValueNotifier<int> pageIndexNofifierController = ValueNotifier<int>(0);
  @override
  ValueNotifier<int> get pageIndexNotifier => pageIndexNofifierController;
}
