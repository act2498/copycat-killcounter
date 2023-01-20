local o_func = PlayerManager.on_killshot
local s_k = 0
local p_k = 0
function PlayerManager:on_killshot(killed_unit, variant, headshot, weapon_id)
	o_func(self,killed_unit, variant, headshot, weapon_id)
	if self._has_secondary_reload_primary or self._has_primary_reload_secondary then
		local equipped_unit = self:get_current_state()._equipped_unit
		local selection_index = equipped_unit and equipped_unit:base() and equipped_unit:base():selection_index() or 0
		if selection_index == 1 then
			s_k = s_k % 10 + 1
			managers.chat:_receive_message(1, "SYSTEM", 'secondary_kills='..s_k, tweak_data.system_chat_color)	
			return
		end
		if selection_index == 2 then
			p_k = p_k % 10 + 1
			managers.chat:_receive_message(1, "SYSTEM", 'primary_kills='..p_k, tweak_data.system_chat_color)
		end
	end
end