import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/src/core/config/my_db.dart';
import 'package:meal/src/features/favourite_food/data/model/food_favourite.dart';
import 'package:meal/src/features/favourite_food/domain/entity/food_favourite.dart';
import 'package:meal/src/features/favourite_food/presentation/bloc/food_favourite_bloc.dart';
import 'package:meal/src/features/food_detail/presentation/page/food_detail_screen.dart';
import 'package:meal/src/features/home/presentation/bloc/food_bloc.dart';
import 'package:meal/src/features/home/presentation/bloc/food_category_bloc.dart';
import 'package:meal/src/features/home/presentation/bloc/food_category_selected_bloc.dart';
import 'package:meal/src/features/home/presentation/page/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal/src/features/registration/presentation/bloc/member_bloc.dart';
import 'package:meal/src/features/registration/presentation/bloc/welcome_validation_cubit.dart';
import 'package:meal/src/features/registration/presentation/page/welcome_screen.dart';
import 'src/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = MyDatabase();
  MyDb.mydb = db;
  setupServiceLocator();
  //select food favourite
  final allFoodFavourite = await db.select(db.foodFavourites).get();

  print("Food Favourie $allFoodFavourite");
  runApp(ModularApp(
    module: MyAppModule(),
    child: MyApp(
      food: allFoodFavourite,
    ),
  ));
}

class MyAppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomeScreen()),
        ChildRoute('/welcome', child: (context, args) => WelcomeScreen()),
        ChildRoute('/food-detail',
            child: (context, args) => FoodDetailScreen(food: args.data))
      ];
}

class MyApp extends StatelessWidget {
  const MyApp({required this.food, Key? key}) : super(key: key);
  final List<FoodFavourite>? food;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //Food BLoC
          BlocProvider(create: (_) => sl<FoodBloc>()..add(LoadFood())),
          BlocProvider(
              create: (_) => sl<FoodCategoryBloc>()..add(LoadFoodCategory())),
          BlocProvider(create: (_) => sl<FoodCategorySelectedBloc>()),
          //Favourite Food BLoC
          BlocProvider(
              create: (_) =>
                  sl<FoodFavouriteBloc>()..add(LoadFavouriteFood(food ?? []))),
          //Registration BLoC
          BlocProvider(create: (_) => sl<WelcomeValidationCubit>()),
          BlocProvider(create: (_) => sl<MemberBloc>()..add(LoadMember()))
        ],
        child: MaterialApp(
          title: 'Meal',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/welcome',
        ).modular());
  }
}
