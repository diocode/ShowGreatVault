local _, ShowGreatVault = ...
--9/13/21 Minimap button now shows/hides Great Vault as expected
ShowGreatVault = LibStub("AceAddon-3.0"):NewAddon(ShowGreatVault, "ShowGreatVault", "AceConsole-3.0", "AceEvent-3.0")

SGV_LDB = LibStub("LibDataBroker-1.1"):NewDataObject("ShowGreatVault", {
  type = "data source",
  text = "Show Great Vault",
  label = "Show Great Vault",
  icon = "Interface\\ICONS\\Classicon_rogue",
  OnClick = function()
    LoadAddOn("Blizzard_WeeklyRewards");
    if WeeklyRewardsFrame:IsShown() then
      WeeklyRewardsFrame:Hide()
    else
      WeeklyRewardsFrame:Show()
    end
  end,
  OnTooltipShow = function(sgv)
    sgv:AddLine("Click to show The Great Vault")
  end
})

LibDBIcon = LibStub("LibDBIcon-1.0")
local SGV_Frame = WeeklyRewardsFrame

function ShowGreatVault:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("ShowGreatVaultDB", {
    profile = {
      minimap = {
        hide = false,
      },
      frame = {
        point = "CENTER",
        relativeFrame = nil,
        relativePoint = "CENTER",
        ofsx = 0,
        ofsy = 0,
        width = 750,
        height = 400,
      },
    },
  });
  LibDBIcon:Register("ShowGreatVault", SGV_LDB, self.db.profile.minimap)
end
