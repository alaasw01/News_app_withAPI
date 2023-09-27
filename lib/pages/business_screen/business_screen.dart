import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/component.dart';
import 'package:news_app/layout/news_layout/cubit/news_cubit.dart';

class BusinessScreen extends StatelessWidget {
   BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list=NewsCubit.get(context).business;
        return buildArticleBuilder(list,context);
      },
    );
  }
}