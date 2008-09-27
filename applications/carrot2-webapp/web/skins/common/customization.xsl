<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="documents.xsl" />
  <xsl:include href="clusters.xsl" />

  <xsl:output indent="no" omit-xml-declaration="yes" method="xml"
              doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
              doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
              media-type="text/html" encoding="utf-8" />
              
  <xsl:strip-space elements="*" />
  
  <!-- Suffix appended to the head title after the current query -->
  <xsl:template match="page" mode="head-title-suffix">Carrot2 Clustering Engine</xsl:template>
  
  <!-- Main page title, hidden in most skins, but picked up by search engines -->
  <xsl:template match="page" mode="page-title">Carrot2 Search Results Clustering Engine</xsl:template>

  <!-- Introductory text shown below the query field on the startup screen -->
  <xsl:template match="page" mode="startup-text">
    Carrot<sup>2</sup> organizes your search results into topics. With
    an instant overview of what's available, you will quickly find what 
    you're looking for.  
  </xsl:template>

  <!-- Title of the About section -->
  <xsl:template match="page" mode="about-title">About Carrot<sup>2</sup>:</xsl:template>

  <!-- About text, hidden in most skins, but picked up by search engines -->
  <xsl:template match="page" mode="about-text">
    Carrot2 is an Open Source Search Results Clustering Engine. It can
    automatically organize (cluster) search results into thematic
    categories. For more information, please check the 
    <a href="http://project.carrot2.org">project website</a>.
  </xsl:template>

  <!-- List of about links, most skins show them -->
  <xsl:template match="page" mode="about-links">
    <ul class="util-links">
      <li><a href="#">About</a><xsl:call-template name="pipe" /></li>
      <li class="hot"><a href="#">New features!</a><xsl:call-template name="pipe" /></li>
      <li class="main"><a href="#">Beta</a><xsl:call-template name="pipe" /></li>
      <li><a href="#">More demos</a><xsl:call-template name="pipe" /></li>
      <li><a href="#">Plugins</a><xsl:call-template name="pipe" /></li>
      <li><a href="#">Download</a><xsl:call-template name="pipe" /></li>
      <li><a href="#">FAQ</a><xsl:call-template name="pipe" /></li>
      <li class="main"><a href="#">Carrot Search</a><xsl:call-template name="pipe" /></li>
      <li><a href="#">Contact</a></li>
    </ul>
  </xsl:template>

  <xsl:template name="pipe"><span class='pipe'> | </span></xsl:template>

  <!-- Error message text -->
  <xsl:template match="page" mode="error-text">
    Our apologies, the following processing error has occurred: 
    <span class="message"><xsl:value-of select="/page/@exception-message" /></span>
    If the error persists, please <a href="http://project.carrot2.org/support.html">contact us</a>.
  </xsl:template>
  
  <!-- Text to show when JavaScript is disabled -->
  <xsl:template match="page" mode="no-javascript-text">
    To use Carrot<sup>2</sup>, please enable JavaScript in your browser.
  </xsl:template>
  
  <!-- The whole about section, override if you need better control of it -->
  <xsl:template match="page" mode="about">
    <h3 class="hide"><xsl:apply-templates select=".." mode="about-title" /></h3>
    <p class="hide"><xsl:apply-templates select=".." mode="about-text" /></p>
    <xsl:apply-templates select=".." mode="about-links" />
  </xsl:template>
  
  <!-- The whole head title, override if you need better control of it -->
  <xsl:template match="page" mode="head-title">
    <xsl:if test="string-length(/page/request/@query) > 0">
      <xsl:value-of select="/page/request/@query" /> -
    </xsl:if>
    <xsl:apply-templates select=".." mode="head-title-suffix" />
  </xsl:template>
</xsl:stylesheet>
