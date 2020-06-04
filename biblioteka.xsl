<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="biblioteka">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>

        </xsl:text>
        <html>
            <body>
                <h1>Biblioteka</h1>
                <div class="czytelnicy">
                    <h2>Czytelnicy</h2>
                    <xsl:apply-templates select="czytelnicy"/>
                    <h3>Kolejka rezerwacji</h3>
                    <xsl:apply-templates select="rezerwacja/kolejka"/>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="czytelnicy" match="czytelnicy">
        <xsl:for-each select="czytelnik">
            <li>
            <xsl:value-of select="@id" />
                <xsl:text> </xsl:text>
            <xsl:value-of select="imie"/>
                <xsl:text> </xsl:text>
            <xsl:value-of select="nazwisko"/>
                <xsl:text> </xsl:text>
            <xsl:value-of select="status"/>
            </li>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="kolejka" match="kolejka">
            <table>
                <tr>
                    <th>Nr</th>
                    <th>Id czytelnika</th>
                    <th>Imie czytelnika</th>
                </tr>
                <xsl:for-each select="miejsce">
                    <xsl:call-template name="miejsce"/>
            </xsl:for-each>
            </table>
    </xsl:template>
    <xsl:template name="miejsce" match="miejsce">
        <tr>
            <td><i><xsl:value-of select="@nr"/></i></td>
            <td><xsl:value-of select="id_cz"/></td>
            <td><xsl:value-of select="imie"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
