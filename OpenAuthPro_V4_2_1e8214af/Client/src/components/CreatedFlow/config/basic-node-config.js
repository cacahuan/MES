export const tools = [
  {
    type: 'drag',
    icon: 'el-icon-rank',
    defaultIcon: 'el-icon-rank',
    name: '拖拽'
  },
  {
    type: 'connection',
    icon: 'el-icon-share',
    defaultIcon: 'el-icon-share',
    name: '连线'
  },
  // {
  //   type: 'zoom-in',
  //   icon: 'el-icon-zoom-in',
  //   name: '放大'
  // },
  // {
  //   type: 'zoom-out',
  //   icon: 'el-icon-zoom-out',
  //   name: '缩小'
  // }
]

export const commonNodes = [
  {
    type: 'start round mix',
    name: '开始',
    icon: 'iconfont icon-StartOP',
    defaultIcon: 'iconfont icon-StartOP',
    belongto: 'commonNodes'
  },
  {
    type: 'end round',
    name: '结束',
    icon: 'iconfont icon-End',
    defaultIcon: 'iconfont icon-End',
    belongto: 'commonNodes'
  },
  {
    type: 'node',
    name: '任务节点',
    icon: 'el-icon-s-tools',
    defaultIcon: 'el-icon-s-tools',
    belongto: 'commonNodes'
  },
  {
    type: 'fork',
    name: '会签开始',
    icon: 'iconfont icon-fork',
    defaultIcon: 'iconfont icon-fork',
    belongto: 'commonNodes'
  },
  {
    type: 'join',
    name: '会签结束',
    icon: 'iconfont icon-gaibanxianxingtubiao-',
    defaultIcon: 'iconfont icon-gaibanxianxingtubiao-',
    belongto: 'commonNodes'
  }
]

export const highNodes = [
  {
    type: 'child-flow',
    name: '子流程',
    icon: 'ChildFlowIcon',
    defaultIcon: 'ChildFlowIcon',
    belongto: 'highNodes'
  }
]

export const laneNodes = [
  {
    type: 'x-lane',
    name: '横向泳道',
    icon: 'iconfont icon-icon',
    defaultIcon: 'iconfont icon-icon',
    belongto: 'laneNodes'
  },
  {
    type: 'y-lane',
    name: '纵向泳道',
    icon: 'iconfont icon-icon',
    defaultIcon: 'iconfont icon-icon',
    belongto: 'laneNodes'
  }
]
