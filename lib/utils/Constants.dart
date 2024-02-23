
import 'dart:ui';

const String BASE_URL="https://api-stg.we-citizens.com/";
const String LOGIN_API_PATH="${BASE_URL}auth/sign-in";
const String SIGNUP_API_PATH="${BASE_URL}auth/sign-up";
const String USER_TYPE_API_PATH="${BASE_URL}users/get-user-type";
const String continueTxt="Continue";
const String confirmTxt="Confirm";
var access_token="";

class AppColors {
  AppColors._();
  static const Color appThemeColor=Color(0xff253859);
  static const Color color_FFA634=Color(0xffFFA634);
  static const Color color_17B26A=Color(0xff17B26A);
  static const Color color_607699=Color(0xff607699);
  static const Color color_1F2937= Color(0xff1F2937);
}
class MyConstants{
  static const String TOKEN ="";
}
