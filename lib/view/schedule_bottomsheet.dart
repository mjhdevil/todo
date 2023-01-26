import 'package:flutter/material.dart';
import 'package:todo/view/CustomTextField.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    // 키보드 높이 가져오기
    return SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 2 ,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
                left: 8, right: 8, top: 1),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: '시작 시간',
                        isTime: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: CustomTextField(
                        label: '종료 시간', isTime: true,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Expanded(
                    child: CustomTextField(
                      label: '내용',
                      isTime: false,
                    ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onSavePressed,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('저장'),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
  void onSavePressed(){

  }
}
