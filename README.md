![Public Market Foundation](.github/public_market_readme_banner_1024_big.png)

# Public Reputation System

[![pipeline status](https://gitlab.com/publicmarket/global-reputation/badges/master/pipeline.svg)](https://gitlab.com/publicmarket/global-reputation/commits/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/3adc0b1ef907f0cabe30/maintainability)](https://codeclimate.com/github/public-market-foundation/public-reputation/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/3adc0b1ef907f0cabe30/test_coverage)](https://codeclimate.com/github/public-market-foundation/public-reputation/test_coverage)

Some of the biggest brands and most important companies in the world have been built on the back of the reputation of their products & services. Online commerce made seller reputation - based on real customer reviews - transparent, visible, and verified against actual purchases for the first time. This was a watershed innovation in the mainstreaming of eCommerce, as the greatest inhibitor to buying online was the risk that a seller will not deliver the product, as described, in a timely manner, with high quality customer service.

Unfortunately, eCommerce reputation has been dominated by private marketplaces such as eBay Feedback or Amazon Ratings. As a result, these reputations are not portable or aggregated. Rather, they are only valuable inside the marketplace itself. This non-portability creates further lock-in for sellers, as to move to another marketplace would require rebuilding their seller reputation from scratch. It also deepens the competitive moat for the monopoly marketplace, as upstart marketplaces must convince buyers to purchase from merchants without established reputations.

Public Market brings something new and important to online commerce - a portable reputation score, based on verified identity, that can be used to conduct business anywhere. A seller’s Global Reputation Score can be integrated anywhere on the Internet (Craigslist or a merchant’s own eCommerce site, for example), further incentivizing sellers to join the Public Market network.

## Technical Details

Public protection platform is Rails API application provides the following JSON:API ([http://jsonapi.org/](http://jsonapi.org/)) endpoints:

`GET /reputations/:id`

* Get seller reputation

`GET /ratings/:id`

* Get rating by uid

`POST /ratings`

* Add a new rating
* Clients MUST provide `X-Api-Key` header

`PUT /ratings/:id`

* Modify existing rating
* Clients MUST provide `X-Api-Key` header

## LICENSE

Copyright (c) 2018 Public Market Foundation, released under the LGPL
