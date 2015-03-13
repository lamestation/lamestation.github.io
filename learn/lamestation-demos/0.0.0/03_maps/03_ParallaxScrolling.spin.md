---
date: 2015-03-13
version: 0.0.0
layout: learnpage
title: "Step 3: Parallax Scrolling"
section: "Section 3: Maps"


prev_file: "02_MapScrolling.spin.html"
prev_name: "Step 2: Map Scrolling"
---
<pre><code>CON
    _clkmode = xtal1|pll16x
    _xinfreq = 5_000_000

OBJ

    lcd     :   &quot;LameLCD&quot; 
    gfx     :   &quot;LameGFX&quot;
    map     :   &quot;LameMap&quot;
    ctrl    :   &quot;LameControl&quot;

    mp      :   &quot;map_cave&quot;
    mp2     :   &quot;map_cave2&quot;
    tileset :   &quot;gfx_cave&quot;
    bkdrop  :   &quot;gfx_cavelake&quot;

VAR
    long    xoffset, yoffset
    long    offsetw, offseth
    long    w1, h1, w2, h2
    long    dx, dy

PUB Main

    lcd.Start(gfx.Start)

    map.Load(tileset.Addr, mp.Addr)
    w1 := map.GetWidth&lt;&lt;3-128
    h1 := map.GetHeight&lt;&lt;3-64

    map.Load(tileset.Addr, mp2.Addr)
    w2 := map.GetWidth&lt;&lt;3-128
    h2 := map.GetHeight&lt;&lt;3-64

    dx  := w1/w2
    dy  := h1/h2

    yoffset := 64

    repeat
        ctrl.Update
        if ctrl.Left
            if xoffset &gt; 0
                xoffset--
        if ctrl.Right
            if xoffset &lt; w1
                xoffset++
        if ctrl.Up
            if yoffset &gt; 0
                yoffset--
        if ctrl.Down
            if yoffset &lt; h1
                yoffset++

        gfx.Blit(bkdrop.Addr)

        gfx.InvertColor(True)
        map.Load(tileset.Addr, mp2.Addr)
        map.Draw(xoffset/dx, yoffset/dy)
        gfx.InvertColor(False)

        map.Load(tileset.Addr, mp.Addr)
        map.Draw(xoffset, yoffset)

        lcd.DrawScreen</code></pre>
<h2 id="resulting-code">Resulting Code</h2>
<pre><code>&#39; 03_maps/03_ParallaxScrolling.spin
&#39; -------------------------------------------------------
&#39; SDK Version: 0.0.0
&#39; Date: 03/13/15
&#39; Copyright (c) 2015 LameStation LLC
&#39; See end of file for terms of use.
&#39; -------------------------------------------------------
CON
    _clkmode = xtal1|pll16x
    _xinfreq = 5_000_000

OBJ

    lcd     :   &quot;LameLCD&quot; 
    gfx     :   &quot;LameGFX&quot;
    map     :   &quot;LameMap&quot;
    ctrl    :   &quot;LameControl&quot;

    mp      :   &quot;map_cave&quot;
    mp2     :   &quot;map_cave2&quot;
    tileset :   &quot;gfx_cave&quot;
    bkdrop  :   &quot;gfx_cavelake&quot;

VAR
    long    xoffset, yoffset
    long    offsetw, offseth
    long    w1, h1, w2, h2
    long    dx, dy

PUB Main

    lcd.Start(gfx.Start)

    map.Load(tileset.Addr, mp.Addr)
    w1 := map.GetWidth&lt;&lt;3-128
    h1 := map.GetHeight&lt;&lt;3-64

    map.Load(tileset.Addr, mp2.Addr)
    w2 := map.GetWidth&lt;&lt;3-128
    h2 := map.GetHeight&lt;&lt;3-64

    dx  := w1/w2
    dy  := h1/h2

    yoffset := 64

    repeat
        ctrl.Update
        if ctrl.Left
            if xoffset &gt; 0
                xoffset--
        if ctrl.Right
            if xoffset &lt; w1
                xoffset++
        if ctrl.Up
            if yoffset &gt; 0
                yoffset--
        if ctrl.Down
            if yoffset &lt; h1
                yoffset++

        gfx.Blit(bkdrop.Addr)

        gfx.InvertColor(True)
        map.Load(tileset.Addr, mp2.Addr)
        map.Draw(xoffset/dx, yoffset/dy)
        gfx.InvertColor(False)

        map.Load(tileset.Addr, mp.Addr)
        map.Draw(xoffset, yoffset)

        lcd.DrawScreen

</code></pre>
