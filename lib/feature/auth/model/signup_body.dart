class SignUpBody {
  String? contactPersonName;
  String? contactPersonPhone;
  String? contactPersonEmail;
  String? accountFirstName;
  String? accountLastName;
  String? accountEmail;
  String? accountPhone;
  String? password;
  String? confirmedPassword;
  String? companyName;
  String? companyPhone;
  String? companyAddress;
  String? companyEmail;
  String? identityType;
  String? identityNumber;
  String? zoneId;
  String? lat;
  String? lon;
  String? chooseBusinessPlan;
  String? subscriptionPackageId;
  String? paymentMethod;
  String? freeTrialOrPayment;
  String? paymentPlatform;

  SignUpBody({
    this.contactPersonName,
    this.contactPersonPhone,
    this.contactPersonEmail,
    this.accountFirstName,
    this.accountLastName,
    this.accountEmail,
    this.accountPhone,
    this.password,
    this.confirmedPassword,
    this.companyName,
    this.companyPhone,
    this.companyAddress,
    this.companyEmail,
    this.identityType,
    this.identityNumber,
    this.zoneId,
    this.lat,
    this.lon,
    this.chooseBusinessPlan,
    this.subscriptionPackageId,
    this.paymentMethod,
    this.freeTrialOrPayment,
    this.paymentPlatform,
  });

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['contact_person_name'] = contactPersonName ?? "";
    data['contact_person_phone'] = contactPersonPhone ?? "";
    data['contact_person_email'] = contactPersonEmail ?? "";
    data['account_email'] = accountEmail ?? "";
    data['account_phone'] = accountPhone ?? "";
    data['company_name'] = companyName ?? "";
    data['company_phone'] = companyPhone ?? "";
    data['company_address'] = companyAddress ?? "";
    data['company_email'] = companyEmail ?? "";
    data['identity_type'] = identityType ?? "";
    data['identity_number'] = identityNumber ?? "";
    data['password'] = password ?? "";
    data['confirm_password'] = confirmedPassword ?? "";
    data['zone_id'] = zoneId ?? "";
    data['latitude'] = lat ?? "";
    data['longitude'] = lon ?? "" ;
    data['choose_business_plan'] = chooseBusinessPlan ?? "";
    data['selected_package_id'] = subscriptionPackageId ?? "";
    data['payment_method'] = paymentMethod ?? "";
    data['free_trial_or_payment'] = freeTrialOrPayment ?? "";
    data['payment_platform'] = paymentPlatform ?? "";

    return data;
  }
}
