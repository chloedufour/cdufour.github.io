<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="//div[@type='scene']">
        <xsl:variable name="scene"><xsl:value-of select="substring-after(head, 'SCÈNE ')"/></xsl:variable>
        <xsl:result-document href="{concat('/Users/chloe/Desktop/', 'frscene', $scene, '.html')}">
            <html>
            <head>
                <title><xsl:value-of select="head"/></title>
                <link rel="stylesheet" type="text/css" href="don-juan-style.css"/>
            </head> 
            <body>
                <div id="{concat('fr', head)}" class="tabcontent">
                    <xsl:apply-templates/></div></body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="head">
        <h2><xsl:apply-templates/></h2>
    </xsl:template>
    
    <xsl:template match="stage">
        <h3><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="sp">
        <dl><xsl:apply-templates/></dl>
    </xsl:template>
    
    <xsl:template match="speaker">
        <dt><xsl:apply-templates/></dt>
    </xsl:template>
    
    <xsl:template match="stage[@type='gesture']">
        <dd class="gesture"><xsl:apply-templates/></dd>
    </xsl:template>
    
    <xsl:template match="p">
        <dd><xsl:apply-templates/></dd>
    </xsl:template>
    
</xsl:stylesheet>