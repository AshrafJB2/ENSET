<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="fr">
      <head>
        <meta charset="UTF-8"/>
        <title>Relevés météorologiques</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 2rem; color: #183044; }
          h1 { color: #176b87; }
          table { border-collapse: collapse; margin: 1rem 0 2rem; min-width: 24rem; }
          caption { font-weight: bold; padding: .6rem; text-align: left; }
          th, td { border: 1px solid #b8cbd5; padding: .55rem .8rem; text-align: left; }
          th { background: #e6f3f7; }
          tbody tr:nth-child(even) { background: #f5fafb; }
        </style>
      </head>
      <body>
        <h1>Mesures des températures</h1>
        <xsl:for-each select="meteo/mesure">
          <table>
            <caption>
              <xsl:text>Date : </xsl:text>
              <xsl:value-of select="@date"/>
            </caption>
            <thead>
              <tr><th>Ville</th><th>Température (°C)</th></tr>
            </thead>
            <tbody>
              <xsl:for-each select="ville">
                <tr>
                  <td><xsl:value-of select="@nom"/></td>
                  <td><xsl:value-of select="@temperature"/></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
