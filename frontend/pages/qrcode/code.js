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
    console.log('uid' + app.d.userId);
    wx.request({
      url: app.d.ceshiUrl + '/Api/Qrcode/getqrcode',
      method: 'post',
      data: {uid: app.d.userId,},
      header: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      success: function (res) {
        console.log('qrcode');
        console.log(res);
        var picture = res.data.src;
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
  saveImgToPhotosAlbumTap: function () {
    wx.downloadFile({
      url: this.data.Qrcodeimg,
      success: function (res) {
        wx.saveImageToPhotosAlbum({
          filePath: res.tempFilePath,
          success: function (res) {
            wx.showToast({
              title: '保存成功',
              icon: 'success',
              duration: 2000
            })  
          },
          fail: function (res) {
            wx.showToast({
              title: '保存失败',
              icon: 'success',
              duration: 2000
            })  
          }
        })
      },
      fail: function () {
      }
    })
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