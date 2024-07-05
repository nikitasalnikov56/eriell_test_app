import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'page_change_event.dart';
part 'page_change_state.dart';

class PageChangeBloc extends Bloc<PageChangeEvent, PageChangeState> {
  PageChangeBloc() : super(PageChangeInitial()) {
    on<AuthPageChangeEvent>(_onPageChange);
 
  }
    Future<void> _onPageChange(event, emit) async{
    if (event.isSignUp) {
      emit(PageSignInState());
    }else{
      emit(PageSignUpState());
    }
  }

}
