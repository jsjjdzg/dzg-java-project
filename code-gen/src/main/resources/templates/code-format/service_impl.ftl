/**
* ${classInfo.classComment}逻辑处理实现类
*
* @author ${authorInfo}
* @since: V1.0 ${.now?string('yyyy-MM-dd')}
*/
@Service
public class ${classInfo.className}ServiceImpl implements ${classInfo.className}Service {

	@Autowired
	private ${classInfo.className}Dao ${classInfo.className?uncap_first}Dao;

	/**
    * 新增
    */
	@Override
	public Result insert(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity) {

		if (${classInfo.className?uncap_first}Entity == null) {
			return new ResultUtil<>().setErrorMsgAndDiyCode(
				StatusEnum.PARAM_ERROR.getCode(), StatusEnum.PARAM_ERROR.getMessage());
        }

		${classInfo.className?uncap_first}Dao.insert(${classInfo.className?uncap_first}Entity);
        return new ResultUtil<>().setSuccessMsg(StatusEnum.SUCCESS.getMessage());
	}

	/**
	* 删除
	*/
	@Override
	public Result delete(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity) {
		int ret = ${classInfo.className?uncap_first}Dao.delete(${classInfo.className?uncap_first}Entity);
		return ret > 0 ? new ResultUtil<>().setSuccessMsg(StatusEnum.SUCCESS.getMessage())
				:new ResultUtil<>().setErrorMsg(StatusEnum.FAIL.getMessage());
	}

	/**
	* 更新
	*/
	@Override
	public Result update(${classInfo.className} ${classInfo.className?uncap_first}) {
		int ret = ${classInfo.className?uncap_first}Dao.update(${classInfo.className?uncap_first});
		return ret > 0 ? new ResultUtil<>().setSuccessMsg(StatusEnum.SUCCESS.getMessage())
				:new ResultUtil<>().setErrorMsg(StatusEnum.FAIL.getMessage());
	}

	/**
	* 查询
	*/
	@Override
	public Result get(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity) {
		return new ResultUtil<>().setData(${classInfo.className?uncap_first}Dao.get(${classInfo.className?uncap_first}Entity));
	}

	/**
	* 查询多个
	*/
	@Override
	public Result getList(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity) {
		return new ResultUtil<>().setData(${classInfo.className?uncap_first}Dao.getList(${classInfo.className?uncap_first}Entity));
	}

	/**
	* 分页查询
	*/
	@Override
	public GridBean pageList(${classInfo.className}Entity ${classInfo.className?uncap_first}Entity) {

		List<${classInfo.className}> pageList = ${classInfo.className?uncap_first}Dao.pageList(${classInfo.className?uncap_first}Entity);
		int totalCount = ${classInfo.className?uncap_first}Dao.pageListCount(${classInfo.className?uncap_first}Entity);

		return new GridBean(${classInfo.className?uncap_first}Entity.getPage(),
			Math.round(totalCount / ${classInfo.className?uncap_first}Entity.getRows() ) + 1 , totalCount, pageList);
	}

}
