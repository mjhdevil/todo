import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/model/model.dart';

// BottomNavigationBar 상태 관리를 위한 GetX controller
// 깃허브 테스트
class BottomNavigationBarController extends GetxController {


  // 현재 선택된 탭 아이템 번호 저장
  var selectedIndex = 0.obs;

  // 탭 이벤트가 발생할 시 selectedIndex값을 변경해줄 함수
  void changeIndex(int index) {
    selectedIndex(index);
  }
}

class NoteController extends GetxController{
  
}

