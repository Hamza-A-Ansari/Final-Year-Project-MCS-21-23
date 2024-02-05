import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fypapp/loginsignup/forgot.dart';
import 'package:fypapp/loginsignup/signup.dart';
import 'package:fypapp/pages/mainLanding.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:fypapp/provider/provider1.dart';
import 'package:fypapp/utils/multiText.dart';
import '../utils/forgotLink.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool value = false;
  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  late bool _passwordVisible;
  void initState() {
    _passwordVisible = false;
  }

  bool _showPassword = false;
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context);

    log_in() async {
      try {
        setState(() {
          value = true;
        });
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
        print("done");
        var data = await FirebaseFirestore.instance
            .collection("users")
            .doc(userCredential.user!.uid)
            .get();
        Provider11.gmail = data['email'];
        Provider11.uid = data['uid'];
        Provider11.name = data['name'];
        Provider11.phone = data['phone'];
        print("${data['email']}=====>email");

        email.clear();
        password.clear();
        setState(() {
          value = false;
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Example()));
      } on FirebaseAuthException catch (e) {
        setState(() {
          value = false;
        });
        Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }

    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  image: new DecorationImage(
                    image: ExactAssetImage('assets/bg.jpeg'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.white,
                                  highlightColor: Color(0xffb929be),
                                  child: Multi(
                                      color: Colors.white,
                                      subtitle: "Hi",
                                      weight: FontWeight.w700,
                                      size: 30),
                                ),
                                Container()
                              ]),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(children: [
                                Multi(
                                    color: Colors.white,
                                    subtitle: "Welcome Back",
                                    weight: FontWeight.w700,
                                    size: 30),
                                Container()
                              ]),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff1B1B1B),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      )),
                  height: height / 1.4,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          Multi(
                              color: Colors.white,
                              subtitle: "Login",
                              weight: FontWeight.normal,
                              size: 25),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            children: [
                              Multi(
                                  color: Colors.white,
                                  subtitle: "Email",
                                  weight: FontWeight.normal,
                                  size: 15),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff009ae2),
                                    Color(0xffb929be)
                                  ]),
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 8.h,
                                  right: 12.w,
                                  left: 12.w),
                              child: TextFormField(
                                controller: email,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                  prefixIcon: GradientIcon(
                                    CupertinoIcons.envelope,
                                    30.0,
                                    LinearGradient(
                                      colors: [
                                        Color(0xff009ae2),
                                        Color(0xffb929be)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  hintText: "abc@gmail.com",
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            children: [
                              Multi(
                                  color: Colors.white,
                                  subtitle: "Password",
                                  weight: FontWeight.normal,
                                  size: 15),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff009ae2),
                                    Color(0xffb929be)
                                  ]),
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 8.h,
                                  right: 12.w,
                                  left: 12.w),
                              child: TextFormField(
                                controller: password,
                                obscureText: !this._showPassword,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: this._showPassword
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() => this._showPassword =
                                          !this._showPassword);
                                    },
                                  ),
                                  prefixIcon: GradientIcon(
                                    Icons.key,
                                    30.0,
                                    LinearGradient(
                                      colors: [
                                        Color(0xff009ae2),
                                        Color(0xffb929be)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 0, color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              GestureDetector(
                                onTap: (){
    Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => Forgot()));
                                },
                                child: ForgotLink(
                                  link: 'Forgot password?',
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          value == false
                              ? Container(
                                  height: 55.h,
                                  width: double.infinity,
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Color(0xff009ae2),
                                            Color(0xffb929be)
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.57),
                                                blurRadius: 5)
                                          ]),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.transparent,
                                            onSurface: Colors.transparent,
                                            shadowColor: Colors.transparent,
                                          ),
                                          onPressed: () {
                                            log_in();
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: 18,
                                              bottom: 18,
                                            ),
                                            child: Text("Log in"),
                                          ))),
                                )
                              : spinkit1,
                              SizedBox(height: 15.h,),
                              GestureDetector(child: ForgotLink(link: "Don't have an account"),onTap:(){
                                 Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => SignUp()));
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  GradientIcon(
    this.icon,
    this.size,
    this.gradient,
  );

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: SizedBox(
        width: size * 1.2,
        height: size * 1.2,
        child: Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
      ),
      shaderCallback: (Rect bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return gradient.createShader(rect);
      },
    );
  }
}

final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Color(0xff009ae2) : Color(0xffb929be),
      ),
    );
  },
);

final spinkit1 = SpinKitSpinningLines(
  color: Color(0xff009ae2),
);
