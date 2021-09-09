



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_hiring/View/employer_screens/home_employer_screen/cubit_slider/slider_state.dart';

class SliderCubit extends Cubit<SliderStates>{
  SliderCubit():super (SliderInitialState());

  static SliderCubit get(context) => BlocProvider.of(context);


  List list = [1, 2, 3, 4, 5];

  int currentIndex = 0;

  void changeIndex(int index){
    currentIndex=index;
    emit( SliderChangeState());
  }
}