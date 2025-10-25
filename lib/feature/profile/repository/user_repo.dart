import 'dart:convert';

import 'package:get/get.dart';
import 'package:demandium_provider/utils/core_export.dart';


class UserRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  UserRepo(this.sharedPreferences, {required this.apiClient});

  Future<Response> getProviderInfo() async {
    return await apiClient.getData(AppConstants.providerProfileUri);
  }

  Future<Response?> getZonesDataList() async {
    return await apiClient.getData('${AppConstants.zoneUrl}?limit=200&offset=1');
  }

  Future<Response> updateProfile({
    required String companyName,
    required String companyPhone,
    required String companyAddress,
    required double lat,
    required double lon,
    required String companyEmail,
    required String contactPersonName,
    required String contactPersonPhone,
    required String contactPersonEmail,
    required String zoneId,
    XFile? profileImage,
    XFile? coverImages,
    List<XFile>? identityImages,
    List<String>? deletedIdentityImages,
    String? identityType,
    String? identityNumber,
  }) async {
    List<MultipartBody> multipartImagesImages = [];

    for(final XFile images in identityImages ?? []) {
      multipartImagesImages.add(MultipartBody('uploaded_identity_images[]', images));
    }
    if(coverImages != null) {
      multipartImagesImages.add(MultipartBody('cover_image', coverImages));
    }


    final Map<String, String> data = {
      "company_name":companyName,
      "company_phone":contactPersonPhone,
      "company_address":companyAddress,
      "company_email":companyEmail,
      "contact_person_name":contactPersonName,
      "contact_person_phone":contactPersonPhone,
      "contact_person_email":contactPersonEmail,
      "zone_ids[]":zoneId,
      "latitude": "$lat",
      "longitude": "$lon",
      if(deletedIdentityImages?.isNotEmpty ?? false) "deleted_identity_images": jsonEncode(deletedIdentityImages),
      if(identityType != null) "identity_type": identityType,
      if(identityNumber != null) "identity_number": "provider",
      "_method": "put",
    };

    debugPrint('---------(update_profile)------$data');

    return await apiClient.postMultipartData(AppConstants.providerProfileUpdateUrl, data, multipartImagesImages, profileImage != null ? MultipartBody('logo', profileImage) : null);
  }

  Future<Response> updatePasswordApi({required String password, required String confirmPassword}) async {
    return await apiClient.postData(AppConstants.updatePasswordUrl, {
      "password": password,
      "confirm_password": confirmPassword,
      "_method": "put"
    });
  }


  Future<Response> getBookingRequestData(String requestType, int offset) async {
    return await apiClient.postData(AppConstants.bookingListUrl,
        {"limit" : Get.find<SplashController>().configModel.content?.paginationLimit, "offset" : offset, "booking_status" : requestType});
  }
}