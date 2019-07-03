/**
* ${classInfo.classComment}逻辑处理入口Controller
*
* @author ${authorInfo}
* @since: V1.0 ${.now?string('yyyy-MM-dd')}
*/
@RestController
public class ${classInfo.className}Controller {

    @Autowired
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

    /**
    * 分页查询
    */
    @RequestMapping("/pageList")
    public GridBean pageList(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity) {
        return ${classInfo.className?uncap_first}Service.pageList(${classInfo.className?uncap_first}Entity);
    }

    /**
    * 查询列表
    */
    @RequestMapping("/getList")
    public Result getList(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity){
        return ${classInfo.className?uncap_first}Service.getList(${classInfo.className?uncap_first}Entity);
    }

    /**
    * 查询
    */
    @RequestMapping("/get")
    public Result get(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity){
        return ${classInfo.className?uncap_first}Service.get(${classInfo.className?uncap_first}Entity);
    }

    /**
    * 新增
    */
    @RequestMapping("/insert")
    public Result insert(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity){
        return ${classInfo.className?uncap_first}Service.insert(${classInfo.className?uncap_first}Entity);
    }

    /**
    * 删除
    */
    @RequestMapping("/delete")
    public Result delete(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity){
        return ${classInfo.className?uncap_first}Service.delete(${classInfo.className?uncap_first}Entity);
    }

    /**
    * 更新
    */
    @RequestMapping("/update")
    public Result update(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity){
        return ${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first}Entity);
    }

}
