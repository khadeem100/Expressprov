import 'package:demandium_provider/helper/extension_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:demandium_provider/utils/core_export.dart';


class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {


    List<Widget> settingsItems = [

      Container(
        decoration: BoxDecoration(
            color: Get.isDarkMode?Colors.grey.withValues(alpha:0.2): Theme.of(context).cardColor,
            boxShadow: context.customThemeColors.shadow,
            borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall))
        ),
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetBuilder<AuthController>(builder: (authController){
                return CupertinoSwitch(
                  activeTrackColor: Theme.of(context).primaryColor,
                    value: authController.isNotificationActive(), onChanged: (value){
                  authController.toggleNotificationSound();
                });
              }),
              const SizedBox(height: Dimensions.paddingSizeDefault,),
              Text(
                'notification_sound'.tr,
                style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),
                textAlign: TextAlign.center,

              ),
            ],
          ),
        ),),
      InkWell(
        onTap: (){
          Get.back();
          showCustomBottomSheet(child: const ChooseLanguageBottomSheet());
        },
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Get.isDarkMode?Colors.grey.withValues(alpha:0.2): Theme.of(context).cardColor,
                  boxShadow: context.customThemeColors.shadow,
                  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.radiusSmall))
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(Images.translate,width: 40,height: 40,),
                    const SizedBox(height: Dimensions.paddingSizeDefault,),
                    Text('language'.tr,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge),),
                  ],
                ),
              ),),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Image.asset(Images.editPen,
                width: 20,
                height:20,
              ),
            ),
          ],
        ),
      ),
    ];

    return Container(
      width: Dimensions.webMaxWidth,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        color: Get.isDarkMode?Theme.of(context).cardColor:Theme.of(context).colorScheme.surface,
      ),
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.keyboard_arrow_down_rounded, size: 30),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height:Dimensions.paddingSizeExtraLarge*2),



              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: ResponsiveHelper.isDesktop(context) ? 4 : ResponsiveHelper.isTab(context) ? 4 : 2,
                    childAspectRatio: (1/1),
                    crossAxisSpacing: 10
                ),
                itemCount: settingsItems.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return settingsItems.elementAt(index);
                },
              ),

              const SizedBox(height: Dimensions.paddingSizeExtraLarge*3),
            ],
          ),

          SizedBox(height: ResponsiveHelper.isMobile(context) ? Dimensions.paddingSizeSmall : 0),
        ]),
      ),
    );
  }
}
