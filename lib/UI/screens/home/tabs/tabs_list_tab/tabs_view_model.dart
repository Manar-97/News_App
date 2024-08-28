import 'package:flutter/material.dart';
import 'package:news_app/data/model/source.dart';

import '../../../../../data/api/api_manager.dart';
import '../../../../base/base_api_state.dart';

class TabsViewModel extends ChangeNotifier {
  late BaseApiState sourcesApiState;
  getSources(String categoryId) async {
    try {
      sourcesApiState = BaseLoadingState();
      notifyListeners();
      List<Source> sources = (await ApiManager.getSources(categoryId)).sources!;
      sourcesApiState = BaseSuccessState<List<Source>>(sources);
      notifyListeners();
    } catch (e) {
      sourcesApiState = BaseErrorState(e.toString());
      notifyListeners();
    }
  }
}
