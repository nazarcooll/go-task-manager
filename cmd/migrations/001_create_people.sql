-- This is a sample migration.

create table {{ .prefix }}users(
  id serial primary key,
  first_name varchar not null,
  last_name varchar not null
);

---- create above / drop below ----

drop table {{ .prefix }}users;
