import 'package:park_easy_app/interface/park_easy_observer.dart';

class ParkEasySubject {

   static List<ParkEasyObserver> observers;

   static void attach(ParkEasyObserver o) {}

   static void detach(ParkEasyObserver o) {}

   static void notify() {}

   static List getData() {}
}