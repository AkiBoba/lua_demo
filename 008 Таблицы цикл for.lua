---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by yo114.
--- DateTime: 22.02.2024 15:53
---

local Table = {}
local TableNum = {10,20,30,40,50}

local a = 10
local b = 20
local c = 30
local d = 40
local e = 50
local TableVar = {a,b,c,d,e}

local TableFor = {}
for i = 1, 10, 1 do
    TableFor[i] = i
end
print('count of lines in table: ', #TableFor)

for i = 1, #TableFor, 1 do
    print('table line: '..i..' is '.. TableFor[i])
end