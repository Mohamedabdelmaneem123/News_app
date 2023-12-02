
import 'package:figma/news%20app/layout/constant/constant.dart';
import 'package:figma/news%20app/layout/dio_peackage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/businuss/businuss.dart';
import '../modules/science/science.dart';
import '../modules/sport/sports.dart';
import 'newsstates.dart';


class cubiit extends Cubit<newsappstates>{
  cubiit() : super(initiailstate());
  static cubiit get(context) => BlocProvider.of(context);

  int current_index =0;
  List<BottomNavigationBarItem> Bottomnav =
  [
     BottomNavigationBarItem(icon:  Icon(Icons.business_center),
    label: 'Business'
    ),
     BottomNavigationBarItem(icon:  Icon(Icons.sports),
    label: 'Sport'
    ),
     BottomNavigationBarItem(icon:  Icon(Icons.science),
    label: 'Science'
    ),


  ];


  List<Widget> screen =[
  Businessscreen(),
  Sportsscreen(),
  Sciencescreen(),
  ];
  void nav(int index){
    current_index = index;
    if(index==2) getscience();
    if(index==1) getsport();
    emit(NavgoetorBarchange());
  }
  List<dynamic> business = [];

  void getBusiness() {
    if (business.length == 0) {
      emit(getbusinessloading());
      Diohelper.getdate(
         url: pathUrl, quary: querybussiness, path:pathUrl,
      ).then((value) {
        business = value.data['articles'];
        emit(getbusinessdatesuccess());
      }).catchError((error) {
        emit(getbusinesserror(error.toString()));
      });
    } else {
      emit(Newgetbusinessdate());
    }
  }

  List<dynamic> science = [];

  void getscience() {
    if (science.length == 0) {
      emit(getscienceloading());
      Diohelper.getdate(
        url: pathUrl, quary: queryscience, path:pathUrl,
      ).then((value) {
        science = value.data['articles'];
        emit(getsciencedatesuccess());
      }).catchError((error) {
        emit(getscienceerror(error.toString()));
      });
    } else {
      emit(Newgetsciencedate());
    }
  }


List<dynamic> sport =[];
void getsport(){
  if(sport.length==0){
    emit(getsportloading());
    Diohelper.getdate(url: pathUrl, quary: querysports, path: pathUrl).then((value) {
      sport = value.data['articles'];
      emit(getsportdatesuccess());
    }).catchError((error){
      emit(getsporterror(error.toString()));
    });
  }
  else
    emit(Newgetsportdate());
}
  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsSearchLoading());
    Diohelper.getdate(
      path: pathSearch,
      quary: searchQuary(value), url: pathUrl,
    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSucess());
    }).catchError((error) {
      emit(NewsGetSearchError(error.toString()));
    });
  }
  bool isChange = false;
  late AnimationController controller;

  void trigger() {
      isChange = !isChange;
      isChange ? controller.forward() : controller.reverse();
      emit(enimation());

  }
}
