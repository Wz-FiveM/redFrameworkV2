--[[
  This file is part of Amaya.
  Created at 04/12/2022 11:13
  
  Copyright (c) Amaya - All Rights Reserved
  
  Unauthorized using, copying, modifying and/or distributing of this file,
  via any medium is strictly prohibited. This code is confidential.
--]]
---@author Wezor

---@class _Job
_Job = {}

function _Job.load(jobName, jobGrade)
    local self = {}
    self.name = jobName
    self.grades = _Job.getData(jobName).grades
    self.label = _Job.getData(jobName).label

    self.getName = function()
        return (self.name)
    end

    self.getGrades = function()
        return (self.grades)
    end

    self.applyJob = function(serverId, newName,newGrade, callback)
        if (not (_Job.getData(newName))) then
            _Server.makeTrace("Le métier n'existe pas !", "error")
            if (callback) then
                callback(false)
            end
            return
        end
        if (not (_Job.getData(newName).grades[newGrade])) then
            _Server.makeTrace("Le grade n'existe pas !", "error")
            if (callback) then
                callback(false)
            end
            return
        end
        self.name = newName
        self.grades = _Job.getData(newName).grades
        self.label = _Job.getData(newName).label
        self.grade = newGrade
        _Server.getPlayer(serverId).jobName = newName
        _Server.getPlayer(serverId).jobGrade = newGrade
        _Server.getPlayer(serverId).job = self
        callback(true)
    end

    return (self)
end

function _Job.loadAllJobs()
    local file = io.open(("resources/%s/data/jobs.json"):format(GetCurrentResourceName()), "r")
    local data = json.decode(file:read("*a"))
    file:close()
    _Server.Jobs = data
    for i, v in pairs(data) do
        _Server.makeTrace(("Métier (%s) charger avec succès !"):format(v.label), "info")
    end
end

_Job.loadAllJobs()

function _Job.getData(jobName)
    if (not (_Server.Jobs[jobName])) then
        return (false)
    end
    return (_Server.Jobs[jobName])
end
