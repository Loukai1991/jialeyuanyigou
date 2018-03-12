<?php
/**
 * 文件名：DownloadQrcode.php
 *
 * 模块：
 *
 * 功能：生成二维码
 *
 * @copyright Copyright (c) 2015 – www.hongshu.com
 * @author    : Administrator
 * @version   :
 */

namespace Api\Controller;


class DownloadQrcodeController extends PublicController
{
    //获取access_token
    public function get_access_token(){
        $appid = C('weixin.appid');
        $secret = C('weixin.secret');
        $url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid={$appid}&secret={$secret}";
        return $data = $this->curl_get($url);
    }
    
    public function curl_get($url) {
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $data = curl_exec($curl);
        curl_close($curl);
        return $data;
    }
    //获得二维码
    public function get_qrcode() {
//        header('content-type:image/gif');
        $uid = I('uid',0,'intval');
        //        if(!$uid){
        //            echo json_encode(array('status'=>0,'message'=>'参数错误，没有识别到用户身份'));
        //        }
        $data = array();
        $data['scene'] = "uid=" . $uid;
        $data['page'] = "pages/index/index";
        $data = json_encode($data);
        $access = json_decode($this->get_access_token(),true);
        $access_token= $access['access_token'];
        $url = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=" . $access_token;
        $da = $this->get_http_array($url,$data);
        var_dump($da);die;
        echo json_encode(array('status'=>1,'pictures'=>$da));
//        $this->assign('data',$da);
//        $this->fetch();
        
    }
    public function get_http_array($url,$post_data) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        // curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);   //没有这个会自动输出，不用print_r();也会在后面多个1
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
        $output = curl_exec($ch);
        curl_close($ch);
        $out = json_decode($output);
        return $out;
    }
    
    
}