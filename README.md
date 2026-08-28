#  Green Shop: Modular E-commerce Platform for Plants & Accessories
###  System Analysis & Architecture Design Portfolio Case Study

 **English** | [Читати українською мовою](./specification-ua.md)

##  Overview
This project focuses on the system analysis and architectural design of a high-performance e-commerce platform tailored for indoor plants and custom accessories. Engineered as a **Modular Monolith** for rapid market entry (2-month MVP), the system is strictly decoupled to ensure a seamless future migration to a microservices architecture.

---

##  System Architecture
Here is the high-level infrastructure layout showing network security topology (Cloudflare WAF), the modularized backend core, state management, and external API gateways:

![Deployment Diagram](./deployment_diagram/deployment_diagram.png)

---

##  Technology Stack & Tools
*   **Database & Cache:** MySQL (Normalized relational architecture), Redis (Token cache & session storage)
*   **Search & Frontend Performance:** Elasticsearch, Virtual Scroll DOM management
*   **Security & Infrastructure:** Cloudflare (WAF Proxy, OWASP Core Rules, WAF Rate Limiting), HTTPS transport, Argon2 hashing
*   **External Integrations:** Stripe API (Secure tokenized payments), Nova Poshta API (National logistics sync)
*   **Modeling & Specifications:** BPMN 2.0, PlantUML (Sequence, Deployment, State Machine models), Figma

---

## 🔗 Interactive Links & Live Demos
*    **[Read Full 20-Page Specification & System Requirements](./specification-ua.md)** — Comprehensive technical analysis, functional matrices, and database definitions (Written in Ukrainian).
*    **[Explore UI/UX Interactive Prototype in Figma]([https://figma.com](https://www.figma.com/design/M6TdfaBpb7u0eTTQ6W4zFF/PlantStore?node-id=01&t=00kjkQDIeDVouZMJ-1))** — Clickable wires addressing specific user persona pain points.
*    **[Test Live API Mock Server & Postman Documentation]([https://getpostman.com](https://documenter.getpostman.com/view/17765106/2sBYAuSBAz))** — Public API contract tracking edge cases, JWT auth, and repository-level business conflicts.

---

## Contacts & Feedback
If you are a Recruiter, Lead Systems Analyst, or Tech Lead interested in discussing this case study, architecture design, or career opportunities, feel free to reach out:

 **Volodymyr Pysmeniuk**

[![Telegram](https://shields.io)](https://t.me/exqzmepvo)

