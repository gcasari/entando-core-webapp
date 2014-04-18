<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>
<%@ taglib prefix="wp" uri="/aps-core" %>

<h1 class="panel panel-default title-page">
	<span class="panel-body display-block">
		<s:text name="title.Portal.guiFragmentManagement" />
	</span>
</h1>

<s:form action="list" cssClass="form-horizontal">
	<s:if test="hasActionErrors()">
		<div class="alert alert-danger alert-dismissable fade in">
			<button class="close" data-dismiss="alert"><span class="icon icon-remove"></span></button>
			<h2 class="h4 margin-none"><s:text name="message.title.ActionErrors" /></h2>
			<ul class="margin-base-top">
				<s:iterator value="actionErrors">
					<li><s:property escape="false" /></li>
					</s:iterator>
			</ul>
		</div>
	</s:if>
	<div class="form-group">
		<div class="input-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<span class="input-group-addon">
				<span class="icon fa fa-file-text-o fa-lg" title="<s:text name="label.search.by"/>&#32;<s:text name="label.id"/>"></span>
			</span>
			<label for="search-id" class="sr-only"><s:text name="label.search.by"/>&#32;<s:text name="label.id"/></label>
			<wpsf:textfield
				id="guiFragment_id"
				name="id"
				cssClass="form-control input-lg"
				title="%{getText('label.search.by')+' '+getText('label.id')}"
				placeholder="%{getText('label.id')}" />
			<div class="input-group-btn">
				<wpsf:submit type="button" name="search-id" id="search-id" cssClass="btn btn-primary btn-lg" title="%{getText('label.search')}">
					<span class="sr-only"><s:text name="label.search" /></span>
					<span class="icon fa fa-search" title="<s:text name="label.search" />"></span>
				</wpsf:submit>
				<button type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="collapse" data-target="#search-advanced" title="<s:text name="title.searchFilters" />">
					<span class="sr-only"><s:text name="title.searchFilters" /></span>
					<span class="caret"></span>
				</button>
			</div>
		</div>
		<div class="input-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div id="search-advanced" class="collapse well collapse-input-group">
				<div class="form-group">
					<label class="control-label col-sm-2 text-right" for="guiFragment_code">
						<s:text name="label.code"/>
					</label>
					<div class="col-sm-5">
						<wpsf:textfield
							id="guiFragment_code"
							name="code"
							cssClass="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2 text-right" for="guiFragment_widgetTypeCode">
						<s:text name="label.widgetTypeCode"/>
					</label>
					<div class="col-sm-5">
						<wpsf:textfield
							id="guiFragment_widgetTypeCode"
							name="widgetTypeCode"
							cssClass="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2 text-right" for="guiFragment_pluginCode">
						<s:text name="label.pluginCode"/>
					</label>
					<div class="col-sm-5">
						<wpsf:textfield
							id="guiFragment_pluginCode"
							name="pluginCode"
							cssClass="form-control" />
					</div>
				</div>
				<%--
				<div class="form-group">
					<label class="control-label col-sm-2 text-right" for="guiFragment_gui">
						<s:text name="label.gui"/>
					</label>
					<div class="col-sm-5">
						<wpsf:textfield
							id="guiFragment_gui"
							name="gui"
							cssClass="form-control" />
					</div>
				</div>
				--%>
				<div class="form-group">
					<div class="col-sm-5 col-sm-offset-2">
						<s:submit type="button" cssClass="btn btn-primary">
							<span class="icon fa fa-search"></span>&#32;<s:text name="label.search" />
						</s:submit>
					</div>
				</div>

			</div>
		</div>
	</div>
</s:form>

<a class="btn btn-default" href="<s:url action="new" />">
	<span class="icon fa fa-plus-circle" />
	&#32;<s:text name="guiFragment.label.new" />
</a>

<s:form action="search">	
	<p class="sr-only">
		<wpsf:hidden name="id" />
		<wpsf:hidden name="code" />
		<wpsf:hidden name="widgetTypeCode" />
		<wpsf:hidden name="pluginCode" />
		<%-- <wpsf:hidden name="gui" /> --%>
	</p>

	<s:set var="guiFragmentsId_list" value="guiFragmentsId" />
	<s:if test="#guiFragmentsId_list.size > 0">
		<wpsa:subset source="#guiFragmentsId_list" count="10" objectName="groupGuiFragments" advanced="true" offset="5">
			<s:set name="group" value="#groupGuiFragments" />

			<div class="text-center">
				<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pagerInfo.jsp" />
				<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pager_formBlock.jsp" />
			</div>

			<div class="table-responsive">
				<table class="table table-bordered">
					<tr>
						<th class="text-center padding-large-left padding-large-right col-xs-4 col-sm-3 col-md-2 col-lg-2"><abbr title="<s:text name="label.actions" />">&ndash;</abbr></th>
						<th class="text-right"><s:text name="label.id" /></th>
						<th><s:text name="label.code" /></th>
						<th><s:text name="label.widgetTypeCode" /></th>
						<th><s:text name="label.pluginCode" /></th>
						<%-- <th><s:text name="label.gui" /></th> --%>
					</tr>
					<s:iterator var="id">
						<s:set name="guiFragment_var" value="%{getGuiFragment(#id)}" />
						<s:url action="edit" var="editGuiFragmentActionVar"><s:param name="id" value="#guiFragment_var.id"/></s:url>
						<s:url action="trash" var="trashGuiFragmentActionVar"><s:param name="id" value="#guiFragment_var.id"/></s:url>
							<tr>
								<td class="text-center text-nowrap">
									<div class="btn-group btn-group-xs">
									<%-- edit --%>
									<a class="btn btn-default" title="<s:text name="label.edit" />&#32;<s:property value="#guiFragment_var.id" />" href="<s:property value="#editGuiFragmentActionVar" escapeHtml="false" />">
										<span class="sr-only"><s:text name="label.edit" />&#32;<s:property value="#guiFragment_var.id" /></span>
										<span class="icon fa fa-pencil-square-o"></span>
									</a>
								</div>
								<%-- remove --%>
								<div class="btn-group btn-group-xs">
									<a
										class="btn btn-warning"
										href="<s:property value="#trashGuiFragmentActionVar" escapeHtml="false" />"
										title="<s:text name="label.remove" />: <s:property value="#guiFragment_var.id" />"
										>
										<span class="sr-only"><s:text name="label.alt.clear" /></span>
										<span class="icon fa fa-times-circle-o"></span>&#32;
									</a>
								</div>				
							</td>
							<td class="text-right"><code><s:property value="#guiFragment_var.id"/></code></td>
							<td><s:property value="#guiFragment_var.code"/></td>
							<td><s:property value="#guiFragment_var.widgetTypeCode"/></td>
							<td><s:property value="#guiFragment_var.pluginCode"/></td>
							<%-- <td><s:property value="#guiFragment_var.gui"/></td> --%>
						</tr>
					</s:iterator>
				</table>
			</div>
			<div class="text-center">
				<s:include value="/WEB-INF/apsadmin/jsp/common/inc/pager_formBlock.jsp" />
			</div>
		</wpsa:subset>
	</s:if>
	<s:else>
		<div class="alert alert-info">
			<s:text name="guiFragment.message.list.empty" />
		</div>
	</s:else>
</s:form>