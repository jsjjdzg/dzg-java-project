/**
* ${classInfo.classComment}MybatisDao层
*
* @author ${authorInfo}
* @since: V1.0 ${.now?string('yyyy-MM-dd')}
*/
@Component
public interface ${classInfo.className}Dao {

    /**
    * 新增
    */
    public int insert(@Param("${classInfo.className?uncap_first}Entity") ${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 删除
    */
    public int delete(@Param("${classInfo.className?uncap_first}Entity") ${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 更新
    */
    public int update(@Param("${classInfo.className?uncap_first}Entity") ${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 单个查询
    */
    public ${classInfo.className}Entity get(@Param("${classInfo.className?uncap_first}Entity") ${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 不分页查询数据
    */
    public List<${classInfo.className}Entity> getList(@Param("${classInfo.className?uncap_first}Entity") ${classInfo.className}Entity ${classInfo.className?uncap_first}Entity);

    /**
    * 分页查询数据
    */
	public List<${classInfo.className}Entity> pageList(@Param("${classInfo.className?uncap_first}Entity") ${classInfo.className}Entity ${classInfo.className?uncap_first}Entity,
                             PagerModel pageModel);

    /**
    * 分页查询数量
    */
    public int pageListCount(@Param("${classInfo.className?uncap_first}Entity") ${classInfo.className}Entity ${classInfo.className?uncap_first}Entity,
                             PagerModel pageModel);

}
