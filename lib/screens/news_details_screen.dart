import 'package:bloc_starter_pro/blocs/favorite/favorites_bloc.dart';
import 'package:bloc_starter_pro/blocs/favorite/favorites_event.dart';
import 'package:bloc_starter_pro/blocs/favorite/favorites_state.dart';
import 'package:bloc_starter_pro/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsScreen extends StatefulWidget {
  final NewsData newsData;

  const NewsDetailsScreen({Key? key, required this.newsData}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) => setState(() => _isLoading = true),
          onPageFinished: (_) => setState(() => _isLoading = false),
        ),
      )
      ..loadRequest(Uri.parse(widget.newsData.link ?? 'https://example.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
      floatingActionButton: BlocConsumer<FavoritesBloc, FavoritesState>(
        listener: (context, state) {
          if (state is AddFavorite) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Added to Favorites")),
            );
          } else if (state is RemoveFavorite) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Removed from Favorites")),
            );
          }
        },
        builder: (context, state) {
          final isFavorite = state.favorites
              .any((item) => item.articleId == widget.newsData.articleId);

          return FloatingActionButton(
            onPressed: () {
              if (isFavorite) {
                context
                    .read<FavoritesBloc>()
                    .add(RemoveFavorite(widget.newsData.articleId!));
              } else {
                context.read<FavoritesBloc>().add(AddFavorite(widget.newsData));
              }
            },
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

