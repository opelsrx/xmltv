<?php

$datevar = date('Y-m-d');

$saxon = new Saxon\SaxonProcessor();

$xsltproc = $saxon->newXsltProcessor();
$xsltproc->setParameter('today', $saxon->createAtomicValue($datevar));
$xsltproc->setSourceFromFile('xml_files/first.xml');
$xsltproc->compileFromFile('xml_files/first.xsl');
$xsltproc->setOutputFile('xml_files/second.xml');
$xsltproc->transformToFile();      

$xsltproc->clearProperties();
$xsltproc->clearParameters();

header('Content-type: text/xml');
readfile("xml_files/second.xml");

?>
