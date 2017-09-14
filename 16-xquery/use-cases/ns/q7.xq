declare namespace ma = "http://www.example.com/AuctionWatch";

<Q7>
  {
    for $a in //ma:Auction
    let $seller_id := $a/ma:Trading_Partners/ma:Seller/*:ID,
        $buyer_id := $a/ma:Trading_Partners/ma:High_Bidder/*:ID
    where namespace-uri($seller_id) = namespace-uri($buyer_id)
    return
        $a/ma:AuctionHomepage
  }
</Q7>