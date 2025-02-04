import 'package:bloc_starter_pro/blocs/news/news_event.dart';
import 'package:bloc_starter_pro/blocs/news/news_state.dart';
import 'package:bloc_starter_pro/data/repositories/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository userRepository;

  final token = "pub_67010390dc45d2e4c0bdf83eb8410f0d4a394";
  final country = "bd";
  final category = "top";

  NewsBloc(this.userRepository) : super(const NewsInitial()) {
    on<LoadNewsList>((event, emit) async {
      emit(const NewsLoading());
      try {
        final loadUrl =
            "https://newsdata.io/api/1/latest?country=$country&apikey=$token&category=$category";

        final users = await userRepository.fetchNews(loadUrl);
        emit(NewsLoaded(users));
      } catch (e) {
        emit(const NewsError("Failed to load users"));
      }
    });
  }
}
