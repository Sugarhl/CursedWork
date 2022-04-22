import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cursed_work/utils/assets.dart';
import 'package:cursed_work/utils/enums.dart';
import 'package:cursed_work/utils/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

String metricsTypeToAsset(MetricsType type) {
  switch (type) {
    case MetricsType.bpm:
      return Assets.bpm;
    case MetricsType.steps:
      return Assets.steps;
  }
}

String metricToLabel(MetricsType type, int value) {
  switch (type) {
    case MetricsType.bpm:
      return '$value bpm';
    case MetricsType.steps:
      return '${(value.toDouble() / 1000).toStringAsFixed(1)}k steps';
  }
}

String errorToMessage(AppError error) {
  switch (error) {
    case AppError.serverError:
      return 'Ошибка сервера';
    case AppError.internalError:
      return 'Что-то пошло не так...';
    case AppError.none:
      return '';
    case AppError.googleError:
      return 'Ошибка Google';
  }
}

void pagingInit<T>({
  required CompositeSubscription sub,
  required PagingController<int, T> controller,
  required List<T> list,
  required RxBool mainScrolledToBottom,
  required Stream<int> listUpd,
  required Future<void> Function(int) fetch,
}) {
  controller.addPageRequestListener(fetch);
  sub.add(
    listUpd.listen((value) {
      _updateController(controller, list, mainScrolledToBottom.value, value);
    }),
  );
  _updateController<T>(controller, list, mainScrolledToBottom.value, 0);
  controller.refresh();
}

void _updateController<T>(
  PagingController<int, T> controller,
  List<T> feed,
  scrolledToBottom,
  key,
) {
  controller.value = PagingState(
    nextPageKey: scrolledToBottom ? null : feed.length,
    itemList: feed,
  );
}

Future<void> showAlertDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ), //this right here
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.dark,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Нет доступа в сеть...',
                style: AppTextStyles.heading2(),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<bool> checkInetConnection(BuildContext context) async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    await showAlertDialog(context);
    return false;
  }
  return true;
}
