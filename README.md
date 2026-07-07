# sample-agent-plugins

Thin scaffold of VS Code agent-plugin samples for **Microsoft Dynamics 365 Business Central AL** development.
Each sample demonstrates one plugin type from the [VS Code agent-customization spec](https://code.visualstudio.com/docs/agent-customization/agent-plugins).

## Repository layout

```
agents/
  bc-developer.md              ← Coding agent  (custom chat participant)
skills/
  bc-al-naming/SKILL.md        ← Skill         (reusable AL naming rules)
hooks/
  al-compile.json              ← Hook          (pre-commit AL compile check)
  scripts/al-compile-check.ps1 ← Hook script   (AL compile runner)
mcp.json                       ← MCP server configuration
plugin.json                    ← Plugin manifest
```
## References

- [VS Code agent plugins](https://code.visualstudio.com/docs/agent-customization/agent-plugins)