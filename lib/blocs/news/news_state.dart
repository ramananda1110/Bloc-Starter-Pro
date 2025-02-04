import 'package:bloc_starter_pro/data/models/news_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props;
}

class NewsInitial extends NewsState {
  const NewsInitial();

  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {
  const NewsLoading();

  @override
  List<Object?> get props => [];
}

class NewsLoaded extends NewsState {
  final List<News> news;

  const NewsLoaded(this.news);

  @override
  List<Object?> get props => [news];
}

class NewsError extends NewsState {
  final String message;

  const NewsError(this.message);

  @override
  List<Object?> get props => [message];
}
