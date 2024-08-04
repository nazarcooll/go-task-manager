-- name: GetUser :one
SELECT * FROM task_manager_users
WHERE id = $1 LIMIT 1;

-- name: ListUser :many
SELECT * FROM task_manager_users
ORDER BY email;

-- name: CreateUser :one
INSERT INTO task_manager_users (
   email, username, first_name, last_name, is_superuser
) VALUES (
  $1, $2, $3, $4, $5
)
RETURNING *;

-- name: UpdateUser :exec
UPDATE task_manager_users
  set username = $2,
  email = $3,
  first_name = $4, 
  last_name = $5, 
  is_superuser = $6
WHERE id = $1
RETURNING *;

-- name: DeleteUser :exec
DELETE FROM task_manager_users
WHERE id = $1;