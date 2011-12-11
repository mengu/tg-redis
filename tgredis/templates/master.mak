<!doctype html>
<html>
<head>
    ${self.meta()}
    <title>${self.title()}</title>
    <link rel="stylesheet" type="text/css" media="screen" href="${tg.url('/css/style.css')}" />
    <link rel="stylesheet" type="text/css" media="screen" href="${tg.url('/css/admin.css')}" />
</head>
<body class="${self.body_class()}">
  ${self.header()}
  ${self.main_menu()}
  ${self.content_wrapper()}
  ${self.footer()}
</body>

<%def name="content_wrapper()">
    <div id="content">
    <div>
    % if page:
      <div class="currentpage">
       Now Viewing: <span>${page}</page>
      </div>
    % endif
      <%
      flash=tg.flash_obj.render('flash', use_js=False)
      %>
      % if flash:
        ${flash | n}
      % endif
      ${self.body()}
    </div>
</%def>

<%def name="body_class()">
</%def>
<%def name="meta()">
  <meta content="text/html; charset=UTF-8" http-equiv="content-type"/>
</%def>

<%def name="title()">  </%def>

<%def name="header()">
  <div id="header">
  	<h1>
  		Welcome to TurboGears 2
		<span class="subtitle">The Python web metaframework</span>
	</h1>
  </div>
</%def>
<%def name="footer()">
  <div class="flogo">
    <img src="${tg.url('/images/under_the_hood_blue.png')}" alt="TurboGears" />
    <p><a href="http://www.turbogears.org/">Powered by TurboGears 2</a></p>
  </div>
  <div class="foottext">
    <p>TurboGears is a open source front-to-back web development
      framework written in Python. Copyright (c) 2005-2009 </p>
  </div>
  <div class="clearingdiv"></div>
</div>
</%def>
<%def name="main_menu()">
  <ul id="mainmenu">
	<li class="first"><a href="${tg.url('/')}" class="${('', 'active')[page=='index']}">Home Page</a></li>
    <li><a href="${tg.url('/?feed=python')}" class="${('', 'active')[page=='Python']}">Python</a></li>
    <li><a href="${tg.url('/?feed=django')}" class="${('', 'active')[page=='Django']}">Django</a></li>
    <li><a href="${tg.url('/?feed=ruby')}" class="${('', 'active')[page=='Ruby']}">Ruby</a></li>
	<li><a href="${tg.url('/?feed=rails')}" class="${('', 'active')[page=='Rails']}">Rails</a></li>
	<li><a href="${tg.url('/?feed=scala')}" class="${('', 'active')[page=='Scala']}">Scala</a></li>
  </ul>
</%def>
</html>
