# AI-assistert utvikling av Regelverk GraphQL App

## Prosjektformål
Bygge en applikasjon for håndtering av regelverk i opptakssystem, med fokus på læring av GraphQL og PostgreSQL.

## Tech Stack
- **Frontend**: React med TypeScript
- **UI Components**: shadcn/ui (Radix UI + Tailwind CSS)
- **API**: GraphQL 
- **Backend**: Quarkus + Graphitron (SIKT's GraphQL code generator)
- **Database**: PostgreSQL med JOOQ for type-safe SQL
- **Build Tools**: Maven (Java), npm (Frontend)
- **Arkitektur**: Monorepo

## Utviklingsprinsipper

### 1. Inkrementell utvikling
- Start smått, bygg gradvis
- Test hver komponent før vi går videre
- Alltid ha en fungerende versjon

### 2. Læringsfokus
- Forklar hver GraphQL-konsept når vi introduserer det
- Vis hvordan data flyter fra database → backend → GraphQL → frontend
- Start med queries, deretter mutations, evt. subscriptions

### 3. Kodestruktur

#### Mappestruktur
```
regelverk-graphql/
├── regelverk-db/           # JOOQ database module
│   ├── src/main/
│   │   └── resources/
│   │       └── db/
│   │           └── migration/  # Flyway migrations
│   ├── docker-compose.yml  # PostgreSQL for development
│   ├── jooq-configuration.xml
│   └── pom.xml
├── regelverk-spec/         # GraphQL schema & Graphitron generation
│   ├── src/main/
│   │   └── resources/
│   │       └── graphql/   # GraphQL schemas
│   │           ├── schema.graphqls
│   │           └── *.graphql
│   └── pom.xml
├── regelverk-service/      # Custom business logic
│   ├── src/main/java/
│   │   └── no/regelverk/
│   │       ├── conditions/  # Custom conditions
│   │       └── services/    # Service classes
│   └── pom.xml
├── regelverk-server/       # Quarkus server
│   ├── src/main/
│   │   ├── java/
│   │   └── resources/
│   │       └── application.properties
│   └── pom.xml
├── frontend/               # React applikasjon
│   ├── src/
│   │   ├── components/     
│   │   │   ├── ui/        # shadcn/ui komponenter
│   │   │   └── app/       # App-spesifikke komponenter
│   │   ├── graphql/        # Queries og mutations
│   │   ├── hooks/          # Custom React hooks
│   │   ├── lib/           # Utility functions
│   │   └── types/          # TypeScript types
│   ├── components.json     # shadcn/ui config
│   └── package.json
├── database/               # Database scripts
│   ├── migrations/         # Flyway/Liquibase migrations
│   └── seed/              # Test data
└── docs/                  # Dokumentasjon
```

### 4. Database Design
- Start med enkle tabeller og relasjoner
- Bruk foreign keys for å bevare referanseintegritet
- Lag migrations for alle schema-endringer
- Dokumenter hvorfor vi velger spesifikke løsninger

### 5. GraphQL Schema Design
- Schema-first tilnærming
- Start med enkle typer og queries
- Gradvis legg til kompleksitet
- Bruk tydelige navn som reflekterer domenet

### 6. Koding sammen med AI

#### Arbeidsflyt
1. **Diskuter** løsningen før implementering
2. **Forklar** tekniske valg og alternativer
3. **Implementer** sammen, steg for steg
4. **Test** at det fungerer
5. **Refaktorer** hvis nødvendig

#### Kommunikasjon
- AI forklarer hva som gjøres og hvorfor
- Bruker stiller spørsmål når noe er uklart
- Vi går ikke videre før begge forstår

### 7. Testing
- Enhetstester for kritisk logikk
- Integrasjonstester for GraphQL endpoints
- Manuelle tester underveis i utviklingen

## Første steg

### Fase 1: Grunnleggende oppsett ✅ FULLFØRT
1. ~~Initialisere Quarkus prosjekt med Graphitron~~
2. ~~Sette opp PostgreSQL database med Docker~~
3. ~~Lage første database-tabell via Flyway migration~~
4. ~~Definere GraphQL schema med Graphitron directives~~
5. ~~Konfigurere JOOQ for type-safe database access~~
6. ~~La Graphitron generere resolvers automatisk~~

### Fase 2: Utvide datamodell
1. Legge til flere entiteter (Person, Utdanningstilbud)
2. Implementere relasjoner
3. Lage mer komplekse queries
4. Bygge brukergrensesnitt

### Fase 3: Forretningslogikk
1. Implementere OpptaksVei-struktur
2. Legge til mutations
3. Implementere validering
4. Bygge admin-funksjonalitet

## Spesielle hensyn for AI-assistanse

### Hva AI skal gjøre:
- Foreslå løsninger med begrunnelse
- Vise alternative tilnærminger
- Forklare GraphQL-konsepter når de introduseres
- Påpeke potensielle problemer
- Hjelpe med debugging

### Hva AI IKKE skal gjøre:
- Generere store mengder kode uten forklaring
- Hoppe over steg
- Anta forkunnskaper
- Implementere avanserte features før basics fungerer

## Nyttige kommandoer

### Backend (Graphitron + Quarkus)
```bash
# Start PostgreSQL database
cd regelverk-db
docker-compose up -d

# Kjør database migrations
mvn flyway:migrate

# Generer JOOQ klasser fra database
mvn clean compile -Pgenerate-jooq

# Bygg hele prosjektet (inkludert Graphitron generering)
cd .. # tilbake til root
mvn clean install

# Start Quarkus server i dev mode
cd regelverk-server
mvn quarkus:dev

# Server kjører på http://localhost:8080
# GraphiQL: http://localhost:8080/graphiql
```

### Frontend
```bash
# Installere dependencies
npm install

# Installere shadcn/ui komponenter
npx shadcn-ui@latest add button
npx shadcn-ui@latest add card
npx shadcn-ui@latest add table
# etc...

# Starte utviklingsserver
npm run dev

# Kjøre tester
npm test
```

### Database
```bash
# Koble til PostgreSQL
psql -U username -d regelverk_db

# Kjøre migrations
mvn flyway:migrate
```

## GraphQL Playground
- Backend: http://localhost:8080/graphiql
- For testing av queries og mutations

## Ressurser for læring
- [GraphQL offisiell dokumentasjon](https://graphql.org/learn/)
- [Graphitron dokumentasjon](https://graphitron.sikt.no/)
- [Quarkus GraphQL guide](https://quarkus.io/guides/smallrye-graphql)
- [JOOQ dokumentasjon](https://www.jooq.org/doc/latest/manual/)
- [Apollo Client dokumentasjon](https://www.apollographql.com/docs/react/)

## Lærdommer fra prosjektoppsettet

### GraphQL-først tilnærming
1. **Design GraphQL schema først** - Tenk på API design før database
2. **Bruk Graphitron directives** - `@table`, `@node`, `@field`, `@asConnection`
3. **JOOQ gir type-safety** - Database til Java uten runtime-feil
4. **Graphitron genererer resolvers** - Minimal boilerplate-kode

### Arbeidsflyt for nye entiteter
1. **Definer GraphQL type** med riktige directives
2. **Lag Flyway migration** som matcher GraphQL schema
3. **Generer JOOQ klasser** fra database
4. **La Graphitron wire alt sammen** automatisk
5. **Test med GraphiQL**

### Viktige Graphitron-directives
- `@table` - Mapper GraphQL type til database-tabell
- `@node` - Implementerer Node interface (for ID)
- `@field(name: "COLUMN_NAME")` - Mapper felt til database-kolonne
- `@asConnection` - Automatisk pagination/connection support
- `@nodeId(typeName: "Type")` - For mutations med ID-parameter
- `@mutation(typeName: INSERT|UPDATE|DELETE)` - Auto-generer mutations

### Prosjektstruktur benefits
- **regelverk-db**: Database migrations og JOOQ generering
- **regelverk-spec**: GraphQL schemas og Graphitron generering  
- **regelverk-service**: Custom business logic
- **regelverk-server**: Quarkus server som wire alt sammen

## Viktige prinsipper
1. **KISS** - Keep It Simple, Stupid
2. **DRY** - Don't Repeat Yourself
3. **YAGNI** - You Aren't Gonna Need It
4. **Explicit is better than implicit**

## Spørsmål å stille underveis
- Forstår jeg dataflyt fra database til brukergrensesnitt?
- Kunne dette vært løst enklere?
- Hva er trade-offs med denne løsningen?
- Hvordan ville dette skalere?

---

*Dette dokumentet er en levende guide som oppdateres etter hvert som vi lærer og utvikler sammen.*