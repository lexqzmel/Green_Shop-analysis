#  Green Shop: Modular E-commerce Platform for Plants & Accessories
###  System Analysis & Architecture Design Portfolio Case Study

*Documentation Language:* [🇺🇸 English Specifications](./specification-en.md) | [🇺🇦 Специфікація українською](./specification-ua.md)

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
*  **Project Specifications & System Requirements:**
  * 🇺🇸 **[Read Full Specification (English Web View)](./specification-en.md)**
  * 🇺🇦 **[Читати повну специфікацію (Ukrainian Web View)](./specification-ua.md)**
*    **[Explore UI/UX Interactive Prototype in Figma](https://www.figma.com/design/M6TdfaBpb7u0eTTQ6W4zFF/PlantStore?node-id=01&t=00kjkQDIeDVouZMJ-1)** — Clickable wires addressing specific user persona pain points.
*    **[Test Live API Mock Server & Postman Documentation](https://documenter.getpostman.com/view/17765106/2sBYAuSBAz)** — Public API contract tracking edge cases, JWT auth, and repository-level business conflicts.

---

## Contacts & Feedback
If you are a Recruiter, Lead Systems Analyst, or Tech Lead interested in discussing this case study, architecture design, or career opportunities, feel free to reach out:

 **Volodymyr Pysmeniuk**

[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/exqzmepvo)
[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:hachmardi@gmail.com)
[![WhatsApp](https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white)](https://wa.me/qr/3MSNVRK4ZBZIC1)
