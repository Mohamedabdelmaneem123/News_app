
import 'package:bloc/bloc.dart';
import 'package:figma/news%20app/News_app/AppCubit/Appstates.dart';
import 'package:figma/news%20app/News_app/helper/CacheHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Appcubiit extends Cubit<Appstates>{
  Appcubiit() : super(init());
  static Appcubiit get(context) => BlocProvider.of(context);

  bool isdark = false;
  void changemode({bool? isDarkFromShared}) {
    if (isDarkFromShared != null) {
      isdark = isDarkFromShared;
      emit(changemodeApp());
    } else {
      isdark = !isdark;
      CacheHelper.setBoolData(key: 'isdark', value: isdark).then((value) {
        emit(changemodeApp());
      }
      );
    }
  }
}