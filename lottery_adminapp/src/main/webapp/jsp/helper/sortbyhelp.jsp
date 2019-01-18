<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类管理</title>
<%@ include file='../include/asset_css.jsp'%>
<%@ include file='../include/asset_js.jsp'%>
<script src="${contextPath }/jsp/js/helpcenter/sortbyhelp.js"></script>
</head>
<body>
	<%@ include file="../include/top.jsp"%>
	<div class="container">
		<ol class="breadcrumb">
			<li><a href="${ctx }/index.do">首页</a></li>
			<li><a href="${ctx }/article/showHelp.do">帮助中心</a></li>
			<li class="active">分类管理</li>
		</ol>

		<div class="panel panel-default">
			<div class="panel-heading">分类管理</div>
			<div class="panel-body">
				<div class="form-horizontal ">
					<div class="form-group clear_margin_bottom">
						<label class="control-label col-sm-1">分类名称</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="datailName" />
							<input type="hidden" id="type" value="${code }">
						</div>
						<a href="javaScript:void(0);" class="btn btn-primary _add">新增分类</a>
					</div>
				</div>
			</div>
		</div>

		<table class="table table-bordered table-condensed table-hover">
			<thead>
				<tr class="text-center success">
					<td>#</td>
					<td width="20%">时间</td>
					<td>分类名称</td>
					<td width="10%">状态</td>
					<td width="10%">文章数</td>
					<td width="15%">操作</td>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach items="${sorts }" var="sort">
					<tr>
						<td>${sort.id }</td>
						<td><fmt:formatDate value="${sort.createTime }" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
						<td>${sort.datailName }</td>
						<td><span class="text-success">${sort.statusStr }</span></td>
						<td>${sort.count }</td>
						<td class="text-center">
							<a href="javaScript:void(0);" id="${sort.id }" class="btn btn-link btn-sm _edit_btn">修改</a>
							<a href="javaScript:void(0);" id="${sort.id }" class="btn btn-link btn-sm _del_btn">删除</a>
						</td>
					</tr>
				</c:forEach>
				<tr style="display: none;" class="_clone">
					<td>1</td>
					<td>2014-08-07 16:23:41</td>
					<td>财务相关</td>
					<td><span class="text-success">显示</span></td>
					<td>111</td>
					<td class="text-center"><a href="javaScript:void(0);"
						class="btn btn-link btn-sm _edit_btn">修改</a><a href="javaScript:void(0);"
						class="btn btn-link btn-sm _del_btn">删除</a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="modal fade " id="edit_modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">修改分类</h4>
				</div>
				<div class="modal-body">
					<div class="form-horizontal">
						<div class="form-group">
							<label class="control-label col-sm-2">分类名称</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="updateDatailName"/>
								<input type="hidden" class="form-control" id="id"/>
							</div>
						</div>
						<div class="form-group clear_margin_bottom">
							<label class="control-label col-sm-2">状态</label>
							<div class="col-sm-5">
								<label class="radio-inline"> <input type="radio"
									name="status" value="10002" /> 显示
								</label> <label class="radio-inline"> <input type="radio"
									name="status" value="10001" /> 隐藏
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						返回</button>
					<button type="button" class="btn btn-primary _update">确定</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade " id="del_modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">删除分类</h4>
				</div>
				<div class="modal-body">
					<p class="text-danger">确定删除该分类？并将该分类下所有条目移至：</p>
					<select class="form-control" style="width: 200px;" name="oid" id="dtype">
						<option>分类名称假字</option>
					</select>
					<input type="hidden" id="did" value="" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">
						返回</button>
					<button type="button" class="btn btn-primary _delete">确定</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>