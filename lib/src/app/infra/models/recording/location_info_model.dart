import 'package:security_cam/src/app/domain/entities/recording/location_info_entity.dart';

import '../../../core/utils.dart';
import 'address_model.dart';

class LocationInfoModel extends LocationInfoEntity {
  LocationInfoModel({
    String? id,
    String? name,
    AddressModel? address,
  }) : super(
          address: address,
          id: id,
          name: name,
        );

  factory LocationInfoModel.fromJson(dynamic json) {
    return LocationInfoModel(
      name: Utils.stringJson(json['name']),
      id: Utils.stringJson(json['id']),
      address: AddressModel.fromJson(
        Utils.getMapJson(json['address']),
      ),
    );
  }
}
