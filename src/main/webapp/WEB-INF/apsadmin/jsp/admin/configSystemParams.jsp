<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="wpsf" uri="/apsadmin-form"  %>
<%@ taglib prefix="wpsa" uri="/apsadmin-core"  %>
<h1 class="panel panel-default title-page">
	<span class="panel-body display-block">
		<a href="<s:url namespace="/do/BaseAdmin" action="settings" />"><s:text name="menu.configure" /></a> / <s:text name="menu.settings.general" /></span>
</h1>

<div class="row">
	
	<div class="hidden-xs hidden-sm col-md-3 col-lg-3 ">
			<s:set var="settingsNavMenuActiveItem" value="%{'configSystemParams'}" />
			<s:include value="/WEB-INF/apsadmin/jsp/admin/inc/settings-nav-menu.jsp" />
	</div>

	<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">

		<s:form action="updateSystemParams" cssClass="form-horizontal">
			<s:if test="hasActionMessages()">
				<div class="alert alert-success alert-dismissable fade in">
					<button class="close" data-dismiss="alert"><span class="icon icon-remove"></span></button>
					<h2 class="h4 margin-none"><s:text name="messages.confirm" /></h2>
					<ul class="margin-base-vertical">
							<s:iterator value="actionMessages">
								<li><s:property escape="false" /></li>
							</s:iterator>
					</ul>
				</div>
			</s:if>
			<fieldset>
				<legend><s:text name="name.pages" /></legend>
				<p class="text-right">
					<span class="label label-default"><s:text name="sysconfig.legend.systemPages" /></span>
				</p>
				
				<s:set name="className" value="'form-control'" />
				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3" for="homePageCode"><s:text name="sysconfig.homePageCode" /></label>
					<div class="col-md-9 col-lg-9">
						<s:set name="paramName" value="'homePageCode'" />
						<s:include value="/WEB-INF/apsadmin/jsp/admin/selectPageParamBlock.jsp" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3" for="notFoundPageCode"><s:text name="sysconfig.notFoundPageCode" /></label>
					<div class="col-md-9 col-lg-9">
						<s:set name="paramName" value="'notFoundPageCode'" />
						<s:include value="/WEB-INF/apsadmin/jsp/admin/selectPageParamBlock.jsp" />
					</div>
				</div>
			
				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3" for="errorPageCode"><s:text name="sysconfig.errorPageCode" /></label>
					<div class="col-md-9 col-lg-9">
						<s:set name="paramName" value="'errorPageCode'" />
						<s:include value="/WEB-INF/apsadmin/jsp/admin/selectPageParamBlock.jsp" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3" for="loginPageCode"><s:text name="sysconfig.loginPageCode" /></label>
					<div class="col-md-9 col-lg-9">
						<s:set name="paramName" value="'loginPageCode'" />
						<s:include value="/WEB-INF/apsadmin/jsp/admin/selectPageParamBlock.jsp" />
					</div>
				</div>
				
				<div class="form-group">
					<s:set name="paramName" value="'urlStyle'" />
					<label class="control-label col-lg-3 col-md-3"><s:text name="sysconfig.URLstyle" /></label>
					<div class="btn-group col-md-9 col-lg-9" data-toggle="buttons">
						
							<label class="btn btn-default <s:if test="systemParams['urlStyle'] == 'classic'"> active</s:if>" for="urlStyle_classic">
								<input type="radio" class="radiocheck" id="urlStyle_classic" name="urlStyle" value="classic" <s:if test="systemParams['urlStyle'] == 'classic'">checked="checked"</s:if> />
								<s:text name="URLstyle.classic" />
							</label>
							<label class="btn btn-default <s:if test="systemParams['urlStyle'] == 'breadcrumbs'"> active</s:if>" for="urlStyle_breadcrumbs">
								<input type="radio" class="radiocheck" id="urlStyle_breadcrumbs" name="urlStyle" value="breadcrumbs" <s:if test="systemParams['urlStyle'] == 'breadcrumbs'">checked="checked"</s:if> />
								<s:text name="URLstyle.breadcrumbs" />
							</label>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3"><s:text name="sysconfig.lang.browser" /></label>
					<div class="btn-group col-md-9 col-lg-9" data-toggle="buttons">
						<s:set name="paramName" value="'startLangFromBrowser'" />
						<s:include value="/WEB-INF/apsadmin/jsp/admin/booleanParamBlock.jsp" />
					</div>
				</div>
			</fieldset>

			<fieldset class="margin-large-top"><legend><s:text name="sysconfig.legend.privacyModule" /></legend>
				<div class="form-group">
					<s:set name="paramName" value="'extendedPrivacyModuleEnabled'" />
					<label class="control-label col-lg-3 col-md-3" for="extendedPrivacyModuleEnabled">
						<s:text name="label.active" />
					</label>
					<div class="col-md-9 col-lg-9">
						<div class="checkbox">
							<s:include value="/WEB-INF/apsadmin/jsp/admin/simpleCheckboxParamBlock.jsp" />	
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3" for="maxMonthsSinceLastAccess"><s:text name="sysconfig.maxMonthsSinceLastAccess" /></label>
					<div class="col-md-9 col-lg-9">
						<s:set name="paramName" value="'maxMonthsSinceLastAccess'" />
						<s:include value="/WEB-INF/apsadmin/jsp/admin/textParamBlock.jsp" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3"><s:text name="sysconfig.maxMonthsSinceLastPasswordChange" /></label>
					<div class="col-md-9 col-lg-9">
						<s:set name="paramName" value="'maxMonthsSinceLastPasswordChange'" />
						<s:include value="/WEB-INF/apsadmin/jsp/admin/textParamBlock.jsp" />
					</div>
				</div>
			</fieldset>

			<fieldset class="margin-large-top"><legend><s:text name="sysconfig.legend.misc" /></legend>
				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3"><s:text name="sysconfig.chooseYourEditor" /></label>
					<div class="btn-group col-md-9 col-lg-9" data-toggle="buttons">
							<label class="btn btn-default <s:if test="systemParams['hypertextEditor'] == 'none'"> active</s:if>" for="hypertextEditor_none">
								<input type="radio" id="hypertextEditor_none" name="hypertextEditor" value="none" <s:if test="systemParams['hypertextEditor'] == 'none'">checked="checked"</s:if> />
								<s:text name="label.none" />
							</label>
							<label class="btn btn-default <s:if test="systemParams['hypertextEditor'] == 'fckeditor'"> active</s:if>" for="hypertextEditor_fckeditor">
								<input type="radio" id="hypertextEditor_fckeditor" name="hypertextEditor" value="fckeditor" <s:if test="systemParams['hypertextEditor'] == 'fckeditor'">checked="checked"</s:if> />
								<s:text name="name.editor.ckeditor" />
							</label>
							<label class="btn btn-default <s:if test="systemParams['hypertextEditor'] == 'hoofed'"> active</s:if>" for="hypertextEditor_hoofed">
								<input type="radio" id="hypertextEditor_hoofed" name="hypertextEditor" value="hoofed" <s:if test="systemParams['hypertextEditor'] == 'hoofed'">checked="checked"</s:if> />
								<s:text name="name.editor.hoofed" />
							</label>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3"><s:text name="sysconfig.chooseYourPagesTreeStyle" /></label>
					<div class="btn-group col-md-9 col-lg-9" data-toggle="buttons">
						<s:set name="paramName" value="'treeStyle_page'" />
						<s:include value="/WEB-INF/apsadmin/jsp/admin/treeStyleParamBlock.jsp" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-3 col-md-3"><s:text name="sysconfig.chooseYourCategoriesTreeStyle" /></label>
					<div class="btn-group col-md-9 col-lg-9" data-toggle="buttons">
						<s:set name="paramName" value="'treeStyle_category'" />
						<s:include value="/WEB-INF/apsadmin/jsp/admin/treeStyleParamBlock.jsp" />
					</div>
				</div>

			</fieldset>

			<wpsa:hookPoint key="core.configSystemParams" objectName="hookPointElements_core_configSystemParams">
				<s:iterator value="#hookPointElements_core_configSystemParams" var="hookPointElement">
					<wpsa:include value="%{#hookPointElement.filePath}"></wpsa:include>
				</s:iterator>
			</wpsa:hookPoint>

			<div class="btn-toolbar">
				<div class="btn-group margin-small-vertical">
					<s:submit type="button" value="" cssClass="btn btn-success"><span class="icon icon-ok"></span>&#32;<s:text name="label.save" /></s:submit>
				</div>
			</div>
			
		</s:form>

	</div>
</div>

<%--
<div id="main">

<s:if test="hasActionMessages()">
<div class="message message_confirm">
<h2><s:text name="messages.confirm" /></h2>
<ul>
	<s:iterator value="actionMessages">
		<li><s:property escape="false" /></li>
	</s:iterator>
</ul>
</div>
</s:if>

<s:form action="updateSystemParams">
<fieldset class="margin-large-top"><legend><s:text name="name.pages" /></legend>
<div>

<p class="important"><s:text name="sysconfig.legend.systemPages" />:</p>
<p>
	<label for="homePageCode" class="basic-mint-label"><s:text name="sysconfig.homePageCode" />:</label>
	<s:set name="paramName" value="'homePageCode'" />
	<s:include value="/WEB-INF/apsadmin/jsp/admin/selectPageParamBlock.jsp" />
</p>

<p>
	<label for="notFoundPageCode" class="basic-mint-label"><s:text name="sysconfig.notFoundPageCode" />:</label>
	<s:set name="paramName" value="'notFoundPageCode'" />
	<s:include value="/WEB-INF/apsadmin/jsp/admin/selectPageParamBlock.jsp" />
</p>

<p>
	<label for="errorPageCode" class="basic-mint-label"><s:text name="sysconfig.errorPageCode" />:</label>
	<s:set name="paramName" value="'errorPageCode'" />
	<s:include value="/WEB-INF/apsadmin/jsp/admin/selectPageParamBlock.jsp" />
</p>

<p>
	<label for="loginPageCode" class="basic-mint-label"><s:text name="sysconfig.loginPageCode" />:</label>
	<s:set name="paramName" value="'loginPageCode'" />
	<s:include value="/WEB-INF/apsadmin/jsp/admin/selectPageParamBlock.jsp" />
</p>

<p class="important"><s:text name="sysconfig.URLstyle" />:</p>
<s:set name="paramName" value="'urlStyle'" />
<ul class="noBullet">
	<li><input type="radio" class="radiocheck" id="urlStyle_classic" name="urlStyle" value="classic" <s:if test="systemParams['urlStyle'] == 'classic'">checked="checked"</s:if> /><label for="urlStyle_classic"><s:text name="URLstyle.classic" /></label></li>
	<li><input type="radio" class="radiocheck" id="urlStyle_breadcrumbs" name="urlStyle" value="breadcrumbs" <s:if test="systemParams['urlStyle'] == 'breadcrumbs'">checked="checked"</s:if> /><label for="urlStyle_breadcrumbs"><s:text name="URLstyle.breadcrumbs" /></label></li>
</ul>

<p class="important"><s:text name="sysconfig.lang.browser" />:</p>
<s:set name="paramName" value="'startLangFromBrowser'" />
	<s:include value="/WEB-INF/apsadmin/jsp/admin/booleanParamBlock.jsp" />

</div>
</fieldset>

<fieldset><legend><s:text name="sysconfig.legend.privacyModule" /></legend>
<div>
<s:set name="paramName" value="'extendedPrivacyModuleEnabled'" />
<p>
	<s:include value="/WEB-INF/apsadmin/jsp/admin/simpleCheckboxParamBlock.jsp" /><label for="extendedPrivacyModuleEnabled"><s:text name="label.active" /></label>
</p>

<p>
	<label for="maxMonthsSinceLastAccess" class="basic-mint-label"><s:text name="sysconfig.maxMonthsSinceLastAccess" />:</label>
	<s:set name="paramName" value="'maxMonthsSinceLastAccess'" />
	<s:include value="/WEB-INF/apsadmin/jsp/admin/textParamBlock.jsp" />
</p>

<p>
	<label for="maxMonthsSinceLastPasswordChange" class="basic-mint-label"><s:text name="sysconfig.maxMonthsSinceLastPasswordChange" />:</label>
	<s:set name="paramName" value="'maxMonthsSinceLastPasswordChange'" />
	<s:include value="/WEB-INF/apsadmin/jsp/admin/textParamBlock.jsp" />
</p>
</div>
</fieldset>

<fieldset><legend><s:text name="sysconfig.legend.misc" /></legend>
<div>
<p class="important"><s:text name="sysconfig.chooseYourEditor" />:</p>
<ul class="noBullet radiocheck">
	<li><input type="radio" id="hypertextEditor_none" name="hypertextEditor" value="none" <s:if test="systemParams['hypertextEditor'] == 'none'">checked="checked"</s:if> /><label for="hypertextEditor_none"><s:text name="label.none" /></label></li>
	<li><input type="radio" id="hypertextEditor_fckeditor" name="hypertextEditor" value="fckeditor" <s:if test="systemParams['hypertextEditor'] == 'fckeditor'">checked="checked"</s:if> /><label for="hypertextEditor_fckeditor"><s:text name="name.editor.ckeditor" /></label></li>
	<li><input type="radio" id="hypertextEditor_hoofed" name="hypertextEditor" value="hoofed" <s:if test="systemParams['hypertextEditor'] == 'hoofed'">checked="checked"</s:if> /><label for="hypertextEditor_hoofed"><s:text name="name.editor.hoofed" /></label></li>
</ul>
</div>

<div>
<p class="important"><s:text name="sysconfig.chooseYourPagesTreeStyle" />:</p>
<s:set name="paramName" value="'treeStyle_page'" />
<s:include value="/WEB-INF/apsadmin/jsp/admin/treeStyleParamBlock.jsp" />
</div>

<div>
<p class="important"><s:text name="sysconfig.chooseYourCategoriesTreeStyle" />:</p>
<s:set name="paramName" value="'treeStyle_category'" />
<s:include value="/WEB-INF/apsadmin/jsp/admin/treeStyleParamBlock.jsp" />
</div>

</fieldset>

<wpsa:hookPoint key="core.configSystemParams" objectName="hookPointElements_core_configSystemParams">
<s:iterator value="#hookPointElements_core_configSystemParams" var="hookPointElement">
	<wpsa:include value="%{#hookPointElement.filePath}"></wpsa:include>
</s:iterator>
</wpsa:hookPoint>

<p class="centerText"><wpsf:submit useTabindexAutoIncrement="true" value="%{getText('label.save')}" cssClass="button" /></p>
</s:form>

</div>
--%>