---
date: 2015-03-13
version: 0.0.0
layout: learnpage
title: "Step 2: Map Scrolling"
section: "Section 3: Maps"

next_file: "03_ParallaxScrolling.spin.html"
next_name: "Step 3: Parallax Scrolling"

prev_file: "01_DrawMap.spin.html"
prev_name: "Step 1: Draw Map"
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
    tileset :   &quot;gfx_cave&quot;

VAR
    long    xoffset
    long    yoffset
    long    bound_x
    long    bound_y

PUB Main

    lcd.Start(gfx.Start)

    map.Load(tileset.Addr, mp.Addr)
    bound_x := map.GetWidth&lt;&lt;3 - lcd#SCREEN_W
    bound_y := map.GetHeight&lt;&lt;3 - lcd#SCREEN_H
    
    yoffset := bound_y

    repeat
        gfx.ClearScreen(0)
        ctrl.Update

        if ctrl.Up
            if yoffset &gt; 0
                yoffset--

        if ctrl.Down
            if yoffset &lt; bound_y
                yoffset++

        if ctrl.Left
            if xoffset &gt; 0
                xoffset--
        if ctrl.Right
            if xoffset &lt; bound_x
                xoffset++
                  
        map.Draw(xoffset, yoffset)
        lcd.DrawScreen</code></pre>
<h2 id="resulting-code">Resulting Code</h2>
<pre><code>&#39; 03_maps/02_MapScrolling.spin
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
    tileset :   &quot;gfx_cave&quot;

VAR
    long    xoffset
    long    yoffset
    long    bound_x
    long    bound_y

PUB Main

    lcd.Start(gfx.Start)

    map.Load(tileset.Addr, mp.Addr)
    bound_x := map.GetWidth&lt;&lt;3 - lcd#SCREEN_W
    bound_y := map.GetHeight&lt;&lt;3 - lcd#SCREEN_H
    
    yoffset := bound_y

    repeat
        gfx.ClearScreen(0)
        ctrl.Update

        if ctrl.Up
            if yoffset &gt; 0
                yoffset--

        if ctrl.Down
            if yoffset &lt; bound_y
                yoffset++

        if ctrl.Left
            if xoffset &gt; 0
                xoffset--
        if ctrl.Right
            if xoffset &lt; bound_x
                xoffset++
                  
        map.Draw(xoffset, yoffset)
        lcd.DrawScreen

</code></pre>
