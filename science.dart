import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../News_app/Cubit.dart';
import '../../News_app/newsstates.dart';
import '../../layout/constant/constant.dart';

class Sciencescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => cubiit()..getscience(),
        child: BlocConsumer<cubiit , newsappstates>(
        listener: (context, state) {},
    builder: (context, state) {
      var go = cubiit.get(context);
      var List = go.science;
      return articleBuilder(List, context);
    })
    );}
}
