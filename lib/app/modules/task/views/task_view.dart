import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yss_app/app/common/ui/input/common_field.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        mini: true,
        backgroundColor: Get.theme.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Icon(
          Icons.add,
          size: 20,
          color: Colors.white,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // expandedHeight: 200,
            floating: true,
            snap: true,
            stretch: true,
            title: const Text('Issue'),
            centerTitle: true,
            actions: const [],
            expandedHeight: 90,
            flexibleSpace: Container(
              child: const Row(
                children: [
                  Expanded(
                    child: CommonTextField(
                      hintText: 'Search',
                      prefixIcon: Icons.search,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Get.theme.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pc Rusak',
                              style: Get.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Task Description',
                              style: Get.textTheme.bodyLarge!.copyWith(
                                color: Get.theme.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            '12:00 PM',
                            style: Get.textTheme.bodyLarge!.copyWith(
                              color: Get.theme.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '12/12/2021',
                            style: Get.textTheme.bodyLarge!.copyWith(
                              color: Get.theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            },
          )
        ],
      ),
    );
  }
}
