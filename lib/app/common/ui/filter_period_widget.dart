import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yss_app/app/common/enums/period.enum.dart';
import 'package:yss_app/app/common/themes/default_theme.dart';

class FilterPeriodController extends GetxController {
  var period = Period.day.obs;
  void changePeriod(String value) {}
}

class FilterPeriodWidget extends GetView<FilterPeriodController> {
  Function(Period)? onChange;
  FilterPeriodWidget({
    super.key,
    required this.onChange,
  });
  @override
  get controller => Get.put(FilterPeriodController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showFilter();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: DefaultTheme.base100Color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: DefaultTheme.primaryColor,
          ),
        ),
        child: Obx(() {
          return Text(
            controller.period.value.title,
            style: Get.textTheme.bodyMedium,
          );
        }),
      ),
    );
  }

  void showFilter() {
    Get.bottomSheet(
      Container(
        height: 250,
        width: Get.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: DefaultTheme.base100Color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              'Filter Periode',
              style: Get.textTheme.labelLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  ...Period.values.map(
                    (period) => Obx(() {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: controller.period.value == period
                              ? DefaultTheme.primaryColor
                              : DefaultTheme.base100Color,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.period.value = period;
                            onChange!(period);
                            Get.back();
                          },
                          child: Text(period.title,
                              textAlign: TextAlign.center,
                              style: Get.textTheme.labelMedium!.copyWith(
                                color: controller.period.value == period
                                    ? DefaultTheme.base100Color
                                    : DefaultTheme.base900Color,
                              )),
                        ),
                      );
                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
