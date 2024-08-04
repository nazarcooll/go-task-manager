CREATE TABLE IF NOT EXISTS teams (
  id bigserial NOT NULL,
  name character varying(150) NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT NOW(),
  CONSTRAINT teams_team_pkey PRIMARY KEY (id),
  CONSTRAINT teams_team_name_key UNIQUE (name)
);
---- create above / drop below ----
DROP TABLE teams