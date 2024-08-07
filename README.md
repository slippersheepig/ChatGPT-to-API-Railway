> [!TIP]
> 2024.7.9更新 使用[chat2api](https://github.com/lanqian528/chat2api#%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F)项目进行Railway部署，可直接在环境变量传递参数（例如refresh_token），无需本地创建文件，更方便好用
> 
> 点击部署[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/Q9R9Rg?referralCode=5JJc9I)

> 如需使用refresh_token，则需新建cookies.json文件并填写对应信息，详见作者项目

使用[Railway](https://railway.app)免费部署，从ChatGPT网站模拟使用API（默认不登录账号使用）  
如需本地部署请访问https://github.com/slippersheepig/ChatGPT-to-API  
源码https://github.com/xqdoo00o/ChatGPT-to-API  
### 使用步骤
- 一、登录你的github，新建一个**私有**的空白repository，将本项目的`Dockerfile`和`api_keys.txt`复制到你的项目
  + `api_keys.txt`里的内容可以编辑，用于API鉴权
  + 如果你想登录账号使用，需完成以下两个步骤（不登录账号则忽略此步）
    + 在repository新建`harPool`文件夹，将`chatgpt.com.har`文件上传到文件夹内，并且Dockerfile倒数第二行新起一行增加`COPY harPool/ /cta/harPool/`
    + 在repository新建`accounts.txt`文件，按如下格式录入保存账号信息，并且Dockerfile倒数第二行新起一行增加`COPY accounts.txt .`
      ```bash
      邮箱A:密码
      邮箱B:密码:2
      邮箱C:密码:2/5
      ...
      ```
    + 密码后的数字表示轮询次数，默认为1次。上例表示第一次对话使用账户A，而后两次对话使用账户B，账户C为Teams账户，接着五次对话使用账户C的Teams，然后两次使用账户C的个人，如此循环。
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
    + 常见项目使用方法如下
      + https://github.com/ChatGPTNextWeb/ChatGPT-Next-Web
        + OPENAI_API_KEY=`api_keys.txt`里填写的KEY
        + BASE_URL=https://XXX-production.up.railway.app
      + https://github.com/Chanzhaoyu/chatgpt-web
        + OPENAI_API_KEY=`api_keys.txt`里填写的KEY
        + OPENAI_API_BASE_URL=https://XXX-production.up.railway.app
      + https://github.com/RockChinQ/QChatGPT
        + "keys": { "openai": ["`api_keys.txt`里填写的KEY"] }
        + "openai-chat-completions": { "base-url": "https://XXX-production.up.railway.app/v1" }
  + 版权归xqdoo00o所有，更多信息请查看作者项目
  + 关于谷歌等第三方登录账号如何部署及其他问题请参考作者项目说明，本项目恕不解答，请谅解
