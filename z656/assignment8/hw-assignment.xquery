declare default element namespace "urn:isbn:1-931666-22-9";
<findingaids>
{for $ead in collection("file:/Users/chloe/Desktop/xquery-assignment?select=*.xml") where some $c03 in $ead//c03 satisfies (count($ead//c03) > 1) order by $ead//eadid descending
    return 
<findingaid>
    <id>{data($ead//eadid)}</id>
    <title>{data($ead//titlepage/titleproper)}</title>
    <daterange> {number(data(substring-after($ead//titlestmt/titleproper/date, "-"))) - number(data(substring-before($ead//titlestmt/titleproper/date, "-")))} </daterange>

<encodedby>{data(substring-after($ead//eadheader/filedesc/titlestmt/author, 'by '))}</encodedby>
      
      <changes>{count($ead//eadheader/revisiondesc/change)}</changes>
      <physicalextent>{data($ead//archdesc/did/physdesc/extent)}</physicalextent>
    <restrictions>{data(string-join($ead//archdesc/accessrestrict/p, "| "))}</restrictions>
    
<indexingterms>{for $indexing in $ead//archdesc/controlaccess/controlaccess/list/item/extref
return <indexterm>{data(normalize-space($indexing))}</indexterm>}</indexingterms>
<volume>{count($ead//archdesc/dsc/c01/c02/c03)}</volume>
</findingaid>
}

</findingaids>

(:separate out the dates, making a number from the string:)