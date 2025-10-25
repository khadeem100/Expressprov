import 'package:demandium_provider/utils/core_export.dart';
import 'package:get/get.dart';

class AdvertisementRepo {
  final ApiClient apiClient;
  AdvertisementRepo({required this.apiClient});


  Future<Response> submitNewAdvertisement(Map<String, String> body, List<MultipartBody> selectedFile) async {
    return await apiClient.postMultipartData(
        AppConstants.submitNewAdvertisement,
        body,
        selectedFile , null,
    );
  }


  Future<Response> editAdvertisement ({required String id, required Map<String, String> body, List<MultipartBody>? selectedFile}) async {
    return await apiClient.postMultipartData(
      "${AppConstants.editAdvertisement}/$id",
      body,
      selectedFile , null,
    );
  }


  
  Future<Response> getAdvertisementList ({required String requestType, required int offset}) async {
    return await apiClient.getData(
        "${AppConstants.getAdvertisementList}?limit=10&offset=$offset&status=$requestType");
  }
  
  

  Future<Response> getAdvertisementDetails ({required String id}) async {
    return await apiClient.getData("${AppConstants.getAdvertisementDetails}/$id");
  }


  Future<Response> deleteAdvertisement ({required String id}) async {
    return await apiClient.deleteData("${AppConstants.deleteAdvertisement}/$id");
  }


  Future<Response> changeAdvertisementStatus ({required String id, required String status, required Map<String, String> body }) async {
    return await apiClient.putData(
      '${AppConstants.changeAdvertisementStatus}/$id/$status', body
    );
  }


  Future<Response> reSubmitAdvertisement (String id,
      {required Map<String, String> body, required List<MultipartBody> selectedFile}) async {
    return await apiClient.postMultipartData(
      "${AppConstants.reSubmitAdvertisement}/$id",
      body,
      selectedFile , null,
    );
  }


  
}