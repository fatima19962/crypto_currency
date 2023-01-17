import 'package:crypto_currency/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});
 
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController age = TextEditingController();
  Future<void> saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  void saveUserDetails() async {
    // print(name.text);
    // print(email.text);
    await saveData("name", name.text);
    await saveData("email", email.text);
    await saveData("age", age.text);
    // print("Data Saved");
  }

  bool isDarkModeEnabled = AppTheme.isDarkModeEnabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled ? Colors.black : Colors.white,
      appBar: AppBar(
       
        title: const Text("Profile Update"),
      ),
      body: Column(children: [
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: TextField(
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(),
        //       hintText: "Name",
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: TextField(
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(),
        //       hintText: "Email",
        //     ),
        //   ),
        // ),
        customTextField("Name", name, false),
        customTextField("Email", email, false),
        customTextField("Age", age, true),
        ElevatedButton(
          onPressed: () {
            saveUserDetails();
          },
          child: const Text("Save Details"),
        ),
      ]),
    );
  }

  Widget customTextField(
      String title, TextEditingController controller, bool isAgeTextField) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        style: TextStyle(color: isDarkModeEnabled ? Colors.white : Colors.grey,),
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: isDarkModeEnabled ? Colors.white : Colors.grey,
          )),
          hintText: title,
          hintStyle: TextStyle(
            color: isDarkModeEnabled ? Colors.white : null,
          ),
        ),
        keyboardType: isAgeTextField ? TextInputType.number : null,
      ),
    );
  }
}
