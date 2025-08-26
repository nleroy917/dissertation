-- rewrite image paths like "/figs/a.png" to "<PROJECT_ROOT>/figs/a.png"
-- pass the root as:  --metadata=typst_root=/absolute/path/to/project
-- if omitted, fallback to the directory of the first input file.

local path = require 'pandoc.path'

local function get_project_root()
  local m = PANDOC_WRITER_OPTIONS["variables"]["typst_root"]
  if m then
    return m
  end
  -- otherwise, fallback to current working dir
  return path.cwd()
end

local ROOT = get_project_root()

function Image(img)
  if img.src:sub(1,1) == '/' then
    -- drop leading slash and join with ROOT
    local rel = img.src:gsub("^/", "")
    local ROOT = tostring(ROOT)
    print("Updating image path:", img.src, "->", path.join({ROOT, rel}))
    img.src = path.join({ROOT, rel})
    return img
  end
end