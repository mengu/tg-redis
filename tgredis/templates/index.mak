<%inherit file="local:templates.master"/>

<%def name="title()">
  Welcome to TurboGears 2.1, standing on the shoulders of giants, since 2007
</%def>

<div id="getting_started" style="margin-bottom: 100px;">
  <h1>Reddit Feeds</h1>
  % for feed in feeds_list["data"]["children"]:
    <div><a href="${feed["data"]["url"]}">${feed["data"]["title"]}</a></div><br />
  % endfor
</div>
<div class="clearingdiv" />

