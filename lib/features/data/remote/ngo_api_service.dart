import 'package:dio/dio.dart';
import 'package:ngo/core/constants/constants.dart';
import 'package:ngo/features/data/model/product.dart';
import 'package:ngo/features/data/remote/responses/response.dart';
import 'package:ngo/features/data/remote/responses/verify_response.dart';
import 'package:retrofit/retrofit.dart';

part 'ngo_api_service.g.dart';

@RestApi(baseUrl: baseURL)
abstract class NGOApiService {
  factory NGOApiService(Dio dio) = _NGOApiService;

  @GET('/product')
  Future<HttpResponse<List<ProductModel>>> getProducts();

  @POST('/donor/register')
  Future<HttpResponse<GeneralResponse>> registerDonor(
      @Body() Map<String, dynamic> donorModel);

  @POST('/donor/verify')
  Future<HttpResponse<GeneralResponse>> loginDonor(
      @Body() Map<String, dynamic> donorModel);

  @POST('/product')
  @MultiPart()
  Future<HttpResponse<GeneralResponse>> donateProduct(
      @Part(name: "product_title") String productTitle,
      @Part(name: "product_category") String productCategory,
      @Part(name: "product_description_before") String productDescription,
      @Part(name: "product_defects_before") String productDefects,
      @Part(name: "product_area_of_donation") String productArea,
      @Part(name: "donor_mob_number") String donorMobileNumber,
      @Part(name: "image") List<MultipartFile>? images);

  @GET('/donor/view')
  Future<HttpResponse<VerifyResponse>> verifyDonor(
      @Header("Authorization") String token);
}
