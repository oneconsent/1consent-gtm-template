# 1Consent CMP for Google Tag Manager

This tag loads your published 1Consent banner. It sets the initial Google consent
state at Consent Initialization and sends updates when 1Consent applies a saved
choice. Your site's banner design, languages and service settings come from its
published 1Consent configuration.

1. In 1Consent, publish a single GDPR banner for all regions with **Advanced
   Consent Mode** enabled. Add the Google services you use to the banner.
2. Manage Google tags in the same web container. Leave the direct Google tag ID
   blank, use the standard `dataLayer` and the default 500 ms wait, then turn on
   **Load 1Consent with the GTM template** in Banner settings → Google Consent
   Mode and publish. Configure consent checks and tag blocking in GTM.
3. Add **1Consent CMP** to the container and enter the public **1Consent Site
   ID**. Use **Consent Initialization – All Pages**. Remove any other CMP tag,
   hard-coded 1Consent embed, and independent Google consent defaults.
4. Use GTM Preview to check defaults, reject, a granular choice, accept, and
   withdrawal before publishing. Optional Google consent types start denied.
   Advanced Consent Mode can send cookieless requests before consent.

Use the [page-code installation](https://1consent.app/docs/integration/google-tag-manager)
if you need strict Basic Consent Mode, automatic blocking before GTM runs, or
automatic selection of different banners by region. The GTM install also does
not support active banner experiments or platform-managed delivery.
