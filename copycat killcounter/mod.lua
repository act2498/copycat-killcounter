--set up someting
local mp = ModPath
local op = mp..'a.ogg'
local o_func = PlayerManager.on_killshot
local s_k = 0
local p_k = 0
if blt.xaudio and io.file_is_readable(op) then
	blt.xaudio.setup()
else
	return
end
Hooks:PostHook(PlayerManager, "on_killshot", hook1, function(self,killed_unit, variant, headshot, weapon_id)
	if self._has_secondary_reload_primary or self._has_primary_reload_secondary then
		local equipped_unit = self:get_current_state()._equipped_unit
		local selection_index = equipped_unit and equipped_unit:base() and equipped_unit:base():selection_index() or 0
		if selection_index == 1 then
			s_k = s_k % 10 + 1
			if s_k == 10 then
				XAudio.UnitSource:new(XAudio.PLAYER, XAudio.Buffer:new(op)):set_volume(1)
			return
		end
		if selection_index == 2 then
			p_k = p_k % 10 + 1
			if p_k == 10 then
				XAudio.UnitSource:new(XAudio.PLAYER, XAudio.Buffer:new(op)):set_volume(1)
			end
		end
	end
end)
