import 'package:figma/news%20app/News_app/Cubit.dart';
import 'package:figma/news%20app/News_app/newsstates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/constant/constant.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubiit, newsappstates>(
      listener: (context, state) {},
      builder: (context, state) {
        cubiit searchCubit = cubiit.get(context);
        var list = searchCubit.search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  label: 'Search',
                  prefix: Icons.search,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'Search Must Not Be Empty';
                    }
                  },
                  onChange: (String value) {
                    searchCubit.getSearch(value);
                  },
                ),
              ),
              Expanded(
                child: articleBuilder(list, context, isSearch: true),
              ),
            ],
          ),
        );
      },
    );
  }
}