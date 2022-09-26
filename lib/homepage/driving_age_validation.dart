import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String ageValid = "";
  checkApplicantAge() {
    if (int.parse(ageController.text) >= 18) {
      setState(() {
        ageValid = "You are Eligible for Driving License";
      });
    } else {
      setState(() {
        ageValid = "You are not  Eligible for Driving License";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              controller: ageController,
              validator: (value) => AgeValidator.validate(value.toString()),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                prefix: SizedBox(
                  width: 5,
                ),
                labelText: "Applicant Age",
                hintText: "Enter your Age",
                suffixIcon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            height: 46,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                primary: Colors.white,
                backgroundColor: const Color(0xFF4167b2),
              ),
              onPressed: () {
                final isvalid = _formKey.currentState!.validate();
                if (isvalid) {
                  checkApplicantAge();
                }
              },
              child: const Text(
                "Check",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            ageValid,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    ));
  }
}

//Test

class AgeValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Age is required' : null;
  }
}

class Applicantage {
  static String checkApplicantAge(applicantAge) {
    if (applicantAge >= 18) {
      return "You are Eligible for Driving License";
    } else {
      return "You are not  Eligible for Driving License";
    }
  }
}
