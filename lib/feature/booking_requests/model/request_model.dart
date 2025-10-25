import 'package:demandium_provider/feature/booking_details/model/bookings_details_model.dart';
import 'package:demandium_provider/feature/custom_post/model/post_model.dart';

class BookingRequestModel {
  String? id;
  String? readableId;
  String? zoneId;
  String? bookingStatus;
  String? serviceSchedule;
  int? isPaid;
  String? paymentMethod;
  double? totalBookingAmount;
  double? totalTaxAmount;
  double? totalDiscountAmount;
  String? createdAt;
  String? updatedAt;
  String? subCategoryId;
  double? totalCampaignDiscountAmount;
  double? totalCouponDiscountAmount;
  int? isGuest;
  int? isRepeatBooking;
  List<RepeatBooking>? repeatBookingList;
  SubCategory? subCategory;
  String ? serviceLocation;


  BookingRequestModel({
    this.id,
    this.readableId,
    this.zoneId,
    this.bookingStatus,
    this.isPaid,
    this.paymentMethod,
    this.totalBookingAmount,
    this.totalTaxAmount,
    this.totalDiscountAmount,
    this.createdAt,
    this.updatedAt,
    this.subCategoryId,
    this.totalCampaignDiscountAmount,
    this.totalCouponDiscountAmount,
    this.isGuest,
    this.isRepeatBooking,
    this.repeatBookingList,
    this.subCategory,
    this.serviceSchedule,
    this.serviceLocation
  });

  BookingRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    readableId = json['readable_id'].toString();
    zoneId = json['zone_id'];
    bookingStatus = json['booking_status'];
    isPaid = json['is_paid'];
    paymentMethod = json['payment_method'];
    totalBookingAmount = double.tryParse(json['total_booking_amount'].toString());
    totalTaxAmount = double.tryParse(json['total_tax_amount'].toString());
    totalDiscountAmount = double.tryParse(json['total_discount_amount'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subCategoryId = json['sub_category_id'];
    totalCampaignDiscountAmount = double.tryParse(json['total_campaign_discount_amount'].toString());
    totalCouponDiscountAmount = double.tryParse(json['total_coupon_discount_amount'].toString());
    isGuest = int.tryParse(json['is_guest'].toString());
    isRepeatBooking = int.tryParse(json['is_repeated'].toString());
    serviceSchedule = json['service_schedule'];
    if (json['repeats'] != null) {
      repeatBookingList = <RepeatBooking>[];
      json['repeats'].forEach((v) {
        repeatBookingList!.add(RepeatBooking.fromJson(v));
      });
    }
    subCategory = json['sub_category'] != null
        ? SubCategory.fromJson(json['sub_category'])
        : null;
    serviceLocation = json['service_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['readable_id'] = readableId;
    data['zone_id'] = zoneId;
    data['booking_status'] = bookingStatus;
    data['is_paid'] = isPaid;
    data['payment_method'] = paymentMethod;
    data['total_booking_amount'] = totalBookingAmount;
    data['total_tax_amount'] = totalTaxAmount;
    data['total_discount_amount'] = totalDiscountAmount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['sub_category_id'] = subCategoryId;
    data['total_campaign_discount_amount'] = totalCampaignDiscountAmount;
    data['total_coupon_discount_amount'] = totalCouponDiscountAmount;
    data['is_guest'] = isGuest;
    data['is_repeated'] = isRepeatBooking;
    if (repeatBookingList != null) {
      data['repeats'] = repeatBookingList!.map((v) => v.toJson()).toList();
    }
    if (subCategory != null) {
      data['sub_category'] = subCategory!.toJson();
    }
    data['service_location'] = serviceLocation;

    return data;
  }
}




