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
  final stabs = <RecommendationModel>[
    RecommendationModel(
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
      media: [
        'https://gipertonium.com/wp-content/uploads/d/e/1/de1b6cbe597bb5c30652e0b7e49671d0.jpg'
      ],
    ),
    RecommendationModel(
        date: 'Вчера в 17:30',
        mainText:
            'Дефицит воды в организме способен повышать риск развития артритов'
            ' и артрозов, так как хрящевая ткань суставов становится излишне плотной,'
            ' теряя упругость, а количество синовиальной жидкости, «смазывающей» '
            'суставы, снижается.'
            ' Дефицит воды приводит к повышенной вязкости основных жидкостей организма, в'
            ' первую очередь крови. А это ― повышенный риск инсультов, инфарктов, '
            'тромбозов, варикозной болезни вен и геморроя ― со'
            'стояний, часть которых опасны не только для здоровья, но иногда и для '
            'жизни человека.'
            'Нехватка воды пагубно сказывает'
            'ся на пищеварении. Замедляются процессы выработки пищеварительных'
            ' ферментов, желудочно-кишечный тракт работает'
            '«вполсилы», пища надолго задерживается в кишечнике, начинаются процессы'
            ' брожения, а затем и воспалительные процес'
            'сы. Часто недостаток воды в организме становится причиной хронически'
            'х запоров.',
        id: 'id2',
        title: 'Вам стоит пить больше воды',
        media: [
          'https://4tololo.ru/sites/default/files/images/20160607124128.jpg'
        ]),
    RecommendationModel(
      date: 'Вчера в 14:30',
      mainText:
          'Проблемы со сном, стрессы и возникающее на их фоне эмоциональное '
          'истощение часто испытывают жители мегаполиса. По статистике, не менее'
          ' 80 процентов жителей крупных городов в возрасте от 25 лет уже при'
          ' пробуждении испытывают чувство усталости и мышечную слабость.'
          ' Если быстро уснуть и выспаться ночью не получается, утром человек '
          'просыпается уставшим, а к вечеру у него ни на что не хватает сил.'
          ' Это свидетельствует о развитии синдрома хронической усталости,'
          ' который, как правило, становится лишь «надводной частью айсберга».'
          '«Проблемы со сном могут быть спровоцированы банальными бытовыми'
          ' условиями, ― комментирует Ольга Шуппо. ― К ним приводит спертый'
          ' воздух в непроветриваемом помещении, шум и яркий свет.'
          ' Но говорить о диагнозе «бессонница» можно только в том случае, '
          'когда проблемы со сном пациент испытывает минимум три раза в неделю».'
          'Бессонные ночи не должны оставаться без внимания, так как это'
          ' тревожный сигнал со стороны организма. Хронический «недосып» '
          'нарушает работу нервной системы, снижает социальную активность,'
          ' умственную и физическую производительность. Если проблема сохраняется'
          ' в течение длительного времени, это может привести к опасным'
          ' последствиям для организма: нарушению иммунной защиты и развитию '
          'хронических заболеваний.',
      id: 'id2',
      title: 'Вам стоит больше спать',
    ),
  ];

  Future<List<RecommendationModel>> getListForFetch(String? offsetID) async {
    //To Do: include backend requests
    if (recommendations.length < 10) {
      return stabs;
    }
    return [];
  }

  Stream<int> get listUpdated => _listUpdated.stream;

  Future<void> fetch() async {
    await mutex.protect(() async {
      await Future.delayed(const Duration(seconds: 1), () async {
        loading.value = true;
        final offset =
            recommendations.isNotEmpty ? recommendations.last.id : null;
        final pr = await getListForFetch(offset);
        await _updateLocal(pr);
      });
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
