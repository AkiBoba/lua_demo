---
--- Generated by Luanalysis
--- Created by lette.
--- DateTime: 23.02.2024 0:55
---
local stopped = false
function OnStop()
    stopped = true
    return 5000
end

function main()
    local TableRTS = AllocTable()
    AddColumn(TableRTS, 1,"Date", true, QTABLE_DATE_TYPE, 10)
    AddColumn(TableRTS, 2,"Time", true, QTABLE_TIME_TYPE, 10)
    AddColumn(TableRTS, 3,"Code", true, QTABLE_INT_TYPE, 10)
    AddColumn(TableRTS, 4,"Price", true, QTABLE_DOUBLE_TYPE, 10)
    AddColumn(TableRTS, 5,"GO", true, QTABLE_DOUBLE_TYPE, 10)
    AddColumn(TableRTS, 6,"Limit", true, QTABLE_DOUBLE_TYPE, 10)
    AddColumn(TableRTS, 7,"Contracts", true, QTABLE_INT_TYPE, 10)
    AddColumn(TableRTS, 8,"Pos", true, QTABLE_INT_TYPE, 10)

    CreateWindow(TableRTS)
    SetWindowCaption(TableRTS, 'Table parameters RTS')
    SetWindowPos(TableRTS, 0, 0, 480, 140)
    InsertRow(TableRTS, -1)
    while stopped == false do
        local TradeDate = getInfoParam('TRADEDATE')
        local ServerTime = getInfoParam('SERVERTIME')
        local SecCode = 'MGNT'
        local CodeClass = 'SPBFUT'
        local ACCOUNT = 'SPBFUT000zt'
        local FIRM_ID = 'SPBFUT000000'
        local LastTable = {}
        LastTable = getParamEx(CodeClass, SecCode, 'LAST')
        local LastPrice = LastTable.param_value
        local GO = getParamEx(CodeClass, SecCode, 'BYDEPO').param_value
        --local Limit = getFuturesLimit(CodeClass, ACCOUNT, 0, 'SUR').cbplplanned
        --local Kont = Limit/GO
        --Kont = Kont - Kont%1
        local Pos = getFuturesHolding(CodeClass, ACCOUNT, SecCode, 0)
        if Pos ~= nil then
            Pos = Pos.totalnet
        else
            Pos = 0
        end

        SetCell(TableRTS, 1,1, tostring(TradeDate))
        SetCell(TableRTS, 1,2, tostring(ServerTime))
        SetCell(TableRTS, 1,3, tostring(SecCode))
        SetCell(TableRTS, 1,4, tostring(LastPrice))
        SetCell(TableRTS, 1,5, tostring(GO))
        --SetCell(TableRTS, 1,6, tostring(Limit))
        --SetCell(TableRTS, 1, 7, tostring(Kont))
        SetCell(TableRTS, 1, 8, tostring(Pos))
        sleep(500)
    end
    message("Script stopped")
    SetCell(TableRTS, 1,1, tostring('STOP'))
end
