import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecoursee/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ecoursee/pages/welcome/bloc/welcome_events.dart';
import 'package:ecoursee/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcone extends StatefulWidget {
  const Welcone({super.key});

  @override
  State<Welcone> createState() => _WelconeState();
}

class _WelconeState extends State<Welcone> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body:
          BlocBuilder<WelcomeBloc, WelcomeState>(builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375
              .w, //menggunakan .w menandakan bukan 375 fix tapi dapat di adjust
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
              controller: pageController,
                onPageChanged: (index) {
                  state.page = index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  /* print("index value is ${index}"); */
                },
                children: [
                  _page(
                      1,
                      context,
                      "next",
                      "First see Learning",
                      "Forget about a for of paper all knowledge in on learning",
                      "assets/images/reading.png"),
                  _page(
                      2,
                      context,
                      "next",
                      "Connect With Everyone",
                      "Always keep in touch with your tutor & friend. Let's get connected",
                      "assets/images/boy.png"),
                  _page(
                      3,
                      context,
                      "get started",
                      "Always Fascinated Learning",
                      "Anywhere, anytime. The time is at our discrtion so study whenever you want",
                      "assets/images/man.png")
                ],
              ),
              Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeSize: const Size(18.0, 8.0),
                        size: const Size.square(8.0),
                        activeColor: Colors.blue,
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ))
            ],
          ),
        );
      })),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName,
      String tittle, String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(imagePath,
          fit: BoxFit.cover,),
        ),
        Container(
          child: Text(
            tittle,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: (){
            //within 0-2 index
            if(index<3){
            //animation
            pageController.animateToPage(
              index, 
              duration: const Duration(milliseconds: 500),
               curve: Curves.easeIn);
            }else{
              /* Navigator.of(context).push(MaterialPageRoute(builder: (context)=> )) */
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
