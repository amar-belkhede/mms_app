import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/model/investment_and_service.dart';
import '../common/display_message.dart';
import '../common/mms_text_button.dart';
import '../common_import.dart';
import 'bloc/home_bloc.dart';
import 'component/home_service_component.dart';
import 'component/home_summary_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String name = 'home';
  static const String path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    HomeBloc.of(context).add(HomeLoadedEvent());
    super.initState();
  }

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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadedState) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.data.investmentList?.length,
                        itemBuilder: (context, index) => HomeSummaryCard(
                            index: index,
                            investment: state.data.investmentList![index]),
                      ),
                    ),
                    if (state.data.serviceList != null)
                      HomeServiceComponent(
                          serviceList: state.data.serviceList!),
                  ],
                ),
              ),
            );
          } else if (state is HomeLoadingState) {
            return const DisplayMessage(
              message: 'Loading',
              showProgressIndicator: true,
            );
          } else if (state is HomeErrorState) {
            return DisplayMessage(
              message: state.message,
            );
          }
          return const DisplayMessage(
            message: 'An error has occured',
          );
        },
      ),
      bottomNavigationBar: appBottomNavigationBar(),
    );
  }

  Widget _summaryList(int index, List<Investment>? list) => Container(
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
                list![index].type!.name,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.lightGrey,
                    ),
              ),
              Text(
                '\$ ${list[index].amount}',
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
      type: BottomNavigationBarType.fixed,
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
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_rounded),
          label: 'Credit',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
