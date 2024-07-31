package teams

import (
	"github.com/nazarcooll/task-manager/internal/types"
)

type TeamsRouter interface {
	Teams() []types.Team
}
