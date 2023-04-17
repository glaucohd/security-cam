import 'package:security_cam/src/app/domain/entities/recording/address_entity.dart';

import '../../../core/utils.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    String? city,
    String? state,
    String? address,
    String? latitude,
    String? longitude,
  }) : super(
          address: address,
          city: city,
          latitude: latitude,
          longitude: longitude,
          state: state,
        );

  factory AddressModel.fromJson(dynamic json) {
    return AddressModel(
      address: Utils.stringJson(json['address']),
      city: Utils.stringJson(json['city']),
      latitude: Utils.stringJson(json['latitude']),
      longitude: Utils.stringJson(json['longitude']),
      state: Utils.stringJson(json['state']),
    );
  }
}
