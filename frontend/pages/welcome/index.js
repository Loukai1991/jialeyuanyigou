var app = getApp();
Page({
    data: {
        //判断小程序的API，回调，参数，组件等是否在当前版本可用。
        canIUse: wx.canIUse('button.open-type.getUserInfo')
    },
    onLoad: function () {
        var that = this;
        // 查看是否授权
        wx.getSetting({
            success: function (res) {
                if (res.authSetting['scope.userInfo']) {
                    wx.getUserInfo({
                        success: function (res) {
                            app.globalData.userInfo = res.userInfo
                        
                            that.getUserInfo();
                          console.log('zouzheli')
                          console.log(app.globalData)
                            if (app.globalData.pid && app.d.userId) {
                                console.log('在welcome页面写入pid,其中pid是' + app.globalData.pid + 'uid是' + app.d.userId);
                                that.writepid();
                            }

                            //授权成功后，跳转进入小程序首页
                            wx.switchTab({
                                url: '/pages/user/user'
                            })
                        }
                    });
                }
            }
        })
    },
    writepid:function(){
        wx.request({
            url: app.d.ceshiUrl + '/Api/Index/writepid',
            method: 'post',
            data: { pid: app.globalData.pid, uid: app.d.userId },
            header: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            success: function (res) {
                console.log(res)
            }
        })
    },
    bindGetUserInfo: function (e) {
        var that = this;
        if (e.detail.userInfo) {
            //用户按了允许授权按钮
            app.globalData.userInfo = e.detail.userInfo
            that.getUserInfo();
          console.log('zou哪里li')
          console.log(app.globalData)
            if (app.globalData.pid && app.d.userId) {
                console.log('在welcome2页面写入pid,其中pid是' + app.globalData.pi + 'uid是' + app.d.userId);
                that.writepid();
            }
            //授权成功后，跳转进入小程序首页
            wx.switchTab({
                url: '/pages/user/user'
            })
        } else {
            //用户按了拒绝按钮
            wx.showModal({
                title:'警告',
                content:'您点击了拒绝授权，将无法进入小程序，请授权之后再进入!!!',
                showCancel:false,
                confirmText:'返回授权',
                success:function(res){
                    if (res.confirm) {
                        console.log('用户点击了“返回授权”')
                    }
                }
            })
        }
    },
    //获取用户信息接口
    queryUsreInfo: function () {
        wx.request({
            url: getApp().globalData.urlPath + 'hstc_interface/queryByOpenid',
            data: {
                openid: getApp().globalData.openid
            },
            header: {
                'content-type': 'application/json'
            },
            success: function (res) {
                console.log(res.data);
                getApp().globalData.userInfo = res.data;
            }
        })
    },

    getUserInfo: function (cb) {
        var that = this
        if (app.globalData.userInfo) {
            typeof cb == "function" && cb(app.globalData.userInfo)
        } else {
            //调用登录接口
            wx.login({
                success: function (res) {
                    var code = res.code;
                    //get wx user simple info
                    wx.getUserInfo({
                        success: function (res) {
                            app.globalData.userInfo = res.userInfo
                            typeof cb == "function" && cb(app.globalData.userInfo);
                            //get user sessionKey
                            //get sessionKey
                            that.getUserSessionKey(code);
                        }
                    });
                }
            });
        }
    },

    getUserSessionKey: function (code) {
        //用户的订单状态
        var that = this;
        wx.request({
            url: app.d.ceshiUrl + '/Api/Login/getsessionkey',
            method: 'post',
            data: {
                code: code
            },
            header: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            success: function (res) {
                //--init data
                var data = res.data;
                if (data.status == 0) {
                    wx.showToast({
                        title: data.err,
                        duration: 2000
                    });
                    return false;
                }

                app.globalData.userInfo['sessionId'] = data.session_key;
                app.globalData.userInfo['openid'] = data.openid;
                that.onLoginUser();
            },
            fail: function (e) {
                wx.showToast({
                    title: '网络异常！err:getsessionkeys',
                    duration: 2000
                });
            },
        });
    },
    onLoginUser: function () {
        var that = this;
        var user = app.globalData.userInfo;
        wx.request({
            url: app.d.ceshiUrl + '/Api/Login/authlogin',
            method: 'post',
            data: {
                SessionId: user.sessionId,
                gender: user.gender,
                NickName: user.nickName,
                HeadUrl: user.avatarUrl,
                openid: user.openid
            },
            header: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            success: function (res) {
                //--init data
                var data = res.data.arr;
                var status = res.data.status;
                if (status != 1) {
                    wx.showToast({
                        title: res.data.err,
                        duration: 3000
                    });
                    return false;
                }
                app.globalData.userInfo['id'] = data.ID;
                app.globalData.userInfo['NickName'] = data.NickName;
                app.globalData.userInfo['HeadUrl'] = data.HeadUrl;
                var userId = data.ID;
                if (!userId) {
                    wx.showToast({
                        title: '登录失败！',
                        duration: 3000
                    });
                    return false;
                }
                app.d.userId = userId;
            },
            fail: function (e) {
                wx.showToast({
                    title: '网络异常！err:authlogin',
                    duration: 2000
                });
            },
        });
    },

})