import 'package:cursed_work/repositories/credentials_repository.dart';
import 'package:cursed_work/utils/models/recommendation_model.dart';
import 'package:get/get.dart';
import 'package:mutex/mutex.dart';
import 'package:rxdart/rxdart.dart';

class FeedController extends GetxController {
  final loaded = true.obs;
  final CredentialsRepository credentialsRepository = Get.find();

  Future<void> load() async {
    loaded.value = false;
    print('load');
    loaded.value = true;
  }

  final recommendations = <RecommendationModel>[].obs;
  final loading = false.obs;
  final scrolledToBottom = false.obs;
  final _listUpdated = PublishSubject<int>();
  final mutex = Mutex();
  final stab = RecommendationModel(
    id: 'id',
    title: 'Риск развития тахикардии',
    mainText: 'Этот тип тахикардии вызывается нарушением генерации импульсов'
        ' синусовым узлом, контролирующим сердечный ритм, или нарушением '
        'проведения импульсов от синусового узла к желудочкам. Аритмии'
        ' выявляются по электрокардиограмме, которая может быть записана'
        ' как с поверхности тела больного, так и непосредственно от '
        'отдельных участков сердца.\n\nТахикардия может быть вызвана'
        ' внешними причинами, перечисленными в '
        'предыдущих разделах, или иметь внутреннюю природу, связанную с '
        'неправильной функцией самого синусового узла. Такую тахикардию '
        'называют синусовой, подчёркивая то, что ритм возникает'
        ' в результате нормальной или ненормальной работы синусового узла.',
    date: 'Сегодня в 15:09',
  );

  Future<List<RecommendationModel>> getListForFetch(String? offsetID) async {
    //To Do: include backend requests
    if (recommendations.length < 10) {
      return [
        stab,
        stab,
        stab,
      ];
    }

    return [];
  }

  Stream<int> get listUpdated => _listUpdated.stream;

  Future<void> fetch() async {
    await mutex.protect(() async {
      loading.value = true;
      final offset =
          recommendations.isNotEmpty ? recommendations.last.id : null;
      final pr = await getListForFetch(offset);
      await _updateLocal(pr);
    });
  }

  Future<void> _updateLocal(List<RecommendationModel> pr) async {
    scrolledToBottom.value = pr.isEmpty;
    recommendations.addAll(pr);
    _listUpdated.add(recommendations.length);
    loading.value = false;
  }

  Future<void> reload() async {
    loading.value = true;
    final fetch = await getListForFetch(null);
    recommendations.clear();
    await _updateLocal(fetch);
  }
}
