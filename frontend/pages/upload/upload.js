var app = getApp()
Page({
  data: {
    tempFilePaths: ''
  },
  onLoad: function () {
  },
  chooseimage: function () {
    var _this = this;
    wx.chooseImage({
      // count: 1, // 默认9  
      // sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有  
      // sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有  
      success: function (res) {
        // 返回选定照片的本地文件路径列表，tempFilePath可以作为img标签的src属性显示图片  
        // _this.setData({
        //   tempFilePaths: res.tempFilePaths
        // })
        var tempFilePaths = res.tempFilePaths  
        wx.uploadFile({
          url: app.d.ceshiUrl + '/Api/UploadImg/uploadimg',
          filePath: tempFilePaths[0],
          name: 'file',
          formData: {
            'user': 'test'
          },
          success: function (res) {
            var that = _this;
            var data = JSON.parse(res.data);
            if(data.status == 1){
              that.setData({
                tempFilePaths: data.url
              })
              //do something
              wx.showToast({
                title: '上传成功',
                duration: 2000
              });
            }else{
              wx.showToast({
                title: '上传失败',
                duration: 2000
              });
             
            }
           
          }
        })

      }
    })
  }
})  