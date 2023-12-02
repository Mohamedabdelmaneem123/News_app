

abstract class newsappstates{}

class initiailstate extends newsappstates{}
class NavgoetorBarchange extends newsappstates{}
class getbusinessloading extends newsappstates{}
class getbusinessdatesuccess extends newsappstates{}
class Newgetbusinessdate extends newsappstates{}
class getbusinesserror extends newsappstates{
  final String error;
  getbusinesserror(this.error);
}

class getscienceloading extends newsappstates{}
class getsciencedatesuccess extends newsappstates{}
class Newgetsciencedate extends newsappstates{}
class getscienceerror extends newsappstates{
  final String error;
  getscienceerror(this.error);
}

class getsportloading extends newsappstates{}
class getsportdatesuccess extends newsappstates{}
class Newgetsportdate extends newsappstates{}
class getsporterror extends newsappstates{
  final String error;
  getsporterror(this.error);
}
class NewsSearchLoading extends newsappstates{}
class NewsGetSearchSucess extends newsappstates{}
class NewsGetSearchError extends newsappstates{
  final String error;
  NewsGetSearchError(this.error);
}
class enimation extends newsappstates{}