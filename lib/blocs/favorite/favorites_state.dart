import 'package:bloc_starter_pro/data/models/news_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  final List<NewsData> favorites;

  const FavoritesState({this.favorites = const []});

  @override
  List<Object> get props => [favorites];
}

class FavoritesInitial extends FavoritesState {}

class FavoriteListUpdated extends FavoritesState {
  const FavoriteListUpdated(List<NewsData> favorites)
      : super(favorites: favorites);
}
