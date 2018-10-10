// pages/user/user.js
var app = getApp()
Page( {
    data: {
        userInfo: {},
        orderInfo:{},
        projectSource: 'https://github.com/liuxuanqiang/wechat-weapp-mall',
        userListInfo: [ {
            icon: '../../images/iconfont-dingdan.png',
            text: '我的订单',
            isunread: true,
            unreadNum: 2
        }, {
            icon: '../../images/iconfont-card.png',
            text: '我的代金券',
            isunread: false,
            unreadNum: 2
        }, {
            icon: '../../images/iconfont-icontuan.png',
            text: '我的拼团',
            isunread: true,
            unreadNum: 1
        }, {
            icon: '../../images/iconfont-shouhuodizhi.png',
            text: '收货地址管理'
        }, {
            icon: '../../images/iconfont-kefu.png',
            text: '联系客服'
        }, {
            icon: '../../images/iconfont-help.png',
            text: '常见问题'
        }],
        loadingText: '加载中...',
        loadingHidden: false,
    },
    onLoad: function (options) {
        var pid = options.uid;
        if(pid){
            app.globalData.pid = pid;
        }
        var that = this
        //调用应用实例的方法获取全局数据
        app.getUserInfo(function(userInfo){
            //更新数据
            that.setData({
                userInfo:userInfo,
                loadingHidden: true
            })
        });
        //如果没有uid，退出去重新授权登录
        if (!app.d.userId){
            wx.navigateTo({
                url: '/pages/welcome/index',
            })
        }
        //写入pid和uid绑定关系
        console.log('直接在user页面写入pid,其中pid是' + app.globalData.pi + 'uid是' + app.d.userId);
        if (app.globalData.pid && app.d.userId){
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

        }

        this.loadOrderStatus();
    },
    onShow:function(){
        this.loadOrderStatus();
    },
    loadOrderStatus:function(){
        //获取用户订单数据
        var that = this;
        wx.request({
            url: app.d.ceshiUrl + '/Api/User/getorder',
            method:'post',
            data: {
                userId:app.d.userId,
            },
            header: {
                'Content-Type':  'application/x-www-form-urlencoded'
            },
            success: function (res) {
                //--init data
                var status = res.data.status;
                if(status==1){
                    var orderInfo = res.data.orderInfo;
                    that.setData({
                        orderInfo: orderInfo
                    });
                }else{
                    wx.showToast({
                        title: '非法操作.',
                        duration: 2000
                    });
                }
            },
            error:function(e){
                wx.showToast({
                    title: '网络异常！',
                    duration: 2000
                });
            }
        });
    },
    onShareAppMessage: function () {
        var userId = this.data.userInfo.id
        return {
            title: '家乐园易购',
            path: '/pages/index/index?userId='+userId,
            success: function (res) {
                // 分享成功
            },
            fail: function (res) {
                // 分享失败
            }
        }
    }
})