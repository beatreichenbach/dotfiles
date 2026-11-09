# Houdini MCP usage

When the `houdini` MCP server is available:

- Use its tools for all Houdini actions. Do not shell out to `hou`, `hython`, or
  raw HTTP.
- Treat the server as a black box. Do not read
  `/home/beat/dev/houdini-mcp/src`, its tests, or the plugin code to answer
  Houdini questions. Exception: the user explicitly asks to develop, debug, or
  review the server.
- Use the server's workflow guides, prompts, resources, and
  `search_help`/`get_help_page` instead of reading repo markdown.
- If the tool surface is stale or incomplete, reconnect the MCP server once. Do
  not investigate by reading code.
- Preserve UI state: no renderer switch, no frame or view changes, no network
  navigation, and no screenshots unless asked.
- Use canonical shelf tools for known networks. Verify with USD data, not
  renders.
- Load the `houdini-live` skill for the detailed live-session checklist.
