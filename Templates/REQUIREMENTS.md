# Requirements Checklist (master)

<!--
This is the MASTER list. Don't fill this one in directly.

At project init, generate this project's own REQUIREMENTS.md by:
1. Reading `type:` from PROJECT.md (landing / app / saas / api / automation)
2. Copying only the rows tagged with that type below
3. Dropping the Types column, converting Priority to a `- [ ]` checkbox grouped by section
4. Saving as Projects/<project-name>/REQUIREMENTS.md

Types:
- landing    = marketing site, brochure site, single-page product/service site, email capture. No auth, no real backend.
- app        = full web app with auth + database, not multi-tenant/billed.
- saas       = app + billing/subscriptions, usually multi-tenant.
- api        = backend service / API only, no frontend.
- automation = n8n/no-code workflow system delivered for a client. No frontend, no end-user auth; often has its own DB/state, calls third-party APIs, sends emails.

Priority: 🔴 High (ship without this = problem) | 🟡 Medium (needed soon after launch) | 🟢 Low (nice to have)

Re-check this list at session start if REQUIREMENTS.md exists in the project folder. Flag any unchecked 🔴 item before calling work "done".
-->

Related: [[PROJECT]] | [[MISTAKES]]

---

## 1. Frontend / UI

| Item | Priority | Types |
|------|----------|-------|
| Form validation (client-side) | 🔴 | landing, app, saas |
| 404 / error pages | 🔴 | landing, app, saas |
| Responsive / mobile design | 🔴 | landing, app, saas |
| Accessibility (a11y) | 🔴 | landing, app, saas |
| Toast notifications | 🔴 | app, saas |
| Loading skeletons | 🔴 | app, saas |
| Pagination | 🔴 | app, saas |
| Modal / dialogs | 🔴 | app, saas |
| Confirmation dialogs | 🔴 | app, saas |
| Error boundaries | 🔴 | app, saas |
| Dropdowns / select menus | 🔴 | app, saas |
| Keyboard navigation | 🔴 | app, saas |
| Infinite scroll | 🟡 | app, saas |
| Empty states | 🟡 | app, saas |
| Breadcrumbs | 🟡 | app, saas |
| Tooltips | 🟡 | app, saas |
| Search & filter UI | 🟡 | app, saas |
| Theming / CSS variables | 🟡 | app, saas |
| Focus management | 🟡 | app, saas |
| File upload UI | 🟡 | app, saas |
| Date/time picker | 🟡 | app, saas |
| Autocomplete / combobox | 🟡 | app, saas |
| Dark mode | 🟢 | landing, app, saas |
| Image preview / lightbox | 🟢 | landing, app, saas |
| Rich text editor | 🟢 | app, saas |

## 2. Auth & Identity

| Item | Priority | Types |
|------|----------|-------|
| Sign up / registration | 🔴 | app, saas, api |
| Sign in / login | 🔴 | app, saas, api |
| Email verification | 🔴 | app, saas, api |
| Password reset flow | 🔴 | app, saas, api |
| JWT / session management | 🔴 | app, saas, api |
| Refresh token rotation | 🔴 | app, saas, api |
| Role-based access control (RBAC) | 🔴 | app, saas, api |
| Account lockout after failed attempts | 🔴 | app, saas, api |
| OAuth (Google, GitHub, etc.) | 🟡 | app, saas, api |
| MFA / 2FA | 🟡 | app, saas |
| Remember me / persistent login | 🟡 | app, saas |
| Logout (all devices) | 🟡 | app, saas |
| SSO (single sign-on) | 🟢 | saas |

## 3. Backend / API

| Item | Priority | Types |
|------|----------|-------|
| Rate limiting | 🔴 | app, saas, api, automation |
| Input validation (server-side) | 🔴 | landing, app, saas, api, automation |
| Input sanitization / XSS prevention | 🔴 | landing, app, saas, api |
| CORS configuration | 🔴 | app, saas, api |
| Error handling & error codes | 🔴 | app, saas, api, automation |
| Request logging | 🔴 | app, saas, api, automation |
| Health check endpoint | 🔴 | app, saas, api, automation |
| Idempotency keys | 🟡 | app, saas, api, automation |
| Webhook support | 🟡 | app, saas, api, automation |
| API versioning | 🟡 | saas, api |
| File upload handling | 🟡 | app, saas, automation |
| Background jobs / queues | 🟡 | app, saas, api, automation |
| Scheduled tasks / cron jobs | 🟡 | app, saas, api, automation |
| Graceful shutdown | 🟡 | app, saas, api, automation |
| API documentation (OpenAPI/Swagger) | 🟡 | saas, api |

## 4. Database

| Item | Priority | Types |
|------|----------|-------|
| Schema migrations | 🔴 | app, saas, api |
| Timestamps (createdAt, updatedAt) | 🔴 | app, saas, api |
| Database indexing | 🔴 | app, saas, api |
| Connection pooling | 🔴 | app, saas, api |
| Transactions | 🔴 | app, saas, api |
| Backups & point-in-time recovery | 🔴 | app, saas, api, automation |
| Backup restore tested (not just backups existing) | 🔴 | app, saas, api, automation |
| Soft deletes | 🟡 | app, saas |
| Query optimization | 🟡 | app, saas, api |
| Data seeding (dev/test) | 🟡 | app, saas, api |
| Full-text search | 🟢 | app, saas |
| Read replicas | 🟢 | saas, api |

## 5. Security

| Item | Priority | Types |
|------|----------|-------|
| HTTPS / SSL/TLS | 🔴 | landing, app, saas, api, automation |
| Security headers (Helmet.js) | 🔴 | landing, app, saas, api |
| Secrets / env var management | 🔴 | landing, app, saas, api, automation |
| Secrets rotation policy (rotate exposed/stale keys periodically) | 🟡 | landing, app, saas, api, automation |
| GDPR / data privacy compliance | 🔴 | landing, app, saas |
| Cookie consent banner | 🔴 | landing, app, saas |
| CSRF protection | 🔴 | app, saas |
| SQL injection prevention | 🔴 | app, saas, api, automation |
| Content Security Policy (CSP) | 🔴 | landing, app, saas |
| Dependency vulnerability scanning | 🟡 | landing, app, saas, api |
| Bot detection / CAPTCHA | 🟡 | landing, app, saas |
| Audit logs | 🟡 | app, saas, automation |
| Data encryption at rest | 🟡 | app, saas, api, automation |
| IP allowlist / blocklist | 🟢 | saas, api |

## 6. Performance

| Item | Priority | Types |
|------|----------|-------|
| CDN for static assets | 🔴 | landing, app, saas |
| Image optimization (WebP, lazy load) | 🔴 | landing, app, saas |
| Code splitting / lazy imports | 🔴 | landing, app, saas |
| Gzip / Brotli compression | 🔴 | landing, app, saas, api |
| Caching (Redis / in-memory) | 🔴 | app, saas, api, automation |
| Database query caching | 🟡 | app, saas, api |
| Prefetching & preloading | 🟡 | landing, app, saas |
| Bundle size analysis | 🟡 | landing, app, saas |
| Core Web Vitals monitoring | 🟡 | landing, app, saas |
| Service worker / offline support | 🟢 | app, saas |

## 7. DevOps & Infrastructure

| Item | Priority | Types |
|------|----------|-------|
| CI/CD pipeline | 🔴 | landing, app, saas, api |
| Workflow version control (n8n JSON backed up to git before deploy) | 🔴 | automation |
| Domain registered & DNS configured | 🔴 | landing, app, saas |
| Env config management (.env) | 🔴 | landing, app, saas, api, automation |
| Uptime monitoring | 🔴 | landing, app, saas, api, automation |
| Rollback strategy | 🔴 | landing, app, saas, api, automation |
| Alerting (failure/error notifications) | 🔴 | app, saas, api, automation |
| Dev / staging / prod environments | 🔴 | app, saas, api |
| Dockerization / containerization | 🔴 | app, saas, api |
| DNS TTL / propagation reviewed before cutover | 🟡 | landing, app, saas |
| Log aggregation (Datadog / Logtail) | 🟡 | app, saas, api, automation |
| Feature flags | 🟡 | app, saas |
| Auto-scaling | 🟢 | saas, api |
| Blue/green or canary deploys | 🟢 | saas, api |

## 8. Email & Notifications

| Item | Priority | Types |
|------|----------|-------|
| SPF record configured | 🔴 | landing, app, saas, automation |
| DKIM record configured | 🔴 | landing, app, saas, automation |
| Email unsubscribe / preferences | 🔴 | landing, app, saas |
| Transactional emails (SendGrid, Resend, etc.) | 🔴 | app, saas, automation |
| Email templates | 🔴 | app, saas |
| Password reset email | 🔴 | app, saas |
| DMARC record configured | 🟡 | landing, app, saas, automation |
| Dedicated sending domain/subdomain (not root) | 🟡 | app, saas, automation |
| Welcome / onboarding email | 🟡 | app, saas |
| In-app notifications | 🟡 | app, saas |
| Bounce & spam handling | 🟡 | app, saas, automation |
| Push notifications (web/mobile) | 🟢 | app, saas |
| SMS notifications | 🟢 | saas |

## 9. SEO & Meta (Core)

| Item | Priority | Types |
|------|----------|-------|
| Meta title & description | 🔴 | landing, app, saas |
| Open Graph tags (OG) | 🔴 | landing, app, saas |
| Canonical URLs | 🔴 | landing, app, saas |
| robots.txt | 🔴 | landing, app, saas |
| XML sitemap | 🔴 | landing, app, saas |
| 301 redirects | 🔴 | landing, app, saas |
| 404 handling for SEO | 🔴 | landing, app, saas |
| Mobile-first indexing compliance | 🔴 | landing, app, saas |
| Twitter / X Card tags | 🟡 | landing, app, saas |
| Noindex / nofollow tags | 🟡 | landing, app, saas |
| Social sharing preview | 🟡 | landing, app, saas |
| Hreflang for i18n | 🟢 | landing, saas |

## 10. SEO (On-page & Technical)

| Item | Priority | Types |
|------|----------|-------|
| H1 / H2 / H3 heading hierarchy | 🔴 | landing, app, saas |
| Image alt text | 🔴 | landing, app, saas |
| Clean URL structure / slugs | 🔴 | landing, app, saas |
| Internal linking strategy | 🔴 | landing, app, saas |
| Keyword research & mapping | 🔴 | landing, saas |
| Duplicate content prevention | 🔴 | landing, saas |
| Page speed optimization | 🔴 | landing, app, saas |
| Core Web Vitals (LCP, CLS, INP) | 🔴 | landing, app, saas |
| Google Search Console setup | 🔴 | landing, app, saas |
| Structured data / schema markup | 🔴 | landing, app, saas |
| Breadcrumb navigation | 🟡 | app, saas |
| Thin content prevention | 🟡 | landing, saas |
| Broken link detection | 🟡 | landing, app, saas |
| Crawl budget optimization | 🟡 | landing, saas |
| XML sitemap per locale | 🟡 | landing, saas |
| Bing Webmaster Tools setup | 🟡 | landing, saas |
| External backlink strategy | 🟢 | landing, saas |

## 11. Geo SEO (Local & Geographic)

<!-- Only relevant if the business targets a specific city/region. Skip entirely otherwise. -->

| Item | Priority | Types |
|------|----------|-------|
| Google Business Profile | 🔴 | landing |
| LocalBusiness schema markup | 🔴 | landing |
| NAP consistency (Name, Address, Phone) | 🔴 | landing |
| Location-specific landing pages | 🔴 | landing |
| Local keyword targeting | 🔴 | landing |
| Local citations / directory listings | 🟡 | landing |
| Geotargeting in Google Search Console | 🟡 | landing |
| Review / rating schema markup | 🟡 | landing |
| Localized content | 🟡 | landing, saas |
| Multi-language support (hreflang) | 🟡 | landing, saas |
| Country-specific domains or subdirectories | 🟡 | landing, saas |
| Region-specific sitemaps | 🟢 | landing, saas |
| IP-based geolocation redirects | 🟢 | landing, saas |
| Google Maps embed | 🟢 | landing |

## 12. AEO (Answer Engine Optimization)

<!-- Mainly for content-marketing-driven landing sites and SaaS docs/blogs. Skip for plain apps. -->

| Item | Priority | Types |
|------|----------|-------|
| FAQ schema markup | 🔴 | landing, saas |
| FAQ / Q&A pages | 🔴 | landing, saas |
| Featured snippet optimization | 🔴 | landing, saas |
| Structured data for rich results | 🔴 | landing, saas |
| E-E-A-T signals | 🔴 | landing, saas |
| Topical authority building | 🔴 | landing, saas |
| HowTo schema markup | 🟡 | landing, saas |
| QAPage schema markup | 🟡 | landing, saas |
| Article / NewsArticle schema | 🟡 | landing, saas |
| Voice search optimization | 🟡 | landing |
| Conversational keyword targeting | 🟡 | landing, saas |
| People Also Ask (PAA) optimization | 🟡 | landing, saas |
| Author bio & credentials page | 🟡 | landing, saas |
| Entity-based SEO / Knowledge Graph | 🟡 | landing, saas |
| LLM.txt / AI-crawler instructions file | 🟡 | landing, app, saas |
| Concise TL;DR / summary sections | 🟡 | landing, saas |
| Citations and references | 🟡 | landing, saas |
| Table formatting for snippet eligibility | 🟡 | landing, saas |
| Definition / glossary pages | 🟢 | landing, saas |
| Speakable schema | 🟢 | landing |

## 13. Analytics & Observability

| Item | Priority | Types |
|------|----------|-------|
| Web analytics (GA4, Plausible, Fathom) | 🔴 | landing, app, saas, api |
| Error tracking (Sentry) | 🔴 | app, saas, api, automation |
| Performance monitoring (APM) | 🟡 | app, saas, api, automation |
| Funnel / conversion tracking | 🟡 | landing, app, saas |
| Custom event tracking | 🟡 | landing, app, saas, automation |
| A/B testing framework | 🟢 | landing, saas |
| User session recording (Hotjar, PostHog) | 🟢 | landing, app, saas |

## 14. UX & Product

| Item | Priority | Types |
|------|----------|-------|
| Privacy policy page | 🔴 | landing, app, saas |
| Contact form | 🟡 | landing, app, saas |
| User settings / profile page | 🔴 | app, saas |
| Terms of service page | 🔴 | app, saas |
| Onboarding flow | 🟡 | app, saas |
| Help / documentation / FAQ | 🟡 | app, saas |
| Feedback / bug report widget | 🟢 | app, saas |
| Changelog / release notes | 🟢 | saas |
| Support chat widget | 🟢 | app, saas |
| Internationalization (i18n) | 🟢 | saas |

## 15. Payments & Billing

<!-- Skip entirely if the project doesn't take payments. -->

| Item | Priority | Types |
|------|----------|-------|
| Payment gateway (Stripe, Lemonsqueezy, etc.) | 🔴 | app, saas |
| Webhook for payment events | 🔴 | app, saas |
| Subscription / plan management | 🟡 | saas |
| Invoice generation | 🟡 | saas |
| Proration & upgrades/downgrades | 🟡 | saas |
| Refunds & disputes | 🟡 | saas |
| Tax calculation | 🟢 | saas |
| Usage-based billing | 🟢 | saas |

## 16. AI / LLM

<!-- Any project that calls an LLM or AI agent, whether it's a chatbot, an n8n AI Agent node, or an AI feature inside an app. -->

| Item | Priority | Types |
|------|----------|-------|
| Structured output validation (never trust raw LLM output) | 🔴 | automation, app, saas, api |
| Retry logic with backoff for AI API calls | 🔴 | automation, app, saas, api |
| Fallback behavior when AI provider is down/rate-limited | 🔴 | automation, app, saas, api |
| Prompt injection defense on user-supplied input | 🔴 | automation, app, saas, api |
| AI API cost / usage monitoring | 🔴 | automation, app, saas, api |
| Token/context length guardrails | 🟡 | automation, app, saas, api |
| Logging AI inputs/outputs for debugging (redact PII) | 🟡 | automation, app, saas, api |
| Eval harness / accuracy tracking for AI outputs | 🟡 | automation, app, saas |
| Human-in-the-loop review for high-stakes AI actions | 🟡 | automation, app, saas |
| Multi-provider fallback (e.g. OpenRouter) | 🟢 | automation, app, saas |

## 17. Client Handoff

<!-- Only applies to freelance/contract client work where you're delivering to someone else. Skip entirely for internal/own projects, or if the contract has no handoff requirement. -->

| Item | Priority | Types |
|------|----------|-------|
| Code/IP ownership transferred per contract terms | 🔴 | landing, app, saas, automation |
| Credentials & access transferred (domain, hosting, API keys) | 🟡 | landing, app, saas, automation |
| Runbook / documentation handoff | 🟡 | app, saas, automation |
| Maintenance & support terms defined | 🟡 | landing, app, saas, automation |
| Training / walkthrough session | 🟢 | app, saas, automation |
