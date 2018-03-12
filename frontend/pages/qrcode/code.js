// pages/panic/panic.js
var app = getApp();
Page({
  data:{
    userinfo: [],
    Qrcodeimg:[]
  },
   
  onLoad:function(){
    // 页面初始化 options为页面跳转所带来的参数
    var that = this;
    that.setData({
      userInfo: app.globalData.userInfo,
    })
    // 获取二维码
    this.getQrcode();
  },
  getQrcode: function(){
    var that = this;
    wx.request({
      url: app.d.ceshiUrl + '/Api/DownloadQrcode/get_qrcode',
      method: 'post',
      data: {uid: app.d.userId,},
      header: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      success: function (res) {
        console.log(res);
        var picture = res.data.picture;
        that.setData({
          Qrcodeimg: picture,
        });
        //endInitData
      },
      error: function (e) {
        wx.showToast({
          title: '网络异常！',
          duration: 2000
        });
      },
    });
  },
  onReady:function(){
    // 页面渲染完成
  },
  onShow:function(){
    // 页面显示
  },
  onHide:function(){
    // 页面隐藏
  },
  onUnload:function(){
    // 页面关闭
  }
})