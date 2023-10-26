import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:pay_app/features/payment_feature/data/data_sources/payment_remote_data_source.dart';
import 'package:pay_app/features/payment_feature/data/repo_impl/payment_repo_impl.dart';
import 'package:pay_app/features/payment_feature/domain/repo/payment_repo.dart';
import 'package:pay_app/features/payment_feature/domain/use_cases/create_payment_use_case.dart';
import 'package:pay_app/features/payment_feature/domain/use_cases/ephemeral_key_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/payment_feature/domain/use_cases/create_customer_use_case.dart';
import '../network/network_info.dart';
import '../network/network_manager.dart';
import '../services/cache_service.dart';
import 'navigation_helper.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // data sources
   getIt.registerLazySingleton<PaymentRemoteDataSource>(() => PaymentRemoteDataSourceImpl());
  // getIt.registerLazySingleton<CategoriesRemoteDataSource>(() => CategoriesRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<AccountRemoteDataSource>(() => AccountRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<CartRemoteDataSource>(() => CartRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<FavouriteRemoteDataSource>(() => FavouriteRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<OrderRemoteDataSource>(() => OrderRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<AddressesRemoteDataSource>(() => AddressesRemoteDataSourceImpl(networkManager: getIt()),);
  // getIt.registerLazySingleton<NotificationRemoteDataSource>(() => NotificationRemoteDataSourceImpl(networkManager: getIt()),);

  //* Repository
   getIt.registerLazySingleton<PaymentRepo>(() => PaymentRepoImpl(paymentRemoteDataSource: getIt(), networkInfo: getIt()),);
  // getIt.registerLazySingleton<CategoriesRepo>(() => CategoriesRepoImpl(categoriesRemoteDataSource: getIt(), networkInfo: getIt(),),);
  // getIt.registerLazySingleton<SearchRepo>(() => SearchRepoImpl(searchRemoteDataSource: getIt(), networkInfo: getIt()),);
  // getIt.registerLazySingleton<AccountRepo>(() => AccountRepoImpl(accountRemoteDataSource: getIt(), networkInfo: getIt()),);
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl( networkInfo: getIt(), homeRemoteDataSource: getIt()),);
  // getIt.registerLazySingleton<CartRepo>(() => CartRepoImpl( networkInfo: getIt(), cartRemoteDataSource: getIt()),);
  // getIt.registerLazySingleton<FavouriteRepo>(() => FavouriteRepoImpl( networkInfo: getIt(), favouriteRemoteDataSource: getIt()),);
  // getIt.registerLazySingleton<OrderRepo>(() => OrderRepoImpl( networkInfo: getIt(), orderRemoteDataSource: getIt()),);
  // getIt.registerLazySingleton<AddressesRepo>(() => AddressesRepoImpl( networkInfo: getIt(), addressesRemoteDataSource: getIt()),);
  // getIt.registerLazySingleton<NotificationRepo>(() => NotificationRepoImpl( networkInfo: getIt(), notificationRemoteDataSource: getIt()),);

  //* Use cases
  _paymentUseCase();
  _accountUseCases();
  _cartUseCases();
  _favouriteUseCases();
  _homeUseCase();
  _categoriesCase();
  _searchUseCase();
  _notificationsUseCases();
  _orderUseCases();
  _addressCases();


  //! ----------- app -----------
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());
  getIt.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  // getIt.registerLazySingleton<FirebaseNotificationService>(() => FirebaseNotificationService(),);
  // getIt.registerLazySingleton<FlutterLocalNotificationService>(() => FlutterLocalNotificationService(),);
  getIt.registerSingleton<NavHelper>(NavHelper());
  getIt.registerSingleton<CacheService>(CacheService());
}

void _authUseCases() {
  // getIt.registerLazySingleton<SignInUseCase>(() => SignInUseCase(repository: getIt()));
  // getIt.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(repository: getIt()));
  // getIt.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(repository: getIt()));
  // getIt.registerLazySingleton<ActivateAccountUseCase>(() => ActivateAccountUseCase(repository: getIt()));
  // getIt.registerLazySingleton<ForgetPasswordUseCase>(() => ForgetPasswordUseCase(repository: getIt()));
  // getIt.registerLazySingleton<ResetPasswordUseCase>(() => ResetPasswordUseCase(repository: getIt()));
  // getIt.registerLazySingleton<VerifyOtpUseCase>(() => VerifyOtpUseCase(repository: getIt()));
}
void _cartUseCases() {
  // getIt.registerLazySingleton<AddItemToCartUseCase>(() => AddItemToCartUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetAllCartItemsUseCase>(() => GetAllCartItemsUseCase(repository: getIt()));
  // getIt.registerLazySingleton<UpdateQuantityUseCase>(() => UpdateQuantityUseCase(repository: getIt()));
  // getIt.registerLazySingleton<RemoveItemFromCartUseCase>(() => RemoveItemFromCartUseCase(repository: getIt()));
  // getIt.registerLazySingleton<SaveItemForLaterUseCase>(() => SaveItemForLaterUseCase(repository: getIt()));
  // getIt.registerLazySingleton<CheckoutUseCase>(() => CheckoutUseCase(repository: getIt()));
  // getIt.registerLazySingleton<CheckCouponUseCase>(() => CheckCouponUseCase(repository: getIt()));
  // getIt.registerLazySingleton<PlaceOrderUseCase>(() => PlaceOrderUseCase(repository: getIt()));
}
void _favouriteUseCases() {
  // getIt.registerLazySingleton<AddItemToFavouriteUseCase>(() => AddItemToFavouriteUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetAllFavouriteItemsUseCase>(() => GetAllFavouriteItemsUseCase(repository: getIt()));
  // getIt.registerLazySingleton<RemoveItemFromFavouriteUseCase>(() => RemoveItemFromFavouriteUseCase(repository: getIt()));
  // getIt.registerLazySingleton<SaveItemToCartUseCase>(() => SaveItemToCartUseCase(repository: getIt()));
  // getIt.registerLazySingleton<UpdateFavouriteQuantityUseCase>(() => UpdateFavouriteQuantityUseCase(repository: getIt()));
}

void _accountUseCases() {
  // getIt.registerLazySingleton<GetProfileUseCase>(() => GetProfileUseCase(repository: getIt()));
  // getIt.registerLazySingleton<UpdatePasswordUseCase>(() => UpdatePasswordUseCase(repository: getIt()));
  // getIt.registerLazySingleton<ChangeLanguageUseCase>(() => ChangeLanguageUseCase(repository: getIt()));
  // getIt.registerLazySingleton<UpdateProfileUseCase>(() => UpdateProfileUseCase(repository: getIt()));
  // getIt.registerLazySingleton<ContactUsUseCase>(() => ContactUsUseCase(repository: getIt()));
  // getIt.registerLazySingleton<DeleteAccountUseCase>(() => DeleteAccountUseCase(repository: getIt()));
}

void _homeUseCase(){
  //getIt.registerLazySingleton<GetHomeDataUseCase>(() => GetHomeDataUseCase(repository: getIt()));
}
void _searchUseCase(){
  //getIt.registerLazySingleton<SearchProductsUseCase>(() => SearchProductsUseCase(repository: getIt()));
}
void _categoriesCase(){
  // getIt.registerLazySingleton<GetAllCategoriesUseCase>(() => GetAllCategoriesUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetAllBestSellingUseCase>(() => GetAllBestSellingUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetAllBestOffersUseCase>(() => GetAllBestOffersUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetAllNewCollectionsUseCase>(() => GetAllNewCollectionsUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetCategoryProductsUseCase>(() => GetCategoryProductsUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetProductDetailsUseCase>(() => GetProductDetailsUseCase(repository: getIt()));
}
void _notificationsUseCases() {
  // getIt.registerLazySingleton<GetNotificationCountUseCase>(() => GetNotificationCountUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetNotificationsUseCase>(() => GetNotificationsUseCase(repository: getIt()));
}

void _orderUseCases() {
  // getIt.registerLazySingleton<ReviewOrderItemUseCase>(() => ReviewOrderItemUseCase(repository: getIt()));
  // getIt.registerLazySingleton<CancelOrderItemUseCase>(() => CancelOrderItemUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetOrderDetailsUseCase>(() => GetOrderDetailsUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetCancelledOrdersUseCase>(() => GetCancelledOrdersUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetDeliveredOrdersUseCase>(() => GetDeliveredOrdersUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetInShippingOrdersUseCase>(() => GetInShippingOrdersUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetInProgressOrdersUseCase>(() => GetInProgressOrdersUseCase(repository: getIt()));
}

void _addressCases() {
  // getIt.registerLazySingleton<GetAddressesUseCase>(() => GetAddressesUseCase(repository: getIt()));
  // getIt.registerLazySingleton<AddAddressUseCase>(() => AddAddressUseCase(repository: getIt()));
  // getIt.registerLazySingleton<EditAddressUseCase>(() => EditAddressUseCase(repository: getIt()));
  // getIt.registerLazySingleton<DeleteAddressUseCase>(() => DeleteAddressUseCase(repository: getIt()));
  // getIt.registerLazySingleton<GetCitiesUseCase>(() => GetCitiesUseCase(repository: getIt()));
}
void _paymentUseCase() {
  getIt.registerLazySingleton<EphemeralKeyUseCase>(() => EphemeralKeyUseCase(paymentRepo: getIt()));
  getIt.registerLazySingleton<CreateCustomerUseCase>(() => CreateCustomerUseCase(paymentRepo: getIt()));
  getIt.registerLazySingleton<CreatePaymentIntentUseCase>(() => CreatePaymentIntentUseCase(paymentRepo: getIt()));
}