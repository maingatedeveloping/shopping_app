import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

//            TextField----------
Widget reuseableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller, bool displaySuffixIcon, isVisible) {
  return SizedBox(
    width: 350,
    child: TextFormField(
      keyboardType: isPasswordType
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      controller: controller,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: !isPasswordType,
      cursorColor: Colors.blue,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        suffixIcon: displaySuffixIcon
            ? IconButton(
                onPressed: isVisible,
                icon: Icon(
                  isPasswordType ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey[700],
                ),
              )
            : const SizedBox(
                height: 0,
              ),
        prefixIcon: Icon(
          icon,
          color: Colors.grey[700],
        ),
        label: Text(text),
        labelStyle: TextStyle(color: Colors.grey[700]),
        //filled: false,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        //fillColor: Colors.blue,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 7, 78, 149)),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: text == 'Email'
          ? (email) {
              if (email != null && !EmailValidator.validate(email)) {
                return 'Enter a valid email';
              } else {
                return null;
              }
            }
          : text == 'Password'
              ? (value) {
                  if (value != null && value.length < 6) {
                    return 'Enter min. 6 characters';
                  } else {
                    return null;
                  }
                }
              : null,
    ),
  );
}

//       Button-------
Container signInSignUpButton(
  BuildContext context,
  bool isLogin,
  onTap,
) {
  return Container(
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return const Color.fromARGB(66, 239, 235, 238);
          } else {
            return Colors.blue;
          }
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
