CREATE TABLE IF NOT EXISTS task_manager_work_item_comments (
  id bigserial NOT NULL,
  reported_by bigint NOT NULL, 
  description character varying,
  child_items bigint[],
  created_at timestamp with time zone NOT NULL DEFAULT NOW(),
  CONSTRAINT task_manager_work_item_comments_comment_pkey PRIMARY KEY (id)
);
---- create above / drop below ----
DROP TABLE task_manager_work_item_comments