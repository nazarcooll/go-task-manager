// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0

package db

import (
	"github.com/jackc/pgx/v5/pgtype"
)

type TaskManagerTeam struct {
	ID        int64
	Name      string
	CreatedAt pgtype.Timestamptz
}

type TaskManagerUser struct {
	ID          int64
	Password    string
	LastLogin   pgtype.Timestamptz
	IsSuperuser bool
	Username    string
	FirstName   string
	LastName    string
	Email       string
	CreatedAt   pgtype.Timestamptz
}

type TaskManagerWorkItem struct {
	ID          int64
	ReportedBy  int64
	AssignedTo  pgtype.Int8
	Name        string
	Description pgtype.Text
	ChildItems  []int64
	Comments    []int64
	CreatedAt   pgtype.Timestamptz
}

type TaskManagerWorkItemComment struct {
	ID          int64
	ReportedBy  int64
	Description pgtype.Text
	ChildItems  []int64
	CreatedAt   pgtype.Timestamptz
}