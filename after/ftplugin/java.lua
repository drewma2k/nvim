-- indent does not work right
vim.cmd("TSDisable indent")

local function convert_links_to_reference(lines)
    local refs = {}
    local ref_order = {}
    local ref_count = 1

    local function get_ref_id(url, title)
        local key = url .. "|" .. (title or "")
        if not refs[key] then
            local id = "ref" .. ref_count
            ref_count = ref_count + 1
            refs[key] = { id = id, url = url, title = title }
            table.insert(ref_order, key)
        end
        return refs[key].id
    end

    local output = {}

    for _, line in ipairs(lines) do

        ---------------------------------------------------------------------
        -- Pass 1: Links WITH titles
        -- Matches:
        --   [text](url "title")
        --   [text](url 'title')
        ---------------------------------------------------------------------
        local new_line = line:gsub(
            "%[([^%]]+)%]%(([^%s%)]+)%s+(['\"])(.-)%3%)",
            function(text, url, quote, title)
                local ref_id = get_ref_id(url, title)
                return string.format("[%s][%s]", text, ref_id)
            end
        )

        ---------------------------------------------------------------------
        -- Pass 2: Links WITHOUT titles
        -- Matches:
        --   [text](url)
        ---------------------------------------------------------------------
        new_line = new_line:gsub(
            "%[([^%]]+)%]%(([^%s%)]+)%)",
            function(text, url)
                local ref_id = get_ref_id(url, nil)
                return string.format("[%s][%s]", text, ref_id)
            end
        )

        table.insert(output, new_line)
    end

    -------------------------------------------------------------------------
    -- Append collected references
    -------------------------------------------------------------------------
    table.insert(output, "")
    for _, key in ipairs(ref_order) do
        local r = refs[key]
        if r.title and r.title ~= "" then
            table.insert(output, string.format("[%s]: %s \"%s\"", r.id, r.url, r.title))
        else
            table.insert(output, string.format("[%s]: %s", r.id, r.url))
        end
    end

    return output
end

local function remove_markdown_links(lines)
  local processed = {}

  for _, line in ipairs(lines) do
    -- Pattern explanation:
    -- %[(.-)%]   → capture text inside [...]
    -- %b()       → match balanced parentheses for the URL
    local new = line:gsub("%[(.-)%]%b()", "`%1`")
    table.insert(processed, new)
  end

  return processed
end

-- -- Test
-- local lines = {
--     "This is a [test](https://example.com).",
--     "Another [link](https://example.org \"Example Title\").",
--     "Repeated [link](https://example.com)."
-- }
--
-- local result = convert_links_to_reference(lines)
-- for _, l in ipairs(result) do print(l) end


local original = vim.lsp.util.convert_input_to_markdown_lines
-- ---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.convert_input_to_markdown_lines = function (input, content)
	local newlines = original(input, content)
	-- return convert_links_to_reference(newlines)
	return remove_markdown_links(newlines)
end

-- add gx support for lsp links
-- Put this in your init.lua or a plugin/*.lua file
-- Function to open jdt:// URIs in the alternate buffer
local function open_jdt_uri()
  local uri = vim.fn.expand("<cWORD>")
  if uri:match("^jdt://") then
    -- Use :buffer# to switch to alternate buffer, then edit the URI
    -- or open it directly in the alternate buffer via :badd then :buffer
    vim.cmd("badd " .. uri)
    vim.cmd("buffer #")
    return
  end

  -- Otherwise fall back to netrw-gx behavior
  vim.cmd("silent execute 'norm! gx'")
end

-- Map gx in normal mode
vim.keymap.set("n", "gx", open_jdt_uri, { silent = true })

