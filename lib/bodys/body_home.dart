import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectm/utility/app_constant.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          elementSearch(),
          Positioned(
            top: 100,
            child: SizedBox(
              width: Get.width,
              height: Get.height - 100,
              child: ListView(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,childAspectRatio: 2
                    ),
                    itemCount: AppConstant.groups.length,physics: ScrollPhysics(),shrinkWrap: true,
                    itemBuilder: (context, index) => Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.electric_bike, size: 40, color: AppConstant.appColor),
                        SizedBox(width: 10),
                        Text(AppConstant.groups[index]),
                      ],
                    ),
                  ),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget elementSearch() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: AppConstant.appColor),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search),
              hintText: 'ต้องการซ่อมอะไร ?',
            ),
          ),
        ),
      ],
    );
  }
}
