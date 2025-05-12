:begin
CREATE CONSTRAINT constraint_10b5cc06 FOR (node:Couleur) REQUIRE (node.nom) IS UNIQUE;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{nom:"Vert", properties:{}}, 
    {nom:"Rouge", properties:{}}, 
    {nom:"Bleu", properties:{}}, 
    {nom:"Jaune", properties:{}},
    {nom:"Rose", properties:{}},
    {nom:"Orange", properties:{}},
    {nom:"Noire", properties:{}}
    ] AS row
CREATE (n:Couleur{nom: row.nom}) SET n += row.properties;
:commit

:begin
CREATE CONSTRAINT constraint_10b5cc07 FOR (node:Gemme) REQUIRE (node.nom) IS UNIQUE;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{nom:"Afghanite", properties:{}}, 
    {nom:"Rubis", properties:{}}, 
    {nom:"Saphir", properties:{}}, 
    {nom:"Diamant", properties:{}},
    {nom:"Topaze", properties:{}},
    {nom:"Obsidienne", properties:{}}
    ] AS row
CREATE (n:Gemme{nom: row.nom}) SET n += row.properties;
:commit




:begin
CREATE CONSTRAINT constraint_8f9dd393 FOR (node:Couleur) REQUIRE (node.couleur) IS UNIQUE;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{_id:7, properties:{nom:"Jaune"}}, {_id:8, properties:{nom:"Rose"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Couleur;
UNWIND [{couleur:"Rouge", properties:{}}, {couleur:"Bleu", properties:{}}, {couleur:"Vert", properties:{}}] AS row
CREATE (n:Couleur{couleur: row.couleur}) SET n += row.properties;
UNWIND [{_id:3, properties:{nom:"Afghanite"}}, {_id:4, properties:{nom:"Rubis"}}, {_id:5, properties:{nom:"Saphir"}}, {_id:6, properties:{nom:"Diamant"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Gemme;
:commit
:begin
UNWIND [{start: {_id:3}, end: {couleur:"Bleu"}, properties:{}}, {start: {_id:4}, end: {couleur:"Rouge"}, properties:{}}, {start: {_id:5}, end: {couleur:"Bleu"}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:Couleur{couleur: row.end.couleur})
CREATE (start)-[r:A_COULEUR]->(end) SET r += row.properties;
:commit
:begin
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
:commit
:begin
DROP CONSTRAINT UNIQUE_IMPORT_NAME;
:commit
