<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:param name="today" required="yes"/>

	<xsl:template match="/urls">
		<tvguide xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="second_xml.xsd">
			<xsl:apply-templates select="//url"/>
		</tvguide>
	</xsl:template>

	<xsl:template match="url">
		<xsl:variable name="channel" select="."/>
		<channel>
			<name><xsl:value-of select="$channel"/></name>
			<logotype><xsl:value-of select="concat('http://chanlogos.xmltv.se/', $channel, '.png')"/></logotype>

			<xsl:variable name="xmlfile" select="doc(concat('http://xmltv.xmltv.se/', $channel, '_', $today,'.xml.gz'))/tv" />

			<xsl:for-each select="$xmlfile//programme">
				<show>
					<xsl:variable name="time" select="./@start" />
					<xsl:variable name="tempHour" select="substring($time,9,2)"/>
					<xsl:variable name="tempMin" select="substring($time,11,2)"/>
					<start><xsl:value-of select="concat($tempHour, ':', $tempMin)"/></start>
					<titel><xsl:value-of select="./title"/></titel>
					<xsl:copy-of select="./desc"/>
				</show>

			</xsl:for-each>
		</channel>
	</xsl:template>



</xsl:stylesheet>
