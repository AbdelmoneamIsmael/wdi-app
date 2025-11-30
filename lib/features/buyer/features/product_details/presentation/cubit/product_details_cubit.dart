import 'package:bloc/bloc.dart';
import 'package:wdi/features/buyer/features/product_details/presentation/cubit/product_details_state.dart';


class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit({required this. productId}) : super(const ProductDetailsState.initial());
  final String productId;
   

}
