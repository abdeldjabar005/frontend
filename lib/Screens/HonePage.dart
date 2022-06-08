import 'package:flutter/material.dart';
import 'package:xy2/Screens/Home/buildProperties.dart';
import 'package:xy2/modules/Post.dart';
import 'package:xy2/network/post_helper.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final _pagingController = PagingController<int, PostsData>(
    firstPageKey: 1,
  );
  late Future newItems;
  ScrollController _scrollController = new ScrollController();
  static const _pageSize = 5;
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await PostService().getPosts(pageKey);
      print(newItems.length);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView<int, PostsData>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<PostsData>(
            itemBuilder: (context, item, index) => buildProperty(item),
          ),
        ),
      );
}
