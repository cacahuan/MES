/**
 * @description: 通用表格列定义
 * @author: liyubao | xufuxing
 * @version: 1.0
 */

 const ColumnDefine = class  {
  /**
   * 字段名
   */
   columnName='';

  /**
   * 中文显示名称
   */
   comment ='';

  /**
   * 是否可编辑
   */

   isEdit=false;
  /**
   * 是否可显示
   */

   isList =false;

  /**
   * 编辑类型，如:select/switch/text等
   * 该属性作为判定字段编辑方式的首要条件
   */
   editType ='';

  /**
   * 下拉列表的来源字典编码
   */
   dataSource ='';

   /**
   * 实体类型，如:string/int
   * 当editType为空时，该属性作为判定字段编辑方式的条件
   */
   entityType ='';

  /**
   * 对应的数据字段类型
   */
   columnType ='';

  /**
   * 实体名称
   */
   entityName ='';

  /**
   * 创建一个初始的实体
   */
  static create() {
   return Object.create(this.prototype);
 }


 /**
  * 
  * @param columnName 字段名
  * @param comment 中文显示名称
  * @param isEdit 是否可编辑
  * @param isList 是否可显示
  * @param editType 编辑类型，如:select/switch/text等
  * @param dataSource 下拉列表的来源字典编码
  * @param entityType 实体类型，如:string/int
  * @param columnType 对应的数据字段类型
  * @param entityName 实体名称
  */
	constructor(columnName, comment, isEdit, isList, editType, dataSource, entityType, columnType, entityName) {
		this.columnName = columnName;
		this.comment = comment;
		this.isEdit = isEdit;
		this.isList = isList;
		this.editType = editType;
		this.dataSource = dataSource;
		this.entityType = entityType;
		this.columnType = columnType;
		this.entityName = entityName;
	}



}

export default ColumnDefine
