package no.regelverk.service;

import jakarta.enterprise.context.ApplicationScoped;
import org.jooq.DSLContext;

/**
 * Service class for Institusjon-related business logic.
 * This will be used for custom operations beyond basic CRUD.
 */
@ApplicationScoped
public class InstitusjonService {
    
    // DSLContext will be injected by Quarkus
    private final DSLContext dsl;
    
    public InstitusjonService(DSLContext dsl) {
        this.dsl = dsl;
    }
    
    /**
     * Example: Count active institutions by type
     */
    public int countActiveByType(String type) {
        // This is just a placeholder - actual implementation will use JOOQ
        return 0;
    }
    
    /**
     * Example: Validate institution code format
     */
    public boolean isValidKode(String kode) {
        if (kode == null || kode.isEmpty()) {
            return false;
        }
        // Institution codes should be 2-10 uppercase letters
        return kode.matches("^[A-Z]{2,10}$");
    }
}