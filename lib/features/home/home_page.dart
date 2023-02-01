import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/model/investment_and_service.dart';
import '../../util/string_value.dart';
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
          StringValue.helloUser,
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
              message: StringValue.loading,
              showProgressIndicator: true,
            );
          } else if (state is HomeErrorState) {
            return DisplayMessage(
              message: state.message,
            );
          }
          return const DisplayMessage(
            message: StringValue.anErrorHasOccured,
          );
        },
      ),
      bottomNavigationBar: appBottomNavigationBar(),
    );
  }

  BottomNavigationBar appBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: StringValue.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.savings_outlined),
          label: StringValue.investment,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payments_outlined),
          label: StringValue.payment,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.credit_card_rounded),
          label: StringValue.credit,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: StringValue.profile,
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
