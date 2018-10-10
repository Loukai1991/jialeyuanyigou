<?php
// 本类由系统自动生成，仅供测试用途
namespace Api\Controller;
use Api\Model\OrderModel;
use Think\Controller;
class IncomeController extends PublicController {

    /**
     * 获取每日收入
     * 返回：static静态奖励、dynamic动态奖励、total收入合计
     */
    public function getPerDayIncome(){
        $orderModel = new OrderModel();
        $param['uid'] = I('uid', 0, 'intval');
        $income = $orderModel->getYestIncome($param);
        $this->ajaxReturn(array('income'=>$income));
    }

}