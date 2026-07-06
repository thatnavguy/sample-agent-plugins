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

---

## Samples

### 1. Coding agent – `bc-coding-agent.yml`

A custom Copilot Chat participant (`@bc-developer`) tuned for Business Central AL development.

- Enforces AL coding conventions (PascalCase, name-prefix, `TextConst` labels, …).
- Knows the recommended object layout inside `.al` files.
- Wires in the `generate-al-object` skill and built-in `codebase` / `fetch` tools.

**Usage in chat:**
```
@bc-developer Create a table extension that adds a "Loyalty Points" field to Customer.
```

---

### 2. Skill – `bc-al-skill.yml`

A reusable prompt called `generate-al-object` that the coding agent (or any agent) can invoke.

Parameters:

| Name | Required | Description |
|------|----------|-------------|
| `objectType` | ✅ | `Table`, `Page`, `Codeunit`, `Report`, `XMLport`, `Query`, or `Enum` |
| `objectId` | ✗ | Numeric ID in the 50000–99999 range |
| `objectName` | ✅ | Object name without the prefix |
| `namePrefix` | ✗ | 2-4 char registered prefix (default: `ABC`) |

**Usage in chat:**
```
@bc-developer /generate-al-object objectType=Codeunit objectName="Sales Helper" namePrefix="XYZ"
```

---

### 3. Hook – `bc-review-hook.yml`

Fires on the `commit` event and reviews every staged `.al` file against:

- AppSource-required checks (object ID range, `DataClassification`, no hard-coded strings, …)
- Advisory warnings (procedure length, missing XML docs, …)

Returns a Markdown checklist per file and a final commit-readiness verdict.

---

### 4. Microsoft Learn MCP – `.vscode/mcp.json`

Connects VS Code Copilot Chat to the **Microsoft Learn MCP server**, giving every agent direct access to official BC/AL docs, API references, and learning paths without leaving the editor.

**Available tools exposed by the server:**

| Tool | Description |
|------|-------------|
| `search_documentation` | Full-text search across learn.microsoft.com |
| `get_article` | Fetch a specific article by URL or slug |
| `list_learning_paths` | List learning paths for a given product/role |

---

## Getting started

1. Clone this repo or copy the plugin files into your BC AL extension workspace.
2. Open the workspace in VS Code with the **GitHub Copilot** extension installed.
3. The `@bc-developer` agent, skill, and hook are automatically discovered.
4. The Microsoft Learn MCP server activates when you open Copilot Chat.

## References

- [VS Code agent plugins](https://code.visualstudio.com/docs/agent-customization/agent-plugins)
- [AL language docs](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-reference-overview)
- [AppSource technical validation](https://learn.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-checklist-submission)
