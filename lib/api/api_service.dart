import 'package:chopper/chopper.dart';
import 'package:tapiwa_app/models/LoginResponseModel.dart';


part 'api_service.chopper.dart';

@ChopperApi(baseUrl: 'auth/token')
abstract class LoginService extends ChopperService{

   @Post(headers: {'accept': 'application/json'})
   Future<Response<LoginResponseModel>> loginUser(
     @Field() String username,
     @Field() String password,
     @Field() String grant_type,
     @Header("Authorization") String auth
   );



 static LoginService create(){

   final client = ChopperClient(
      // The first part of the URL is now here
      baseUrl: 'http://192.168.100.18:5000/',
      services: [
        // The generated implementation
        _$LoginService(),
      ],
      // Converts data to & from JSON and adds the application/json header.
      converter: JsonConverter(),
    );

    // The generated class with the ChopperClient passed in
    return _$LoginService(client);
  }
   
 }


