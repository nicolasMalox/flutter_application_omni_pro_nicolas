import 'package:flutter_application_omni_pro_nicolas/service/album_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Testing the api info', () async {
    bool done = false;
    AlbumService objectService = AlbumService();
    var fetch = (await objectService.getListalbums());

    if (fetch.isNotEmpty) {
      done = true;
    }
    expect(done, true);
  });
}
