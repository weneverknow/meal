import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/src/config/my_db.dart';
import 'package:meal/src/config/style.dart';
import 'package:meal/src/features/add_food_favourite/data/datasource/food_favourite_data_source.dart';
import 'package:meal/src/features/add_food_favourite/data/model/food_favourite.dart';
import 'package:meal/src/features/add_food_favourite/data/repositories/food_favourite_repository_impl.dart';
import 'package:meal/src/features/add_food_favourite/presentation/bloc/food_favourite_bloc.dart';
import 'package:meal/src/features/food_detail/presentation/page/food_detail_screen.dart';
import 'package:meal/src/features/home/data/datasource/food_category_remote_data_source.dart';
import 'package:meal/src/features/home/data/datasource/food_remote_data_source.dart';
import 'package:meal/src/features/home/data/repositories/food_category_repository_impl.dart';
import 'package:meal/src/features/home/data/repositories/food_repository_impl.dart';
import 'package:meal/src/features/home/domain/usecases/food_category_get_all.dart';
import 'package:meal/src/features/home/domain/usecases/food_get_all.dart';
import 'package:meal/src/features/home/presentation/bloc/food_bloc.dart';
import 'package:meal/src/features/home/presentation/bloc/food_category_bloc.dart';
import 'package:meal/src/features/home/presentation/bloc/food_category_selected_bloc.dart';
import 'package:meal/src/features/home/presentation/page/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal/src/features/welcome/data/datasource/member_data_source.dart';
import 'package:meal/src/features/welcome/data/repositories/member_repository_impl.dart';
import 'package:meal/src/features/welcome/presentation/bloc/member_bloc.dart';
import 'package:meal/src/features/welcome/presentation/bloc/welcome_validation_cubit.dart';
import 'package:meal/src/features/welcome/presentation/page/welcome_screen.dart';
import 'package:meal/src/http/http_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = MyDatabase();
  MyDb.mydb = db;
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
          BlocProvider(
              create: (_) => FoodBloc(
                  foodGetAll: FoodGetAll(FoodRepositoryImpl(
                      FoodRemoteDataSourceImpl(HttpService()))))
                ..add(LoadFood())),
          BlocProvider(
              create: (_) => FoodCategoryBloc(
                  foodCategoryGetAll: FoodCategoryGetAll(
                      FoodCategoryRepositoryImpl(
                          FoodCategoryRemoteDataSourceImpl(HttpService()))))
                ..add(LoadFoodCategory())),
          BlocProvider(create: (_) => FoodCategorySelectedBloc()),
          BlocProvider(
              create: (_) => FoodFavouriteBloc(
                  foodFavouriteRepositoryImpl: FoodFavouriteRepositoryImpl(
                      FoodFavouriteDataSourceImpl(MyDb.mydb!)))
                ..add(LoadFavouriteFood(food ?? []))),
          BlocProvider(create: (_) => WelcomeValidationCubit()),
          BlocProvider(
              create: (_) => MemberBloc(
                  repositoryImpl:
                      MemberRepositoryImpl(MemberDataSourceImpl(MyDb.mydb!)))
                ..add(LoadMember()))
        ],
        child: MaterialApp(
          title: 'Meal',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/welcome',
          //routeInformationParser: Modular.routeInformationParser,
          //routerDelegate: Modular.routerDelegate,
          //home: const HomeScreen()
        ).modular());
  }
}
