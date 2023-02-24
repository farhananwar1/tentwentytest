// ignore_for_file: non_constant_identifier_names

class UiStringConst {
  static SignUpScreenUiString signUpScreenUiString = SignUpScreenUiString();
  static LoginScreenUiString loginScreenUiString = LoginScreenUiString();
  static ForgotPasswordScreenUiString forgotPasswordScreenUiString =
      ForgotPasswordScreenUiString();
  static CreateNewPasswordScreenUiString createNewPasswordScreenUiString =
      CreateNewPasswordScreenUiString();
}

class LoginScreenUiString {
  String LOGIN_SUGGESTION = "Login to your account";
  String EMAIL_HINT = 'Enter your email';
  String PASSWORD_HINT = 'Enter your password';
  String REMEMBER_TITLE = 'Remember Me';
  String FORGOT_PASSWORD = "Forgot Password";
}

class SignUpScreenUiString {
  // Step 3 || Email
  String WHAT_IS_YOUR_EMAIL = 'What is your email address?';
  String ENTER_EMAIL_HINT = 'Enter your email';

  // Step4 || Phone
  String WHATS_YOUR_MOBILE_NUMBER = 'What is your phone number?';
  String ENTER_PHONE_NUMBER_HINT = 'Enter your phone number';
  String ENTER_OTP_HINT = '-';
  String PHONE_NUMBER_ATTENTION = "You can't Proceed\nwithout phone number";
  String ENTER_SIX_DIGIT_VERIFICATION_CODE =
      "Enter 6 digit verification code\nsent on your email";
  String RESEND_CODE = "Resend Code";
  String VERIFY_CODE = "Next";

  // Step5 || Password
  String CREATE_PASSWORD = 'Create your password';
  String ENTER_PASSWORD_HINT = 'Enter your password';
  String ENTER_CONFIRM_PASSWORD_HINT = 'Re-enter to confirm password';
  String PASSWORD_ATTENTION =
      '(one capital, one special character, minimum 8 letters)';

  // Step6 || Arrive
  String ARRIVE_TITLE = "How did you find out about Greater Moments?";

  // Step7 || Which area
  String WHICH_AREA = "Which area do you live in?";
  String CONSENT = "I consent to marketing information to be sent";

  // Step8 || Receive Communication
  String RECEIVE_COMMUNICATION =
      'I consent to receive communications relating to this app';

  //Career Signup Form
  String CAREER_FIRST_NAME = 'First Name';
  String CAREER_LAST_NAME = 'Last Name';
  String CAREER_FULL_NAME = 'Full Name';
  String CAREER_EMAIL_ADDRESS = 'Email Address';
  String CAREER_ORGANIZATION_NAME = 'Organization Name';
  String PHONE_NUMBER = 'Phone Number';
  String PASSWORD = 'Password';
  String CONFIRM_PASSWORD = 'Confirm Password';

  String CAREER_FIRST_NAME_HINT = 'Enter your first name';
  String CAREER_LAST_NAME_HINT = 'Enter your last name';
  String CAREER_FULL_NAME_HINT = 'Enter your full name';
  String CAREER_EMAIL_ADDRESS_HINT = 'Info@gmail.com';
  String CAREER_ORGANIZATION_NAME_HINT = 'Organization Name';
  String PHONE_NUMBER_HINT = 'Phone Number';
  String PASSWORD_HINT = 'Password';
  String CONFIRM_PASSWORD_HINT = 'Confirm Password';

  // Terms and Conditions
  String TERMS_AND_CONDITIONS =
      'https://socialsensemanchester.sharepoint.com/sites/SocialSenseLTD/_layouts/15/guestaccess.aspx?docid=0f0e6f0e3c72e4b6b8e7c2dab03d3ff5c&authkey=ASI-SU025qPsN3HrS2W2oiQ&e=zapYf2';
}

class ForgotPasswordScreenUiString {
  String FORGOT_PASSWORD_SUGGESTION = 'Enter Your Email';
  String EMAIL_HINT = 'Enter email';
}

class CreateNewPasswordScreenUiString {
  String ENTER_NEW_PASSWORD_SUGGESTION = 'Enter password';
  String RE_ENTER_PASSWORD_SUGGESTION = 'Re-enter password';
}
