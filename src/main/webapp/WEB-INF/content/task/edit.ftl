<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>编辑任务</title>
<#include "/content/commons/page_css.ftl" />
<#include "/content/commons/page_js.ftl" />

<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
		
	// 表单验证
	$inputForm.validate({
		rules: {
		},
		messages: {
		},
		submitHandler:function(form){
            form.submit();
        }
	});
	
	$("#btn_pop_submitA").click(function(){
 		$inputForm.submit();
	});
	
	
});
</script>

</head>

<body>
<form id="inputForm" method="post" action="update">
	<input type="hidden" name="id" value="${info.id}" />
	<input type="hidden" name="disorder" value="0" />
	
    <div id="auditTab" class="pop_main" style="width:600px;border: 0px solid;">

       <div class="pop_information_mod">
            <ul class="pop_list merchant_type_add">
            
                	<li class="clearfix">
                		<label for="title require" class="tit">任务标题：<span class=" red">*</span></label>
                		<input class="c_input_text required" type="text" style="width:200px;" name="title" value="${(info.title)!}" realValue="请输入标题" maxlength="200" />
               		</li>

                	<li class="clearfix">
                		<label for="projectId" class="tit">所属项目：<span class=" red">*</span></label>
                		<select class="c_select" name="projectId" style="width:150px;" id="projectId">
                		<#list projectList as project>
							<option value="${project.id}" <#if (info.projectId?? && project.id == info.projectId)> selected="selected"</#if>>
								${project.name}
							</option>
						</#list>
						</select>
                	</li>
                	
                	<li class="clearfix">
                		<label for="action" class="tit">类型：<span class=" red">*</span></label>
               			<span>${actionTypeMap[info.action?string].getName()}</span>
               			<input type="hidden" name="action" value="${(info.action)!}" />
                	</li>
                	
                	<li class="clearfix">
                		<label for="status" class="tit">当前状况：<span class=" red">*</span></label>
               			<span>${statusTypeMap[info.status?string].getName()}</span>
               			<input type="hidden" name="status" value="${(info.status)!}" />
                	</li>

					<li class="clearfix">
                		<label for="exVersion" class="tit">上次版本：<span class=" red">*</span></label>
                		<span>${(info.exVersion)!}</span>
               			<input type="hidden" name="exVersion" value="${(info.exVersion)!}" />
                	</li>
					<li class="clearfix">
                		<label for="version" class="tit">发布版本：<span class=" red">*</span></label>
               			<input class="c_input_text required" type="text" style="width:200px;" name="version" value="${(info.version)!}" realValue="请输入版本号" maxlength="200" />
                	</li>
            </ul>

        </div>

    </div>
    <div class="pop_footer">
        <a id="btn_pop_submitA" class="btn_pop_submitA" href="javascript:void(0)">确定</a>
        <a id="btn_pop_submitB" class="btn_pop_submitB" href="javascript:void(0)" onclick="art.dialog.close();">取消</a>
    </div>

</form>


</body>
</html>