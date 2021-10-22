<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes" 
        include-content-type="no" indent="yes"/>  
    
    <xsl:variable name="letsrock" as="document-node()+" select="collection('../xml-and-schema/Song-XML/?select=*.xml')"/>
    
    <xsl:template match="/">
        <xsl:for-each select="$letsrock">
            <xsl:result-document method="xhtml" href="songCollectionHTML/{current()//song/@name ! replace(., '''', '') ! replace(., '\s+', '-')}.html" html-version="5" omit-xml-declaration="yes" include-content-type="no" indent="yes">
        <html>
            <head>
                <title>Let’s Rock: All the Lyrics</title>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                
                <!--ebb: Add your link element for the CSS stylesheet association here.
                  <link rel="stylesheet" type="text/css" href="style.css" />
                -->
                <!--ebb: Add your script element for the JS file association here. 
                <script type="text/javascript" src="highlight.js">/**/</script>
                -->
            </head>
            <body>
                <h1>Let’s Rock: All the Lyrics</h1>
                <!--Add HTML buttons, table of contents, etc? -->
                <!--The next section outputs the lyrics of each song in your XML collection.
                For now it's all one file, but we can revise this to output each song in a separate file.
                Is it useful to be able to see all the lyrics together on a page?
                -->
           <section id="lyrics">
                
                    <!-- ebb: I'm trying to generate id values that do not have spaces or apostrophes.
                    Getting rid of the apostrophe is tricky because it can be confused for the start of an XML attribute value.
                    To work with it, we have to escape it with *another* apostrophe so all of them are matched.
                    -->
               
                    <section id="{current()//song/@name ! replace(., '''', '') ! replace(., '\s+', '-')}">
                        <h2><xsl:apply-templates select="current()//sname"/></h2>
                        <h3><xsl:apply-templates select="current()//author"/></h3>
                        
                        <xsl:apply-templates select="descendant::verse | descendant::chorus"/>
                    </section>
           </section>
            </body>
        </html>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="verse | chorus">
        <div class="{current()/name()}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="line">
        <!--ebb: outputting the each line in a <div> block, and calculating the sequential line number in an HTML span element.-->
       <div class="line"> <span class="number"><xsl:value-of select="count(preceding::line) + 1"/><xsl:text> </xsl:text></span>
        <xsl:apply-templates/></div>
    </xsl:template>
    <xsl:template match="i">
        <span class="{@story}"><xsl:apply-templates/></span>
    </xsl:template>
    
</xsl:stylesheet>