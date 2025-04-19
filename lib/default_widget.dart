import 'package:flutter/material.dart';

Widget defaultEditText({
  int lines = 1,
  Function()? onTap,
  TextEditingController? controller,
  required String hintText,
  TextInputType textInput = TextInputType.text,
  IconData? suffixIcon,
  bool obscureText = false
}){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
      maxLines: lines,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Fill The Empty Data';
        }
        return null;
      },
      onTap: onTap,
     controller: controller,
      keyboardType: textInput,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(hintText,style: TextStyle(color:Colors.white,),),
        border: OutlineInputBorder(
          borderSide: BorderSide(color:Colors.black,width: 10,style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15.0),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            controller?.clear();
          },
          icon: Icon(suffixIcon,color:Colors.white,),
        ),
      ),
    ),
  );
}