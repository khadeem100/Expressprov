// import 'package:get/get.dart';
// import 'package:demandium_provider/utils/core_export.dart';
//
// class AccountInfo extends StatefulWidget {
//   const AccountInfo({super.key});
//
//   @override
//   State<AccountInfo> createState() => _AccountInfoState();
// }
//
// class _AccountInfoState extends State<AccountInfo> {
//   final FocusNode _passwordFocus = FocusNode();
//   final FocusNode _confirmPasswordFocus = FocusNode();
//   final GlobalKey<FormState> accountInfo = GlobalKey<FormState>();
//   final TextEditingController emailAddressController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//
//
//   @override
//   void initState() {
//     super.initState();
//     emailAddressController.text = Get.find<UserProfileController>().providerModel!.content!.providerInfo!.owner!.email??"";
//     phoneNumberController.text = Get.find<UserProfileController>().providerModel!.content!.providerInfo!.owner!.phone??"";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: SingleChildScrollView(
//             child: GetBuilder<UserProfileController>(builder: (userProfileController){
//               return Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Form(
//                   key: accountInfo,
//                   child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       //TextFieldTitle(title: "email".tr, requiredMark: true, isPadding: false,),
//                       CustomTextField(
//                         title: "email".tr,
//                         isEnabled: false,
//                         controller: emailAddressController,
//
//                       ),
//                       const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge),
//
//                      // NonEditableTextField(text: userProfileController.providerModel!.content!.providerInfo!.owner!.email??"",),
//
//
//                       CustomTextField(
//                         title: "phone_number".tr,
//                         isEnabled: false,
//                         controller: phoneNumberController,
//
//                       ),
//                       const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge),
//
//                       //TextFieldTitle(title: "phone_number".tr, requiredMark: true, isPadding: false,),
//
//                       //NonEditableTextField(text: userProfileController.providerModel!.content!.providerInfo!.owner!.phone??"",),
//
//
//                        CustomTextField(
//                          title: "password".tr,
//                          isShowSuffixIcon: true,
//                          controller: userProfileController.passwordController,
//                          hintText: "******",
//                          isPassword: true,
//                          focusNode: _passwordFocus,
//                          nextFocus: _confirmPasswordFocus,
//                          onValidate: (value){
//                            return FormValidationHelper().isValidPassword(value);
//                          },
//                        ),
//
//                       const SizedBox(height: Dimensions.paddingSizeExtraMoreLarge),
//
//                       CustomTextField(
//                         title: "confirm_password".tr,
//                         isShowSuffixIcon: true,
//                         controller: userProfileController.confirmPasswordController,
//                         hintText: "******",
//                         isPassword: true,
//                         focusNode: _confirmPasswordFocus,
//                         inputAction: TextInputAction.done,
//                         onValidate: (value){
//                           return (value ==null || value.isEmpty) ? "field_cannot_be_empty".tr :
//                           value != userProfileController.passwordController?.text ?
//                           "confirm_password_does_not_matched".tr : null;
//                         },
//                       ),
//
//
//                     ],
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ),
//
//         GetBuilder<UserProfileController>(builder: (userProfileController){
//             return Column(children: [
//               const SizedBox(height: 20),
//               userProfileController.isLoading ?
//               Center(child: CircularProgressIndicator(color: Theme.of(context).hoverColor)) :
//               CustomButton(
//                 btnTxt: "save".tr,
//                 onPressed: (){
//
//                   if(accountInfo.currentState!.validate()){
//                     userProfileController.updateProfileWithPassword().then((status){
//                       if(status.isSuccess!){
//                         showCustomSnackBar("password_updated_successfully".tr, type: ToasterMessageType.success);
//                       } else{
//                         showCustomSnackBar(status.message);
//                       }
//                     });
//                   }
//
//                 },
//               ),
//             ]);
//           }
//         ),
//       ],
//     );
//   }
// }
