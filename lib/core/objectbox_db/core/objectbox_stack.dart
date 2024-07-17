import 'package:path/path.dart' as p;
import 'package:cyber_safe/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectboxStack {
  static final ObjectboxStack instance = ObjectboxStack._internal();

  ObjectboxStack._internal();
  late final Store _store;

  ObjectboxStack._create(this._store);

  Future<ObjectboxStack> create() async {
    _store = await openStore(
        directory: p.join(
            (await getApplicationDocumentsDirectory()).path, "cyber_safe"),
        macosApplicationGroup: "group.duc_app_lab_ind.cyber_safe");
    return ObjectboxStack._create(_store);
  }

  Store get store => _store;
}
