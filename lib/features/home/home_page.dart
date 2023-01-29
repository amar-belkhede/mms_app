import 'package:go_router/go_router.dart';
import '../common/mms_text_button.dart';
import '../common_import.dart';
import 'component/home_service_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String name = 'home';
  static const String path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppColors.mmsIndigo,
        ),
        leading: GestureDetector(
          child: const Icon(
            Icons.menu,
            size: 30,
          ),
          onTap: () {
            context.pop();
          },
        ),
        title: Text(
          'Hello, Jeremy',
          style: TextStyle(
              color: AppColors.mmsIndigo,
              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => _summaryList(index),
                ),
              ),
              HomeServiceComponent(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: appBottomNavigationBar(),
    );
  }

  Widget _summaryList(int index) => Container(
        height: 200.0,
        width: MediaQuery.of(context).size.width - 100,
        margin: EdgeInsets.only(
          left: (index == 0) ? 20 : 0,
          right: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mmsIndigo,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'wallet',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.lightGrey,
                    ),
              ),
              Text(
                '\$ 540,324.45',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: AppColors.lightGrey),
              ),
              SizedBox(
                height: 30,
              ),
              MmsButton(
                buttonText: 'Withdraw Funds',
                fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
                textColor: Colors.white,
                backgroundColor: AppColors.sandyColor,
              )
            ],
          ),
        ),
      );

  BottomNavigationBar appBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.savings_outlined),
          label: 'Investment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payments_outlined),
          label: 'Payment',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.credit_card_rounded),
        //   label: 'Credit',
        // ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.person_2_outlined),
        //   label: 'Profile',
        // ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
