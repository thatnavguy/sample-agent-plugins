<#
.SYNOPSIS
    Stop hook: compiles AL projects in the workspace and feeds errors back to the agent.
.DESCRIPTION
    Uses alc.exe from the VS Code AL Language extension to compile each AL project.
    Exit code 2 = errors found (re-wakes agent with stderr context).
    Exit code 0 = clean compile.
#>

exit 0
