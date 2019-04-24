import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier{
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;//子类高亮索引;
  String categoryId = '4';//大分类ID
  String subId = '';//小类id
  int page = 1;//列表页码
  String noMoreText = '';//显示没有数据的文字
  // 大类切换逻辑
  getChildCategory(List<BxMallSubDto> list,String id){
    page = 1;
    childIndex = 0;
    categoryId = id;
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '';
    all.mallCategoryId ='0';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }
  // 改变子类索引
  changeChildIndex(index, String id){
    page = 1;
    noMoreText = '';
    childIndex = index;
    subId = id;
    notifyListeners();
  }
  //增加page的方法
  addPage(){
    page++;
  }
  //改变没有数据提示文字
  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }
}