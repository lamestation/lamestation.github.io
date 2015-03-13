<pre><code>CON
    _clkmode        = xtal1 + pll16x
    _xinfreq        = 5_000_000

OBJ
        lcd     :               &quot;LameLCD&quot;
        gfx     :               &quot;LameGFX&quot;
        map     :               &quot;LameMap&quot;
        ctrl    :               &quot;LameControl&quot;

        font    :               &quot;gfx_font4x6_b&quot;
        dia     :               &quot;gfx_scroll&quot;
        map1gfx :               &quot;gfx_lostatsea&quot;
        map1    :               &quot;map_lostatsea&quot;
        
PUB Main

    lcd.Start(gfx.Start)

    gfx.ClearScreen(0)
    gfx.LoadFont(font.Addr, &quot; &quot;, 0, 0)

    &#39; add a map for a cool effect
    map.Load(map1gfx.Addr, map1.Addr)
    map.Draw(0,0)

    &#39; cool dialog box function with customizable graphics
    DialogBox(@strang,0,32,128,24,6,6)
    lcd.DrawScreen

    repeat
        ctrl.Update
    until ctrl.A

    DialogBox(@strang2,0,32,128,24,6,6)
    lcd.DrawScreen


PUB DialogBox(str, x,y,w,h, tw, th) | dx, dy, x1, y1, w1, h1, frame

    x1 := x/tw
    y1 := y/th

    w1 := w/tw-1
    h1 := h/th-1

    repeat dy from 0 to h1
        repeat dx from 0 to w1
            frame := 0
            case dy
                0:      frame += 0
                h1:     frame += 6
                other:  frame += 3

            case dx
                0:      frame += 0
                w1:     frame += 2
                other:  frame += 1

            gfx.Sprite(dia.Addr,x+dx*tw,y+dy*th,frame)

    gfx.TextBox(str,x+tw, y+th, w-tw, h-th)

DAT

strang   byte    &quot;TOAD: And we were lost at sea&quot;,10,&quot;for what felt like years...&quot;,0
strang2  byte    &quot;There was no end in sight.&quot;,0</code></pre>
<h2 id="resulting-code">Resulting Code</h2>
<pre><code>&#39; 04_text/DialogBox.spin
&#39; -------------------------------------------------------
&#39; SDK Version: 0.0.0
&#39; Date: 03/13/15
&#39; Copyright (c) 2015 LameStation LLC
&#39; See end of file for terms of use.
&#39; -------------------------------------------------------
CON
    _clkmode        = xtal1 + pll16x
    _xinfreq        = 5_000_000

OBJ
        lcd     :               &quot;LameLCD&quot;
        gfx     :               &quot;LameGFX&quot;
        map     :               &quot;LameMap&quot;
        ctrl    :               &quot;LameControl&quot;

        font    :               &quot;gfx_font4x6_b&quot;
        dia     :               &quot;gfx_scroll&quot;
        map1gfx :               &quot;gfx_lostatsea&quot;
        map1    :               &quot;map_lostatsea&quot;
        
PUB Main

    lcd.Start(gfx.Start)

    gfx.ClearScreen(0)
    gfx.LoadFont(font.Addr, &quot; &quot;, 0, 0)

    &#39; add a map for a cool effect
    map.Load(map1gfx.Addr, map1.Addr)
    map.Draw(0,0)

    &#39; cool dialog box function with customizable graphics
    DialogBox(@strang,0,32,128,24,6,6)
    lcd.DrawScreen

    repeat
        ctrl.Update
    until ctrl.A

    DialogBox(@strang2,0,32,128,24,6,6)
    lcd.DrawScreen


PUB DialogBox(str, x,y,w,h, tw, th) | dx, dy, x1, y1, w1, h1, frame

    x1 := x/tw
    y1 := y/th

    w1 := w/tw-1
    h1 := h/th-1

    repeat dy from 0 to h1
        repeat dx from 0 to w1
            frame := 0
            case dy
                0:      frame += 0
                h1:     frame += 6
                other:  frame += 3

            case dx
                0:      frame += 0
                w1:     frame += 2
                other:  frame += 1

            gfx.Sprite(dia.Addr,x+dx*tw,y+dy*th,frame)

    gfx.TextBox(str,x+tw, y+th, w-tw, h-th)

DAT

strang   byte    &quot;TOAD: And we were lost at sea&quot;,10,&quot;for what felt like years...&quot;,0
strang2  byte    &quot;There was no end in sight.&quot;,0

</code></pre>