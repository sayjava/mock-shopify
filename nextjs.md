# NextJS E-Commerce

<p align="center">
<a href="https://nextjs-mock-shopify.faker-server.dev">https://nextjs-mock-shopify.faker-server.dev</a>
</p>

The [NextJS E-Commerce](https://github.com/vercel/commerce) framework is a
popular React framework for building E-Commerce storefronts. The example
storefront is a clone of the NextJS E-Commerce Starter. It points to the mock
Shopify GraphQL API to pull data with no changes to the codebase.

- Clone the NextJS commerce repo
- Follow the instructions to run the application
- Change the shopify domain to the mock shopify URL in the `.env` file

## Changes To NextJS Codebase

The only change to the codebase is the `SHOPIFY_STORE_DOMAIN` variable in the
`.env`. this is an example of the `.env` file

```env
COMPANY_NAME="Mock Shop."
TWITTER_CREATOR="@sayjava"
TWITTER_SITE="https://github.com/sayjava"
SITE_NAME="Mock-Shop"
SHOPIFY_REVALIDATION_SECRET="mock-secret"
SHOPIFY_STOREFRONT_ACCESS_TOKEN="mock-token"
SHOPIFY_STORE_DOMAIN="shopify.fakerserver.dev/graphql"
```

Add the placeholder domain to the `next.config.js` file to be able to render the
product images

```javascript
{
  protocol: 'https',
  hostname: 'via.placeholder.com',
  pathname: '/**'
}
```
