import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_testing/homepage/driving_age_validation.dart';

void main() {
  TextEditingController ageController = TextEditingController();
  test("Empty agecontroller return empty string", () {
    var result = AgeValidator.validate("");
    expect(result, 'Age is required');
  });
  test("Non Empty agecontroller return empty string", () {
    var result = AgeValidator.validate("Age");
    expect(result, null);
  });
  test("Age Controller have value", () {
    ageController.text = "input value";
    var result = ageController.text;
    expect(result, 'input value');
  });
  test("If User ageController value is 18 or greater than", () {
    var result = Applicantage.checkApplicantAge(20);
    expect(result, 'You are Eligible for Driving License');
  });
  test("If User ageController value is less than 18 ", () {
    var result = Applicantage.checkApplicantAge(16);
    expect(result, "You are not  Eligible for Driving License");
  });
}
  
//Setup
//run
//verify