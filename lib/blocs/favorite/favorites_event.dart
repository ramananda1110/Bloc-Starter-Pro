import 'package:bloc_starter_pro/data/models/news_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class AddFavorite extends FavoritesEvent {
  final NewsData newsData;

  const AddFavorite(this.newsData);

  @override
  List<Object?> get props => [newsData];
}

class RemoveFavorite extends FavoritesEvent {
  final String articleId;

  const RemoveFavorite(this.articleId);

  @override
  List<Object?> get props => [articleId];
}