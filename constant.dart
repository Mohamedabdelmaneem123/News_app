import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


String baseUrl = 'https://newsapi.org/';
String pathUrl = 'v2/top-headlines';
String pathSearch = 'v2/everything';
String apiKey = '74c46aa019f2472a8f80a48776f97d95';
String urlToImage = 'https://cleantechnica.com/wp-content/uploads/2023/11/SUPERCHARGER-1920x1280-1.jpg';


Map<String , dynamic> querybussiness =
{
  'country': 'eg',
  'category':'business',
  'apikey':'74c46aa019f2472a8f80a48776f97d95'
};

Map<String , dynamic> querysports =
{
  'country': 'eg',
  'category':'sports',
  'apikey':apiKey
};

Map<String , dynamic> queryscience =
{
  'country': 'eg',
  'category':'science',
  'apikey':apiKey
};

Map<String , dynamic> searchQuary(String vaule) =>
{
  'q': vaule,
  'apikey':apiKey
};

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


Widget buildArticleItem(article, context) => InkWell(
  onTap: () {
    navigateTo(context, WebViewScreen(url: article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,

          decoration:   BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: article['urlToImage'] == null
                    ? AssetImage('assets/images/no_image_available.jpg')
                as ImageProvider
                    : NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit as void Function(String)?,
      onChanged: onChange as void Function(String)?,
      onTap: onTap as void Function()?,
      validator: validate as String? Function(String?)?,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed as void Function()?,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );



void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);


class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }


}

Widget articleBuilder(list, context, {isSearch = false}) {
  return list.length > 0
      ? ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: 10,
  )
      : isSearch
      ? Container()
      : Center(
    child: CircularProgressIndicator(),
  );
}
