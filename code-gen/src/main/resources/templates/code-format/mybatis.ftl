<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basePathInfo}.dao.${classInfo.className}Dao">

    <resultMap id="${classInfo.className}" type="${basePathInfo}.entity.${classInfo.className}" >
    <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
        <result column="${fieldItem.columnName}" property="${fieldItem.fieldName}" />
    </#list>
    </#if>
    </resultMap>

    <sql id="Base_Column_List">
    <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
        ${fieldItem.columnName}<#if fieldItem_has_next>,</#if>
    </#list>
    </#if>
    </sql>

    <insert id="insert" parameterType="java.util.Map" >
        INSERT INTO ${classInfo.tableName} (
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
        <#list classInfo.fieldList as fieldItem >
            <#if fieldItem.columnName != "Id" >
            ${fieldItem.columnName}<#if fieldItem_has_next>,</#if>
            </#if>
        </#list>
        </#if>
        )
        VALUES(
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
        <#list classInfo.fieldList as fieldItem >
        <#if fieldItem.columnName != "Id" >
            <#if fieldItem.columnName="AddTime" || fieldItem.columnName="UpdateTime" >
            NOW()<#if fieldItem_has_next>,</#if>
            <#else>
            ${r"#{"}${classInfo.className?uncap_first}Entity.${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>
            </#if>
        </#if>
        </#list>
        </#if>
        )
    </insert>

    <delete id="delete" parameterType="java.util.Map" >
        DELETE FROM ${classInfo.tableName}
        WHERE ${classInfo.fieldList[0].columnName} = ${r"#{"}${classInfo.className?uncap_first}Entity.${classInfo.fieldList[0].columnName}}
    </delete>

    <update id="update" parameterType="java.util.Map" >
        UPDATE ${classInfo.tableName}
        SET
        <#list classInfo.fieldList as fieldItem >
        <#if fieldItem.columnName != "Id" && fieldItem.columnName != "AddTime" && fieldItem.columnName != "UpdateTime" >
            ${fieldItem.columnName} = ${r"#{"}${classInfo.className?uncap_first}Entity.${fieldItem.fieldName}${r"}"},
        </#if>
        </#list>
            UpdateTime = NOW()
        WHERE ${classInfo.fieldList[0].columnName} = ${r"#{"}${classInfo.className?uncap_first}Entity.${classInfo.fieldList[0].columnName}}
    </update>

    <select id="get" parameterType="java.util.Map" resultMap="${classInfo.className}Entity">
        SELECT <include refid="Base_Column_List" />
        FROM ${classInfo.tableName}
        WHERE ${classInfo.fieldList[0].columnName} = ${r"#{"}${classInfo.className?uncap_first}Entity.${classInfo.fieldList[0].columnName}}
    </select>

    <select id="getList" parameterType="java.util.Map" resultMap="${classInfo.className}Entity">
        SELECT <include refid="Base_Column_List" />
        FROM ${classInfo.tableName}
     </select>

    <select id="pageList" parameterType="java.util.Map" resultMap="${classInfo.className}Entity">
        SELECT <include refid="Base_Column_List" />
        FROM ${classInfo.tableName}
        LIMIT ${r"#{"}${classInfo.className?uncap_first}Entity.start}, ${r"#{"}${classInfo.className?uncap_first}Entity.end}
    </select>

    <select id="pageListCount" parameterType="java.util.Map" resultType="int">
        SELECT count(1)
        FROM ${classInfo.tableName}
    </select>

</mapper>
