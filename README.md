# Regelverk GraphQL Application

En moderne applikasjon for håndtering av regelverk i opptakssystem, bygget med GraphQL-først tilnærming.

## 🛠️ Tech Stack

- **Backend**: Quarkus + Graphitron (SIKT's GraphQL code generator)
- **Database**: PostgreSQL med JOOQ for type-safe SQL
- **API**: GraphQL med automatisk genererte resolvers
- **Frontend**: React + TypeScript + shadcn/ui (kommer senere)
- **Build**: Maven monorepo

## 🏗️ Arkitektur

```
regelverk-graphql/
├── regelverk-db/          # Database migrations & JOOQ
├── regelverk-service/     # Custom business logic
├── regelverk-spec/        # GraphQL schemas
├── regelverk-server/      # Quarkus server
├── graphitron/           # SIKT's code generator (submodule)
└── frontend/             # React app (kommer senere)
```

## 🚀 Kom i gang

### Forutsetninger
- Java 17+
- Maven 3.8+
- Docker (for PostgreSQL)

### Oppstart

1. **Klon repo og submodules:**
   ```bash
   git clone [repo-url]
   cd regelverk-graphql
   git submodule update --init --recursive
   ```

2. **Start PostgreSQL:**
   ```bash
   cd regelverk-db
   docker-compose up -d
   ```

3. **Kjør database migrations:**
   ```bash
   mvn flyway:migrate
   ```

4. **Generer JOOQ klasser:**
   ```bash
   mvn clean compile -Pgenerate-jooq
   ```

5. **Bygg prosjekt:**
   ```bash
   cd .. # tilbake til root
   mvn clean install
   ```

6. **Start server:**
   ```bash
   cd regelverk-server
   mvn quarkus:dev
   ```

### Utforsk API-et

- **GraphiQL**: http://localhost:8080/graphiql
- **GraphQL Endpoint**: http://localhost:8080/graphql

### Test queries

```graphql
query {
  institusjoner {
    nodes {
      id
      kode
      navn
      kortNavn
      type
      aktiv
    }
  }
}
```

## 📚 Lærdommer og beste praksis

### GraphQL-først tilnærming
1. Design GraphQL schema med Graphitron directives
2. Lag matchende database-tabell via Flyway
3. JOOQ genererer type-safe Java-klasser
4. Graphitron genererer alle resolvers automatisk

### Legge til nye entiteter
1. Definer GraphQL type i `regelverk-spec/src/main/resources/graphql/`
2. Lag Flyway migration i `regelverk-db/src/main/resources/db/migration/`
3. Generer JOOQ: `mvn compile -Pgenerate-jooq`
4. Bygg: `mvn clean install`
5. Test i GraphiQL

### Viktige Graphitron directives
- `@table` - Kobler GraphQL type til database-tabell
- `@node` - Implementerer Node interface for ID-håndtering  
- `@field(name: "COLUMN_NAME")` - Mapper felt til database-kolonne
- `@asConnection` - Legger til automatisk pagination
- `@mutation(typeName: INSERT|UPDATE|DELETE)` - Generer mutations

## 📖 Dokumentasjon

Se [CLAUDE.md](./CLAUDE.md) for detaljert veiledning om AI-assistert utvikling og arbeidsflyt.

## 🎯 Status

- ✅ Prosjektstruktur satt opp
- ✅ PostgreSQL database med Docker
- ✅ Flyway migrations
- ✅ JOOQ code generation  
- ✅ GraphQL schema for Institusjon
- ✅ Graphitron resolver generation
- ✅ Quarkus server
- ⏳ React frontend (neste fase)
- ⏳ Flere entiteter (Person, Utdanningstilbud, etc.)
- ⏳ Komplekse forretningsregler

## 🤝 Utvikling

Dette prosjektet bruker AI-assistert utvikling med fokus på læring og forståelse. Se [CLAUDE.md](./CLAUDE.md) for retningslinjer.

Alle endringer gjøres inkrementelt, én entitet om gangen, med full testing underveis.