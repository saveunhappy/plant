<template>
  <div>
    <p>
      <button v-on:click="add()" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-edit"></i>
        新增
      </button>
      &nbsp;
      <button v-on:click="list(1)" class="btn btn-white btn-default btn-round">
        <i class="ace-icon fa fa-refresh"></i>
        刷新
      </button>
    </p>
    <pagination ref="pagination" v-bind:list="list" v-bind:itemCount="8"></pagination>
    <div class="row">
      <div v-for="plant in plants" class="col-md-4">
        <div class="thumbnail search-thumbnail">
          <img v-show="!plant.image" class="media-object" src="/static/image/demo-course.jpg" />
          <img v-show="plant.image" class="media-object" v-bind:src="plant.image" />
          <div class="caption">
            <div class="clearfix">
              <span class="pull-right label label-primary info-label">
                {{PLANT_STATUS | optionKV(plant.status)}}
              </span>
            </div>
            <h3 class="search-title">
              <a href="#" class="blue">{{plant.name}}</a>
            </h3>

            <p>
              <span class="blue bolder bigger-150">{{plant.price}}&nbsp;<i class="fa fa-rmb"></i></span>&nbsp;
            </p>
            <p>{{plant.summary}}</p>
            <p>
              <button v-on:click="edit(plant)" class="btn btn-white btn-xs btn-info btn-round">
                编辑
              </button>

              <button v-on:click="del(plant.id)" class="btn btn-white btn-xs btn-info btn-round">
                删除
              </button>
            </p>
          </div>
        </div>
      </div>
    </div>
<!--    <table id="simple-table" class="table  table-bordered table-hover">-->
<!--      <thead>-->
<!--      <tr>-->
<!--         <th>id</th>-->

<!--         <th>绿植名称</th>-->

<!--         <th>概述</th>-->

<!--         <th>绿植封面</th>-->

<!--         <th>状态</th>-->


<!--        <th>操作</th>-->
<!--      </tr>-->

<!--      </thead>-->

<!--      <tbody>-->
<!--      <tr v-for="plant in plants">-->



<!--              <td>{{plant.id}}</td>-->
<!--              <td>{{plant.name}}</td>-->
<!--              <td>{{plant.summary}}</td>-->
<!--              <td>{{plant.image}}</td>-->
<!--              <td>{{PLANT_STATUS | optionKV(plant.status)}}</td>-->
<!--        <td>-->

<!--          <div class="hidden-sm hidden-xs btn-group">-->
<!--            <button v-on:click="edit(plant)" class="btn btn-xs btn-info">-->
<!--              <i class="ace-icon fa fa-pencil bigger-120"></i>-->
<!--            </button>-->

<!--            <button v-on:click="del(plant.id)" class="btn btn-xs btn-danger">-->
<!--              <i class="ace-icon fa fa-trash-o bigger-120"></i>-->
<!--            </button>-->
<!--          </div>-->
<!--        </td>-->
<!--      </tr>-->
<!--      </tbody>-->
<!--    </table>-->
    <div id="form-modal" class="modal fade" tabindex="-1" role="dialog">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
            <h4 class="modal-title">表单</h4>
          </div>
          <div class="modal-body">
            <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-sm-2 control-label">绿植名称</label>
                  <div class="col-sm-10">
                    <input v-model="plant.name" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">概述</label>
                  <div class="col-sm-10">
                    <input v-model="plant.summary" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">绿植封面</label>
                  <div class="col-sm-10">
                    <input v-model="plant.image" class="form-control">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">状态</label>
                 <div class="col-sm-10">
                  <select v-model="plant.status" class="form-control">
                    <option v-for="o in PLANT_STATUS" v-bind:value="o.key">{{ o.value }}</option>
                  </select>
                  </div>
                </div>
              <div class="form-group">
                <label class="col-sm-2 control-label">价格</label>
                <div class="col-sm-10">
                  <input v-model="plant.price" class="form-control">
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button v-on:click="save()" type="button" class="btn btn-primary">保存</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
  </div>
</template>

<script>
import Pagination from "../../components/pagination";

export default {
  name: "business-plant",
  components: {Pagination},
  data: function () {
    return {
      plant: {},
      plants: [],
      PLANT_STATUS: PLANT_STATUS,
    }
  },
  mounted() {
    let _this = this;
    _this.$refs.pagination.size = 5;
    _this.list(1);

    //sidebar激活样式方法一
    // this.$parent.activeSidebar("business-plant-sidebar");
  },
  methods: {
    add() {
      //这个add的作用就是点开那个模态框，新增是save
      let _this = this;
      _this.plant = {}
      $("#form-modal").modal('show');
    },
    edit(plant) {
      //这个add的作用就是点开那个模态框，新增是save
      let _this = this;
      _this.plant = $.extend({}, plant);
      $("#form-modal").modal('show');
    },
    list(page) {
      let _this = this;
      Loading.show();
      _this.$ajax.post(process.env.VUE_APP_SERVER + "/business/admin/plant/list",
          {
            page: page,
            size: _this.$refs.pagination.size
          }).then((response) => {
        Loading.hide();
        console.log("查询用户列表结果", response);
        let resp = response.data;
        _this.plants = resp.content.list;
        _this.$refs.pagination.render(page, resp.content.total);
      })
    },
    save() {
      let _this = this;
        // 保存校验
        if (1 != 1
          || !Validator.require(_this.plant.name, "绿植名称")
          || !Validator.length(_this.plant.name, "绿植名称", 1, 50)
          || !Validator.length(_this.plant.summary, "概述", 1, 2000)
          || !Validator.length(_this.plant.image, "绿植封面", 1, 2000)
        ) {
          return;
        }

      _this.$ajax.post(process.env.VUE_APP_SERVER + "/business/admin/plant/save",
          _this.plant).then((response) => {
        console.log("查询用户列表结果", response);
        let resp = response.data;
        if (resp.success) {
          $("#form-modal").modal('hide');
          _this.list(1)
          Toast.success("保存成功");
        }else{
          Toast.warning(resp.message);

        }
      })
    },
    del(id) {
      let _this = this;
      Confirm.show("删除用户后不可恢复!",function () {
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + "/business/admin/plant/delete/" + id).then((response) => {
          console.log("删除用户列表结果", response);
          let resp = response.data;
          if (resp.success) {
            Toast.success("删除成功");
            _this.list(1);

          }
        })
    });
    }

  }
}
</script>