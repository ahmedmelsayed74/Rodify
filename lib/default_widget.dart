import 'package:flutter/material.dart';

Widget حقل_نص_افتراضي({
  int عدد_الأسطر = 1,
  Function()? عند_النقر,
  TextEditingController? وحدة_التحكم,
  required String نص_إرشادي,
  TextInputType نوع_الإدخال = TextInputType.text,
  IconData? رمز_نهاية,
  bool نص_سري = false,
}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextFormField(
      maxLines: عدد_الأسطر,
      validator: (القيمة) {
        if (القيمة == null || القيمة.isEmpty) {
          return 'يرجى ملء الحقل الفارغ';
        }
        return null;
      },
      onTap: عند_النقر,
      controller: وحدة_التحكم,
      keyboardType: نوع_الإدخال,
      obscureText: نص_سري,
      decoration: InputDecoration(
        label: Text(
          نص_إرشادي,
          style: TextStyle(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 10, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15.0),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            وحدة_التحكم?.clear();
          },
          icon: Icon(رمز_نهاية, color: Colors.white),
        ),
      ),
    ),
  );
}
