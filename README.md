# Green Shop: Modular E-commerce Platform for Plants & Accessories
## Overview
This project focuses on the system analysis and architectural design of a high-performance e-commerce platform tailored for indoor plants and custom accessories. Designed for rapid market entry (2-month MVP) and scalability.

##  System Architecture
Here is the high-level infrastructure map (Cloudflare WAF, Modular Monolith API, MySQL, Redis cache, and Stripe integration):

![Deployment Diagram](./docs/images/deployment_diagram.png)

## Technology Stack & Tools
- **Database & Cache:** MySQL, Redis
- **Search & Performance:** Elasticsearch, Virtual Scroll
- **Security & Infrastructure:** Cloudflare (WAF, Managed Rules, Rate Limiting), HTTPS, Argon2
- **Integrations:** Stripe API (Payments), Nova Poshta API (Logistics)
- **Modeling & Design:** BPMN 2.0, PlantUML (Sequence, Deployment), Figma

## Interactive Links & Live Demos
- **[Read Full 20-Page Specification & System Requirements](./docs/specification.md)** 
- **[Explore UI/UX Interactive Prototype in Figma]([https://figma.com...](https://www.figma.com/design/M6TdfaBpb7u0eTTQ6W4zFF/PlantStore?node-id=01&t=00kjkQDIeDVouZMJ-1)**
- **[Test Live API Mock Server & Postman Documentation](https://...)**
