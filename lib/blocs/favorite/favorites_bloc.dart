import 'package:bloc_starter_pro/blocs/favorite/favorites_event.dart';
import 'package:bloc_starter_pro/blocs/favorite/favorites_state.dart';
import 'package:bloc_starter_pro/data/models/news_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitial()) {
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
  }

  void _onAddFavorite(AddFavorite event, Emitter<FavoritesState> emit) {
    final updatedFavorites = List<NewsData>.from(state.favorites)
      ..add(event.newsData);
    emit(FavoriteListUpdated(updatedFavorites));
  }

  void _onRemoveFavorite(RemoveFavorite event, Emitter<FavoritesState> emit) {
    final updatedFavorites = List<NewsData>.from(state.favorites)
      ..removeWhere((item) => item.articleId == event.articleId);
    emit(FavoriteListUpdated(updatedFavorites));
  }
}
