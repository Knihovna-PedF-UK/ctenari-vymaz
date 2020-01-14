local function get_subs(tpl)
  local subs = {}
  local start, stop = string.find(tpl, "(%-+)")
  while start do
    subs[#subs+1] = {start=start, stop=stop}
    start, stop = string.find(tpl,"(%-+)", stop + 1)
  end
  return subs
end

local function parse_line(line, subs)
  local t = {}
  local codes = {}
  -- máme řetězec v utf8, takže nemůžeme používat string.sub
  -- místo toho použijeme pole utf8 znaků
  for _, x in utf8.codes(line) do codes[#codes+1] = x end
  for k, v in ipairs(subs) do
    local chars = {}
    for i = v.start, v.stop do
      chars[#chars+1] = codes[i]
    end
    local word = utf8.char(table.unpack(chars)):gsub("^%s*", ""):gsub("%s*$", "")
    t[#t+1] = word
  end
  return t
end





  
local tpl = "-----  ------------  ----------------------------  ---------------  ---------------------  -----------  -----------  -----------"
local subs = get_subs(tpl)

local records = {}
for line in io.lines() do
  local rec = parse_line(line, subs)
  -- zkontrolovat, že řádek skutečně obsahuje záznam
  if  rec[2]:match("^[0-9]+$") then
    records[#records+1]  = rec
    -- print(table.concat(rec, "\t"))
  -- jméno rozdělené na víc řádků
  elseif rec[1] == "" and rec[2] == "" and rec[3] ~="" then 
    -- přidat jméno do předešlého záznamu
    records[#records][3] = records[#records][3] .. rec[3]
  end
end

for _, rec in ipairs(records) do
  print(table.concat(rec, "\t"))
end
