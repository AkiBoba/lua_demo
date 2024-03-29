---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by yo114.
--- DateTime: 25.02.2024 17:21
---
function main()
    local TableRTS = AllocTable()
    AddColumn(TableRTS, 1, 'Legend', true, QTABLE_STRING_TYPE, 15)
    AddColumn(TableRTS, 2, 'Year', true, QTABLE_INT_TYPE, 10)
    AddColumn(TableRTS, 3, 'Month', true, QTABLE_INT_TYPE, 13)
    AddColumn(TableRTS, 4, 'Day', true, QTABLE_INT_TYPE, 10)
    AddColumn(TableRTS, 5, 'Hour', true, QTABLE_INT_TYPE, 10)
    AddColumn(TableRTS, 6, 'Minute', true, QTABLE_INT_TYPE, 10)
    AddColumn(TableRTS, 7, 'Seconds', true, QTABLE_INT_TYPE, 13)
    AddColumn(TableRTS, 8, 'Open', true, QTABLE_INT_TYPE, 13)
    AddColumn(TableRTS, 9, 'Max', true, QTABLE_INT_TYPE, 13)
    AddColumn(TableRTS, 10, 'Min', true, QTABLE_INT_TYPE, 13)
    AddColumn(TableRTS, 11, 'Close', true, QTABLE_INT_TYPE, 13)
    AddColumn(TableRTS, 12, 'Vol', true, QTABLE_INT_TYPE, 10)
    AddColumn(TableRTS, 13, 'Max N', true, QTABLE_INT_TYPE, 10)
    AddColumn(TableRTS, 14, 'Min N', true, QTABLE_INT_TYPE, 10)
    CreateWindow(TableRTS)
    SetWindowCaption(TableRTS, 'Graphics info RTS')
    SetWindowPos(TableRTS, 0,10,900,70)
    InsertRow(TableRTS, -1)

    local RTSCandles = getNumCandles('RAO15M')
    local RTSPrice, RTSN, RTSName = getCandlesByIndex('RAO15M', 0,0,RTSCandles)
    --message(tostring(RTSN))
    local Year = RTSPrice[RTSN - 7].datetime.year
    local Month = RTSPrice[RTSN - 7].datetime.month
    local Day = RTSPrice[RTSN - 7].datetime.day
    local Hour = RTSPrice[RTSN - 7].datetime.hour
    local Min = RTSPrice[RTSN - 7].datetime.min
    local Sec = RTSPrice[RTSN - 7].datetime.sec
    local Open = RTSPrice[RTSN - 7].open
    local High = RTSPrice[RTSN - 7].high
    local Low = RTSPrice[RTSN - 7].low
    local Close = RTSPrice[RTSN - 7].close
    local Vol = RTSPrice[RTSN - 7].vol

    local MaxN = 0
    local N = 200
    for i = RTSN - 1, RTSN - N, -1 do
        if RTSPrice[i].high > MaxN then
            MaxN = RTSPrice[i].high
        end
    end

    local MinN = RTSPrice[RTSN-1].low
    local j = RTSN - 1
    while j >= RTSN-N do
        if RTSPrice[j].low < MinN then
            MinN = RTSPrice[j].low
        end
        j = j - 1
    end

    SetCell(TableRTS, 1,1, tostring(RTSName))
    SetCell(TableRTS, 1,2, tostring(Year))
    SetCell(TableRTS, 1,3, tostring(Month))
    SetCell(TableRTS, 1,4, tostring(Day))
    SetCell(TableRTS, 1,5, tostring(Hour))
    SetCell(TableRTS, 1,6, tostring(Min))
    SetCell(TableRTS, 1,7, tostring(Sec))
    SetCell(TableRTS, 1,8, tostring(Open-Open%1))
    SetCell(TableRTS, 1,9, tostring(High-High%1))
    SetCell(TableRTS, 1,10, tostring(Low-Low%1))
    SetCell(TableRTS, 1,11, tostring(Close-Close%1))
    SetCell(TableRTS, 1,12, tostring(Vol))
    SetCell(TableRTS, 1,13, tostring(MaxN))
    SetCell(TableRTS, 1,14, tostring(MinN))
end