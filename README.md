# vdf-converter
Ruby Gem for converting Valves data format to various other formats

<h2>Example Usage</h2>

<code>
require 'vdf-converter'
items_text = open("items_game.txt").read # imported using the steam web API
converter = VdfConverter.new
converter.saveJSON(items_text, "hurray2.json")
</code>
