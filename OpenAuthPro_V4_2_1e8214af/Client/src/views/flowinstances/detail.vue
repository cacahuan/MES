<!--流程详情页面-->
<template>
  <div>
    <sticky :className="'sub-navbar'">
      <div class="filter-container">
        {{postObj.customName}}
        <el-tag size="mini" style="margin-left: 10px;">{{postObj.createDate}}</el-tag>
        <el-tag size="mini">{{postObj.activityName}}</el-tag>
      </div>
    </sticky>
    <div class="createPost-container">
      <el-collapse v-model="activeNames" style="padding: 0 15px; background: #fff;">
        <el-collapse-item name="1">
          <el-card class="box-card" v-if="postObj.frmType ==1">
            <component v-bind:is="postObj.dbName != '' && postObj.dbName +'Detail'" :frmData="postObj.frmData">
            </component>
          </el-card>

          <template v-else-if="postObj.frmType === 2">
            <div style="padding-right: 25px;">
              <CreatedForm :insite="true" ref="createdForm"
                v-if="frmContentData.list && frmContentData.list.length > 0" :data="frmContentData"
                :value="defaultValue">
              </CreatedForm>
            </div>
          </template>
          <el-card class="box-card" v-else>
            <p v-html="postObj.frmPreviewHtml"></p>
          </el-card>
        </el-collapse-item>
        <el-collapse-item title="流转记录" name="2">
          <span slot="title" style="font-size: 16px;font-weight: 600;">流转记录</span>
          <el-timeline>
            <el-timeline-item v-for="(history, index) in histories" :key="index" :timestamp="history.createDate">
              {{history.content}}
            </el-timeline-item>
          </el-timeline>
        </el-collapse-item>
        <el-collapse-item title="流程图" name="3">
          <span slot="title" style="font-size: 16px;font-weight: 600;">流程图</span>
          <div style="height: 500px;">
            <CreatedFlow ref="createdFlow" :form-template="currentForm" :isEdit="true" :isShowContent="isShowContent"
              :scheme-content="postObj.schemeContent"></CreatedFlow>
          </div>
        </el-collapse-item>
      </el-collapse>

    </div>
  </div>
</template>

<script>
  import Sticky from '@/components/Sticky' // 粘性header组件
  import * as apiFlowinstances from '@/api/flowinstances'
  import CreatedForm from '@/components/Formcreated/components/CreatedForm'
  import CreatedFlow from '@/components/CreatedFlow'
  export default {
    name: 'flowinstance-detail',
    components: {
      Sticky,
      CreatedForm,
      CreatedFlow
    },
    data() {
      return {
        isShowContent: true,
        currentForm: null,
        postObj: {
          customName: '',
          schemeContent: '',
          createDate: '',
          activityName: '',
          code: '',
          dbName: '',
          frmType: 0,
          frmData: '',
          activityId: ''
        },
        frmContentData: {
          list: [],
          config: {}
        },
        defaultValue: {},
        activeNames: ['1', '2', '3'], // 展开的信息
        loading: false,
        histories: []      
      }
    },
    created() {
      const id = this.$route.params && this.$route.params.id
      apiFlowinstances.get({
        id: id
      }).then(response => {
        this.postObj = response.result
        this.frmContentData = JSON.parse(response.result.frmContentData)
        this.defaultValue = JSON.parse(response.result.frmData)
      }).catch(err => {
        console.log(err)
      })

      apiFlowinstances.queryHistories({
        flowInstanceId: id
      }).then(response => {
        this.histories = response.result
      }).catch(err => {
        console.log(err)
      })
    },
    methods: {
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  @import "src/styles/mixin.scss";

  .createPost-container {
    position: relative;
    padding: 10px;

    .createPost-main-container {
      padding: 40px 45px 20px 50px;

      .postInfo-container {
        position: relative;
        @include clearfix;
        margin-bottom: 10px;

        .postInfo-container-item {
          float: left;
        }
      }

      .editor-container {
        min-height: 500px;
        margin: 0 0 30px;

        .editor-upload-btn-container {
          text-align: right;
          margin-right: 10px;

          .editor-upload-btn {
            display: inline-block;
          }
        }
      }
    }

    .word-counter {
      width: 40px;
      position: absolute;
      right: -10px;
      top: 0px;
    }
  }
</style>