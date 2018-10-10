// pages/panic/panic.js
var app = getApp();
Page({
  data: {
    static: 0,
    dynamic: 0,
    total:0,
    tuijianren:'',
    num:0,
    fensilist:{}
  },

  onLoad: function () {
    // 页面初始化 options为页面跳转所带来的参数
    var that = this;
    that.setData({
      userInfo: app.globalData.userInfo,
    })
    // 获取二维码
    this.getincome();
  },
  getincome: function () {
    var that = this;
    wx.request({
      url: app.d.ceshiUrl + '/Api/Income/getPerDayIncome',
      method: 'post',
      data: { uid: app.d.userId, },
      header: {
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      success: function (res) {
        var income = res.data.income;
        console.log(income);
        that.setData({
          static: income.static,
          dynamic:income.dynamic,
          total:income.total,
          num:income.num,
          fensilist: income.fensilist,
          tuijianren: income.tuijianren
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
  onReady: function () {
    // 页面渲染完成
  },
  onShow: function () {
    // 页面显示
  },
  onHide: function () {
    // 页面隐藏
  },
  onUnload: function () {
    // 页面关闭
  }
  
})