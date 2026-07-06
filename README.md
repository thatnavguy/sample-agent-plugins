# sample-agent-plugins

Thin scaffold of VS Code agent-plugin samples for **Microsoft Dynamics 365 Business Central AL** development.
Each sample demonstrates one plugin type from the [VS Code agent-customization spec](https://code.visualstudio.com/docs/agent-customization/agent-plugins).

## Repository layout

```
.github/
  agents/
    bc-coding-agent.yml   ← Coding agent  (custom chat participant)
  skills/
    bc-al-skill.yml       ← Skill         (reusable AL object generator)
  hooks/
    bc-review-hook.yml    ← Hook          (pre-commit AL code reviewer)
.vscode/
  mcp.json                ← Microsoft Learn MCP server configuration
```
## References

- [VS Code agent plugins](https://code.visualstudio.com/docs/agent-customization/agent-plugins)