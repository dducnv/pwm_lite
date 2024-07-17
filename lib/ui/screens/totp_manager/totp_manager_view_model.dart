import 'package:cyber_safe/core/domains.dart';
import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/utils/logger.dart';
import 'package:cyber_safe/core/utils/result.dart';
import 'package:cyber_safe/ui/base/base_view_model.dart';
import 'package:cyber_safe/ui/provider/data_shared.dart';
import 'package:flutter/material.dart';

class TOTPViewModel extends BaseViewModel{
 final TOTPUsecase totpUsecase;
  TOTPViewModel({
    required this.totpUsecase,
  });

  ValueNotifier
  <List<TOTPOjbModel>> totpList = ValueNotifier([]);

  DataShared get dataShared => DataShared.instance;

  void initData() async {
    setState(ViewState.busy);
    Result<List<TOTPOjbModel>, Exception> totpResult = await totpUsecase.getAllTOTP();
    if(totpResult.isSuccess){
      totpList.value = totpResult.data??[];
    
    }else{
      customLogger(msg: totpResult.error.toString(), typeLogger: TypeLogger.error);
    }
    setState(ViewState.idle);
  }
}