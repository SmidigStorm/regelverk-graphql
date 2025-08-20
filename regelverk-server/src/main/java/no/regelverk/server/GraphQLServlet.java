package no.regelverk.server;

import jakarta.servlet.annotation.WebServlet;
import no.sikt.graphql.GraphitronServlet;

/**
 * GraphQL Servlet that extends Graphitron's base servlet.
 * This will automatically wire up all generated resolvers.
 */
@WebServlet(
    name = "GraphQLServlet",
    urlPatterns = {"/graphql"}
)
public class GraphQLServlet extends GraphitronServlet {
    // Graphitron will handle all the wiring automatically
}