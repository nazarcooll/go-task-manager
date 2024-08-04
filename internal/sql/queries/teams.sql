-- name: GetTeam :one
SELECT * FROM task_manager_teams
WHERE id = $1 LIMIT 1;

-- name: ListTeam :many
SELECT * FROM task_manager_teams
ORDER BY name;

-- name: CreateTeam :one
INSERT INTO task_manager_teams (
   name
) VALUES (
  $1
)
RETURNING *;

-- name: UpdateTeam :exec
UPDATE task_manager_teams
  set name = $2
WHERE id = $1
RETURNING *;

-- name: DeleteTeam :exec
DELETE FROM task_manager_teams
WHERE id = $1;