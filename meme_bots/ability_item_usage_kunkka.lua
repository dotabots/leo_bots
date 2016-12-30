local util = require(GetScriptDirectory().."/util");

comboDesire = 0;

function AbilityUsageThink()

    local npcBot = GetBot();
    
    if (npcBot:IsUsingAbility()) then return end;
    
    abilityTorrent = npcBot:GetAbilityByName("kunkka_torrent");
    abilityTidebringer = npcBot:GetAbilityByName("kunkka_tidebringer");
    abilityX = npcBot:GetAbilityByName("kunkka_x_marks_the_spot");
    abilityReturn = npcBot:GetAbilityByName("kunkka_return");
    abilityGhostship = npcBot:GetAbilityByName("kunkka_ghostship");    

end

function considerCombo()
  local npcBot = GetBot();
  local xRange = abilityX:GetCastRange();
  local tideRange = abilityTidebringer:GetCastRange();
  local torrentRange = abilityTorrent:GetCastRange();
  local shipRange = abilityGhostship:GetCastRange();
  
  local nearbyEnemies = npcBot:GetNearbyHeroes(
end