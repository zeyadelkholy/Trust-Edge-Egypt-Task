import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:starttechtask/utils/extensions_helper.dart';
import 'package:starttechtask/utils/widgets/basic_filed.dart';
import 'package:starttechtask/utils/widgets/master_button.dart';
import 'package:starttechtask/view_model/logic_view_model.dart';

class UpdateView extends GetWidget<LogicViewModel> {
  const UpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update information',
          style: context.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(93, 20, 107, 1.0),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
              child: BasicFiled(
                text: 'Full name',
                controller: controller.fullNameController,
              ),
            ),
            BasicFiled(
              keyboardType:TextInputType.number ,
              text: 'Phone number',
              controller: controller.phoneNumberController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
              child: BasicFiled(
                keyboardType: TextInputType.emailAddress,
                text: 'Email',
                controller: controller.emailController,
              ),
            ),
            MasterButton(
              text: 'Save',
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
