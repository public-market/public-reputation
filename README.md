![Public Market Foundation](.github/public_market_readme_banner_1024_big.png)

# Public Reputation

[![pipeline status](https://gitlab.com/publicmarket/global-reputation/badges/master/pipeline.svg)](https://gitlab.com/publicmarket/global-reputation/commits/master)
[![Maintainability](https://api.codeclimate.com/v1/badges/3adc0b1ef907f0cabe30/maintainability)](https://codeclimate.com/github/public-market-foundation/public-reputation/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/3adc0b1ef907f0cabe30/test_coverage)](https://codeclimate.com/github/public-market-foundation/public-reputation/test_coverage)

Public Reputation is a portable reputation score, based on a verified identity, that can be used to conduct business anywhere. "Reputation" is fundamentally a facet of trust, which is required in order for a peer-to-peer online commerce system to operate.  Utilizing Blockchain for its inherent immutable nature ensures that Public Reputation is transparent, open, secure and accessible to anyone. Public Reputation will initially function as a score that changes over time as seller review scores are given by buyers. This reputation score is recorded to Blockchain and is “portable”, meaning it can be utilized across multiple online storefronts, or anywhere such information has value. No longer is “reputation” locked to a single marketplace or held proprietary by a single ecosystem.

## Technical Details

Public Reputation is a Rails API application providing the following JSON:API ([http://jsonapi.org/](http://jsonapi.org/)) endpoints:

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

## Contributing

See [how you can help](.github/CONTRIBUTING.md).

## Code of Conduct

Public Market Foundation [Code of Conduct](.github/CODE_OF_CONDUCT.md).

## LICENSE

Copyright (c) 2018 Public Market Foundation, released under the LGPL
