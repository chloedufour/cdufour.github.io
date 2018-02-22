<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:output omit-xml-declaration="yes"/>
    
    <xsl:template match="node()|@*">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*"/>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="coach"/>
    
    <xsl:variable name="game_info">
        <xsl:value-of select="concat('The Minnesota Twins vs. New York Yankees', ' at ', game/@venue, ' on ', game/@date)"/>
    </xsl:variable>
    
    <xsl:template match="game">
        <html>
            <head>
                <title>MLB</title>
                <link rel="stylesheet" type="text/css" href="main.css"/> 
            </head>
            <body>
                <h1 class="mlb">MLB Game</h1>
                <p class="mlb">On April 4, 2011, the Minnesota Twins played the New York Yankees at Yankee Stadium. The first table is the team roster for the Twins and the second table is the roster for the Yankees.</p>
                <h2 class="mlb"><xsl:copy-of select="$game_info"/></h2>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="team">
        <div class="team"><table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Number</th>
                <th>Box Name</th>
                <th>RL</th>
                <th>Bats</th>
                <th>Position</th>
                <th>Status</th>
                <th>Bat Order</th>
                <th>Game Position</th>
                <th>Avg</th>
                <th>HR</th>
                <th>RBI</th>
            </tr>
            <xsl:apply-templates select="player">
            <xsl:sort select="@num" data-type="number" order="ascending"></xsl:sort>
        </xsl:apply-templates>
            <xsl:apply-templates select="coach"/>
        </table></div>
    </xsl:template>
    
    
    <xsl:template match="player">
        <tr><td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of  select="concat(@first, ' ', @last)"/></td>
            <td><xsl:value-of select="@num"/></td>
            <td><xsl:value-of select="@boxname"/></td>
            <td><xsl:value-of select="@rl"/></td>
            <td><xsl:value-of select="@bats"/></td>
            <td><xsl:value-of select="@position"/></td>
            <td><xsl:value-of select="@status"/></td>
            <td><xsl:value-of select="@bat_order"/></td>
            <td><xsl:value-of select="@game_position"/></td>
            <td><xsl:value-of select="@avg"/></td>
            <td><xsl:value-of select="@hr"/></td>
            <td><xsl:value-of select="@rbi"/></td>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>
    
    <!--<xsl:template match="coach">
        <xsl:copy><xsl:apply-templates/>
        <div class="coach"><table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Position</th>
                <th>Number</th>
            </tr>
            <xsl:apply-templates/>
        </table></div>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="coach" priority="2">
                <tr class="coach">
                    <td><xsl:value-of select="@id"/></td>
                    <td><xsl:value-of  select="concat(@first, ' ', @last)"/></td>
                    <td><xsl:value-of select="@position"/></td>
                    <td><xsl:value-of select="@num"/></td>
        <xsl:apply-templates/>
                </tr>
    </xsl:template> -->
    
    <xsl:template match="umpires">
        <h2 class="mlb">The Umpires at <xsl:copy-of select="$game_info"/></h2>
        <div class="umpire"><table>
            <tr>
                <th>Name</th>
                <th>Position</th>
            </tr>
            <xsl:apply-templates/>
        </table></div>
    </xsl:template>
    
    <xsl:template match="umpire">
        <tr>
            <td><xsl:value-of select="@name"/></td>
            <td><xsl:value-of select="@position"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>

<!--<xsl:template match=”parent”>
        <some html that you are creating>
            <xsl:apply-templates select=”child”>
                <xsl:sort select=”@attribute”  data-type=”number” order=”ascending or descending”/>
            </xsl:apply-templates>
        </some html>
    </xsl:template> -->