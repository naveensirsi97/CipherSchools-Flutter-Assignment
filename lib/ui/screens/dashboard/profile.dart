import 'package:ciperschools_assignment_app/services/auth_services.dart';
import 'package:ciperschools_assignment_app/services/firestore_service.dart';
import 'package:ciperschools_assignment_app/ui/screens/signUp_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FireStoreService fireStoreService = FireStoreService();
  late String userName = '';
  Future<void> _loadUserData() async {
    try {
      Map<String, dynamic>? userData = await fireStoreService.getUserData();
      if (userData != null && userData.containsKey('name')) {
        setState(() {
          userName = userData['name'];
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error loading user data: $error');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundImage:
                    Image.asset('assets/images/img_6.png', fit: BoxFit.cover)
                        .image,
              ),
              title: const Text(
                'Username',
                style: TextStyle(
                  color: Color(0xFF90909F),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                userName,
                style: const TextStyle(
                  color: Color(0xFF161719),
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.edit),
            ),
            const SizedBox(
              height: 16,
            ),
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12),
                child: Column(
                  children: [
                    ListTile(
                      leading: Container(
                        width: 52,
                        height: 52,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEEE5FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Icon(
                          Icons.wallet,
                          color: Color(0xFF7E3DFF),
                          size: 32,
                        ),
                      ),
                      title: const Text(
                        'Account',
                        style: TextStyle(
                          color: Color(0xFF292B2D),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListTile(
                      leading: Container(
                        width: 52,
                        height: 52,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEEE5FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Icon(
                          Icons.settings,
                          color: Color(0xFF7E3DFF),
                          size: 32,
                        ),
                      ),
                      title: const Text(
                        'Settings',
                        style: TextStyle(
                          color: Color(0xFF292B2D),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListTile(
                      leading: Container(
                        width: 52,
                        height: 52,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFEEE5FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Icon(
                          Icons.file_upload_outlined,
                          color: Color(0xFF7E3DFF),
                          size: 32,
                        ),
                      ),
                      title: const Text(
                        'Export Data',
                        style: TextStyle(
                          color: Color(0xFF292B2D),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () async {
                        await AuthService().signOut();
                        if (mounted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignUpScreen()));
                        }
                      },
                      child: ListTile(
                        leading: Container(
                          width: 52,
                          height: 52,
                          padding: const EdgeInsets.all(10),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFE2E4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Icon(
                            Icons.logout,
                            color: Color(0xFFFD3C4A),
                            size: 32,
                          ),
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                            color: Color(0xFF292B2D),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
