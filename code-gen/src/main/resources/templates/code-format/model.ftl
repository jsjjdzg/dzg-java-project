/**
* ${classInfo.classComment}实体类
*
* @author ${authorInfo}
* @since: V1.0 ${.now?string('yyyy-MM-dd')}
*/
@Accessors(chain = true)
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class ${classInfo.className}Entity extends PagerModel implements Serializable{

    private static final long serialVersionUID = 48L;

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
<#list classInfo.fieldList as fieldItem >
    <#if fieldItem.fieldClass == "Date">
    @ApiModelProperty(value = "${fieldItem.fieldComment}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

    <#else>
    @ApiModelProperty(value = "${fieldItem.fieldComment}")
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};

    </#if>
</#list>
</#if>
}