CREATE TABLE IF NOT EXISTS work_items (
  id bigserial NOT NULL,
  reported_by bigint NOT NULL, 
  assigned_to bigint,
  name character varying(256) NOT NULL,
  description character varying,
  child_items bigint[],
  comments bigint[],
  created_at timestamp with time zone NOT NULL DEFAULT NOW(),
  CONSTRAINT work_items_item_pkey PRIMARY KEY (id)
);
---- create above / drop below ----
DROP TABLE work_items