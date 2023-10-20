import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/component.dart';
import 'package:news_app/layout/news_layout/cubit/news_cubit.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list=NewsCubit.get(context).search ;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    NewsCubit.get(context).getSearchData(value);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Title must be not empty';
                    }
                    return null;
                  },
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                  
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: 'Search',
                  ),
                ),
              ),
              Expanded(child: buildArticleBuilder(list, context,isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
