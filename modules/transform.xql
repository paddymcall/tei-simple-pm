(:~
 : Transform a given source into a standalone document using
 : the specified odd.
 : 
 : @author Wolfgang Meier
 :)
xquery version "3.0";

declare namespace output="http://www.w3.org/2010/xslt-xquery-serialization";

import module namespace config="http://www.tei-c.org/tei-simple/config" at "config.xqm";
import module namespace pmu="http://www.tei-c.org/tei-simple/xquery/util" at "../content/util.xql";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare option output:method "html";
declare option output:html-version "5.0";
declare option output:media-type "text/html";

let $doc := request:get-parameter("doc", ())
let $odd := request:get-parameter("odd", "teisimple.odd")
return
    if ($doc) then
        let $xml := doc($config:data-root || "/" || $doc)
        return
            pmu:process($config:odd-root || "/" || $odd, $xml, $config:output-root, "../generated")
    else
        <p>No document specified</p>