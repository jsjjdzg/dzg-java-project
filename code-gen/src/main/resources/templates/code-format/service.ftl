/**
* ${classInfo.classComment}逻辑处理Service
*
* @author ${authorInfo}
* @since: V1.0 ${.now?string('yyyy-MM-dd')}
*/
public interface ${classInfo.className}Service {

    /**
    * 新增
    */
    public Result insert(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 删除
    */
    public Result delete(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 更新
    */
    public Result update(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 查询
    */
    public ${classInfo.className}Entity get(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 查询多个
    */
    public List<${classInfo.className}Entity> getList(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 分页查询
    */
    public GridBean pageList(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

}
