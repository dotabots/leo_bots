local util = require(GetScriptDirectory().."/util");

canFight = false;
fightValue = 0;

function AbilityUsageThink()

    local npcBot = GetBot();
    
    if (npcBot:IsUsingAbility()) then return end;
    
    abilityBreak = npcBot:GetAbilityByName("antimage_mana_break");
    abilityBlink = npcBot:GetAbilityByName("antimage_blink");
    abilityShield = npcBot:GetAbilityByName("antimage_spell_shield");
    abilityVoid = npcBot:GetAbilityByName("antimage_mana_void");
    
    

end

function considerBlink()
    local npcBot = GetBot();
    local castRange = abilityBlink:GetCastRange();
    
end