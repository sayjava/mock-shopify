<h1 align="center"> Mock Shopify Guide </h1>

<p align="center">
The most straightforward and efficient method to create a Shopify E-Commerce Storefront without the need to connect to an actual Shopify store
</p>

<p align="center">
<a href="https://shopify.faker-server.dev/graphql">https://shopify.faker-server.dev/graphql</a>
</p>

## Features

- No Shopify Store required.
- Simulate different `product`, `collection`, `cart`, `customer` and `search`
  scenarios
- Simulate blocks and articles
- Simulate different product recommendation scenarios
- Internationalization support
- Customer authentication support

> [!IMPORTANT] Mock Shopify GraphQL API was built to the specification of the
> Version 2023-07 of the GraphQL API

## Getting Started

It is very easy to get started with `Mock Shopify`. Just point your application
to the mock Shopify GraphQL API endpoint and you are good to go. Below are some
examples of how to get started with `Mock Shopify` using different frameworks.

- [Shopify Hydrogen Guide](/hydrogen.md)
- [NextJS E-Commerce Guide](/nextjs.md)

## Supported Shopify Operations

These are the currently supported operations. Operations that are not supported
returns an error.

- [x] Shop
- [x] Product(s)
  - [x] Recommendations
  - [x] Variants
  - [x] Metafields
- [x] Collection(s)
- [x] Cart
- [x] Checkout
- [x] Search
- [x] Predictive Search
- [x] Customer
  - [x] Customer Orders
  - [x] Authentication
  - [x] Password Reset
  - [x] MailingAddress
    - [x] Create
    - [x] Updated
    - [x] Delete
- [x] Pages
- [x] Blogs
- [x] Articles
- [ ] Payment(s) (Coming Soon)
- [ ] Shipping Rates (Coming Soon)

> [!NOTE] If there are properties that are missing, bugs or useful operations,
> please raise an issue on this repo.

## Local/Offline Setup

```bash
docker run --rm -p 8080:8080 ghcr.io/sayjava/mock-shopify:0.2.0
```

## Documentation

`Mock Shopify` uses the full graphql schema from the Shopify Storefront API.
Therefore, all operations supported by the Shopify Storefront API are supported
by `Mock Shopify`. For a full list of operations, please see the
[Shopify Storefront API](https://shopify.dev/docs/api/storefront/2023-07).

### Products

Fetch products using the Shopify product ID or product handle. This allows you
to build out product UI components to reflect different product state.

> [!NOTE] The `Mock Shopify` product response will always return a product
> regardless of the product ID or handle.

> [!NOTE] The `Mock Shopify` product images are placeholders appropriately
> sized.

#### Alternative Product Scenarios

| Product Handle          | Description                                        |
| ----------------------- | -------------------------------------------------- |
| `out-of-stock-product`  | Simulates a product that is out of stock           |
| `giftcard-product`      | Simulates a product that is a gift card            |
| `subscription-product`  | Simulates a product that is a subscription product |
| `not-found-product`     | Simulates a product that is not found              |
| `no-metafields-product` | Simulates a product that has no metafields         |
| `no-variants-product`   | Simulates a product that has no variants           |
| `on-sale-product`       | Simulates a product that is on sale                |

Example

The following query will return a product that is out of stock

```graphql copy
query {
  product(handle: "out-of-stock-product") {
    availableForSale
  }
}
```

### Shop Examples

- [Out of Stock Product](https://hydrogen-mock-shopify.faker-server.dev/products/out-of-stock-product)
- [Gift Card Product](https://hydrogen-mock-shopify.faker-server.dev/products/giftcard-product)
- [Not Found Product](https://hydrogen-mock-shopify.faker-server.dev/products/not-found-product)
- [On Sale Product](https://hydrogen-mock-shopify.faker-server.dev/products/on-sale-product)

### Product Recommendations

Product recommendations can be retrieved for a product using any product ID.
`Mock Shopify` will return a simulated list of recommended products for any
given product ID.

#### Alternative Product Recommendation Scenario

| Product Handle               | Description                                 |
| ---------------------------- | ------------------------------------------- |
| `no-recommendations-product` | Simulates a product that has no recommended |
| products                     |                                             |

### Collection(s)

`Mock Shopify` allows developers to query collections by `id` or `handle`. This
allows you to build out collection UI components to reflect different collection
state.

> [!NOTE] The `Mock Shopify` collection response will always return a collection

#### Alternative Collection Scenarios

| Handle                 | Description                              |
| ---------------------- | ---------------------------------------- |
| `not-found-collection` | Simulates an unknown collection          |
| `no-items-collection`  | Simulates a an empty list of collections |

#### Collection Filters

`Mock Shopify` supports collection filters. The following filters are supported:

| Filter             | Description                                               | Type          |
| ------------------ | --------------------------------------------------------- | ------------- |
| `Product Type`     | Simulates different product types filters                 | `LIST`        |
| `Vendor`           | Simulates multiple vendors filter                         | `LIST`        |
| `Price`            | Simulates the price ranges for a collection               | `PRICE_RANGE` |
| `Product Material` | Simulates product materials filter                        | `LIST`        |
| `Availability`     | Simulates product availability filter                     | `LIST`        |
| `Sort By`          | Simulates sorting order of the products in the collection | `LIST`        |
| `Color`            | Simulates sorting order of the collection                 | `LIST`        |

### Cart

Any `cart id` will always return a cart. This allows developers to build out
cart UI components to reflect different cart state.

The number of items in the cart is determined by the `first` query argument of
the `cart.lines` query.

The below query will return the 2 items in the cart

```graphql copy
query {
  cart(id: "cart-id") {
    lines(first: 2) {
      edges {
        node {
          id
          quantity
        }
      }
    }
  }
}
```

The following mutation cart operations are supported by `Mock Shopify`:

- `cartCreate`
- `cartLinesAdd`
- `cartLinesUpdate`
- `cartLinesRemove`
- `cartAttributesUpdate`
- `cartDiscountCodesUpdate`
- `cartPaymentUpdate`
- `cartSubmitForCompletion`

> [!IMPORTANT] Please not that `Mock Shopify` does not keep any state, therefore
> any changes made to a cart will not persist. The basic operations will succeed
> but the cart will not be updated.

#### Alternative Cart Scenarios

| Cart ID           | Description                                  |
| ----------------- | -------------------------------------------- |
| `empty-cart`      | Simulates a cart that is empty               |
| `discounted-cart` | Simulates a cart with applied discount codes |

> [!NOTE] See the
> [Shopify Storefront API](https://shopify.dev/docs/api/storefront/2023-07/queries/cart)
> for more information on the cart mutation operations, arguments,return types
> and error values.

### Search

`Mock Shopify` supports product searches using all the arguments supported by
the Shopify Storefront API.

#### Alternative Search Scenarios

| Query        | Description                                |
| ------------ | ------------------------------------------ |
| `no-results` | Simulates a search that returns no results |

### Predictive Search

The predictive search is limited to returning `Products` and `Collections`. The
predictive search will return a list of products and collections regardless of
the search term. It will also return some random search suggestions queries
perfect for build out UIs.

#### Alternative Predictive Search Control headers

| Header       | Description                                           |
| ------------ | ----------------------------------------------------- |
| `no-results` | Simulates a predictive search that returns no results |

### Customer

`Mock Shopify` supports a few common customer operations

- Create Customer
- Authentication
- Password Reset
- Customer Orders
- MailingAddress
  - Create
  - Updated
  - Delete

### Shop Example

> [!NOTE] Any email and password combination will work for authentication. The
> site does not keep any state.

- [Customer Login](https://hydrogen-mock-shopify.faker-server.dev/login)
- [Customer Orders](https://hydrogen-mock-shopify.faker-server.dev/account/orders)
- [Customer Orders](https://hydrogen-mock-shopify.faker-server.dev/account/profile)

#### Alternative Customer Scenarios

When testing customer journeys, a couple of alternative journeys are available
using special values as listed below in this table

| Header                   | Description                                                                            |
| ------------------------ | -------------------------------------------------------------------------------------- |
| `wrong-user@example.com` | If this specific email is supplied then the server will return an authentication error |
