import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

void main()=>runApp(MaterialApp(
home: NewPage(),
));

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  SharedPreferences loginDetails;
  DummyLogin dummyLogin = new DummyLogin();
  String username;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }


  void initial() async{
    loginDetails=await SharedPreferences.getInstance();
    setState(() {
      username=loginDetails.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight ,
                colors: [Colors.blueGrey,Colors.blue]
            )
        ),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome',style: TextStyle(
              fontSize: 54
            ),),
            SizedBox(height: 20,),
            // ignore: deprecated_member_use
            FlatButton(onPressed: (){
              loginDetails.setBool('login', true);
                print('www');
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DummyLogin()));
              }, child: Text('Logout',style: TextStyle(
              color: Colors.black,
            ),),
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(90),
              ),

            )
          ],
        ),
      ),
    );
  }
}
