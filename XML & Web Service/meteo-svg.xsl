<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <svg:svg width="820" height="500" viewBox="0 0 820 500"
        role="img" aria-labelledby="titre description">
      <svg:title id="titre">Histogramme animé des températures</svg:title>
      <svg:desc id="description">Comparaison des températures de chaque ville pour chaque date.</svg:desc>
      <svg:style>
        text { font-family: Arial, sans-serif; fill: #183044; }
        .grid { stroke: #d7e2e8; stroke-width: 1; }
        .axis { stroke: #526b79; stroke-width: 1.5; }
      </svg:style>
      <svg:text x="410" y="28" text-anchor="middle" font-size="20" font-weight="bold">
        Températures par ville (°C)
      </svg:text>

      <svg:line class="axis" x1="48" y1="370" x2="790" y2="370"/>
      <svg:line class="axis" x1="48" y1="70" x2="48" y2="370"/>
      <svg:line class="grid" x1="48" x2="790" y1="370" y2="370"/>
      <svg:text x="40" y="374" text-anchor="end" font-size="11">0</svg:text>
      <svg:line class="grid" x1="48" x2="790" y1="280" y2="280"/>
      <svg:text x="40" y="284" text-anchor="end" font-size="11">10</svg:text>
      <svg:line class="grid" x1="48" x2="790" y1="190" y2="190"/>
      <svg:text x="40" y="194" text-anchor="end" font-size="11">20</svg:text>
      <svg:line class="grid" x1="48" x2="790" y1="100" y2="100"/>
      <svg:text x="40" y="104" text-anchor="end" font-size="11">30</svg:text>

      <xsl:for-each select="/meteo/mesure">
        <xsl:variable name="mesurePosition" select="position()"/>
        <xsl:for-each select="ville">
          <xsl:variable name="barX" select="60 + (position() - 1) * 86 + ($mesurePosition - 1) * 30"/>
          <xsl:variable name="barHeight" select="number(@temperature) * 9"/>
          <xsl:variable name="barY" select="370 - $barHeight"/>
          <svg:rect x="{$barX}" y="370" width="24" height="0" rx="2">
            <xsl:attribute name="fill">
              <xsl:choose>
                <xsl:when test="$mesurePosition = 1">#2186a6</xsl:when>
                <xsl:otherwise>#f08a4b</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <svg:animate attributeName="y" from="370" to="{$barY}" dur="1.2s" begin="0s" fill="freeze"/>
            <svg:animate attributeName="height" from="0" to="{$barHeight}" dur="1.2s" begin="0s" fill="freeze"/>
          </svg:rect>
          <svg:text x="{$barX + 12}" y="{$barY - 5}" text-anchor="middle" font-size="10">
            <xsl:value-of select="@temperature"/>
          </svg:text>
        </xsl:for-each>
      </xsl:for-each>

      <xsl:for-each select="/meteo/mesure[1]/ville">
        <svg:text x="{87 + (position() - 1) * 86}" y="390"
            text-anchor="middle" font-size="10">
          <xsl:value-of select="@nom"/>
        </svg:text>
      </xsl:for-each>

      <xsl:for-each select="/meteo/mesure">
        <xsl:variable name="legendX" select="540 + (position() - 1) * 130"/>
        <svg:rect x="{$legendX}" y="440" width="16" height="16">
          <xsl:attribute name="fill">
            <xsl:choose>
              <xsl:when test="position() = 1">#2186a6</xsl:when>
              <xsl:otherwise>#f08a4b</xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
        </svg:rect>
        <svg:text x="{$legendX + 23}" y="453" font-size="12">
          <xsl:value-of select="@date"/>
        </svg:text>
      </xsl:for-each>
    </svg:svg>
  </xsl:template>
</xsl:stylesheet>
