import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starttechtask/utils/extensions_helper.dart';
import 'package:starttechtask/view/update_view.dart';
import 'package:starttechtask/view_model/logic_view_model.dart';


class HomeView extends GetWidget<LogicViewModel> {
  const HomeView({super.key});
  final List<String> actions = const [
    'Update information',
    'Change Password',
    'Delete Account',
    'Logout',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: context.textTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(93, 20, 107, 1.0),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.account_box_outlined,
              size: 30,
              color: Color.fromRGBO(93, 20, 107, 1.0),
            ),
            title: Text(
              controller.fullNameController.text.isEmpty
                  ? controller.fullNameController.text = 'Zeyad Elkholy'
                  : controller.fullNameController.text,
              style: context.textTheme.titleLarge?.copyWith(color: Colors.grey),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.phone_android_outlined,
              size: 30,
              color: Color.fromRGBO(93, 20, 107, 1.0),
            ),
            title: Text(
              controller.phoneNumberController.text.isEmpty
                  ? controller.phoneNumberController.text = '+201060568141'
                  : controller.phoneNumberController.text,
              style: context.textTheme.titleLarge?.copyWith(color: Colors.grey),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.email_outlined,
              size: 30,
              color: Color.fromRGBO(93, 20, 107, 1.0),
            ),
            title: Text(
              controller.emailController.text.isEmpty
                  ? controller.emailController.text = 'zeyad@gmail.com'
                  : controller.emailController.text,
              style: context.textTheme.titleLarge?.copyWith(color: const Color.fromRGBO(93, 20, 107, 1.0)),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    if (index == 0) {
                      context.push(const UpdateView());
                    } else if (index == 2 || index == 3) {
                      context.pushReplacement(const HomeView());
                      controller.emailController.text = '';
                      controller.phoneNumberController.text = '';
                      controller.passwordController.text = '';
                      controller.confirmPasswordController.text = '';
                      controller.fullNameController.text = '';
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 0.5,
                          offset: Offset(0.5, 0.5),
                        )
                      ],
                    ),
                    child: ListTile(
                      title: Text(actions[index]),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined,color: Color.fromRGBO(93, 20, 107, 1.0)),
                    ),
                  ),
                );
              },
              itemCount: actions.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 8,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
