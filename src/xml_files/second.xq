declare namespace saxon="http://saxon.sf.net/";
declare option saxon:output "method=xhtml";
declare option saxon:output "omit-xml-declaration=no";
declare option saxon:output "doctype-public=-//W3C//DTD XHTML 1.0 Strict//EN";
declare option saxon:output "doctype-system=http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd";
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tv Tabloid</title>
    <link rel="stylesheet" type="text/css" href="xml_files/tabloid_xhtml.css"/>
  </head>
  <body>
    <h1>Online tabloid service</h1>
    {
      for $chan in //*:channel
      return
        <div class="channelColumn">
          <p>{data($chan//*:name)}</p>
          <div>
            <img alt="logotyp" src="{data($chan/*:logotype)}" />
          </div>
          {
            for $show in $chan//*:show
            return
            <div class="showInfo">
              <h2>{data($show/*:start)}</h2>
              <h2>{data($show/*:titel)}</h2>
              {
                if(not($show/*:desc)) then (
                )
                else (
                  <h3>{data($show/*:desc)}</h3>
                )
              }
            </div>
          }
        </div>
    }
  </body>
</html>
