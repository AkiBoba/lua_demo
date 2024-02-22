---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by yo114.
--- DateTime: 22.02.2024 19:42
---

local FileNameWrite = 'C:\\Lua\\Test.txt'
local FileNameRead = 'C:\\Lua\\Test1.txt'
local FileWrite
local FileRead
FileWrite = io.open(FileNameWrite, 'a')
FileRead = io.open(FileNameRead, 'r')
--Режимы открытия файла:
--«r» – режим чтения файла;
--«w» – режим записи в файл с удалением содержимого файла (перезапись);
--«a» – режим записи в файл с добавлением к содержимому файла.

FileWrite:write('test write in file\n')
FileWrite:flush()
local Read = FileRead:read('*l')
--Параметры чтения из файла:
--«*l» – читает следующую строку;
--«*a» – читает весь файл;
--«*n» – читает числовое значение;
--«5» – (числовое значение) читает количество символов равное указанному числу, например команда Read = FileRead:read(5) прочитает первые пять символов из строки.
print(Read)