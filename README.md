使用[Railway](https://railway.app)免费部署，从ChatGPT网站模拟使用API（默认不登录账号使用）  
https://github.com/xqdoo00o/ChatGPT-to-API  
### 使用步骤
- 一、登录你的github，新建一个**私有**的空白repository，将本项目的`Dockerfile`和`api_keys.txt`复制到你的项目
  + `api_keys.txt`里的内容可以编辑，用于API鉴权
  + 如果你想登录账号使用，需完成以下两个步骤（不登录账号则忽略此步）
    + 在repository新建`harPool`文件夹，将`chatgpt.com.har`文件上传到文件夹内，并且Dockerfile倒数第二行新起一行增加`COPY harPool/ /cta/harPool/`
    + 在repository新建`accounts.txt`文件，按如下格式录入保存账号信息，并且Dockerfile倒数第二行新起一行增加`COPY accounts.txt .`
      ```bash
      邮箱:密码
      邮箱:密码
      ...
      ```
  + 你也可以直接fork本仓库（不建议，因为非付费github用户fork完之后无法设为私有，你的项目存在隐私泄露及滥用的风险，尤其是如果添加了账号信息则相当于完全公开了）
- 二、打开[Railway](https://railway.app)，右上角点击login选择github方式登录，右上方继续点击New Project，按如下说明操作
  + 点击Deploy from Github repo，选择你第一步建立的仓库
  + 点击Add variables，VARIABLE_NAME填入SERVER_HOST，VALUE填入0.0.0.0，点击右侧的Add
  + 继续点击右上方New Variable，VARIABLE_NAME填入PORT，VALUE填入8080，点击右侧的Add
  + 网页左上方你会发现Apply 2 changes，点击其右侧的Deploy
  + 等待几分钟，点击项目名下方的Deployments，如果状态已变为Active，点击右侧的View Logs，如果发现最后一行显示正在监听0.0.0.0:8080，则表示部署成功
  + 点击项目名下方的Settings，下拉到Networking选项，Public Networking处点击Generate Domain，出来的XXX-production.up.railway.app就是API访问地址了
- 三、或者，你也可以直接点击下方按钮一键在[Railway](https://railway.app)中部署
  + [![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/Yxd_qk?referralCode=5JJc9I)
  + 注意，一键部署项目，API KEY固定为`sk-mjj`，并且无法使用账号登录功能
- 四、注意事项
  + API访问地址为`https://XXX-production.up.railway.app/v1/chat/completions`，API KEY为你在`api_keys.txt`里设置的KEY
  + 版权归xqdoo00o所有，更多信息请查看作者项目
  + 关于谷歌等第三方登录账号如何部署及其他问题请参考作者项目说明，本项目恕不解答，请谅解
