import 'package:flutter/material.dart';
import 'package:medical_hiring/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final Function onSaved, validator;
  final String hint, label;
  final bool obscureText;
  final width;
  final Color colorLabel;
  final Color colorBorder;
  final TextInputType keyboardType;

  final Widget icon;

  CustomTextFormField({
    @required this.onSaved,
    @required this.hint,
    @required this.label,
    this.obscureText = false,
    this.width,
    this.colorLabel = kWhiteColor,
    this.colorBorder = kWhiteColor,
    @required this.validator,
    this.keyboardType = TextInputType.multiline,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  color: colorLabel, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: height * 0.01),
            SizedBox(
              child: TextFormField(
                // keyboardType: TextInputType.multiline,
                onSaved: onSaved,
                validator: validator,
                minLines: label == 'Details' ? 5 : 1,
                keyboardType: keyboardType,
                // hint == 'Product Description\n' ? TextInputType.multiline : null,
                maxLines: label == 'Details' ? 10 : 1,
                obscureText: obscureText,
                cursorColor: Colors.black54,

                style: Theme.of(context).textTheme.headline3,
                decoration: InputDecoration(
                  // helperMaxLines: 5,
                  fillColor: Colors.white,
                  filled: true,
                  hintText: hint,
                  suffixIcon: icon,
                  hintStyle: Theme.of(context).textTheme.headline2,

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBorder),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  ///
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBorder),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  ///
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBorder),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  ///

                  ///error border
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: colorBorder),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  String validationTextFormField(String value) {
    if (hint == 'Email') {
      if (value.isEmpty) {
        return 'Email is Empty';
      }
    } else if (hint == 'Password') {
      if (value.isEmpty) {
        return 'Password is Empty';
      } else if (value.length + 1 <= 6) {
        return 'Password is less than 6 items';
      }
    } else if (hint == 'User Name') {
      if (value.isEmpty) {
        return 'Name is Empty';
      }
    }
    return null;
  }
}

class TextFieldSample extends StatelessWidget {
  TextFieldSample({
    @required this.onSaved,
    @required this.validator,
    @required this.keyboardType,
    @required this.obscureText,
    @required this.hint,
    @required this.colorBorder,
    this.initialValue,
  });
  final initialValue;
  final Function onSaved;
  final Function validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hint;
  final Color colorBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        keyboardType: keyboardType,
        // hint == 'Product Description\n' ? TextInputType.multiline : null,
        obscureText: obscureText,
        cursorColor: Colors.black54,
        initialValue: initialValue,
        style: Theme.of(context).textTheme.headline3,
        decoration: InputDecoration(
          // helperMaxLines: 5,
          fillColor: Colors.white,
          filled: true,
          hintText: hint,

          hintStyle: Theme.of(context).textTheme.headline2,

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorBorder),
            borderRadius: BorderRadius.circular(10),
          ),

          ///
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorBorder),
            borderRadius: BorderRadius.circular(10),
          ),

          ///
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorBorder),
            borderRadius: BorderRadius.circular(10),
          ),

          ///

          ///error border
          border: OutlineInputBorder(
            borderSide: BorderSide(color: colorBorder),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
