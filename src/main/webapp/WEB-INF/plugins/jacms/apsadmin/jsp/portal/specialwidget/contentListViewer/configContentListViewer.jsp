<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wp" uri="/aps-core" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form" %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core" %>

<h1 class="panel panel-default title-page">
	<span class="panel-body display-block">
		<a href="<s:url action="viewTree" namespace="/do/Page" />" title="<s:text name="note.goToSomewhere" />: <s:text name="title.pageManagement" />">
			<s:text name="title.pageManagement" /></a>&#32;/&#32;
		<a href="
						<s:url action="configure" namespace="/do/Page">
							<s:param name="pageCode"><s:property value="currentPage.code"/></s:param>
						</s:url>
			 " title="<s:text name="note.goToSomewhere" />: <s:text name="title.configPage" />"><s:text name="title.configPage" /></a>&#32;/&#32;
		<s:text name="name.showlet" />
	</span>
</h1>

<div id="main">

<s:set var="breadcrumbs_pivotPageCode" value="pageCode" />
<s:include value="/WEB-INF/apsadmin/jsp/portal/include/pageInfo_breadcrumbs.jsp" />

<s:action namespace="/do/Page" name="printPageDetails" executeResult="true" ignoreContextParams="true"><s:param name="selectedNode" value="pageCode"></s:param></s:action>

<h3 class="margin-more-top margin-more-bottom"><s:text name="name.widget" />:&#32;<s:property value="%{getTitle(showlet.type.code, showlet.type.titles)}" /></h3>

		<h2 class="h5 margin-small-vertical">
			<label class="sr-only"><s:text name="name.showlet" /></label>
			<span class="icon icon-puzzle-piece" title="<s:text name="name.showlet" />"></span>&#32;
			<s:property value="%{getTitle(showlet.type.code, showlet.type.titles)}" />
		</h2>

		<p class="sr-only">
			<s:hidden name="pageCode" />
			<s:hidden name="frame" />
			<s:hidden name="showletTypeCode" value="%{showlet.type.code}" />
		</p>

	<s:if test="hasFieldErrors()">
		<div class="alert alert-danger alert-dismissable">
			<button class="close" data-dismiss="alert"><span class="icon icon-remove"></span></button>
			<h3 class="h4 margin-none"><s:text name="message.title.FieldErrors" /></h3>
			<ul>
			<s:iterator value="fieldErrors">
				<s:iterator value="value">
				<li><s:property escape="false" /></li>
				</s:iterator>
			</s:iterator>
			</ul>
		</div>
	</s:if>

		<s:if test="showlet.config['contentType'] == null">
		<%-- CONTENT TYPE --%>
		<fieldset class="col-xs-12 margin-large-top">

		<div class="form-group">
			<label for="contentType"><s:text name="label.type"/></label>
			<div class="input-group">
				<s:select name="contentType" id="contentType" list="contentTypes" listKey="code" listValue="descr" cssClass="form-control" />
				<span class="input-group-btn">
					<s:submit type="button" action="configListViewer" cssClass="btn btn-success">
						<span class="icon icon-ok"></span>&#32;
						<s:text name="label.confirm" />
					</s:submit>
				</span>
			</div>

		</fieldset>
		</s:if>
		<s:else>

		<fieldset class="margin-medium-top"><legend><s:text name="title.contentInfo" /></legend>
			<div class="form-group">
				<div class="col-xs-12">
					<label for="contentType"><s:text name="label.type"/></label>
					<div class="input-group">
						<s:select name="contentType" id="contentType" list="contentTypes" listKey="code" listValue="descr" disabled="true" value="%{getShowlet().getConfig().get('contentType')}" cssClass="form-control" />
						<span class="input-group-btn">
							<s:submit action="changeContentType" value="%{getText('label.change')}" cssClass="btn btn-info" />
						</span>
					</div>
				</div>
			</div>
			<p class="sr-only">
				<s:hidden name="contentType" value="%{getShowlet().getConfig().get('contentType')}" />
				<s:hidden name="categories" value="%{getShowlet().getConfig().get('categories')}" />
				<s:iterator value="categoryCodes" var="categoryCodeVar" status="rowstatus">
				<input type="hidden" name="categoryCodes" value="<s:property value="#categoryCodeVar" />" id="categoryCodes-<s:property value="#rowstatus.index" />"/>
				</s:iterator>
			</p>

		</fieldset>

		<fieldset class="margin-medium-top">
			<legend data-toggle="collapse" data-target="#options-publishing"><s:text name="title.publishingOptions" />&#32;<span class="icon icon-chevron-down"></span></legend>

			<div class="collapse" id="options-publishing">
				<div class="form-group">
					<div class="col-xs-12">
						<label for="modelId"><s:text name="label.contentModel" /></label>
						<s:select name="modelId" id="modelId" value="%{getShowlet().getConfig().get('modelId')}"
							list="%{getModelsForContentType(showlet.config['contentType'])}" headerKey="" headerValue="%{getText('label.default')}" listKey="id" listValue="description" cssClass="form-control" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-12">
						<label for="maxElemForItem"><s:text name="label.maxElementsForItem" /></label>
						<s:select name="maxElemForItem" id="maxElemForItem" value="%{getShowlet().getConfig().get('maxElemForItem')}"
							headerKey="" headerValue="%{getText('label.all')}" list="#{1:1,2:2,3:3,4:4,5:5,6:6,7:7,8:8,9:9,10:10,15:15,20:20}" cssClass="form-control" />
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-12">
						<label for="maxElements"><s:text name="label.maxElements" /></label>
						<s:select name="maxElements" id="maxElements" value="%{getShowlet().getConfig().get('maxElements')}"
							headerKey="" headerValue="%{getText('label.all')}" list="#{1:1,2:2,3:3,4:4,5:5,6:6,7:7,8:8,9:9,10:10,15:15,20:20}" cssClass="form-control" />
					</div>
				</div>
			</div>
		</fieldset>

		<fieldset class="margin-medium-top">
			<legend data-toggle="collapse" data-target="#filters"><s:text name="title.filterOptions" />&#32;<span class="icon icon-chevron-down"></span></legend>

			<div class="collapse" id="filters">
				<div class="form-group">
					<div class="col-xs-12">
						<label for="category"><s:text name="label.categories" /></label>
						<div class="input-group">
							<s:select name="categoryCode" id="category" list="categories" listKey="code" listValue="getShortFullTitle(currentLang.code)" headerKey="" headerValue="%{getText('label.all')}" cssClass="form-control" />
							<span class="input-group-btn">
								<s:submit type="button" action="addCategory" cssClass="btn btn-info">
									<span class="icon icon-filter">&#32;
									<s:text name="label.filter" />
								</s:submit>
							</span>
						</div>
					</div>
				</div>

				<s:if test="null != categoryCodes && categoryCodes.size() > 0">
					<h3 class="sr-only"><s:text name="title.resourceCategories.list"/></h3>
					<s:iterator value="categoryCodes" var="categoryCodeVar">
					<s:set name="showletCategory" value="%{getCategory(#categoryCodeVar)}"></s:set>

					<span class="label label-default label-sm pull-left padding-small-top padding-small-bottom margin-small-right margin-small-bottom">
					  <span class="icon icon-tag"></span>&#32;
					  <abbr title="<s:property value="#showletCategory.getFullTitle(currentLang.code)"/>">
					    <s:property value="#showletCategory.getShortFullTitle(currentLang.code)" />
					  </abbr>&#32;
					  <wpsa:actionParam action="removeCategory" var="actionName" >
					  	<wpsa:actionSubParam name="categoryCode" value="%{#categoryCodeVar}" />
					  </wpsa:actionParam>
					  <s:submit
					    type="button"
					    action="%{#actionName}"
					    title="%{getText('label.remove') + ' ' + #showletCategory.getFullTitle(currentLang.code)}"
					    cssClass="btn btn-default btn-xs badge">
					     <span class="icon icon-remove"></span>
					      <span class="sr-only">x</span>
					  </s:submit>
					</span>

					</s:iterator>

					<div class="clearfix"></div>

					<s:if test="categoryCodes.size() > 1">
						<div class="btn-group" data-toggle="buttons">
							<label for="orClauseCategoryFilter" class="btn btn-default">
								<wpsf:checkbox name="orClauseCategoryFilter"
									value="%{getShowlet().getConfig().get('orClauseCategoryFilter')}" id="orClauseCategoryFilter" />
								<s:text name="label.orClauseCategoryFilter" />
							</label>
						</div>
					</s:if>
				</s:if>
				<%--
				<s:else>
					<p><s:text name="note.categories.none" /></p>
				</s:else>
				--%>
				<div class="form-group">
					<div class="col-xs-12">
						<label for="filterKey"><s:text name="label.filter" /></label>
						<div class="input-group">
							<s:select name="filterKey" id="filterKey" list="allowedFilterTypes" listKey="key" listValue="value" cssClass="form-control" />
							<span class="input-group-btn">
								<s:submit type="button" action="setFilterType" cssClass="btn btn-info">
									<span class="icon icon-plus-sign-alt"></span>&#32;
									<s:text name="label.add" />
								</s:submit>
							</span>
						</div>
					</div>
				</div>

				<p class="sr-only">
					<s:hidden name="filters" value="%{getShowlet().getConfig().get('filters')}" />
				</p>

				<s:if test="null != filtersProperties && filtersProperties.size()>0" >
					<ol class="list-group">
					<s:iterator value="filtersProperties" id="filter" status="rowstatus">
					<%--
						<s:property value="#rowstatus.index+1"/>
					--%>
						<li class="list-group-item">
							<s:text name="label.filterBy" /><strong>
								<s:if test="#filter['key'] == 'created'">
									<s:text name="label.creationDate" />
								</s:if>
								<s:elseif test="#filter['key'] == 'modified'">
									<s:text name="label.lastModifyDate" />
								</s:elseif>
								<s:else>
									<s:property value="#filter['key']" />
								</s:else>
							</strong><s:if test="(#filter['start'] != null) || (#filter['end'] != null) || (#filter['value'] != null)">,
							<s:if test="#filter['start'] != null">
								<s:text name="label.filterFrom" /><strong>
									<s:if test="#filter['start'] == 'today'">
										<s:text name="label.today" />
									</s:if>
									<s:else>
										<s:property value="#filter['start']" />
									</s:else>
								</strong>
								<s:if test="#filter['startDateDelay'] != null" >
									<s:text name="label.filterValueDateDelay" />:<strong> <s:property value="#filter['startDateDelay']" /></strong>&nbsp;<s:text name="label.filterDateDelay.gg" />&nbsp;
								</s:if>
							</s:if>
							<s:if test="#filter['end'] != null">
								<s:text name="label.filterTo" /><strong>
									<s:if test="#filter['end'] == 'today'">
										<s:text name="label.today" />
									</s:if>
									<s:else>
										<s:property value="#filter['end']" />
									</s:else>
								</strong>
								<s:if test="#filter['endDateDelay'] != null" >
									<s:text name="label.filterValueDateDelay" />:<strong> <s:property value="#filter['endDateDelay']" /></strong>&nbsp;<s:text name="label.filterDateDelay.gg" />
								</s:if>
							</s:if>
							<s:if test="#filter['value'] != null">
								<s:text name="label.filterValue" />:<strong> <s:property value="#filter['value']" /></strong>
									<s:if test="#filter['likeOption'] == 'true'">
										<em>(<s:text name="label.filterValue.isLike" />)</em>
									</s:if>
							</s:if>
							<s:if test="#filter['valueDateDelay'] != null" >
								<s:text name="label.filterValueDateDelay" />:<strong> <s:property value="#filter['valueDateDelay']" /></strong>&nbsp;<s:text name="label.filterDateDelay.gg" />
							</s:if>
							</s:if>
							<s:if test="#filter['nullValue'] != null" >
								&nbsp;<s:text name="label.filterNoValue" />
							</s:if>
							&middot;
							<s:if test="#filter['order'] == 'ASC'"><s:text name="label.order.ascendant" /></s:if>
							<s:if test="#filter['order'] == 'DESC'"><s:text name="label.order.descendant" /></s:if>

							<div class="btn-toolbar pull-right">
								<div class="btn-group btn-group-sm">
									<wpsa:actionParam action="moveFilter" var="actionName" >
										<wpsa:actionSubParam name="filterIndex" value="%{#rowstatus.index}" />
										<wpsa:actionSubParam name="movement" value="UP" />
									</wpsa:actionParam>
									<s:submit type="button" action="%{#actionName}" title="%{getText('label.moveUp')}" cssClass="btn btn-default">
										<span class="sr-only"><s:text name="label.moveUp" /></span>
										<span class="icon icon-sort-up"></span>
									</s:submit>

									<wpsa:actionParam action="moveFilter" var="actionName" >
										<wpsa:actionSubParam name="filterIndex" value="%{#rowstatus.index}" />
										<wpsa:actionSubParam name="movement" value="DOWN" />
									</wpsa:actionParam>
									<s:submit type="button" action="%{#actionName}" title="%{getText('label.moveDown')}" cssClass="btn btn-default">
										<span class="sr-only"><s:text name="label.moveDown" /></span>
										<span class="icon icon-sort-down"></span>
									</s:submit>
								</div>
								<div class="btn-group btn-group-sm">
									<wpsa:actionParam action="removeFilter" var="actionName" >
										<wpsa:actionSubParam name="filterIndex" value="%{#rowstatus.index}" />
									</wpsa:actionParam>
									<s:submit type="button" action="%{#actionName}" title="%{getText('label.remove')}" cssClass="btn btn-warning">
										<span class="icon icon-remove-circle"></span>
									</s:submit>
								</div>
							</div>
							<span class="clearfix"></span>
						</li>
					</ol>

				</s:iterator>
				</s:if>
				<%--
				<s:else>
					<p><s:text name="note.filters.none" /></p>
				</s:else>
				--%>
			</div>
		</fieldset>

		<%-- TITLES --%>
		<fieldset class="margin-medium-top">
			<legend data-toggle="collapse" data-target="#options-extra"><s:text name="title.extraOption" />&#32;<span class="icon icon-chevron-down"></span></legend>
		<div class="collapse" id="options-extra">
			<p><s:text name="note.extraOption.intro" /></p>
				<s:iterator id="lang" value="langs">
					<div class="form-group">
						<div class="col-xs-12">
							<label for="title_<s:property value="#lang.code" />">
								<code class="label label-info"><s:property value="#lang.code" /></code>&#32;
								<s:text name="label.title" />
							</label>
							<s:textfield name="tiale_%{#lang.code}" id="title_%{#lang.code}" value="%{showlet.config.get('title_' + #lang.code)}" cssClass="form-control" />
						</div>
					</div>
				</s:iterator>

				<div class="form-group">
					<div class="col-xs-12">
						<label for="pageLink"><s:text name="label.page" /></label>
						<s:select list="pages" name="pageLink" id="pageLink" listKey="code" listValue="getShortFullTitle(currentLang.code)"
								value="%{showlet.config.get('pageLink')}" headerKey="" headerValue="%{getText('label.none')}" cssClass="form-control" />
					</div>
				</div>

				<s:iterator var="lang" value="langs">
					<div class="form-group">
						<div class="col-xs-12">
							<label for="linkDescr_<s:property value="#lang.code" />">
								<code class="label label-info"><s:property value="#lang.code" /></code>&#32;
								<s:text name="label.link.descr"/>
							</label>
							<s:textfield name="liakDescr_%{#lang.code}" id="linkDescr_%{#lang.code}" value="%{showlet.config.get('linkDescr_' + #lang.code)}" cssClass="form-control" />
						</div>
					</div>
				</s:iterator>

			</div>
		</fieldset>


		<%-- USER FILTERS - START BLOCK --%>
		<fieldset class="margin-medium-top">
			<legend data-toggle="collapse" data-target="#filters-frontend"><s:text name="title.filters.search" />&#32;<span class="icon icon-chevron-down"></span></legend>

			<div class="collapse" id="filters-frontend">

				<div class="form-group">
					<div class="col-xs-12">
						<label for="userFilterKey"><s:text name="label.filter" /></label>
						<div class="input-group">
							<s:select name="userFilterKey" id="userFilterKey" list="allowedUserFilterTypes" listKey="key" listValue="value" cssClass="form-control" />
							<span class="input-group-btn">
								<s:submit type="button" action="addUserFilter" cssClass="btn btn-info">
									<span class="icon icon-plus-sign-alt"></span>&#32;
									<s:text name="label.add" />
								</s:submit>
							</span>
						</div>
					</div>
				</div>

				<p class="sr-only">
					<s:hidden name="userFilters" value="%{getShowlet().getConfig().get('userFilters')}" />
				</p>

				<s:if test="null != userFiltersProperties && userFiltersProperties.size() > 0" >
				<ol class="list-group">
					<s:iterator value="userFiltersProperties" id="userFilter" status="rowstatus">
					<li class="list-group-item">
						<s:text name="label.filterBy" />
						<strong>
							<s:if test="#userFilter['attributeFilter'] == 'false'">
								<s:if test="#userFilter['key'] == 'fulltext'">
									<s:text name="label.fulltext" />
								</s:if>
								<s:elseif test="#userFilter['key'] == 'category'">
									<s:text name="label.category" />
									<s:if test="null != #userFilter['categoryCode']">
										<s:set name="userFilterCategoryRoot" value="%{getCategory(#userFilter['categoryCode'])}"></s:set>
										(<s:property value="#userFilterCategoryRoot.getFullTitle(currentLang.code)"/>)
									</s:if>
								</s:elseif>
							</s:if>
							<s:elseif test="#userFilter['attributeFilter'] == 'true'">
								<s:property value="#userFilter['key']" />
							</s:elseif>
						</strong>

						<div class="btn-toolbar pull-right">
							<div class="btn-group btn-group-sm">
								<wpsa:actionParam action="moveUserFilter" var="actionName" >
									<wpsa:actionSubParam name="filterIndex" value="%{#rowstatus.index}" />
									<wpsa:actionSubParam name="movement" value="UP" />
								</wpsa:actionParam>
								<s:submit type="button" action="%{#actionName}" title="%{getText('label.moveUp')}" cssClass="btn btn-default">
									<span class="icon icon-sort-up"></span>
								</s:submit>
								<wpsa:actionParam action="moveUserFilter" var="actionName" >
									<wpsa:actionSubParam name="filterIndex" value="%{#rowstatus.index}" />
									<wpsa:actionSubParam name="movement" value="DOWN" />
								</wpsa:actionParam>
								<s:submit type="button" action="%{#actionName}" title="%{getText('label.moveDown')}" cssClass="btn btn-default">
									<span class="icon icon-sort-down"></span>
								</s:submit>
							</div>
							<div class="btn-group btn-group-sm">
								<wpsa:actionParam action="removeUserFilter" var="actionName" >
									<wpsa:actionSubParam name="filterIndex" value="%{#rowstatus.index}" />
								</wpsa:actionParam>
								<s:submit type="button" action="%{#actionName}" title="%{getText('label.remove')}" cssClass="btn btn-warning">
									<span class="icon icon-remove-circle"></span>
								</s:submit>
							</div>
						</div>
						<span class="clearfix"></span>
					</li>
					</s:iterator>
				</ol>
				</s:if>

			</div>

		</fieldset>
		<%-- USER FILTERS - END BLOCK --%>

		</s:else>

	</div>
</div>

<div class="form-group">
	<div class="col-xs-12 col-sm-4 col-md-3 margin-small-vertical">
		<s:submit action="saveListViewerConfig" value="%{getText('label.save')}" cssClass="btn btn-primary btn-block" />
	</div>
</div>

</s:form>

</div>
