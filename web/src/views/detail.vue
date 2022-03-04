<template>
  <main role="main">
    <div class="album py-5 bg-light">
      <div class="container">
        <div class="row course-head">
          <div class="col-sm-6" id="cover-video-div">
            <img class="img-fluid" v-bind:src="plant.image">
          </div>
          <div class="col-sm-6">
            <h1>{{plant.name}}</h1>
            <p class="course-head-item">
              <span>{{PLANT_STATUS | optionKV(plant.status)}}</span>
            </p>
            <p class="course-head-desc">{{plant.summary}}</p>
            <p class="course-head-price">
              <span class="price-now text-danger"><i class="fa fa-yen"></i>&nbsp;{{plant.price}}&nbsp;&nbsp;</span>
            </p>
            <p class="course-head-button-links">
              <a v-show="!memberCourse.id" v-on:click="adopt()" class="btn btn-lg btn-primary btn-shadow" href="javascript:;">购买</a>
              <a v-show="memberCourse.id" href="#" class="btn btn-lg btn-success btn-shadow disabled">购买成功</a>
            </p>
          </div>
        </div>

      </div>
    </div>
  </main>
</template>

<script>
export default {
  name: "detail",
  data: function (){
    return{
      id: "",
      plant: {},
      memberCourse: {},
      PLANT_STATUS: PLANT_STATUS,
    }
  },
  mounted() {
    let _this = this;
    _this.id = _this.$route.query.id;
    _this.findPlant();
  },
  methods: {
    findPlant() {
      let _this = this;
      _this.$ajax.get(process.env.VUE_APP_SERVER + '/business/web/plant/find/' + _this.id).then((response)=>{
        let resp = response.data;
        _this.plant = resp.content;


        _this.getEnroll();

        // 获取报名信息
        // _this.getEnroll();
      })
    },
    getEnroll() {
      let _this = this;
      let loginMember = Tool.getLoginMember();
      if (Tool.isEmpty(loginMember)) {
        console.log("未登录");
        return;
      }
      _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/web/memberPlant/get-enroll', {
        plantId: _this.plant.id,
        memberId: loginMember.id
      }).then((response)=>{
        let resp = response.data;
        if (resp.success) {
          _this.memberCourse = resp.content || {};
        }
      });
    },

    adopt(){
      let _this = this;
      let loginMember = Tool.getLoginMember();
      if (Tool.isEmpty(loginMember)) {
        Toast.warning("请先登录");
        return;
      }
      _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/web/memberPlant/adopt',{
        plantId:_this.plant.id,
        memberId:loginMember.id
      }).then((response)=>{
        let resp = response.data;
        if(resp.success){
          _this.memberCourse = resp.content;
          Toast.success("购买成功")
        }else{
          Toast.warning(resp.messages);
        }
        // 获取报名信息
        // _this.getEnroll();
      })
    }

  }
}
</script>

<style>
/* 课程信息 */
.course-head {
}
.course-head h1 {
  font-size: 2rem;
  margin-bottom: 1.5rem;
}
.course-head-item span {
  margin-right: 1rem;
}
.course-head-desc {
  font-size: 1rem;
  color: #555
}
.course-head a {
}
@media (max-width: 700px) {
  .course-head h1 {
    font-size: 1.5rem;
  }
}
.chapter-section-tr td{
  padding: 1rem 1.25rem;
  vertical-align: middle;
}

/*行头小图标*/
.chapter-section-tr td .section-title i{
  color: #2a6496;
}

</style>