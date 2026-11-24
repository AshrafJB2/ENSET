<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="fr">
      <head>
        <meta charset="UTF-8"/>
        <title>Rapport des mandats</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 2rem; color: #183044; }
          h1 { color: #176b87; }
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid #b8cbd5; padding: .6rem; text-align: left; }
          th { background: #e6f3f7; }
          tbody tr:nth-child(even) { background: #f5fafb; }
        </style>
      </head>
      <body>
        <h1>Rapport des mandats</h1>
        <table>
          <thead>
            <tr>
              <th>Numéro</th>
              <th>Date</th>
              <th>Montant</th>
              <th>État</th>
              <th>Expéditeur</th>
              <th>Destinataire</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="rapport/mandat">
              <tr>
                <td><xsl:value-of select="@num"/></td>
                <td><xsl:value-of select="@date"/></td>
                <td><xsl:value-of select="@montant"/></td>
                <td><xsl:value-of select="@etat"/></td>
                <td>
                  <xsl:value-of select="expediteur/@prenom"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="expediteur/@nom"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="expediteur/@ville"/>
                  <xsl:text>)</xsl:text>
                </td>
                <td>
                  <xsl:value-of select="destinataire/@prenom"/>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="destinataire/@nom"/>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="destinataire/@ville"/>
                  <xsl:text>)</xsl:text>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
