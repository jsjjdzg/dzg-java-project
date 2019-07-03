/**
* 分页查询结果实体类
*
* @author ${authorInfo}
* @since: V1.0 ${.now?string('yyyy-MM-dd')}
*/
@Accessors(chain = true)
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class GridBean {

    @ApiModelProperty(value = "当前页")
    private int page;

    @ApiModelProperty(value = "总页数")
    private int total;

    @ApiModelProperty(value = "总条数")
    private int records;

    @ApiModelProperty(value = "当前页数据")
    private List<?> rows;

    @ApiModelProperty(value = "查询状态")
    private boolean success = true;

    @ApiModelProperty(value = "返回信息")
    private String message;

    public GridBean(int page, int total, int records, List<?> rows) {
        super();
        this.page = page;
        this.total = total;
        this.records = records;
        this.rows = rows;
    }
}