import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:figma/news%20app/layout/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../News_app/Cubit.dart';
import '../../News_app/newsstates.dart';

class Businessscreen extends StatelessWidget {
  const Businessscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => cubiit()..getBusiness(),
      child: BlocConsumer<cubiit , newsappstates>(
        listener: (context, state) {},
        builder: (context, state) {
          var go = cubiit.get(context);
          var List = go.business;
          return articleBuilder(List,context);
            /*ConditionalBuilder(
            condition: state is! getbusinessloading,
            builder: (BuildContext context) {
              return ListView.separated(itemBuilder: (context, index) => allscreen(),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10);
            },
            fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
          );

        },),
    );

             */
  }));
}}