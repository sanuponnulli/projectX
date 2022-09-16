import 'package:dio/dio.dart';

Future<List<List>> getdata() async {
  try {
    Response response =
        await Dio().get('https://finekube.com/interview/flutterTest.php');
    final totalpages = response.data["total_pages"];
    List data = response.data["data"];
    List<List> returndata = [];
    for (int i = 0; i < 6; i++) {
      returndata.add([data[i]["Name"], data[i]["Img"]]);
    }
    // print(returndata);
    return returndata;
    //print(response.data["total_pages"]);
  } catch (e) {
    print(e);
    return [];
  }
}
