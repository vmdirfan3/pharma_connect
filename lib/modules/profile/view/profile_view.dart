import 'package:flutter/material.dart';
import 'package:pharma_connect/modules/profile/controller/profile_controller.dart';
import 'package:pharma_connect/utils/index.dart';
import 'package:provider/provider.dart';

import '../../../utils/regex.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileController>(context);
    return Scaffold(
      backgroundColor: AppColorConst.dashboardBG, // Background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: profileProvider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5FEFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://i.ibb.co/gMDTMMg/Avatar.png',
                          // Replace with your image asset path
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profileProvider.nameController.text.isNotEmpty?profileProvider.nameController.text:"User Name",
                            style: TextStyle(
                              color: Color(0xFF475466),
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 28,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  side: const BorderSide(width: 1),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4))),
                              onPressed: () {
                                profileProvider.isEditing =
                                    !profileProvider.isEditing;
                              },
                              child: const Text(
                                'Edit details',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Input Fields
                buildLabel('Name'),
                buildField(
                  'Enter Your Name',
                  controller: profileProvider.nameController,
                  validator: nameValidator,
                  isEditable: profileProvider.isEditing,
                ),
                buildLabel('Phone'),
                buildField(
                  'Enter Your Phone Number',
                  controller: profileProvider.phoneController,
                  validator: phoneValidator,
                  isEditable: profileProvider.isEditing,
                ),
                buildLabel('Email'),
                buildField(
                  'Enter Your Email',
                  controller: profileProvider.emailController,
                  validator: emailValidator,
                  isEditable: profileProvider.isEditing,
                ),
                buildLabel('Practitioner ID'),
                buildField(
                  'Enter Your ID',
                  controller: profileProvider.idController,
                  validator: idValidator,
                  isEditable: profileProvider.isEditing,
                ),
                buildLabel('Billing Address'),
                buildField(
                  'Enter Your Address',
                  controller: profileProvider.addressController,
                  validator: addressValidator,
                  isEditable: profileProvider.isEditing,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: profileProvider.isEditing
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10676E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  if (profileProvider.formKey.currentState?.validate() ?? false) {
                    profileProvider.updateData();
                  }
                },
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 4),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF344053),
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget buildField(
    String hintText, {
    required TextEditingController controller,
    required String? Function(String?) validator, // Add validator
    bool isEditable = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          readOnly: !isEditable,
          validator: validator,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B6F75),
          ),
          decoration: InputDecoration(fillColor: Colors.white,filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B6F75),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            errorStyle: const TextStyle(
              fontSize: 12,
              color: Colors.red,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
          ),
        ),
      ],
    );
  }
}
