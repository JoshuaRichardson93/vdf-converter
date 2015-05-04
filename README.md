# vdf-converter
Ruby Gem for converting Valves data format to various other formats

<h2>Example Usage</h2>

<code>
require 'vdf-converter'<br/>
items_text = open("items_game.txt").read # imported using the steam web API<br/>
converter = VdfConverter.new<br/>
converter.saveJSON(items_text, "hurray2.json")<br/>
</code>
