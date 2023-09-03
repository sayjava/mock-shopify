# Shopify Hydrogen

<p align="center">
<a href="https://hydrogen-mock-shopify.faker-server.dev">https://hydrogen-mock-shopify.faker-server.dev</a>
</p>

The [Hydrogen](https://hydrogen.shopify.dev/) framework is a Shopify official
storefront. The example storefront is a clone of the Shopify Hydrogen Starter.
It points to the mock Shopify GraphQL API to pull data with no changes to the
codebase.

- Follow the [instructions](https://hydrogen.shopify.dev/) to create a new
  storefront with Hydrogen
- Change the shopify domain to the mock shopify URL in the `.env` file

## Changes To Hydrogen Codebase

The only change to the codebase is the `PUBLIC_STORE_DOMAIN` variable in the
`.env`. this is an example of the `.env` file

```env
SESSION_SECRET="mock-secret"
PUBLIC_STOREFRONT_API_TOKEN="mock-api-token"
PRIVATE_STOREFRONT_API_TOKEN="mock-api-token"
PUBLIC_STORE_DOMAIN="shopify.faker-server.dev/graphql"
PUBLIC_STOREFRONT_ID="foobar"
```

## Internationalization

`Mock Shopify` supports internalization. The default country is `US`. To change
the country which mostly affects the currency, use the `country` variable in the
graphql variable.

The example query below will return the cart in the `FR` (French) locale

```graphql copy
query CartQuery($country: CountryCode = ZZ, $language: LanguageCode) @inContext(country: $country, language: $language) {
  cart(id: "some-cart-id") {
    cost {
      totalAmount {
        amount
        currencyCode
      }
    }
  }
}
```

```json copy
{
  "country": "FR",
  "language": "fr"
}
```

To see this in action using the hydrogen example shop

- [French Shop](https://hydrogen-shopify.faker-server.com/fr-FR)
- [British Shop](https://hydrogen-shopify.faker-server.com/en-GB)
- [Japanese Shop](https://hydrogen-shopify.faker-server.com/ja-JP)
