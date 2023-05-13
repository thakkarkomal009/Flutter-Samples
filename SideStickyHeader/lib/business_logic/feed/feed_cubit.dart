import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:side_sticky_header/business_logic/feed/model/feed_model.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedInitial()) {
    getFeedList();
  }

  List<FeedModel> _feedList = [];

  void getFeedList() async {
    emit(FeedLoading());
    String data = await rootBundle.loadString('assets/feed_list_data.json');
    var jsonResult = jsonDecode(data);

    List<dynamic>? feeds = jsonResult != null ? List.from(jsonResult) : null;
    _feedList.addAll(feeds!.map((m) => FeedModel.fromJson(m)).toList());

    emit(FeedListLoaded(_feedList));
  }
}
