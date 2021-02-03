import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

//  void getData() async{
////    String username =  await Future.delayed(Duration(seconds: 3),(){
////      return 'yoshi';
////    });
////
////    String bio = await Future.delayed(Duration(seconds: 2),(){
////      return 'nygyft';
////    });
////    print('$username - $bio');
//
//    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
//    Map data = jsonDecode(response.body);
//    print(data);



//  String time = 'loading';

    void setupWorldTime() async{
      WorldTime instance = WorldTime(location: 'Berlin', flag:'germany.png', url:'Europe/Berlin');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location':instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDaytime': instance.isDaytime,
      });
//      print(instance.time);
//      setState(() {
//        time=instance.time;
//      });
    }

  @override
  void initState() {
    super.initState();
//    getData();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
//      body: Padding(
//        padding: EdgeInsets.all(50.0),
//        child: Text('loading'),
      body: Center(
        child: SpinKitPumpingHeart(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
