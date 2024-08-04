-- name: GetTeam :one
SELECT * FROM teams
WHERE id = $1 LIMIT 1;

-- name: ListTeam :many
SELECT * FROM teams
ORDER BY name;

-- name: CreateTeam :one
INSERT INTO teams (
   name
) VALUES (
  $1
)
RETURNING *;

-- name: UpdateTeam :exec
UPDATE teams
  set name = $2
WHERE id = $1
RETURNING *;

-- name: DeleteTeam :exec
DELETE FROM teams
WHERE id = $1;