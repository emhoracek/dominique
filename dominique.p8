pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
-- dominique
-- by libby

curr_dia = 1
dia_btn = 0
dia_mode = 1

hearts = "����"

t=0

x=64
y=64

music(0)

function _update()
 t += 1
 if dia_mode == 1
 then dia_handler()
 else dir4_handler()
 end
end

function _draw()
 cls()
 
 map(0,0,0,0,16,16)
  
 if dia_mode == 1
 then 
   draw_dia(dialog[curr_dia])
 end
  
 draw_dashboard()
 
 spr(17,x,y)
end

------------------------------
--         dashboard        --
------------------------------

function draw_dashboard()
  print(hearts,3,3,8)
  print("day 1",100,3,8)
end

------------------------------
--       first scene        --
------------------------------

function first_scene()
  


------------------------------
--          dialog          --
------------------------------

-- handle input 
function dia_handler()
 if (btnp(0)) tgl_btn()
 if (btnp(1)) tgl_btn()
 if (btnp(2)) tgl_btn()
 if (btnp(3)) tgl_btn()
 
 if (btnp(5)) next_dia()
end

function tgl_btn()
  if dia_btn == 2
  then dia_btn = 1
  else dia_btn = 2
  end
end

function next_dia()
  if curr_dia < #dialog
  then curr_dia += 1
  else curr_dia = 1
  end
end

function draw_dia(o)
  rectfill(0,90,128,128,7)
  rect(1,91,126,126,8)
  spr(33,5,95)
  spr(34,13,95)
  spr(49,5,103)
  spr(50,13,103)
  print(o.w1, 24, 96, 12)
  print(o.w2, 24, 104, 12)
  if (o.b1 != "" and o.b2 != "")
  then draw_btns(o.b1, o.b2)
  end
end

function draw_btns(w1,w2)
  rectfill(22,114,60,122,8)
  rectfill(70,114,110,122,8)
  print(w1,24,116,7)
  print(w2,72,116,7)
  bx = 70
  if (dia_btn == 1) bx = 22
  rect(bx,114,bx+40,122,7)
  spr(3+slow(10),bx+20,108)   
end

-- dialog constructor
function md(w1,w2,b1,b2)
  tmp_dia = {}
  tmp_dia.w1 = w1
  tmp_dia.w2 = w2
  tmp_dia.b1 = b1
  tmp_dia.b2 = b2
  return tmp_dia
end

dialog = 
 { md("are you ready to compete",
      "for queen of the galaxy?",
      "yes", "no"),
   md("what will be your ",
      "strategy?",
      "crafty", "fight!") }

-------------------------------
--        movement           --
-------------------------------

function dir4_handler()
 if (btn(0)) x -= 1
 if (btn(1)) x += 1
 if (btn(2)) y -= 1
 if (btn(3)) y += 1
end

function dir2_handler()
 if (btn(0)) x -= 1
 if (btn(1)) x += 1
end
       
-------------------------------
--          helpers          --
-------------------------------

-- slow time :p
function slow(f)
  return (flr(t/f))%2
end
__gfx__
0000000000000000fffee22200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008808800444eee2200aaaa0000aaaa000aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088888880444ddd110aaaa9800a999980aaaaa98000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088888880fffdd111aa999f88a991f1a8aa999f8800000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088888004cccc1119991f1a9997cfca99911f1aa00000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000888000fbbbb333aa7cfca9aaffefa9af7cfcaa00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000800004aaaa999ffffefffffffffff22ffff2200000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000f8888222ff0000ffff0000ff8826628800000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000a9000000d1000000710000007100000000660009aa9000660000000033b0000088800000cc100000aa90000000000000000000000000000000000
0000000000a9fa0000d14d0000d47600007fd1000077c76650e44e0567766600003f33b0008f888000c4cc100094aa9000000000000000000000000000000000
000000000a9ffa000014410000d44d00007ff700000c77c65e7447e55677c000000ff400082ff890001444310004440000000000000000000000000000000000
000000000028820000877200041761400f7dd7f00000cc754e2aa2e467cc000000bbb330092249900111c1130099a99000000000000000000000000000000000
000000000f8772f004688240047dd6040fd77d0f000000cc44222244cc00000000bbbb3000f88820c14cc313004aaa9000000000000000000000000000000000
000000000f88882f04777664077776600ddddd10000000000e7ee2e0000000000fbbb3f40f2882f004311140040aa94000000000000000000000000000000000
00000000007007000080080000d010000070600000000000e2eee72e0000000000310100002101000031c3100002020000000000000000000000000000000000
00000000008000800070007000076000000dd00000000000227eee2e000000000001031000010210004cc410000a292000000000000000000000000000000000
00000000111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001ee9999999999ee100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001e9aaaaa99aaa98100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000019aaa999ff9a822100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000019aa944ff449882100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001aa94ffffff4988100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001aa9f11ff11ff9a100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001a9f17cffc71fa9100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001a99f71ff17ffaa100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001a99fffffffffaa100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001aa9fffeefff4aa100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001aa94ffffff4aa9100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001aaa94444449aaa100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001aa996fff699aaa100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001a99976677999a9100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000655555560000000000000000
00e2fe0000000aaaaa0000000000055566000000000000dd7dd00000000000577550000000000000000000000000000000000000566666650000000000000000
000ff0000000aaaaa9800000000055566580000000000d7dd7dd0000000005657755000000000000000000000000000000000000566666650000000000000000
002ee200000aaa999f8800000005557554280000000007fddd7d0000000006444475000000000000000000000000000000000000566666650000000000000000
0fe772f0000a9911f1aa0000000577114156000000007d1f11d7d000000065141147500000000000000000000000000000000000566666650000000000000000
0feeee2f009aaf7cfcaa90000000247d4d50000000ff7d3f37f11d00004465343741150000000000000000000000000000000000566666650000000000000000
00700700009222ffff229000000222444422000000ff11ffff1dd1000044114444ddd10000000000000000000000000000000000566666650000000000000000
00e000e000888826628820000088882662882000000f111661dddd000004dd1661dddd0000000000000000000000000000000000655555560000000000000000
000e200000888827728820000088882772882000000ff11771d1f1000004411771d1410000000000000000000000000000000000000000000000000000000000
00e2fe0000082ff222f2000000082442224200000001111111110f00000011dddd11040000000000000000000000000000000000000000000000000000000000
000ff0000022222ffff22000006668844446600000011dd1dd1fff00000667767764440000000000000000000000000000000000000000000000000000000000
002ee20008888222288882000777766667777600001ddddddddff000006777777774400000000000000000000000000000000000000000000000000000000000
0fe772f007888888888887000877777777777800007ddddddddddd0000d7777777777d0000000000000000000000000000000000000000000000000000000000
f2eee2f00088887777887000008877888877800000077dddd777dd00000ddd77dddd760000000000000000000000000000000000000000000000000000000000
0070070000000ff0ff0000000000044044000000000000ff0ff00000000000440440000000000000000000000000000000000000000000000000000000000000
00e00e0000000880880000000000088088000000000000dd0dd00000000000dd0dd0000000000000000000000000000000000000000000000000000000000000
000e20000000000000000000000070a99a0a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00e2fe0000000000000066660000aa722aa700006666000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000ff0000000000000667776000099aaaa9900006777660000000000000000000000000000000000000000000000000000000000000000000000000000000000
002ee2000000066666777776000a94999949a0006777776666600000000000000000000000000000000000000000000000000000000000000000000000000000
0fe772f0000000777777777760972114411299067777777777000000000000000000000000000000000000000000000000000000000000000000000000000000
f2eee2f000000007777677777a9927c44c7299a77777677770000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000000006666776779a99a244442a99a97767766660000000000000000000000000000000000000000000000000000000000000000000000000000000
0e000e000000000007777676aeaae22222e2aa2a6767777000000000000000000000000000000000000000000000000000000000000000000000000000000000
000e200000000000000067769eeee24994e2e2296776000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00e2fe0000000000000000000eee22eaae22e2200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000ff000000000000000000002244442244442000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
002ee20000000000000000002eee4442244422200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0fe772f0000000000000000226e7eeee6eeeee620000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0feeee2f0000000000000002e7eee7eee7e6eee22000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000000000000000002eeeeeeeeeee7e222000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00e00e000000000000000000027e6eee622226200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6555555600000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
5666666500000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
5666666500000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
5666666500000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
5666666500000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
5666666500000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
5666666500000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
6555555600000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
8888888800000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
8888888800000000000000000000000000000000000000000000000000000000ccccc1cc00000000000000000000000000000000000000000000000000000000
8888888800000000000000000000000000000000000000000000000000000000ccc11c1100000000000000000000000000000000000000000000000000000000
8888888800000000000000000000000000000000000000000000000000000000c1cccccc00000000000000000000000000000000000000000000000000000000
88888888000000000000000000000000000000000000000000000000000000001c1ccccc00000000000000000000000000000000000000000000000000000000
8888888800000000000000000000000000000000000000000000000000000000ccc11cc100000000000000000000000000000000000000000000000000000000
8888888800000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
8888888800000000000000000000000000000000000000000000000000000000cccccccc00000000000000000000000000000000000000000000000000000000
bbbbbbbb88888888ccccccccaaaaaaaa5555555577777777eeeeeeee00000000bbbbbbbb00000000000000000000000000000000000000000000000000000000
bbbbbbbb88888888ccccccccaaaaaaaa5555555577777777eeeeeeee00000000bbbbbbbb00000000000000000000000000000000000000000000000000000000
bbbbbbbb88888888ccccccccaaaaaaaa5555555577777777eeeeeeee00000000bbbbbbbb00000000000000000000000000000000000000000000000000000000
bbbbbbbb88888888ccccccccaaaaaaaa5555555577777777eeeeeeee00000000bbbbbbbb00000000000000000000000000000000000000000000000000000000
bbbbbbbb88888888ccccccccaaaaaaaa5555555577777777eeeeeeee00000000bbbbbbbb00000000000000000000000000000000000000000000000000000000
bbbbbbbb88888888ccccccccaaaaaaaa5555555577777777eeeeeeee00000000bbbbbbbb00000000000000000000000000000000000000000000000000000000
bbbbbbbb88888888ccccccccaaaaaaaa5555555577777777eeeeeeee00000000bbbbbbbb00000000000000000000000000000000000000000000000000000000
bbbbbbbb88888888ccccccccaaaaaaaa5555555577777777eeeeeeee00000000bbbbbbbb00000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
88888888888888888888888888888888a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
88888888888888888888888888888888a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
88888888888888888888888888888888a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
8888888880808080808080808888a8a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a8a8a8a88080808080808080a8a8a8a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a8a8a8a88080808080808080a8a8a8a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
808080a8a8a8a8a8a8a8a8a8a8989898a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
808080a8a8a8a8a8a8a8a8a8a8989898a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
808080a8a8a8a8a8a8a8a8a8a8989898a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a8a8a8a880808080808080a8909090a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a8a8a8a880808080808080a8909090a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a8a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a3a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a4a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a5a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6a6
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0808080808080808080808080808080809090909090909090909090909090909080808080808080808080808080808080a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2a2a2a2a2a2a2a2a2a2a2a2a2a2a2a28080808080808080808080808080808000000000000000000000000000000000
__sfx__
0110000000472004620c3400c34318470004311842500415003700c30500375183750c3000c3751f4730c375053720536211540114330c37524555247120c3730a470163521d07522375164120a211220252e315
01100000183732440518433394033c65539403185432b543184733940318433394033c655306053940339403184733940318423394033c655394031845321433184733940318473394033c655394033940339403
01100000247552775729755277552475527755297512775524755277552b755277552475527757297552775720755247572775524757207552475227755247522275526757297552675722752267522975526751
01100000001750c055003550c055001750c055003550c05500175180650c06518065001750c065003650c065051751106505365110650c17518075003650c0650a145160750a34516075111451d075113451d075
011000001b5771f55722537265171b5361f52622515265121b7771f76722757267471b7461f7362271522712185771b5571d53722517187361b7261d735227122454527537295252e5171d73514745227452e745
01100000275422754227542275422e5412e5452b7412b5422b5452b54224544245422754229541295422954224742277422e7422b7422b5422b5472954227542295422b742307422e5422e7472b547305462e742
0110000030555307652e5752b755295622e7722b752277622707227561297522b072295472774224042275421b4421b5451b5421b4421d542295471d442295422444624546245472444727546275462944729547
0110000000200002000020000200002000020000200002000020000200002000020000200002000020000200110171d117110171d227131211f227130371f2370f0411b1470f2471b35716051221571626722367
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002e775000002e1752e075000002e1752e77500000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 00044208
00 00044108
00 00010304
00 00010304
01 00010203
00 00010203
00 00010305
00 00010306
00 00010305
00 00010306
00 00010245
02 00010243
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

