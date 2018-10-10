<?php
namespace Api\Model;
use Think\Model;
class OrderModel extends Model {
	protected $startime = 0;
	protected $endtime = 0;
	const FIRSTPRIZE = '8%';  //一代
	const SECONDEPRIZE = '5%';  //二代
	const THIRDPRIZE = '3%';  //三代

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
		if(!$param['uid']){
			$this->error = '参数错误';
			return false;
		}

		$uid = $param['uid'];

		//得出起止时间
		$this->get_time_range();
		//静态奖励
		$staticprize = $this->getstaticprize($uid, $this->startime, $this->endtime);

		//动态奖励
		$dynamicprize = $this->getdynamicprize($uid, $this->startime, $this->endtime);
		//总收入
		$total = $staticprize + $dynamicprize;
		//推荐人姓名
		$tuijianren = '';
		$pid = M('user')->where(array('id'=>$uid))->getField('pid');
	
		if(!empty($pid)){
			$tuijianren = M('user')->where(array('id'=>$pid))->getField('name');
		}

		// //我的粉丝们名单+我的粉丝们总数
		$fensilist = M('user')->where(array('pid'=>$uid))->field('name,photo')->select();
		if(!empty($fensilist)){
			$num = count($fensilist);
		}else{
			$num = 0;
		}
		
		
		return ['static'=>$staticprize, 'dynamic'=>$dynamicprize, 'total'=>$total,'num'=>$num,'fensilist'=>$fensilist,'tuijianren'=>$tuijianren];
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
		$field = 'amount, product_num';  //TODO 金额和数量是相乘的关系吗
		$rows = $this->getamount($map,$field);
		//处理数据
		$staticprize = 0;
		if(empty($rows)){
			return $staticprize;
		}
		foreach($rows as &$row){
			$row['theday_total'] = intval($row['amount']*$row['product_num']);
			$staticprize +=$row['theday_total'];
		}
		return $staticprize;
	}

	/**
	 * 获取动态奖励
	 * @param $id
	 * @param $starttime
	 * @param $endtime
	 * @return float|int
	 */
	public function getdynamicprize($id, $starttime, $endtime){
		$children = $this->getChildren($id);
		$first = $children['first'];
		$second = $children['second'];
		$third = $children['third'];
		if(empty($first) && empty($second) && empty($third)){
			return 0;
		}
		//组合查询条件
		//时间和付款状态为公用
		$map['status'] = ['gt',10];
		$map['addtime'] = ['between',[$starttime,$endtime]];
		$field = 'amount, product_num';  //TODO 金额和数量是相乘的关系吗
		$map_third = $map_second = $map_first = $map;

		$map_first['id'] = ['in', $first];
		$rows_first = $this->getamount($map_first, $field);

		$prize_second = $prize_third = 0;
		$prize_first = $this->geteachdynamicprize($rows_first, self::FIRSTPRIZE);
		if(!empty($second)){
			$map_second['id'] = ['in', $second];
			$rows_second = $this->getamount($map_second, $field);
			$prize_second = $this->geteachdynamicprize($rows_second , self::SECONDEPRIZE);
			if(!empty($third)){
				$map_third['id'] = ['in', $third];
				$rows_third = $this->getamount($map_third, $field);
				$prize_third = $this->geteachdynamicprize($rows_third, self::THIRDPRIZE);
			}
		}
		
		//合计
		$sum_dynamicprize = $prize_first + $prize_second + $prize_third;
		return $sum_dynamicprize;

	}

	/**
	 * 计算各代的动态奖励
	 * @param $rows
	 * @param $level 代数
	 * @return float|int
	 */
	public function geteachdynamicprize($rows, $level){
		$prize = 0;
		foreach($rows as $arr){
			$arr['theday_total'] = intval($arr['amout']*$arr['product_num']);
			$prize += $arr['theday_total'];
		}

		if($prize){
			$prize = round($prize * $level, 2);
		}

		return $prize;
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

	/**
	 * 获取下面三代
	 * @param $id
	 * @return array
	 */
	public function getChildren($id){
		//获取一代所有id
		$map_fchild['pid'] = $id;
		$firstchildren = $this->getids($map_fchild);
		if(!empty($firstchildren)){
			//获取二代所有id
			$map_schild['pid'] = array('in', $firstchildren);
			$secondchildren = $this->getids($map_schild);
			if(!empty($secondchildren)){
				//获取三代所有id
				$map_tchild['pid'] = array('in', $secondchildren);
				$thirdchildren = $this->getids($map_tchild);
			}
		}
		$secondchildren = $secondchildren ? $secondchildren : '';
		$thirdchildren = $thirdchildren ? $thirdchildren : '';

		return ['first'=>$firstchildren, 'second'=>$secondchildren, 'third'=>$thirdchildren];
	}

	/**
	 * 查询id的集合
	 * @param array $map
	 * @return mixed
	 */
	public function getids(array $map){
		return M('user')->where($map)->getField('id', true);
	}

	/**
	 * 计算起止时间
	 * @return bool
	 */
	public function get_time_range(){
		//计算昨日起始时间
		$starttime = $endtime = 0;
		getRelativeTime(NOW_TIME,'lastday',$starttime,$endtime);
		$this->startime = $starttime;
		$this->endtime = $endtime;
		return true;
	}
}