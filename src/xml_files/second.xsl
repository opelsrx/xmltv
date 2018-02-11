<!-- This file is to demonstrate another way to make the xhtml, it is not used in the website -->

<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

<xsl:output method="xml" encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd." http-equiv="Content-Type" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes" />


	<xsl:template match="/">

		<html>
			<head>
				<title>Tv Tabloid</title>
				<link rel="stylesheet" href="xml_files/tabloid_xhtml.css" type="text/css"/>
			</head>

			<body>
				<h1>Online tabloid service</h1>
				<xsl:apply-templates select="//channel"/>

			</body>
		</html>
	</xsl:template>


	<xsl:template match="channel">

		<div class="channelColumn">
			<p><xsl:value-of select="./name"/></p>
			<div><img alt="logotyp" ><xsl:attribute name="src"><xsl:value-of select="logotype"/></xsl:attribute></img></div>

			<xsl:for-each select="show">

				<xsl:variable name="time" select="start"/>
				<xsl:variable name="tempHour" select="substring($time,9,2)"/>
				<xsl:variable name="tempMin" select="substring($time,11,2)"/>
				<xsl:variable name="description" select="desc"/>
				<div class="showInfo">
					<h2><xsl:value-of select="concat($tempHour, ':', $tempMin)"/></h2>
					<h2><xsl:value-of select="titel"/></h2>
					<xsl:if test="$description">
						<h3><xsl:value-of select="$description"/></h3>
					</xsl:if>
				</div>
			</xsl:for-each>
		</div>

	</xsl:template>

</xsl:stylesheet>
