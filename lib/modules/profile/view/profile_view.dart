import 'package:flutter/material.dart';
import 'package:pharma_connect/modules/profile/controller/profile_controller.dart';
import 'package:pharma_connect/utils/index.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileProvider=Provider.of<ProfileController>(context);
    return Scaffold(
      backgroundColor: AppColorConst.dashboardBG, // Background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                        'https://i.ibb.co/gMDTMMg/Avatar.png', // Replace with your image asset path
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dr. Rachel Green',
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                                side: const BorderSide(width: 1),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                            ),
                            onPressed: () {
                              profileProvider.isEditing = !profileProvider.isEditing;
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
              buildField('Enter Your Name',controller: profileProvider.nameController,isEditable: profileProvider.isEditing),
              buildLabel('Phone'),
              buildField('Enter your phone Number',controller: profileProvider.phoneController,isEditable: profileProvider.isEditing),
              buildLabel('Email'),
              buildField('Enter Your Email',controller: profileProvider.emailController,isEditable: profileProvider.isEditing),
              buildLabel('Practitioner ID'),
              buildField('Enter Your ID',controller: profileProvider.idController,isEditable: profileProvider.isEditing),
              buildLabel('Billing Address'),
              buildField('Enter Your Address',controller: profileProvider.addressController,isEditable: profileProvider.isEditing),

            ],
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
            profileProvider.updateData();
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

  Widget buildField(String hintText,
      {TextEditingController? controller, bool isEditable = false}) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        readOnly: !isEditable, // Disable editing based on state
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF6B6F75),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B6F75),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }}