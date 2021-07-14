import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/app_cubit/cubit.dart';
import 'package:news_app_flutter/components/components.dart';
import 'package:news_app_flutter/layout/cubit/cubit.dart';
import 'package:news_app_flutter/layout/cubit/states.dart';
import 'package:news_app_flutter/modules/search/search_screen.dart';
import 'package:news_app_flutter/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){

        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context,SearchScreen(),);
                  },
                  icon:Icon(Icons.search,
                  ),
              ),
              IconButton(
                icon:Icon(
                  Icons.brightness_4_outlined,
                ),
                  onPressed: ()
                  {
                    AppCubit.get(context).changeAppMode();
                  },

              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },
            items:cubit.bottomItems,
          ),
        );
      },
    );
  }
}
