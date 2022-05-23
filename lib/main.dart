import 'package:flutter/material.dart';
import 'package:flutter_project_2/screens/main_secreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//
// Future<String> getData() async{
//   print('hello');
//   await Future.delayed(Duration(seconds: 2));
//   return 'hello user k cha';
//   // throw Exception('some error');
// }


void main() async {
  // getData().then((value) => print(value)).catchError((err) => print(err));
  //  try{
  //    final data = await getData();
  //    print(data);
  //  }catch (err){
  //    print('err cha $err');
  //  }

  runApp(ProviderScope(child: Home()));
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}