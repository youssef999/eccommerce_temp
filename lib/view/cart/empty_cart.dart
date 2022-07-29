


  import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Center(
            //     child: SvgPicture.asset(
            //   'assets/sss1.svg',
            //   height: 200,
            // )),
            Center(child: Custom_Text(
              text:  "السلة فارغة " ,
              color: Colors.black,
              fontSize:25,
              alignment:Alignment.center,
            )),
          ],
        ),
      ),
    );
  }
}
