import 'package:figma/news%20app/News_app/AppCubit/Appcubit.dart';
import 'package:figma/news%20app/layout/constant/constant.dart';
import 'package:figma/news%20app/layout/dio_peackage.dart';
import 'package:figma/news%20app/modules/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit.dart';
import 'newsstates.dart';

class app_news extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubiit, newsappstates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var mo = cubiit.get(context);

        return Scaffold(
          appBar: AppBar(actions: [
            IconButton(
                icon:Icon(Icons.search),
              onPressed: () {
                   navigateTo(context, SearchScreen());
                  },),
            IconButton(
                 icon:Icon (Icons.brightness_4_outlined),
                onPressed: () {
               Appcubiit.get(context).changemode();
                },)

          ],
          title: Text('news'),
          ),
          body: mo.screen[mo.current_index],
          bottomNavigationBar: BottomNavigationBar(
            items: mo.Bottomnav,
            type: BottomNavigationBarType.fixed,
            currentIndex: mo.current_index,
            onTap: (index) {
              mo.nav(index);
            },
          ),
        );
      },
    );
  }
}
