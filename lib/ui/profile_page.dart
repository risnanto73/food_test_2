part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                //// Header
                Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    height: 220,
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          margin: EdgeInsets.only(bottom: 16),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/photo_border.png'))),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage((context
                                        .read<UserCubit>()
                                        .state as UserLoaded)
                                        .user
                                        .picturePath ?? ''),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Text(
                          (context.read<UserCubit>().state as UserLoaded)
                              .user
                              .name ?? '',
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          (context.read<UserCubit>().state as UserLoaded)
                              .user
                              .email ?? '',
                          style:
                          greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                        )
                      ],
                    )),
                //// Body
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomTabbar(
                        titles: ["Account", "FoodMarket"],
                        selectedIndex: selectedIndex,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
        
                      Builder(builder: (_) {
                        if (selectedIndex == 0) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text("Edit Profile"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
        
                                },
                              ),
                              ListTile(
                                title: Text("Home Address"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
        
                                },
                              ),
                              ListTile(
                                title: Text("Security"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
        
                                },
                              ),
                              ListTile(
                                title: Text("Payments"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
        
                                },
                              ),
                              ListTile(
                                title: Text("Rate App"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
        
                                },
                              ),
                              ListTile(
                                title: Text("Sign Out"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  // Get.to(() => RateAppPage());
                                },
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              ListTile(
                                title: Text("Rate App"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  // Get.to(() => RateAppPage());
                                },
                              ),
                              ListTile(
                                title: Text("Help Center"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  // Get.to(() => HelpCenterPage());
                                },
                              ),
                              ListTile(
                                title: Text("Privacy & Policy"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  // Get.to(() => PrivacyPolicyPage());
                                },
                              ),
                              ListTile(
                                title: Text("Term & Conditions"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  // Get.to(() => TermConditionPage());
                                },
                              ),
                            ],
                          );
                        }
                      }),
        
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
