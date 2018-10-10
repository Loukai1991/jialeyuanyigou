<?php
// 本类由系统自动生成，仅供测试用途
namespace Api\Controller;
use Think\Controller;
class QrcodeController extends PublicController {
	//获取二维码升级版，将二维码中间的图像处理成用户微信的头像
	public function getqrcode(){

		$id = I('uid', 0, 'intval');

		if(!$id){
			$this->ajaxReturn(['code'=>0,'msg'=>'系统错误', 'data'=>$_REQUEST]);
		}

		//判断服务器有没有已经生成二维码，不要重复生成
		$picturedir = '/www/wwwroot/qqiqq.xyz/Data/UploadFiles/qrcode/';
		$filepath = $picturedir.$id.'.png';
		$src = "https://qqiqq.xyz/Data/UploadFiles/qrcode/".$id.'.png';

		if(file_exists($filepath)){
			echo json_encode(['src'=>$src,'code'=>1, 'msg'=>'已存在']);
			exit();
		}

		$path="pages/user/user?uid=".$id;
		$width=430;
		$post_data='{"path":"'.$path.'","width":'.$width.'}';

		$access_token = $this->getaccesstoken();
		if(!$access_token){
			echo json_encode(['code'=>0,'msg'=>'系统错误，没有获取到token']);
			exit();
		}
		$url="https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token=".$access_token;
		// $url="https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=".$access_token;
		$resWxQrCode=$this->api_notice_increment($url,$post_data);
		//获取到二维码以后，开始将微信头像放到二维码中间
		//获取用户头像
		$avatarUrl = M('user')->where(['id'=>$id])->getField('photo');
		//用户头像图片变圆形
		if(!empty($avatarUrl)){
			$avatar = file_get_contents($avatarUrl);
			$logo   = $this->yuanImg($avatar);//返回的是图片数据流
			//二维码与头像结合
			$sharePic = $this->qrcodeWithLogo($resWxQrCode,$logo);
		}else{
			$sharePic = $resWxQrCode;
		}
	
		$bool = file_put_contents($filepath, $sharePic);
		$res = ['src'=>$src,'code'=>1,'msg'=>'ok'];
		$this->ajaxReturn($res);
	}

	 /** 
	 * 剪切图片为圆形 
	 * @param  $picture 图片数据流 比如file_get_contents(imageurl)返回的东东
	 * @return 图片数据流
	 */  
	protected function yuanImg($picture) {  
	    $src_img = imagecreatefromstring($picture);
	    $w   = imagesx($src_img);
	    $h   = imagesy($src_img);  
	    $w   = min($w, $h);  
	    $h   = $w;  
	    $img = imagecreatetruecolor($w, $h);  
	    //这一句一定要有
	    imagesavealpha($img, true);
	    //拾取一个完全透明的颜色,最后一个参数127为全透明  
	    $bg = imagecolorallocatealpha($img, 255, 255, 255, 127);  
	    imagefill($img, 0, 0, $bg);  
	    $r   = $w / 2; //圆半径  
	    $y_x = $r; //圆心X坐标  
	    $y_y = $r; //圆心Y坐标  
	    for ($x = 0; $x < $w; $x++) {  
	        for ($y = 0; $y < $h; $y++) {  
	            $rgbColor = imagecolorat($src_img, $x, $y);  
	            if (((($x - $r) * ($x - $r) + ($y - $r) * ($y - $r)) < ($r * $r))) {  
	                imagesetpixel($img, $x, $y, $rgbColor);  
	            }  
	        }  
	    }  
	    /**
	     * 如果想要直接输出图片，应该先设header。header("Content-Type: image/png; charset=utf-8");
	     * 并且去掉缓存区函数
	     */
	    //获取输出缓存，否则imagepng会把图片输出到浏览器
	    ob_start();
	    imagepng ( $img );
	    imagedestroy($img);         
	    $contents =  ob_get_contents();
	    ob_end_clean();
	    return $contents;    
	}

	/**
	 * 在二维码的中间区域镶嵌图片
	 * @param $QR 二维码数据流。比如file_get_contents(imageurl)返回的东东,或者微信给返回的东东
	 * @param $logo 中间显示图片的数据流。比如file_get_contents(imageurl)返回的东东
	 * @return  返回图片数据流
	 */
	 protected function qrcodeWithLogo($QR,$logo){
	    $QR   = imagecreatefromstring ($QR);
	    $logo = imagecreatefromstring ($logo);
	    $QR_width    = imagesx ( $QR );//二维码图片宽度
	    $QR_height   = imagesy ( $QR );//二维码图片高度
	    $logo_width  = imagesx ( $logo );//logo图片宽度
	    $logo_height = imagesy ( $logo );//logo图片高度   
	    $logo_qr_width  = $QR_width / 3;//组合之后logo的宽度(占二维码的1/2.2) 
	    $scale  = $logo_width / $logo_qr_width;//logo的宽度缩放比(本身宽度/组合后的宽度)
	    $logo_qr_height = $logo_height / $scale;//组合之后logo的高度 
	    $from_width = ($QR_width - $logo_qr_width) / 2;//组合之后logo左上角所在坐标点
	    /**
	     * 重新组合图片并调整大小 
	     * imagecopyresampled() 将一幅图像(源图象)中的一块正方形区域拷贝到另一个图像中 
	    */
	    imagecopyresampled ( $QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width, $logo_qr_height, $logo_width, $logo_height );
	    /**
	     * 如果想要直接输出图片，应该先设header。header("Content-Type: image/png; charset=utf-8");
	     * 并且去掉缓存区函数
	     */
	    //获取输出缓存，否则imagepng会把图片输出到浏览器
	    ob_start();
	    imagepng ( $QR );
	    imagedestroy($QR);
	    imagedestroy($logo); 
	    $contents =  ob_get_contents();
	    ob_end_clean();     
	    return $contents;
	}

	// /**
	//  * 用户获取二维码接口 原始版本，直接获取微信二维码输出。不处理中间的图像
	//  */
	// public function getqrcode(){
	// 	$id = I('uid', 0, 'intval');
	// 	if(!$id){
	// 		$this->ajaxReturn(['code'=>0,'msg'=>'系统错误', 'data'=>$_REQUEST]);
	// 	}

	// 	//判断服务器有没有已经生成二维码，不要重复生成
	// 	$picturedir = '/www/wwwroot/qqiqq.xyz/Data/UploadFiles/qrcode/';
	// 	$filepath = $picturedir.$id.'.png';
	// 	$src = "https://qqiqq.xyz/Data/UploadFiles/qrcode/".$id.'.png';

	// 	if(file_exists($filepath)){
	// 		echo json_encode(['src'=>$src,'code'=>1, 'msg'=>'已存在']);
	// 		exit();
	// 	}

	// 	$path="pages/user/user?uid=".$id;
	// 	$width=430;
	// 	$post_data='{"path":"'.$path.'","width":'.$width.'}';

	// 	$access_token = $this->getaccesstoken();
	// 	if(!$access_token){
	// 		echo json_encode(['code'=>0,'msg'=>'系统错误，没有获取到token']);
	// 		exit();
	// 	}
	// 	$url="https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token=".$access_token;
	// 	// $url="https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=".$access_token;
	// 	$result=$this->api_notice_increment($url,$post_data);
	// 	$bool = file_put_contents($filepath, $result);
	// 	$res = ['src'=>$src,'code'=>1,'msg'=>'ok'];
	// 	$this->ajaxReturn($res);
	// }

	public function getaccesstoken(){
		$wx_config = C('weixin');
		$appid = $wx_config['appid'];
		$secret = $wx_config['secret'];
		$url_access_token = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=".$appid."&secret=".$secret;

		$getArr=array();
		$tokenArr=json_decode($this->send_post($url_access_token, $getArr, "GET"));
		$access_token=$tokenArr->access_token;
		return $access_token;
	}

	public function send_post($url, $post_data,$method='POST') {
		$postdata = http_build_query($post_data);
		$options = array(
		'http' => array(
		'method' => $method, //or GET
		'header' => 'Content-type:application/x-www-form-urlencoded',
		'content' => $postdata,
		'timeout' => 15 * 60 // 超时时间（单位:s）
		)
		);
		$context = stream_context_create($options);
		$result = file_get_contents($url, false, $context);
		return $result;
	}

	public function api_notice_increment($url, $data){
		$ch = curl_init();
		$header = "Accept-Charset: utf-8";
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
		curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (compatible; MSIE 5.01; Windows NT 5.0)');
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$tmpInfo = curl_exec($ch);
//		     var_dump($tmpInfo);
//		    exit;
		if (curl_errno($ch)) {
			return false;
		}else{
			// var_dump($tmpInfo);
			return $tmpInfo;
		}
	}

}