<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes"/>
    
    <xsl:variable name="article-id">
        <xsl:value-of select="count(//text/body/div[@id])"/>
    </xsl:variable>
    
    <xsl:template match="//text/body/div">
       <xsl:variable name="article-id"><xsl:value-of select="position()"/></xsl:variable>
       <xsl:result-document href="{concat('/Users/chloe/Desktop/IMH/', $article-id, '.html')}">
            <html>
                <head> 
                    <title><xsl:value-of select="head[1]"/></title>
                    <link rel="stylesheet" type="text/css" href="imhstyle.css"/>
                    <link href="https://fonts.googleapis.com/css?family=Noto+Serif" rel="stylesheet"/>
                </head>
                <body> 
                        <xsl:call-template name="pb"/>
                    <details><summary>Type Metadata</summary><p><xsl:value-of select="concat('type= ', @type, ' ', 'id= ', @id)"/></p></details>
                        <xsl:apply-templates/>
                </body>
            </html>
       </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="head">
        <h1 align="center"><xsl:apply-templates/></h1>
    </xsl:template>
    
    <xsl:template match="//hi[@rend='i']" name="italics">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    
    <xsl:template match="note[@place='marg']">
        <br/><span style="text-align: left;"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="//hi[@rend='b']" name="bold">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="div">
        
        <div><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="//body/pb" name="pb">
        <details><summary>Metadata</summary><p><xsl:value-of select="concat('n= ', @n, ' ', 'id= ', @id)"/></p></details>
    </xsl:template>
    
    <xsl:template match="p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="p[@rend='center']">
        <p style="text-align: center;"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="quote">
        <blockquote><xsl:apply-templates/></blockquote>
    </xsl:template>
    
    <xsl:template match="hi[@rend='sup']">
        <sup><xsl:apply-templates/></sup>
    </xsl:template>
    
    <xsl:template match="hi[@rend='u']">
        <u><xsl:apply-templates/></u>
    </xsl:template>
    
    <xsl:template match="list[@type='ordered']">
        <ol><xsl:apply-templates/></ol>
    </xsl:template>
    
    <xsl:template match="item">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    
</xsl:stylesheet>