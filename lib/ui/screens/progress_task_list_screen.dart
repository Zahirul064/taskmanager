import 'package:flutter/material.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';

import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../../data/models/task_list_by_status_model.dart';
import '../widgets/snack_bar_message.dart';
import '../widgets/task_item_widget.dart';

import '../widgets/tm_app_bar.dart';

class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {

  bool _getProgressTaskListInProgress=false;
  TaskListByStatusModel? progressTaskListModel;

  @override
  @override
  void initState() {
    super.initState();
    _getProgressTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Visibility(
              visible: _getProgressTaskListInProgress==false,
              replacement: CenteredCircularProgressIndicator(),
              child: _buildTaskListView()
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: progressTaskListModel?.taskList?.length ?? 0,
      itemBuilder: (context,indexx) {
        return TaskItemWidget(
          taskModel: progressTaskListModel!.taskList![indexx],
          status: 'Progress',
          color: Colors.yellow,
        );
      },
    );
  }

  Future<void> _getProgressTask() async{
    _getProgressTaskListInProgress=true;
    setState(() {});
    final NetworkResponse response=await NetworkCaller.getRequest(url: Urls.taskListByStatusUrl('Progress'));
    if(response.isSuccess){
      progressTaskListModel=TaskListByStatusModel.fromJson(response.responseData!);
    }
    else{
      showSnackBarMessage(context, response.errorMessage);
    }
    _getProgressTaskListInProgress=false;
    setState(() {});
    

  }

}







