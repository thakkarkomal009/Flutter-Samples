import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:side_sticky_header/business_logic/feed/feed_cubit.dart';
import 'package:side_sticky_header/business_logic/feed/model/feed_model.dart';
import 'package:side_sticky_header/presentation/widget/feed_view.dart';
import 'package:side_sticky_header/presentation/widget/loading_card.dart';
import 'package:side_sticky_header/presentation/widget/side_header.dart';

class FeedListScreen extends StatelessWidget {
  List<FeedModel> _feedList = [];
  bool? _hasData;

  FeedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false, title: const Text('Side Sticky Header List')),
      body: BlocBuilder<FeedCubit, FeedState>(
        builder: (context, state) {
          if (state is FeedLoading) {
            return showLoaderView();
          } else if (state is FeedListLoaded) {
            _feedList = state.feedList;
          }
          return CustomScrollView(
            slivers: (_feedList.isEmpty && _hasData == true)
                ? <Widget>[showLoaderView()]
                : showFeedListView(context),
            reverse: false,
          );
        },
      ),
    );
  }

  List<Widget> showFeedListView(BuildContext context) {
    List<Widget> feedList = [];
    Map feedMap = {};

    (_feedList.isEmpty && _hasData == true)
        ? <Widget>[showLoaderView()]
        :
    _feedList.forEach((feed) {
            if (feedMap.containsKey(feed.date)) {
              feedMap[feed.date].add(feed);
            } else {
              feedMap[feed.date] = [feed];
            }
          });
    feedMap.forEach((key, value) {
      feedList.add(SliverStickyHeader(
          header: SideHeader(
            date: key,
          ),
          sliver: SliverPadding(
            padding: const EdgeInsets.only(left: 60.0, right: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      FeedView(
                        feed: value[index],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                },
                childCount: value.length,
              ),
            ),
          )));
    });
    return feedList;
  }

  Widget showLoaderView() {
    List<Widget> loaderView = [];
    List.generate(5, (index) {
      return loaderView.add(
        Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              child: LoadingCard(height: 280),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      );
    });
    return SingleChildScrollView(
      child: Column(
        children: loaderView,
      ),
    );
  }
}
