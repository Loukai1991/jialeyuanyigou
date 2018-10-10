<?php
namespace Admin\Controller;
use Think\Controller;
class UserController extends PublicController{

	//*************************
	// 普通会员的管理
	//*************************
	public function index(){
//		$aaa_pts_qx=1;
//		$type=$_GET['type'];
//		$id=(int)$_GET['id'];
//		$tel = trim($_REQUEST['tel']);
		$name = trim($_REQUEST['name']);  //找人
        $fensi = trim($_REQUEST['fensi']); //找粉丝
        if(!empty($fensi) && !is_numeric($fensi)){
            $this->error('找ta的粉丝要填ta的ID哦，不要填名称');
            exit();
        }
        if(!empty($name) && !empty($fensi)){
            $this->error('要么找人，要么找ta粉丝，只能填一个');
            exit();
        }
       
		$names=$this->htmlentities_u8($_GET['name']);
		//搜索
//		$where="1=1";
//		$name!='' ? $where.=" and name like '%$name%'" : null;
//		$tel!='' ? $where.=" and tel like '%$tel%'" : null;
        $where = array();
        if(!empty($name)){
            $where['name'] = array('like','%'.$name.'%');
        }elseif(!empty($fensi)){
            $fensi = intval($fensi);
            $where['pid'] = $fensi;
        }
		define('rows',20);
		$count=M('user')->where($where)->count();
		$rows=ceil($count/rows);

		$page=(int)$_GET['page'];
		$page<0?$page=0:'';
		$limit=$page*rows;
		$userlist=M('user')->where($where)->order('id desc')->limit($limit,rows)->select();
		$page_index=$this->page_index($count,$rows,$page);
		foreach ($userlist as $k => $v) {
			$userlist[$k]['addtime']=date("Y-m-d H:i",$v['addtime']);
			//获取我的推荐人姓名
            $pid = $v['pid'];
            $p_name = '无';
            if($pid && $pid != 1){
                $p_name = M('user')->where(array('id'=>$pid))->getField('name');
            }
            $userlist[$k]['p_name'] = $p_name;
		}
		//当前取谁的粉丝
        if(!empty($fensi)){
		    $pid_name = M('user')->where(array('id'=>$fensi))->getField('name');
		    $this->assign('p_name',$pid_name);
        }
		//====================
		// 将GET到的参数输出
		//=====================
		$this->assign('name',$name);
        $this->assign('fensi',$_REQUEST['fensi']);
		//=============
		//将变量输出
		//=============
		$this->assign('page_index',$page_index);
		$this->assign('page',$page);
		$this->assign('userlist',$userlist);
		$this->display();	
	}

	//*************************
	//会员地址管理
	//*************************
	public function address(){
		// $aaa_pts_qx=1;
		$id=(int)$_GET['id'];
		if($id<1){return;}
		if($_GET['type']=='del' && $id>0 && $_SESSION['admininfo']['qx']==4){
		  $this->delete('address',$id);
		}
		//搜索
		$address=M('address')->where("uid=$id")->select();
		
	    //=============
		//将变量输出
		//=============
		$this->assign('address',$address);
		$this->display();
	}

	public function del()
	{
		$id = intval($_REQUEST['did']);
		$info = M('user')->where('id='.intval($id))->find();
		if (!$info) {
			$this->error('会员信息错误.'.__LINE__);
			exit();
		}

		$data=array();
		$data['del'] = $info['del'] == '1' ?  0 : 1;
		$up = M('user')->where('id='.intval($id))->save($data);
		if ($up) {
			$this->redirect('User/index',array('page'=>intval($_REQUEST['page'])));
			exit();
		}else{
			$this->error('操作失败.');
			exit();
		}
	}	
}