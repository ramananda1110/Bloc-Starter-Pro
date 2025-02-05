import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadNewsList extends NewsEvent {}


// Add this event to the NewsEvent class
class SearchNews extends NewsEvent {
  final String query;

  SearchNews(this.query);
}