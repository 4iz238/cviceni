<results>
  {
    let $a := doc("bib.xml")//author
    for $last in distinct-values($a/last),
        $first in distinct-values($a[last=$last]/first)
    return
        <result>
            { $last, $first }
            {
                for $b in doc("bib.xml")/bib/book
                where some $ba in $b/author 
                      satisfies ($ba/last = $last and $ba/first=$first)
                return $b/title
            }
        </result>
  }
</results>