--[[
  This file is part of Amaya.
  Created at 04/12/2022 15:32
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

---@class _Accounts
_Accounts = {}

function _Accounts.load(cash, bank, blackMoney)
    local self = {}
    self.cash = cash
    self.bank = bank
    self.blackMoney = blackMoney
    self.getCash = function()
        return (self.cash)
    end
    self.getBank = function()
        return (self.bank)
    end
    self.getBlackMoney = function()
        return (self.blackMoney)
    end
    self.addCash = function(amount)
        self.cash = self.cash + amount
    end
    self.addBank = function(amount)
        self.bank = self.bank + amount
    end
    self.addBlackMoney = function(amount)
        self.blackMoney = self.blackMoney + amount
    end
    self.removeCash = function(amount)
        self.cash = self.cash - amount
    end
    self.removeBank = function(amount)
        self.bank = self.bank - amount
    end
    self.removeBlackMoney = function(amount)
        self.blackMoney = self.blackMoney - amount
    end
    self.setCash = function(amount)
        self.cash = amount
    end
    self.setBank = function(amount)
        self.bank = amount
    end
    self.setBlackMoney = function(amount)
        self.blackMoney = amount
    end
    return (self)
end
