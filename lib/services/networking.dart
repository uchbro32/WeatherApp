import 'dart:convert';
import 'package:http/http.dart' as http;
 class NetworkHelper {
   NetworkHelper(this.url);
   final String url;

   Future getData() async{
     var u = Uri.parse(url);
     http.Response response = await http.get(u);

     if(response.statusCode == 200){
       return jsonDecode(response.body);
     }
     else{
       print(response.statusCode);
     }

   }

 }