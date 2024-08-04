CREATE TABLE IF NOT EXISTS users (
  id bigserial NOT NULL,
  password character varying(128) NOT NULL,
  last_login timestamp with time zone,
  is_superuser boolean NOT NULL,
  username character varying(150) NOT NULL,
  first_name character varying(150) NOT NULL,
  last_name character varying(150) NOT NULL,
  email character varying(254) NOT NULL,
  created_at timestamp with time zone NOT NULL,
  CONSTRAINT users_user_pkey PRIMARY KEY (id),
  CONSTRAINT users_user_username_key UNIQUE (username)
);
---- create above / drop below ----
DROP TABLE users