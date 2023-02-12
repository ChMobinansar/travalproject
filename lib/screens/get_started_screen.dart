import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travalproject/screens/screen_1.dart';
import '../confriguration/size_config.dart';
import '../contants/app_colors.dart';
import '../contants/app_string.dart';


class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/images/get_started_background_img.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
          appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              systemNavigationBarColor:  AppColors.kPrimaryColorSkyBlue,
              statusBarColor: AppColors.kPrimaryColorSkyBlue, // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top:SizeConfig.screenHeight!*0.07,left: SizeConfig.screenWidth!*0.08,right: 10,bottom: 0 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.getStartedTravelText,style: TextStyle(
                    height:1,
                  color: Colors.white,
                  fontSize: 50,fontFamily: "Larken Serif Trial"
                ),
                ),
                Text(
                  AppString.getStartedNeedText,style: GoogleFonts.inter(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 21,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
                )
                ),
                SizedBox(
                  height: SizeConfig.screenHeight!*0.05,
                ),
                letStartedContainer(onTap:() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen1()));
                }, boxText:AppString.getStartedText,)
              ],
            ),
          ),
          )
      ],
    );
  }
  Widget letStartedContainer({required var onTap,required String boxText}){
    return InkWell(
      onTap: onTap,
      child: Container(
        height:SizeConfig.screenHeight!*0.06,
        width: SizeConfig.screenWidth!*0.4,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50)
        ),
        child: Center(child: Text(boxText,style: TextStyle(
          fontSize: 18,
            color: AppColors.kPrimaryColorSkyBlueDark,fontWeight:FontWeight.bold
        ),)),
      ),
    );
  }
}
