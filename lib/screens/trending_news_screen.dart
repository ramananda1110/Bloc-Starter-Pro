import 'package:bloc_starter_pro/blocs/network/internet_cubit.dart';
import 'package:bloc_starter_pro/blocs/news/news_bloc.dart';
import 'package:bloc_starter_pro/blocs/news/news_event.dart';
import 'package:bloc_starter_pro/blocs/news/news_state.dart';
import 'package:bloc_starter_pro/config/routes/app_page.dart';
import 'package:bloc_starter_pro/widgets/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingNewsScreen extends StatefulWidget {
  const TrendingNewsScreen({super.key});

  @override
  State<TrendingNewsScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TrendingNewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsBloc>().add(LoadNewsList());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
        listener: (context, state) {
      if (state == InternetState.disconnected) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No internet connection')),
        );
      }
    }, child: BlocBuilder<InternetCubit, InternetState>(
      builder: (context, internetState) {
        if (internetState == InternetState.disconnected) {
          return const NoInternetWidget();
        } else if (internetState == InternetState.connected) {
          return BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NewsLoaded) {
                return ListView.builder(
                  itemCount: state.news.length,
                  itemBuilder: (context, index) {
                    final data = state.news[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      elevation: 4,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        title: Text(
                          data.title ?? 'No Title Available',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Published on: ${data.pubDate ?? 'No Date Available'}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              data.sourceName ?? 'Unknown Source',
                              style: const TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                color: Colors.blue,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              data.description ?? 'No description available',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          // Navigator.pushReplacementNamed(context, AppPage.details);

                          Navigator.pushNamed(
                            context,
                            AppPage.details,
                            arguments: data,
                          );
                        },
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('Failed to load news data.'));
              }
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
