-- V1: Create institusjon table
-- This is our first entity - educational institutions

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE institusjon (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    kode VARCHAR(10) UNIQUE NOT NULL,
    navn VARCHAR(255) NOT NULL,
    kort_navn VARCHAR(50),
    type VARCHAR(50),
    aktiv BOOLEAN DEFAULT true,
    opprettet TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    oppdatert TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add some test data
INSERT INTO institusjon (kode, navn, kort_navn, type, aktiv) VALUES 
    ('NTNU', 'Norges teknisk-naturvitenskapelige universitet', 'NTNU', 'UNIVERSITET', true),
    ('UIO', 'Universitetet i Oslo', 'UiO', 'UNIVERSITET', true),
    ('UIB', 'Universitetet i Bergen', 'UiB', 'UNIVERSITET', true),
    ('OSLOMET', 'OsloMet – storbyuniversitetet', 'OsloMet', 'UNIVERSITET', true),
    ('HVL', 'Høgskulen på Vestlandet', 'HVL', 'HOGSKOLE', true);

-- Index for faster lookups
CREATE INDEX idx_institusjon_kode ON institusjon(kode);
CREATE INDEX idx_institusjon_type ON institusjon(type) WHERE aktiv = true;