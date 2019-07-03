/**
* 分页Model
*
* @author ${authorInfo}
* @since: V1.0 ${.now?string('yyyy-MM-dd')}
*/
@Accessors(chain = true)
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class PagerModel {

    @ApiModelProperty(value = "页码")
    private int page = 1;

    @ApiModelProperty(value = "每页显示行数")
    private int rows = 10;

    @ApiModelProperty(value = "排序对象，对应的表字段名称")
    private String sortObject;

    @ApiModelProperty(value = "排序方式，asc/desc")
    private String sortType;

    @ApiModelProperty(value = "开始数")
    private int start = (page - 1) * rows;

    @ApiModelProperty(value = "结尾数")
    private int end = page * rows;
}
