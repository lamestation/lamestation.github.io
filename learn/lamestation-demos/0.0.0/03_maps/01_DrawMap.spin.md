---
date: 2015-03-13
version: 0.0.0
layout: learnpage
title: "Step 1: Draw Map"
section: "Section 3: Maps"

next_file: "02_MapScrolling.spin.html"
next_name: "Step 2: Map Scrolling"

---
<p>Add the usual settings.</p>
<pre><code>CON
    _clkmode = xtal1|pll16x
    _xinfreq = 5_000_000</code></pre>
<p>Include the necessary objects.</p>
<pre><code>OBJ

    lcd     :   &quot;LameLCD&quot; 
    gfx     :   &quot;LameGFX&quot;
    map     :   &quot;LameMap&quot;

    cavemap :   &quot;map_cave&quot;
    tileset :   &quot;gfx_cave&quot;
</code></pre>
<p>Create a public main function.</p>
<pre><code>PUB Main</code></pre>
<p>Set up the LCD and graphics systems.</p>
<pre><code>    lcd.Start(gfx.Start)</code></pre>
<p>Load the necessary graphics and map data into <code>LameMap</code>.</p>
<pre><code>    map.Load(tileset.Addr, cavemap.Addr)</code></pre>
<p>Draw your map to the screen buffer.</p>
<pre><code>    map.Draw(0,64)</code></pre>
<p>Draw to the screen.</p>
<pre><code>    lcd.DrawScreen</code></pre>
<h2 id="resulting-code">Resulting Code</h2>
<pre><code>&#39; 03_maps/01_DrawMap.spin
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

    cavemap :   &quot;map_cave&quot;
    tileset :   &quot;gfx_cave&quot;

PUB Main
    lcd.Start(gfx.Start)
    map.Load(tileset.Addr, cavemap.Addr)
    map.Draw(0,64)
    lcd.DrawScreen

</code></pre>
