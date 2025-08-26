function Blocks(blocks)
    for i, block in ipairs(blocks) do
        if block.identifier ~= nil then
            block.identifier = ""
        end
    end
    return blocks
end