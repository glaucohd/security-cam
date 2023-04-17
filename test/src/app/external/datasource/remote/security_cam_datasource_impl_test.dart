import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:security_cam/src/app/external/datasource/remote/security_cam_datasource_impl.dart';
import 'package:security_cam/src/app/infra/models/recording/recording_model.dart';
import 'package:security_cam/src/app/services/http_service.dart';

import 'security_cam_datasource_impl_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  final service = MockHttpService();
  final datasource = SecurityCamDatasourceImpl(service: service);

  test(
    'deve verificar se a conexao foi bem sucedida',
    () async {
      const int limit = 10;
      const url = 'http://localhost:3001/v1/videos/history?limit=$limit';

      when(service.call<RecordingModel>(
        url: url,
        type: RestType.get,
        fromJson: anyNamed('fromJson'),
      )).thenAnswer((_) async {
        final response = Response(body, 202);
        final recordingModel =
            RecordingModel.fromJson(json.decode(response.body));
        return recordingModel;
      });

      final future = datasource.getSecurityRecordings(limit: limit);
      expect(future, completes);
    },
  );
}

const body = '''{
  "data": [
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "0#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Maiores sunt neque voluptates blanditiis tempore facere architecto placeat.",
        "description": "Quaerat aliquam fugit distinctio ut ipsa."
      },
      "locationInfo": {
        "id": "1c6e05d2-2daa-419f-b37c-58414fcc2c52",
        "name": "Condomínio edifício Marks",
        "address": {
          "city": "Sayreville",
          "state": "NE",
          "address": "313 Isabella Islands",
          "latitude": "-72.6741",
          "longitude": "-107.1544"
        }
      }
    },
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "1#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Doloribus animi ratione dignissimos dolorem molestias dolore.",
        "description": "Distinctio magnam laudantium doloribus."
      },
      "locationInfo": {
        "id": "b62a4447-9af5-4611-a3f8-4c304bd3e40f",
        "name": "Condomínio edifício Goldner",
        "address": {
          "city": "East Marcel",
          "state": "UT",
          "address": "08724 Feest Knoll",
          "latitude": "30.7271",
          "longitude": "-143.9707"
        }
      }
    },
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "2#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Ratione quia quaerat doloribus fugiat placeat perferendis.",
        "description": "Architecto nesciunt ducimus dolore nemo culpa eum."
      },
      "locationInfo": {
        "id": "8e9f4514-7b62-45fb-ba0c-66665ef8365a",
        "name": "Condomínio edifício Runte",
        "address": {
          "city": "Peytonburgh",
          "state": "WI",
          "address": "80009 Evert Summit",
          "latitude": "-86.8417",
          "longitude": "-34.5733"
        }
      }
    },
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "3#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Rerum molestiae totam suscipit perferendis vel.",
        "description": "Nobis tenetur animi officia."
      },
      "locationInfo": {
        "id": "e530cf25-5ef9-4a27-becf-7940765bf877",
        "name": "Condomínio edifício Keebler",
        "address": {
          "city": "Fort Noelia",
          "state": "PA",
          "address": "0683 Mireille Inlet",
          "latitude": "-63.4736",
          "longitude": "-164.6701"
        }
      }
    },
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "4#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Soluta officiis cumque sequi tempora aut eum a dolore repudiandae.",
        "description": "Non perferendis maiores libero sint consectetur eaque."
      },
      "locationInfo": {
        "id": "9482c564-4c27-4454-961a-95f08cc6f038",
        "name": "Condomínio edifício Romaguera",
        "address": {
          "city": "Emmerichhaven",
          "state": "IA",
          "address": "2432 Wunsch Shore",
          "latitude": "51.2734",
          "longitude": "110.2774"
        }
      }
    },
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "5#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Odio architecto reiciendis fugit praesentium autem corporis voluptate.",
        "description": "Unde ut possimus error delectus vitae."
      },
      "locationInfo": {
        "id": "51027d0c-425d-491d-8cc7-0fcc9d5090c0",
        "name": "Condomínio edifício Graham",
        "address": {
          "city": "Port Woodrowberg",
          "state": "TX",
          "address": "1538 Bosco Rapid",
          "latitude": "-31.8084",
          "longitude": "149.3185"
        }
      }
    },
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "6#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Dolorum necessitatibus odio harum non corrupti architecto.",
        "description": "Est tempora architecto voluptatibus."
      },
      "locationInfo": {
        "id": "fe92def0-d043-4f2c-8d96-fa14cc95e9de",
        "name": "Condomínio edifício Walsh",
        "address": {
          "city": "Grand Rapids",
          "state": "WV",
          "address": "93144 Rita Crossing",
          "latitude": "13.6948",
          "longitude": "176.5862"
        }
      }
    },
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "7#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Eligendi consequatur quos hic tenetur distinctio.",
        "description": "Laborum enim voluptatum sunt."
      },
      "locationInfo": {
        "id": "9cb28f53-232b-4e35-ba1c-a804a7dd3d03",
        "name": "Condomínio edifício Herman",
        "address": {
          "city": "Alejandraton",
          "state": "VT",
          "address": "713 Bernhard Lights",
          "latitude": "49.4235",
          "longitude": "-56.5085"
        }
      }
    },
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "8#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Necessitatibus reprehenderit esse reiciendis possimus laborum aperiam eveniet aperiam.",
        "description": "Corporis eaque minima ullam ad ut at eveniet."
      },
      "locationInfo": {
        "id": "0838d97c-598d-4cab-9f81-ead6f3e7a026",
        "name": "Condomínio edifício Windler",
        "address": {
          "city": "Legrosland",
          "state": "AK",
          "address": "839 Damion Spring",
          "latitude": "17.6412",
          "longitude": "-27.8529"
        }
      }
    },
    {
      "uri": "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
      "fileName": "9#11-04-2023#03-00-08#11-04-2023#03-05-00.ts",
      "videoInfo": {
        "title": "Gabriel`s video history @index",
        "subtitle": "Officia perferendis eveniet numquam quibusdam in veniam maiores autem.",
        "description": "Atque officiis totam quisquam."
      },
      "locationInfo": {
        "id": "6e0d9b7f-3188-47d1-801e-62ddd82bc29c",
        "name": "Condomínio edifício Senger",
        "address": {
          "city": "South Reinholdside",
          "state": "IL",
          "address": "6076 Kuhn Court",
          "latitude": "-86.8923",
          "longitude": "49.5505"
        }
      }
    }
  ],
  "status": {
    "message": null,
    "code": 200
  }
} ''';
