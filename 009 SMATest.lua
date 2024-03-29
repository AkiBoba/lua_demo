---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by yo114.
--- DateTime: 22.02.2024 16:12
---
function SMA(Table, n)
    --Считать скользящее среднее мы будем используя основной цикл перебора значений и вложенный цикл считающий сумму предыдущих 10 значений
    local TableSMA = {}
    for i = 1, #Table, 1 do
        if i < n then
            TableSMA[i] = Table[i]
        else
            local j = i
            local Sum = 0
            while j > i - n do
                Sum = Sum + Table[j]
                j = j - 1
            end
            TableSMA[i] = Sum/n
        end
    end
    return TableSMA
end



local Table  = {}
local n = 20 --  значение интервала скользящего среднего
local x = 20

for i = 1, 200 do
    Table[i] = x + i
end

TableSMA = SMA(Table, n)
for i = 1, #Table, 1 do
    print('\t'..'table line: '..i..' is '.. Table[i]..'\t'..TableSMA[i])
end