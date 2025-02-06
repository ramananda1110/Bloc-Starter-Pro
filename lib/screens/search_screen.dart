import 'package:bloc_starter_pro/blocs/news/news_bloc.dart';
import 'package:bloc_starter_pro/blocs/news/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/news/news_event.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search News",
                hintText: "Enter a keyword to search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (query) {
                context.read<NewsBloc>().add(SearchNews(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NewsLoaded) {
                  final newsList = state.news;
                  if (newsList.isEmpty) {
                    return const Center(child: Text("No data found"));
                  } else {
                    return ListView.builder(
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        final data = newsList[index];
                        return ListTile(
                          title: Text(data.title ?? 'No Title'),
                          subtitle: Text(
                            data.description ?? "",
                            maxLines: 2,  // Limit to 2 lines
                            overflow: TextOverflow.ellipsis,  // Add "..." at the end
                          ),
                        );
                      },
                    );
                  }
                } else {
                  return const Center(child: Text('Failed to load news data.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
