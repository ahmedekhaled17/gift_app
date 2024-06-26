import 'package:get/get.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/middle_ware/my_middle_ware.dart';
import 'package:graduation_project/views/screens/address/add.dart';
import 'package:graduation_project/views/screens/address/adddetails.dart';
import 'package:graduation_project/views/screens/address/view.dart';
import 'package:graduation_project/views/screens/auth/forget_password/forget_password.dart';
import 'package:graduation_project/views/screens/auth/forget_password/reset_password.dart';
import 'package:graduation_project/views/screens/auth/forget_password/success_reset_password.dart';
import 'package:graduation_project/views/screens/auth/forget_password/verify_code.dart';
import 'package:graduation_project/views/screens/auth/login_screen.dart';
import 'package:graduation_project/views/screens/auth/sign_up_screen.dart';
import 'package:graduation_project/views/screens/auth/success_sign_up.dart';
import 'package:graduation_project/views/screens/cart.dart';
import 'package:graduation_project/views/screens/checkout.dart';
import 'package:graduation_project/views/screens/home_screen.dart';
import 'package:graduation_project/views/screens/items.dart';
import 'package:graduation_project/views/screens/myfavorite.dart';
import 'package:graduation_project/views/screens/offers.dart';
import 'package:graduation_project/views/screens/on_boarding_screen.dart';
import 'package:graduation_project/views/screens/orders/archive.dart';
import 'package:graduation_project/views/screens/orders/details.dart';
import 'package:graduation_project/views/screens/orders/pending.dart';
import 'package:graduation_project/views/screens/productdetails.dart';
import 'package:graduation_project/views/screens/splash_screen.dart';
import 'views/screens/auth/verify_code_sign_up.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const SplashScreen() , middlewares: [
    MyMiddleWare()
  ]),
  //GetPage(name: "/", page: () => const Cart()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.login, page: () => const LoginScreen()),
  GetPage(name: AppRoute.signUp, page: () => const SignUpScreen()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoardingScreen()),
  GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),

  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),

  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  //GetPage(name: AppRoute.offers, page: () => const OffersView()),
  GetPage(name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),

];
