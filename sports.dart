import 'package:figma/news%20app/News_app/Cubit.dart';
import 'package:figma/news%20app/layout/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../News_app/newsstates.dart';

class Sportsscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context)=> cubiit()..getsport(),
    child: BlocConsumer<cubiit , newsappstates>(
      listener: (context, state) {},
        builder: (context, state) {
          var mo = cubiit.get(context);
          var list = mo.sport;
          return articleBuilder(list, context);
        },),

    );
  }
}
