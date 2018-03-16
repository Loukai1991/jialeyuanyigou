<?php
namespace Home\Model;
use Think\Model;
class OrderModel extends Model {
    protected $startime = 0;
    protected $endtime = 0;
    
	 public function getuid($oppenid){
	     if(!$oppenid){
	         $this->error = '参数错误';
	         return false;
         }
         $uid = M('user')->where(['oppenid'=>$oppenid])->getField('id');
	     return $uid;
     }
     
     public function getchildrenuids($uid){
	     if(!$uid){
	         $this->error = '参数错误';
	         return false;
         }
         
         $uids = M('user')->where(['pid'=>$uid])->field('id');
	     return $uids;
     }
    
    /**
     * 当日只计算昨日收入
     * @param array $param
     *
     * @return bool
     *
     */
     public function getYestIncome(array $param){
	     if($param['oppenid']){
	         $uid = $this->getuid($param['oppenid']);
         }else{
	         $this->error = '参数错误';
	         return false;
         }
         if(!$uid){
	         $this->error = '参数错误';
	         return false;
         }
         //得出起止时间
         $this->get_time_range();
         //静态奖励
         $staticprize = $this->getstaticprize($uid, $this->startime, $this->endtime);
         //动态奖励
         $dynamicprize = $this->getdynamicprize($uid, $this->startime, $this->endtime);
         
         return ['static'=>$staticprize, 'dynamic'=>$dynamicprize];
     }
    
    /**
     * 获取指定日期范围静态奖
     * @param $id
     * @param $starttime
     * @param $endtime
     *
     * @return int
     */
     public function getstaticprize($id,$starttime,$endtime){
         //获取订单额
        $map['status'] = ['gt',10];
        $map['id'] = $id;
        $map['addtime'] = ['between',[$starttime,$endtime]];
        $field = 'amount, product_num';
        $rows = $this->getamount($map,$field);
        //处理数据
        $staticprize = 0;
        foreach($rows as &$row){
            $row['theday_total'] = intval($row['amount']*$row['product_num']);
            $staticprize +=$row['theday_total'];
        }
        return $staticprize;
    }
    
    /**
     * 获取指定条件订单金额
     * @param $map
     * @param $field
     *
     * @return mixed
     */
    public function getamount($map,$field){
         return $this->where($map)->field($field)->select();
    }
    public function getdynamicprize($id, $starttime, $endtime){
    
    }
     
     public function get_time_range(){
         //计算昨日起始时间
         $starttime = $endtime = 0;
         getRelativeTime(NOW_TIME,'lastday',$starttime,$endtime);
         $this->startime = $starttime;
         $this->endtime = $endtime;
         return true;
     }
}