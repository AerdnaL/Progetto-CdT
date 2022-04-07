<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>

    <xsl:template match="/">
        <html xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
                <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet"></link>
                <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet"></link>
                <link href="style.css" rel="stylesheet" type="text/css"></link>
                <meta charset="UTF-8"></meta>
                <title> Progetto di Codifica di Testi </title>
            </head>
            <body>
                <header>
                    <h1 id="titolo">Cartoline dal passato</h1>
                    <nav>
                        <ul>
                            <li><a href="#cartolina48"> Cartolina 48</a></li>
                            <li><a href="#cartolina95"> Cartolina 45</a></li>
                            <li><a href="#cartolina157"> Cartolina 157 </a></li>
                            <li><a href="#crediti"> Crediti </a></li>
                        </ul>
                    </nav>
                    <div id="introduzione">
                        <p>
                            Questo sito è stato realizzato per il progetto del corso di Codifica di Testi a.a.
                            2020/2021 del corso di laurea in Informatica Umanistica. <br></br>
                            Le tre cartoline qui presentate provengono dal <i>Museo Civico Etnografico "Giovanni Podenzana".</i>, del comune di 
                            <i>La Spezia</i>.
                            <br></br>
                            Queste cartoline risalgono alla Prima Guerra Mondiale e riguardano la corrispondenza di due innamorati, Oliva Turtura e Giovanni Coliola.
                            <br></br>
                        </p>
                    </div>
                </header>
                <section id="cartolina48">
                    <div class="cont">
                        <xsl:apply-templates select="//tei:teiCorpus/tei:TEI[@xml:id='xml_48']"/>
                    </div>
                </section>

                <section id="cartolina95">
                    <div class="cont">
                        <xsl:apply-templates select="//tei:teiCorpus/tei:TEI[@xml:id='xml_95']"/>
                    </div>
                </section>

                <section id="cartolina157">
                    <div class="cont">
                        <xsl:apply-templates select="//tei:teiCorpus/tei:TEI[@xml:id='xml_157']"/>
                    </div>
                </section>

                <section id="crediti">
                    <div class="cont">
                        <xsl:apply-templates select="//tei:teiCorpus/tei:teiHeader/tei:fileDesc"/>
                    </div>
                </section>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:teiCorpus/tei:TEI[@xml:id='xml_48' or @xml:id='xml_95' or @xml:id='xml_157']">
            <div class="info">
                <h2><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h2>
                <div class="informazioni">
                    <h3>Informazioni sulla cartolina</h3>
                    <h4>Titolo: <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title"/></h4>
                    <p><b>Scritto da: </b><i><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author"/></i>, nel <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:bibl/tei:date"/></p>
                    <p><b>Codice identificativo: </b><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/></p>
                    <p><b>Condizione: </b><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:objectDesc/tei:supportDesc/tei:condition"/></p>
                    <p><b>Tipologia: </b><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords/tei:term[3]"/></p>
                    <p><b>Descrizione: </b><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords/tei:term[1]"/></p>
                    <p><b>Lingua: </b><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:langUsage/tei:language"/></p>
                    <br/>
                </div>
                <div class="persona">
                    <h3>Persone</h3>
                    <p><b>Mittente: </b><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person/tei:persName"/></p>
                    <p><b>Destinatario: </b><xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[2]/tei:persName"/></p>
                    <br/>
                </div>
                <div class="dataLuogo">
                    <h3>Luoghi e Date</h3>
                    <p><b>Luogo mittente: </b><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:placeName"/></p>
                    <p><b>Data mittente: </b><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='sent']/tei:date[@type='writing']"/></p>
                    <p><b>Luogo destinatario: </b><xsl:value-of select="tei:teiHeader/tei:profileDesc/tei:correspDesc/tei:correspAction[@type='received']/tei:placeName"/></p>
                </div>
                <div class="corpo">
                    <div class="fronte">
                        <p><xsl:value-of select="tei:text/tei:body/tei:div[@type='fronte']/tei:figure/tei:figDesc"/></p>
                    </div>
                </div>
            </div>
            <xsl:apply-templates select="tei:facsimile"/>
            <xsl:apply-templates select="tei:text/tei:body/tei:div[@type='retro']"/>
    </xsl:template>

    <!-- immagini -->

    <xsl:template match="tei:facsimile">
        <div class="immagine">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:surface[@xml:id='fronte048' or @xml:id='fronte095' or @xml:id='fronte157']/tei:graphic">
        <div class="imgfronte">
            <img src="{@url}"/>
        </div>
    </xsl:template>

    <xsl:template match="tei:surface[@xml:id='retro048' or @xml:id='retro095' or @xml:id='retro157']/tei:graphic">
        <div class="imgretro">
            <img src="{@url}"/>
        </div>
    </xsl:template>

    <!-- testi -->

    <xsl:template match="tei:body/tei:div[@type='retro']">
        <div class="testo">
            <div class="testoSinistra">
                <xsl:apply-templates select="tei:div[@type='codice']"/>
                <xsl:apply-templates select="tei:div[@type='message']"/>
            </div>
            <div class="testoDestra">
                <xsl:apply-templates select="tei:div[@type='destination']"/>
            </div>                
        </div>
    </xsl:template>

    <xsl:template match="tei:div[@type='codice']">
        <p>
            <xsl:value-of select="tei:p"></xsl:value-of>
            <br/>
        </p>
    </xsl:template>

    <xsl:template match="tei:div[@type='message']">
        <p><xsl:value-of select="tei:opener"/></p>
        <p><xsl:value-of select="tei:p"/></p>
        <p><xsl:value-of select="tei:closer"/></p>
    </xsl:template>

    <xsl:template match="tei:div[@type='destination']">
        <xsl:for-each select="tei:p[2]/tei:address/tei:addrLine">
            <p><xsl:value-of select="."/></p>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:teiCorpus/tei:teiHeader/tei:fileDesc">        
        <h1><xsl:value-of select="tei:titleStmt/tei:title"/></h1>                
        
        <div>
            <p><b>Trascritto da: </b></p>
            <p><xsl:value-of select="tei:titleStmt/tei:respStmt/tei:name[1]"/>, <xsl:value-of select="tei:titleStmt/tei:respStmt/tei:name[2]"/></p>
        </div>

        <div>
            <p><b>Ente di appartenenza: </b></p>
            <p><xsl:value-of select="tei:titleStmt/tei:respStmt[2]/tei:name"/></p>
        </div>

        <div>
            <p><i><xsl:value-of select="tei:editionStmt/tei:edition"/></i></p>
        </div>
        
        <div>
            <p><b>Codifica a cura di: </b></p>
            <p><xsl:value-of select="tei:titleStmt/tei:respStmt/tei:name[1]"/>, <xsl:value-of select="tei:titleStmt/tei:respStmt/tei:name[2]"/></p>
        </div>
        
        <div>
            <p><b>Compilato da: </b></p>
            <p><xsl:value-of select="tei:editionStmt/tei:respStmt[2]/tei:name"/></p>
        </div>
        
        <div>
            <p><b>Responsabile scientifico: </b></p>
            <p><xsl:value-of select="tei:editionStmt/tei:respStmt[3]/tei:name[1]"/>, <xsl:value-of select="tei:editionStmt/tei:respStmt[3]/tei:name[2]"/></p>
        </div>
        
        <div>
            <p><b>Funzionario responsabile: </b></p>
            <p><xsl:value-of select="tei:editionStmt/tei:respStmt[4]/tei:name"/></p>
        </div>
            
    </xsl:template>
</xsl:stylesheet>