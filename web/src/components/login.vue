<template>
  <div id="login-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-login" role="document">
      <div class="modal-content">
        <div class="modal-body">
          <div class="login-div" v-show="MODAL_STATUS === STATUS_LOGIN">
            <h3>登&nbsp;&nbsp;录</h3>
            <div class="form-group">
              <input v-model="member.loginName" class="form-control" placeholder="用户名">
            </div>
            <div class="form-group">
              <input class="form-control" type="password" placeholder="密码" v-model="member.password">
            </div>
            <div class="form-group">
              <button v-on:click="login()" class="btn btn-primary btn-block submit-button">
                登&nbsp;&nbsp;录
              </button>
            </div>
            <div class="form-group">
              <div class="pull-right">
                <a href="javascript:;" v-on:click="toForgetDiv()">忘记密码</a>&nbsp;
                <a href="javascript:;" v-on:click="toRegisterDiv()">我要注册</a>
              </div>
            </div>
            <div class="form-group to-register-div">
            </div>
          </div>
          <div class="register-div" v-show="MODAL_STATUS === STATUS_REGISTER">
            <h3>注&nbsp;&nbsp;册</h3>

            <div class="form-group">
              <input
                     id="register-name" v-model="memberRegister.name"
                     class="form-control" placeholder="昵称">
            </div>
            <div class="form-group">
              <input
                     id="login-name" v-model="memberRegister.loginName"
                     class="form-control" placeholder="用户名">
            </div>
            <div class="form-group">
              <input
                     id="register-password" v-model="memberRegister.password"
                     class="form-control" placeholder="密码" type="password">
            </div>
            <div class="form-group">
              <button class="btn btn-primary btn-block submit-button" v-on:click="register()">
                注&nbsp;&nbsp;册
              </button>
            </div>
            <div class="form-group to-login-div">
              <a href="javascript:;" v-on:click="toLoginDiv()">我要登录</a>
            </div>
          </div>
          <div class="forget-div" v-show="MODAL_STATUS === STATUS_FORGET">
            <h3>忘记密码</h3>
            <div class="form-group">
              <input
                     id="forget-mobile" v-model="memberForget.loginName"
                     class="form-control" placeholder="用户名">
            </div>
            <div class="form-group">
              <input
                     id="forget-password" v-model="memberForget.password"
                     class="form-control" placeholder="密码" type="password">
            </div>
            <div class="form-group">
              <input
                     id="forget-confirm-password" v-model="memberForget.confirm"
                     class="form-control" placeholder="确认密码" type="password">
            </div>
            <div class="form-group">
              <button v-on:click="resetPassword()" class="btn btn-primary btn-block submit-button">
                重&nbsp;&nbsp;置
              </button>
            </div>
            <div class="form-group to-login-div">
              <a href="javascript:;" v-on:click="toLoginDiv()">我要登录</a>
            </div>
          </div>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
</template>

<script>

  export default {
    name: 'the-login',
    data: function () {
      return {
        // 模态框内容切换：登录、注册、忘记密码
        STATUS_LOGIN: "STATUS_LOGIN",
        STATUS_REGISTER: "STATUS_REGISTER",
        STATUS_FORGET: "STATUS_FORGET",
        MODAL_STATUS: "",

        member: {},
        memberForget: {},
        memberRegister: {},

        remember: true, // 记住密码
        imageCodeToken: "",

        // 注册框显示错误信息
        registerMobileValidate: null,
        registerMobileCodeValidate: null,
        registerPasswordValidate: null,
        registerNameValidate: null,
        registerConfirmPasswordValidate: null,

        // 忘记密码框显示错误信息
        forgetMobileValidate: null,
        forgetMobileCodeValidate: null,
        forgetPasswordValidate: null,
        forgetConfirmPasswordValidate: null,
      }
    },
    computed: {
      registerMobileValidateClass: function () {
        return {
          'border-success': this.registerMobileValidate === true,
          'border-danger': this.registerMobileValidate === false,
        }
      },
      registerMobileCodeValidateClass: function () {
        return {
          'border-success': this.registerMobileCodeValidate === true,
          'border-danger': this.registerMobileCodeValidate === false,
        }
      },
      registerPasswordValidateClass: function () {
        return {
          'border-success': this.registerPasswordValidate === true,
          'border-danger': this.registerPasswordValidate === false,
        }
      },
      registerNameValidateClass: function () {
        return {
          'border-success': this.registerNameValidate === true,
          'border-danger': this.registerNameValidate === false,
        }
      },
      registerConfirmPasswordValidateClass: function () {
        return {
          'border-success': this.registerConfirmPasswordValidate === true,
          'border-danger': this.registerConfirmPasswordValidate === false,
        }
      },
      forgetMobileValidateClass: function () {
        return {
          'border-success': this.forgetMobileValidate === true,
          'border-danger': this.forgetMobileValidate === false,
        }
      },
      forgetMobileCodeValidateClass: function () {
        return {
          'border-success': this.forgetMobileCodeValidate === true,
          'border-danger': this.forgetMobileCodeValidate === false,
        }
      },
      forgetPasswordValidateClass: function () {
        return {
          'border-success': this.forgetPasswordValidate === true,
          'border-danger': this.forgetPasswordValidate === false,
        }
      },
      forgetConfirmPasswordValidateClass: function () {
        return {
          'border-success': this.forgetConfirmPasswordValidate === true,
          'border-danger': this.forgetConfirmPasswordValidate === false,
        }
      },
    },
    mounted() {
      let _this = this;
      _this.toLoginDiv();
    },
    methods: {

      /**
       * 打开登录注册窗口
       */
      openLoginModal() {
        let _this = this;
        $("#login-modal").modal("show");
      },

      //---------------登录框、注册框、忘记密码框切换-----------------
      toLoginDiv() {
        let _this = this;

        // 从缓存中获取记住的用户名密码，如果获取不到，说明上一次没有勾选“记住我”
        // let rememberMember = LocalStorage.get(LOCAL_KEY_REMEMBER_MEMBER);
        // if (rememberMember) {
        //   _this.member = rememberMember;
        // }

        // 显示登录框时就刷新一次验证码图片
        _this.MODAL_STATUS = _this.STATUS_LOGIN
      },
      toRegisterDiv() {
        let _this = this;
        _this.MODAL_STATUS = _this.STATUS_REGISTER
      },
      toForgetDiv() {
        let _this = this;
        _this.MODAL_STATUS = _this.STATUS_FORGET
      },

      register() {
        let _this = this;

        // 调服务端注册接口
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/web/member/register', _this.memberRegister).then((response) => {
          let resp = response.data;
          if (resp.success) {
            Toast.success("注册成功");
            $("#login-modal").modal("hide");
          } else {
            Toast.warning(resp.message);
          }
        })
      },


      //---------------登录框-----------------
      login () {
        let _this = this;

        // 如果密码是从缓存带出来的，则不需要重新加密
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/web/member/login', _this.member).then((response)=>{
          let resp = response.data;
          if (resp.success) {
            console.log("登录成功：", resp.content);
            let loginMember = resp.content;
            // 登录成功
            Toast.success("登录成功");


            _this.$parent.setLoginMember(loginMember);
            Tool.setLoginMember(resp.content);
            $("#login-modal").modal("hide");
          } else {
            Toast.warning(resp.message);
            _this.member.password = "";
          }
        });
      },
      resetPassword() {
        let _this = this;

        // 调服务端密码重置接口
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/web/member/reset-password', _this.memberForget).then((res)=>{
          let response = res.data;
          if (response.success) {
            Toast.success("密码重置成功");
            _this.toLoginDiv();
          } else {
            Toast.warning(response.message);
          }
        }).catch((response)=>{
          console.log("error：", response);
        })
      },

      //-------------------------------- 注册框校验 ----------------------------

      onRegisterMobileBlur () {
        let _this = this;
        _this.registerMobileValidate = Pattern.validateMobile(_this.memberRegister.mobile);
        return _this.registerMobileValidate;
      },

      onRegisterMobileCodeBlur () {
        let _this = this;
        _this.registerMobileCodeValidate = Pattern.validateMobileCode(_this.memberRegister.smsCode);
        return _this.registerMobileValidate;
      },

      onRegisterNameBlur () {
        let _this = this;
        _this.registerNameValidate = Pattern.validateName(_this.memberRegister.name);
        return _this.registerMobileValidate;
      },

      onRegisterPasswordBlur () {
        let _this = this;
        _this.registerPasswordValidate = Pattern.validatePasswordWeak(_this.memberRegister.passwordOriginal);
        return _this.registerMobileValidate;
      },

      onRegisterConfirmPasswordBlur () {
        let _this = this;
        let confirmPassword = $("#register-confirm-password").val();
        if (Tool.isEmpty(confirmPassword)) {
          return _this.registerConfirmPasswordValidate = false;
        }
        return _this.registerConfirmPasswordValidate = (confirmPassword === _this.memberRegister.passwordOriginal);
      },

      //-------------------------------- 忘记密码框校验 ----------------------------

      onForgetMobileBlur () {
        let _this = this;
        return _this.forgetMobileValidate = Pattern.validateMobile(_this.memberForget.mobile);
      },

      onForgetMobileCodeBlur () {
        let _this = this;
        return _this.forgetMobileCodeValidate = Pattern.validateMobileCode(_this.memberForget.smsCode);
      },

      onForgetPasswordBlur () {
        let _this = this;
        return _this.forgetPasswordValidate = Pattern.validatePasswordWeak(_this.memberForget.passwordOriginal);
      },

      onForgetConfirmPasswordBlur () {
        let _this = this;
        let forgetPassword = $("#forget-confirm-password").val();
        if (Tool.isEmpty(forgetPassword)) {
          return _this.forgetConfirmPasswordValidate = false;
        }
        return _this.forgetConfirmPasswordValidate = (forgetPassword === _this.memberForget.passwordOriginal);
      }
    }
  }
</script>

<style scoped>
  /* 登录框 */
  .login-div .input-group-addon {
    padding: 0;
    border: 0;
  }

  #login-modal h3 {
    text-align: center;
    margin-bottom: 20px;
  }

  #login-modal .modal-login {
    max-width: 400px;
  }

  #login-modal input:not(.remember) {
    height: 45px;
    font-size: 16px;
  }

  #login-modal .submit-button {
    height: 50px;
    font-size: 20px;
  }

  #login-modal .to-login-div {
    text-align: center;
  }
</style>
