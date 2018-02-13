<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="CATALOG">
    
    <html>
        <head>
            <title>Catalog of Plants</title>
            <link rel="stylesheet" type="text/css" href="chloedufour.github.io/css/main.css"/>
            <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montserrat|Nanum+Myeongjo" rel="stylesheet"/>
        </head>
        <h1 class="plants"> Catalog of Plants</h1>
    <xsl:apply-templates/>
    </html>
    </xsl:template>
    
    <xsl:template match="PLANT">
        <dl><xsl:apply-templates/></dl>
    </xsl:template>
    
    <xsl:template match="COMMON">
        <dt><xsl:apply-templates/></dt>
    </xsl:template>
    
    <xsl:template match="BOTANICAL">
        <dd class="botanical"><xsl:apply-templates/></dd>
    </xsl:template>
 
    <xsl:template match="ZONE">
        <dd class="zone">Zone: <xsl:apply-templates/></dd>
    </xsl:template>
    
    <xsl:template match="LIGHT">
        <dd class="light">Light Conditions: <xsl:apply-templates/></dd>
    </xsl:template>
    
    <xsl:template match="PRICE">
        <dd class="price"><xsl:apply-templates/></dd>
    </xsl:template>
    
    <xsl:template match="AVAILABILITY">
        <dd class="availability">Availability: <xsl:apply-templates/></dd>
    </xsl:template>
    
</xsl:stylesheet>