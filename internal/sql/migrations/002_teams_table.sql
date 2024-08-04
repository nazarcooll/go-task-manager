CREATE TABLE IF NOT EXISTS task_manager_teams (
  id bigserial NOT NULL,
  name character varying(150) NOT NULL,
  created_at timestamp with time zone NOT NULL DEFAULT NOW(),
  CONSTRAINT task_manager_teams_team_pkey PRIMARY KEY (id),
  CONSTRAINT task_manager_teams_team_name_key UNIQUE (name)
);
---- create above / drop below ----
DROP TABLE task_manager_teams