<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" />

    <xsl:param name="uri" />
    <xsl:param name="args" />
    <xsl:param name="custom-style" />
    <xsl:param name="custom-link" />
    <xsl:param name="custom-desc" />

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <meta name="referrer" content="never" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
                <title>Index of <xsl:value-of select="$uri"/></title>
                <link rel="stylesheet" href="/_plugin/icon.css" />

                <style>
body {
    margin: 0;
    background-color: #F7F7F7;
    color: #333;
    margin-bottom: 4em;
}
table {
    width: 100%;
    border-spacing: 0;
    font-size: 0;
    background-color: #F7F7F7;
}
a {
    color: #333;
    font-weight: normal;
    text-decoration: none;
}
a:hover { color: dodgerblue; }
thead > tr {
    background: linear-gradient(to bottom,#f4f4f4 0,#eee 100%);
    box-shadow: 0 1px 1px 0 #DFDFDF;
    line-height: 4em;
}
th { border-right: 1px solid #ddd; }
th:hover { background: #FFF7; }
thead > tr > th, tr > td:last-child { text-align: center; }
thead > tr > th:first-child:after { content: 'Sort:'; }
thead > tr > th:nth-child(2), thead > tr > th:nth-child(3) { text-align: left; }
tr {
    color: #aaa;
    font-size: small;
}
tr:hover { background-color: #FFF; }
tr > td:first-child { width: 1px; }
td:nth-child(2) { font-size: medium; }
td {
    border-bottom: solid 1px #DFDFDF;
    border-top: solid 1px #FFF;
}
tbody > tr:first-child > td { border-top: none; }
img {
    width: 36px;
    max-height: 36px;
    margin: 0.5em;
}
header {
    position: absolute;
    right: 0;
}
#b_toggle {
    background: none;
    border: none;
    cursor: pointer;
    font-size: 2.5em;
    vertical-align: top;
    padding: 0;
}
#b_toggle:after {
    content: '#';
    display: block;
    width: .5em;
    word-break: break-all;
    line-height: 8px;
    color: #777;
    margin-top: .5em;
}
#b_toggle:focus {
    outline: none;
    padding: unset;
}
footer {
    box-shadow: 0 0 1px 0 #ccc;
    background-color: #EDEDED;
    text-align: center;
    line-height: 3em;
    position: fixed;
    bottom: 0;
    width: 100%;
}
                </style>
                <style id='b'>
thead > tr {
    display: block;
    width: 100%;
    height: 4em;
    border: none;
    margin-bottom: 2px;
}
thead > tr > th {
    display: inline;
    margin-right: 1px;
}
thead > tr > th:first-child { border: none; }
tr {
    display: inline-block;
    border: 2px dashed;
    width: 20em;
    height: 10em;
    margin: 0 -2px -2px 0;
    overflow: hidden;
}
tr > td:first-child { width: unset; }
td {
    display: block;
    text-align: center;
    border: none;
}
#b_toggle:after {
    content: '___';
    margin-top: -.2em;
}
                </style>

                <xsl:if test="normalize-space($custom-style) != ''">
                    <link rel="stylesheet">
                        <xsl:attribute name="href">
                            <xsl:value-of select="$custom-style" />
                        </xsl:attribute>
                    </link>
                </xsl:if>
            </head>
            <body>
                <header>
                    <button id="b_toggle" title="Switch View" onclick="toggle()"></button>
                    <a href="/"><img src="/_plugin/popup_close.png" /></a>
                </header>
                <xsl:apply-templates/>
                <script><![CDATA[
function get() {
    var p = document.cookie.search(/v=(0|1)/);
    if (~p && document.cookie[p+2] == "1") return 1;
    return 0;
}
function display(p) {
    document.getElementById('b').disabled = p;
    document.getElementById('b').type = p ? 'disable' : '';
}
function toggle() {
    var p = get() ? 0 : 1;
    document.cookie = "v=" + p + "; expires=" + new Date(Date.now() + 30758400000).toUTCString();
    display(p);
}
display(get());]]>
                </script>
                <footer><span><a href="{$custom-link}"><xsl:value-of select="$custom-desc" /></a></span></footer>
            </body>
        </html>
    </xsl:template>
    <xsl:variable name="SC">
        <xsl:if test="$args != ''"></xsl:if>
    </xsl:variable>
    <xsl:variable name="SN">
        <xsl:choose>
            <xsl:when test="$SC = 'N'">name</xsl:when>
            <xsl:when test="$SC = 'D'">date</xsl:when>
            <xsl:when test="$SC = 'S'">size</xsl:when>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="SO">
        <xsl:if test="$args != ''"></xsl:if>
    </xsl:variable>

    <xsl:template match="list">
        <table>
            <thead>
                <tr>
                    <th></th>
                    <th><a href="?C=N&amp;O=D">Name</a></th>
                    <th><a href="?C=D&amp;O=D">Date</a></th>
                    <th><a href="?C=S&amp;O=D">Size</a></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="icon folder"></td>
                    <td><a href="../">../</a></td>
                    <td></td>
                    <td></td>
                </tr>
                <xsl:if test="$SN != ''">
                    <xsl:choose>
                        <xsl:when test="$SO = 'A'">
                            <xsl:for-each select="directory">
                                <xsl:sort select="$SN" order="ascending"/>
                            </xsl:for-each>
                            <xsl:for-each select="file">
                                <xsl:sort select="$SN" order="ascending"/>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="$SO = 'D'">
                            <xsl:for-each select="file">
                                <xsl:sort select="$SN" order="descending"/>
                            </xsl:for-each>
                            <xsl:for-each select="directory">
                                <xsl:sort select="$SN" order="descending"/>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:if>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="directory">
        <tr>
            <td class="icon folder"></td>
            <td><a href="{.}"><xsl:value-of select="." /></a></td>
            <td><xsl:value-of select="translate(@mtime,'TZ',' ')" /></td>
            <td>-</td>
        </tr>
    </xsl:template>

    <xsl:template match="file">
        <xsl:variable name="size">
            <xsl:if test="string-length(@size) &gt; 0">
                <xsl:if test="number(@size) = 0">
                    <xsl:value-of select="@size" />
                </xsl:if>
                <xsl:if test="number(@size) &gt; 0">
                    <xsl:choose>
                        <xsl:when test="round(@size div 1024) &lt; 2"><xsl:value-of select="@size" /> B</xsl:when>
                        <xsl:when test="round(@size div 1048576) &lt; 2"><xsl:value-of select="format-number((@size div 1024), '0.0')" /> KB</xsl:when>
                        <xsl:when test="round(@size div 1073741824) &lt; 2"><xsl:value-of select="format-number((@size div 1048576), '0.00')" /> MB</xsl:when>
                        <xsl:otherwise><xsl:value-of select="format-number((@size div 1073741824), '0.00')" /> GB</xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="ext">
            <xsl:value-of select="substring-after(substring(.,string-length(.)-4),'.')"/>
        </xsl:variable>

        <tr>
            <td class="icon {$ext}"></td>
            <td><a href="{.}"><xsl:value-of select="." /></a></td>
            <td><xsl:value-of select="translate(@mtime,'TZ',' ')" /></td>
            <td title="{@size}"><xsl:value-of select="$size"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>