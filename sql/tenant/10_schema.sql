DROP TABLE IF EXISTS competition;
DROP TABLE IF EXISTS player;
DROP TABLE IF EXISTS player_score;

CREATE TABLE competition (
  id VARCHAR(255) NOT NULL PRIMARY KEY,
  tenant_id BIGINT NOT NULL,
  title TEXT NOT NULL,
  finished_at BIGINT NULL,
  created_at BIGINT NOT NULL,
  updated_at BIGINT NOT NULL
);

CREATE TABLE player (
  id VARCHAR(255) NOT NULL PRIMARY KEY,
  tenant_id BIGINT NOT NULL,
  display_name TEXT NOT NULL,
  is_disqualified BOOLEAN NOT NULL,
  created_at BIGINT NOT NULL,
  updated_at BIGINT NOT NULL
);

CREATE TABLE player_score (
  id VARCHAR(255) NOT NULL PRIMARY KEY,
  tenant_id BIGINT NOT NULL,
  player_id VARCHAR(255) NOT NULL,
  competition_id VARCHAR(255) NOT NULL,
  score BIGINT NOT NULL,
  row_num BIGINT NOT NULL,
  created_at BIGINT NOT NULL,
  updated_at BIGINT NOT NULL
);

create index tenant_id on competition(tenant_id);
create index id on competition(id);
create index player_seach on player(tenant_id, created_at);
create index player_id on player(id);
create index search on player_score(tenant_id,competition_id, player_id);