import 'package:flutter/material.dart';
import 'package:todo/view/CustomTextField.dart';
import 'package:get/get.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final DateTime selectedDate;

  const ScheduleBottomSheet({
    required this.selectedDate,
    Key? key,
}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey(); // 폼 키 생성

  int? startTime; // 시작 시간 저장 변수
  int? endTime;
  String? content;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    // 키보드 높이 가져오기
    return Form(
      key: formKey,
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
                        onSaved: (String? val){
                          startTime = int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(child: CustomTextField(
                        label: '종료 시간',
                      isTime: true,
                      onSaved: (String? val){
                        endTime = int.parse(val!);
                      },
                      validator: timeValidator,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Expanded(
                    child: CustomTextField(
                      label: '내용',
                      isTime: false,
                      onSaved: (String? val){
                        content = val;
                      },
                      validator: contentValidator,
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
  void onSavePressed()async{
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();

      print(startTime);
      print(endTime);
      print(content);


      Get.back();



    }
  }
  String? timeValidator(String? val){}
  String? contentValidator(String? val){}
}
