import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_brief/app/app.dart';
import 'package:news_brief/di/di.dart';
import 'package:news_brief/domain/domain.dart';
//import 'package:news_brief/domain/repository/model%20info/article1.dart';
import 'package:flutter/widgets.dart';
//import 'package:go_router/go_router.dart';
import 'package:news_brief/domain/repository/top_news_info/CharacterRepository.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _infoBloc = InfoBloc(getIt<CharacterRepository>());

  @override
  void initState() {
    _infoBloc.add(const InfoLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Info Page',
          ),
          backgroundColor: const Color.fromARGB(255, 8, 8, 66),
        ),
        body: Container(
          color: const Color.fromRGBO(227, 221, 225, 1),
          child: BlocBuilder<InfoBloc, InfoState>(
            bloc: _infoBloc,
            builder: (context, state) {
              if (state is InfoLoadInProgress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is InfoLoadSuccess) {
                Article articles = state.articles;
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Specifications',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      20.ph,
                      // ListView.separated(
                      //   primary: false,
                      //   shrinkWrap: true,
                      //   itemCount: articles.length,
                      //   itemBuilder: (context, index) {
                      //     //if (articles.length==articles[index]){
                      //     return ArticleCardInfo(
                      //       article: articles[index],
                      //     );
                      //     //}
                      //   },
                      //   separatorBuilder: (context, index) {
                      //     return 20.ph;
                      //   },
                      // ),

                      Text(
                        'Name:',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        articles.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        //style: Theme.of(context).textTheme.titleLarge,
                      ),
                      10.ph,
                      Text(
                        'Description:',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        articles.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      10.ph,
                      Text(
                        'First appearance:',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        articles.firstAppearance,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        //style: Theme.of(context).textTheme.titleLarge,
                      ),
                      10.ph,
                      Text(
                        'Creator:',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      10.ph,
                      Text(
                        articles.creator,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                );
              }
              if (state is InfoLoadFailure) {
                return ErrorCard(
                  title: 'Error',
                  description: state.exception.toString(),
                  onReload: () {
                    _infoBloc.add(const InfoLoad());
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
