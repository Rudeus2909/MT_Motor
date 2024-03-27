import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:motor_app/utils/global_colors.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            '-Hoặc đăng ký với-',
            style: TextStyle(
              color: GlobalColors.textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              //Facebook
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        )
                      ]),
                  child: SvgPicture.asset(
                    'assets/facebook.svg',
                    height: 35,
                  ),
                ),
              ),
              const SizedBox(width: 14,),
              //Google
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        )
                      ]),
                  child: SvgPicture.asset(
                    'assets/google.svg',
                    height: 30,
                  ),
                ),
              ),
              const SizedBox(width: 14,),
              //X
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        )
                      ]),
                  child: SvgPicture.asset(
                    'assets/twitterx.svg',
                    height: 30,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
