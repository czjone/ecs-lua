-- -- ==========================================================================
-- -- xlib.ecs
xlib.ecs = xlib.ecs or {}
xlib.ecs.matcher = class({})
local matcher = xlib.ecs.matcher

function matcher:ctor(entites)
    self._entites = entites
    self._match_entites = {}
end

function matcher:get_entites()
    return self._match_entites;
end

function matcher:re_match()
    table.remove_all_for_array(self._match_entites);
    local entites = self._entites
    local func = self.match
    for _, entity in ipairs(entites) do
        if func(self, entity) then
            table.insert(entites, entity)
        end
    end
end

function matcher:match(entity)
    return true;
end
