<template>
  <main role="main">

    <section class="jumbotron text-center">
      <div class="container">
        <h1>绿植购买平台</h1>
        <p class="lead text-muted">
          种子变绿植的过程不仅是碳中和的过程，也是爱地球理念传播的过程,低碳环保的大学生生活
          ,从一颗传播爱与生命的绿植种子开始。
        </p>
        <p>
          <router-link to="list" class="btn btn-primary my-2 p-3 font-weight-bold">点击查看所有绿植</router-link>
        </p>
      </div>
    </section>

    <div class="album py-5 bg-light">
      <div class="container">
        <div class="title1">最新上线</div>
        <div class="row">
          <div v-for="o in news" class="col-md-4">
            <the-plant v-bind:plant="o"></the-plant>

          </div>
        </div>
      </div>
    </div>

  </main>
</template>

<script>
import ThePlant from "@/components/the-plant";
export default {
  name: "index",
  components: {ThePlant},
  data: function (){
    return{
      news:[],
    }
  },
  mounted() {
    let _this = this;
    _this.listNew();
  },
  methods: {
    listNew(){
      let _this = this;
      _this.$ajax.get(process.env.VUE_APP_SERVER + "/business/web/plant/list-new").then((response) => {
        console.log("查询用户列表结果", response);
        let resp = response.data;
        if(resp.success){
          _this.news = resp.content.list;
          console.log(resp)
        }
      })
    }
  }
}
</script>

<style scoped>
.title1{
  margin-bottom: 2rem;
  color: #fafafa;
  letter-spacing: 0;
  text-shadow: 0px 1px 0px #999, 0px 2px 0px #888, 0px 3px 0px #777, 0px 4px 0px #666, 0px 5px 0px #555, 0px 6px 0px #444, 0px 7px 0px #333, 0px 8px 7px #001135;
  font-size: 2rem;
}
</style>