<?php
/**
 * 文件名：UploadImg.php
 *
 * 模块：
 *
 * 功能：做微信小程序上传图片测试
 *
 * @copyright Copyright (c) 2015 – www.hongshu.com
 * @author    : Administrator
 * @version   :
 */

namespace Api\Controller;

class UploadImgController extends PublicController
{
    public function uploadimg(){
   
        //调用上传类
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     100 * 1024 ;// 设置附件上传大小
        $upload->exts      =     array('jpg', 'gif', 'png');// 设置附件上传类型
        $upload->rootPath  =   '/var/www/html/Data/UploadFiles/fromminiprogram/'; // 设置附件上传根目录
//        $upload->savePath  =  dirname(getBookStaticFilepath($bid)).'/'; // 设置附件上传（子）目录
        $upload->autoSub = false;  //不要生成日期子目录
    
    
        //上传文件
        $info   =   $upload->upload();
        
        if(!$info) {    // 上传错误提示错误信息
            $result['code'] = 0;
            $result['msg'] = $upload->getError();
            $this->ajaxReturn($result);
        }
        $imgurl = 'https://22688155.shrlc.org/Data/UploadFiles/fromminiprogram/'.$info['file']['savename'];
        echo json_encode(array('status'=>1,'msg'=>'上传成功','url'=>$imgurl));
        exit();
    
    }
}