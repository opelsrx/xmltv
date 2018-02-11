<?php

$saxon = new Saxon\SaxonProcessor();
$xquery = $saxon->newXQueryProcessor();
$xquery->setQueryFile('xml_files/second.xq');
$xquery->setContextItemFromFile('xml_files/second.xml');
$xquery->runQueryToFile('xml_files/tabloid.html');

readfile("xml_files/tabloid.html");

?>
