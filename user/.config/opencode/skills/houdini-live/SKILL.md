---
name: Houdini Live Session
description: Use when working in a live Houdini session through the houdini MCP. Solaris/USD assets, Component Builder, materials, lights, SOPs, simulations, or scene inspection. Enforces MCP-only operation, canonical shelf tools, USD naming standards, and minimal UI disruption.
---

# Houdini Live Session

This skill is for using the Houdini MCP against a live session. It is not for
developing the MCP server.

## The MCP is the interface

- Use the MCP tools, prompts, resources, and the installed Houdini help.
- Treat the server as a black box. Do not read or search
  `/home/beat/dev/houdini-mcp/src`, its tests, or the plugin code to answer a
  scene question.
- Do not call the plugin over raw HTTP and do not bypass a missing tool with
  `hython` or HOM.
- If a tool is missing, fails, or returns something unexpected, report the exact
  tool and error. Ask for a server change instead of reverse-engineering it.
- Exception: source inspection is allowed only when the user explicitly asks to
  develop, debug, or review the server.

## Fresh connection

- Before work, confirm the MCP tool surface is fresh. A stale server usually
  exposes an old or incomplete tool list.
- If the list is stale or incomplete, reconnect the MCP server once. Do not
  investigate by reading code.
- If it is still stale, stop and report the tool count and the error.

## Preserve the session

- Do not change the current network editor, viewport renderer, frame, framing,
  selection, display flags, or pane focus unless the task requires it.
- Do not capture screenshots or test-render unless the user asks or approves.
- Do not move existing nodes. Layout only new nodes.
- Do not save the scene unless asked.

## Use canonical tools

- Use `get_workflow_guide` or the server prompts before hand-building a setup.
- Use `run_shelf_tool` for known networks, especially Component Builder.
- Batch independent reads and writes.
- Stop when the request is met. Do not add unrequested polish.

## Component Builder

1. Run the **Component Builder shelf tool** in `/stage`. Do not hand-create the
   four nodes.
2. Rename only the Component Output to the PascalCase asset name. Its name
   becomes the root prim.
3. Delete all sticky notes inside Component Geometry.
4. Build the geometry in the internal SOP network, above the `default` output.
   Layout the internal network.
5. For Arnold, add a Mesh LOP after Component Geometry.
6. Materials in the Material Library are named after the material.
7. Display the Component Output.
8. To reference within the same network, create a Reference LOP, connect the
   Component Output to the multi-input, and leave all parameters at defaults.
   It lands at `/<AssetName>`.
9. Layout `/stage`.

## USD and naming

- Component assets and root prims are PascalCase: `Pig`, `Chair`, `WaterTank`.
- Materials are PascalCase and use exactly the material name: `Gray`, `Wood`,
  `Water`. Never add `_mtl`, `_mat`, `_shader`, or similar suffixes.
- Leave generated and default node names alone. Only rename wrangles, using
  lowercase snake_case names that describe the action.
- Neutral gray is a linear value: `0.2`, not `0.5`.
- Use the pattern `%type:Mesh` for the double-sided Mesh LOP edit.
- Materials belong in a Material Library LOP, never `/mat` or object level.
- Reference LOP defaults are correct unless the user specifies a hierarchy.

## Verification

- Prefer USD data: `get_stage_info`, `list_usd_prims`,
  `get_usd_bound_material`, `get_usd_attributes`, `list_lights`, and
  `find_error_nodes`.
- Do not switch the viewport renderer or capture a screenshot to verify unless
  the user asks.
- Report what you verified and what you did not.

## Efficiency

- A simple component asset should take roughly 10-15 MCP calls.
- If a routine build passes about 20 calls, stop and reassess.
