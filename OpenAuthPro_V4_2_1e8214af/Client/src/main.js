import Vue from 'vue'

import 'normalize.css/normalize.css'// A modern alternative to CSS resets

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import '@/assets/custom-theme/index.css'
import locale from 'element-ui/lib/locale/lang/zh-CN' // lang i18n
import VueContextMenu from 'vue-contextmenu'

import '@/styles/index.scss' // global css

import App from './App'
import router from './router'
import store from './store'

import '@/permission' // permission control

import '@/assets/public/css/comIconfont/iconfont.css'
import '@/assets/public/css/comIconfont/iconfont.js'

//工作流使用的图标
import '@/assets/public/css/workflowicon/iconfont.css'
import '@/assets/public/css/workflowicon/iconfont.js'


import '../public/ueditor/ueditor.config.js'
import '../public/ueditor/ueditor.all.js'
import '../public/ueditor/lang/zh-cn/zh-cn.js'
import '../public/ueditor/formdesign/leipi.formdesign.v4.js'


// 请假条表单和详情
import FrmLeaveReqAdd from '@/views/forms/userDefine/frmLeaveReq/add'
import FrmLeaveReqUpdate from '@/views/forms/userDefine/frmLeaveReq/update'
import FrmLeaveReqDetail from '@/views/forms/userDefine/frmLeaveReq/detail'

Vue.use(ElementUI, { locale })
Vue.use(VueContextMenu)

Vue.config.productionTip = false
Vue.component('FrmLeaveReqAdd', FrmLeaveReqAdd)
Vue.component('FrmLeaveReqUpdate', FrmLeaveReqUpdate)
Vue.component('FrmLeaveReqDetail', FrmLeaveReqDetail)
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
