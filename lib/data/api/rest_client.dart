import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../dto/dto.dart';

part 'rest_client.g.dart';

@lazySingleton
@RestApi()
abstract class RestClient {
  @factoryMethod
  factory RestClient(Dio dio, {@Named('apiUrl') String? baseUrl}) = _RestClient;

  @POST('/products')
  Future<ReadProductRs> getProducts(@Body() ReadProductRq rq);

  @PATCH('/costs')
  Future<UpdateCostProductRs> updateCosts(@Body() UpdateCostProductRq rq);
}
