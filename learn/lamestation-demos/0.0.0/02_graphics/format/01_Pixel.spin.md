<pre><code>OBJ
    lcd : &quot;LameLCD&quot;
    gfx : &quot;LameGFX&quot;

PUB SinglePixel
    lcd.Start(gfx.Start)
    gfx.Sprite(@data, 0,0, 0)
    lcd.DrawScreen
    
DAT

data
word    0
word    1, 1
word    1
</code></pre>
<h2 id="resulting-code">Resulting Code</h2>
<pre><code>&#39; 02_graphics/format/01_Pixel.spin
&#39; -------------------------------------------------------
&#39; SDK Version: 0.0.0
&#39; Date: 03/13/15
&#39; Copyright (c) 2015 LameStation LLC
&#39; See end of file for terms of use.
&#39; -------------------------------------------------------
OBJ
    lcd : &quot;LameLCD&quot;
    gfx : &quot;LameGFX&quot;

PUB SinglePixel
    lcd.Start(gfx.Start)
    gfx.Sprite(@data, 0,0, 0)
    lcd.DrawScreen
    
DAT

data
word    0
word    1, 1
word    1


</code></pre>