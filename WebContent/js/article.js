//
//
//layui.use(['layedit', 'layer', 'element'], function(){
//  const $ = layui.$
//  const layedit = layui.layedit;
//  const layer = layui.layer
//
//
//  const idx = layedit.build('comment-txt', {
//    tool: [],
//    height: 160
//  }); //建立编辑器
//
//  $(".layui-unselect.layui-layedit-tool").hide()
//
//  
//
//  $(".commment button").click(async () => {
//    let content = layedit.getContent(idx).trim()
//
//    if(content.length === 0)return layer.msg("评论内容不能为空")
//
//    const data = {
//      content,
//      article: $(".art-title").data("artid")
//    }
//
//    $.post("/comment", data, (data) => {
//      layer.msg(data.msg, {
//        time: 1000,
//        end(){
//          if(data.status === 1){
//            // 评论成功就承载页面
//            window.location.reload()
//          }
//        }
//      })
//    })
//  })
//});

layui.use(['form', 'layedit', "element"], function() {
  const form = layui.form;
  const layedit = layui.layedit;
  const $ = layui.$

  const index = layedit.build('article-content', {
    hideTool: [
      'image' //插入图片
    ]
  }); //建立编辑器

  form.on("submit(send)", (res) => {
    const { tips, title } = res.field

    if(layedit.getText(index).trim().length === 0)return layer.alert("请输入内容")
    
    const data = {
      tips,
      title,
      content: layedit.getContent(index)
    }

//    $.post("article.do", data, (msg) => {
//      if(msg.status){
//        layer.alert('发表成功', (res) => {
//          location.href = "/"
//        })
//      }else{
//        layer.alert(`发表失败，失败信息：${msg.msg}`)
//      }
//    }
//    )
  })


  //- let res = 0

  //- const proving = () => {
  //-   const sym = ["+", '-', '*', '/']

  //-   let num1 = parseInt(Math.random()*100)
  //-   let num2 = parseInt(Math.random()*100)

  //-   let str = num1 + sym[parseInt(Math.random() * (sym.length - 1))] + num2

  //-   $(".result").html(str)
  //-   res = eval(str)
  //- }
  //- proving()
  //- // 验证
  //- $("button").on("click", () => {
  //-   if($("#L_vercode").val()*1 === res){

  //-   }
  //- })

});

