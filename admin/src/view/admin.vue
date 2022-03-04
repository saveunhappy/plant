<template>
  <div>
    <div id="navbar" class="navbar navbar-default ace-save-state">
      <div class="navbar-container ace-save-state" id="navbar-container">
        <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
          <span class="sr-only">Toggle sidebar</span>

          <span class="icon-bar"></span>

          <span class="icon-bar"></span>

          <span class="icon-bar"></span>
        </button>

        <div class="navbar-header pull-left">
          <a href="index.html" class="navbar-brand">
            <small>
              <i class="fa"></i>
              绿植后台管理系统
            </small>
          </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right" role="navigation">
          <ul class="nav ace-nav">
            <li class="light-green dropdown-modal">
              <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                <span class="user-info">
									<small>欢迎:</small>
									{{ loginUser.name }}
								</span>

                <i class="ace-icon fa fa-caret-down"></i>
              </a>

              <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
<!--                <li>-->
<!--                  <a href="#">-->
<!--                    <i class="ace-icon fa fa-cog"></i>-->
<!--                    Settings-->
<!--                  </a>-->
<!--                </li>-->

<!--                <li>-->
<!--                  <a href="profile.html">-->
<!--                    <i class="ace-icon fa fa-user"></i>-->
<!--                    Profile-->
<!--                  </a>-->
<!--                </li>-->

<!--                <li class="divider"></li>-->

                <li>
                  <a v-on:click="logout()" href="#">
                    <i class="ace-icon fa fa-power-off"></i>
                    退出登录
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div><!-- /.navbar-container -->
    </div>

    <div class="main-container ace-save-state" id="main-container">

      <div id="sidebar" class="sidebar                  responsive                    ace-save-state">
        <ul class="nav nav-list">
          <li class="" id="welcome-sidebar">
            <router-link to="/welcome">
              <i class="menu-icon fa fa-tachometer"></i>
              <span class="menu-text"> 欢迎 </span>
            </router-link>

            <b class="arrow"></b>
          </li>

          <li class="open">
            <a href="#" class="dropdown-toggle">
              <i class="menu-icon fa fa-list"></i>
              <span class="menu-text"> 业务管理 </span>
              <b class="arrow fa fa-angle-down"></b>
            </a>

            <b class="arrow"></b>

            <ul class="submenu">

              <li class="" id="business-user-sidebar">
                <router-link to="/business/user">
                  <i class="menu-icon fa fa-caret-right"></i>
                  管理员管理
                </router-link>
                <b class="arrow"></b>
              </li>


              <li class="" id="business-member-sidebar">
                <router-link to="/business/member">
                  <i class="menu-icon fa fa-caret-right"></i>
                  用户管理
                </router-link>
                <b class="arrow"></b>
              </li>

              <li class="" id="business-plant-sidebar">
                <router-link to="/business/plant">
                  <i class="menu-icon fa fa-caret-right"></i>
                  绿植管理
                </router-link>
                <b class="arrow"></b>
              </li>


              <li class="" id="business-memberPlant-sidebar">
                <router-link to="/business/memberPlant">
                  <i class="menu-icon fa fa-caret-right"></i>
                  购买记录
                </router-link>
                <b class="arrow"></b>
              </li>

            </ul>
          </li>

        </ul><!-- /.nav-list -->

        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
          <i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state"
             data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>

      </div>
      <div class="main-content">
        <div class="main-content-inner">
          <div class="page-content">
            <div class="row">
              <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <router-view/>
                <!-- PAGE CONTENT ENDS -->
              </div><!-- /.col -->
            </div><!-- /.row -->
          </div><!-- /.page-content -->
        </div>
      </div><!-- /.main-content -->

      <div class="footer">
        <div class="footer-inner">
          <div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
						</span>

            &nbsp; &nbsp;
            <span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
          </div>
        </div>
      </div>

      <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
      </a>
    </div><!-- /.main-container -->

  </div>
</template>
<script>

  export default {
    name: "admin",
    data: function () {
      return {
        loginUser: {},
      }
    },
    mounted: function () {
      let _this = this;
      $("body").removeClass("login-layout light-login");
      $("body").attr("class", "no-skin");
      $.getScript('/ace/assets/js/ace.min.js');
      _this.loginUser = SessionStorage.get("USER");
    },
    watch: {
      $route: {
        handler:function(val, oldVal){
          // sidebar激活样式方法二
          console.log("---->页面跳转：", val, oldVal);
          let _this = this;

          // if (!_this.hasResourceRouter(val.name)) {
          //   _this.$router.push("/login");
          //   return;
          // }

          _this.$nextTick(function(){  //页面加载完成后执行
            _this.activeSidebar(_this.$route.name.replace("/", "-") + "-sidebar");
          })
        }
      }
    },
    methods:{
      login(){
        this.$router.push("/admin")
      },
      logout(){
        let _this = this;
        SessionStorage.set("USER",null);
        _this.$router.push("/login")

      },

      activeSidebar:function (id){
        //兄弟菜单去掉active样式，自身增加active样式
        $("#" + id).siblings().removeClass("active");
        $("#" + id).siblings().find("li").removeClass("active");
        $("#" + id).addClass("active");
        //如果有父菜单，父菜单的兄弟菜单去掉open active,父菜单增加open active
        let parentLi = $("#" + id).parents("li");
        if(parentLi){
          parentLi.siblings().find("li").removeClass("active");
          parentLi.siblings().removeClass("active");
          parentLi.addClass("active");
        }


      }
    }
  }
</script>
<style scoped>
#navbar{
  background: rgb(154,188,50);
}
</style>
