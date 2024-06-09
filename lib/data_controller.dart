import 'package:get/get.dart';
import 'package:get_pay/services/data_services.dart';

class DataController extends GetxController {
  var list = [].obs;
  final service = DataServices();

  get newList => list.where((e) => e["status"]).map((e) => e).toList();

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  _loadData() async {
    var info = await service.getUsers();
    list.addAll(info);
  }
}
