declare namespace xlink = "http://www.w3.org/1999/xlink";

<Q4>
  {
    for $hr in //@xlink:href
    return <ns>{ $hr }</ns>
  }
</Q4>