# jig-demo

This is the **Jig demonstration repository** for stakeholder presentations.

It intentionally contains drift across multiple governance areas to showcase
what Jig detects and fixes automatically:

| File / Resource | Drift Type |
|---|---|
| `infrastructure/main.tf` | Old Terraform module versions + unformatted code |
| `main.go` | Unformatted Go code |
| `config.yaml` | YAML spacing violations |
| `SECURITY.md` | Stale content, missing managed blocks |
| `CONTRIBUTING.md` | Outdated manual guide |
| Repo description | Wrong description (will be updated by Jig) |
| Branch protection | No rules enforced yet |

## Demo Flow

1. Start Jig server: `make server`
2. Navigate to the fleet dashboard
3. Find `jig-test-custome/jig-demo` in the list
4. Click **Sync** — Jig will open a PR with all fixes
5. Review the PR to see every governance fix applied
