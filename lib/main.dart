import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'newPage.dart';

void main()=>runApp(MaterialApp(
  home:DummyLogin() ,
));

class DummyLogin extends StatefulWidget {
  @override
  _DummyLoginState createState() => _DummyLoginState();
}

class _DummyLoginState extends State<DummyLogin> {
  TextEditingController emailController;
  TextEditingController passwordController;
  String username,password;
  bool newUser;
  SharedPreferences loginDetails;
  FocusNode myFocusNode;
bool isHiddenPassword=true;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _check_if_already_login();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy'),
      ),
      body: Container(
        child: Form(
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              physics: BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight ,
                        colors: [Colors.blueGrey,Colors.blue]
                    )
                ),
                //margin: EdgeInsets.only(top: 125),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                      //onEditingComplete: () => node.nextFocus(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator:validateEmail,
                      //  onSaved: (String value){
                      //    // ignore: unnecessary_statements
                      //    this.data.email=value;
                      //  },
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your Email',
                        contentPadding: const EdgeInsets.all(15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      controller: passwordController,
                      // onEditingComplete: () => node.nextFocus(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: _validate_pass,
                      // onSaved: (String value){
                      //   this.data.password=value;
                      // },
                      obscureText: isHiddenPassword,
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your password',
                        suffixIcon: InkWell(
                            onTap: _tooglePassword,
                            child: Icon(isHiddenPassword?Icons.visibility:Icons.visibility_off)),
                        contentPadding: const EdgeInsets.all(15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),


                    SizedBox(
                      height: 15,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    // ignore: deprecated_member_use
                    FlatButton(
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(90),
                        ),
                        padding: const EdgeInsets.all(15),
                        textColor: Colors.white,
                        onPressed: () {
                            username=emailController.toString();
                            password=passwordController.toString();
                          if(username!= '' && password!=''){
                            print('YOYOO');
                            loginDetails.setBool('login', false);
                            loginDetails.setString('username', username);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context)=>NewPage()));
                          }
                        }

                    ),


                  ],
                ),

              ),
            );
          },),
        ),
      ),
    );
  }

void _tooglePassword() {
  setState(() {
    isHiddenPassword=!isHiddenPassword;
  });
}
  // ignore: non_constant_identifier_names
  void _check_if_already_login() async {
     loginDetails=await SharedPreferences.getInstance();
     newUser=(loginDetails.getBool('login')??true);
     print('user');
     if(newUser==false){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>NewPage()));
     }
  }

}

