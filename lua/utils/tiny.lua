local map, sum, trim
do
	local _obj_0 = require("lib.std")
	map, sum, trim = _obj_0.table.map, _obj_0.table.sum, _obj_0.string.trim
end
local alter
alter = function(attr, per)
	return math.floor(attr * (100 + per) / 100)
end
local clamp
clamp = function(value)
	return math.min(1, math.max(0, value))
end
local limit
limit = function(c, a, op)
	if op == "i" then
		return (c + a) > 100 and 100 or c + a
	elseif op == "d" then
		return (c - a) < 0 and 0 or c - a
	end
	return error("operation should be either i or, d", 5)
end
local in_range
in_range = function(n, max)
	assert(n, "number should not be nil")
	if type(n) == "string" and n:find("%.") and tonumber(n) == 1 then
		n = tonumber(n) * 100 .. "%"
	end
	if type(n) == "string" and n:find("%%") then
		n = (tonumber(n:sub(1, #n - 1)) * max) / 100
	end
	if math.abs(n - max) < 0.000001 then
		return 1
	end
	assert(n >= 0 and n <= max, "number should be between 0-255/0-1/0-100")
	return n
end
local Tiny
do
	local _class_0
	local named_colors
	local _base_0 = {
		hex2rgb = function(hex)
			hex = hex:sub(1, 1) == "#" and hex:sub(2) or hex
			if hex:len() == 3 then
				hex = tostring(hex:sub(1, 1):rep(2)) .. tostring(hex:sub(2, 2):rep(2)) .. tostring(hex:sub(3, 3):rep(2))
			end
			return {
				r = tonumber(hex:sub(1, 2), 16),
				g = tonumber(hex:sub(3, 4), 16),
				b = tonumber(hex:sub(5, 6), 16)
			}
		end,
		hue2rgb = function(p, q, t)
			if t < 0 then
				t = t + 1
			end
			if t > 1 then
				t = t - 1
			end
			if t < 1 / 6 then
				return p + (q - p) * 6 * t
			end
			if t < 1 / 2 then
				return q
			end
			if t < 2 / 3 then
				return p + (q - p) * (2 / 3 - t) * 6
			end
			return p
		end,
		hsl2rgb = function(h, s, l)
			local rgb = { }
			if s == 0 then
				rgb = {
					r = l,
					g = l,
					b = l
				}
			else
				local q = l < 0.5 and l * (1 + s) or l + s - l * s
				local p = 2 * l - q
				rgb = {
					r = Tiny.hue2rgb(p, q, h + 1 / 3),
					g = Tiny.hue2rgb(p, q, h),
					b = Tiny.hue2rgb(p, q, h - 1 / 3)
				}
			end
			return {
				r = rgb.r * 255,
				g = rgb.g * 255,
				b = rgb.b * 255
			}
		end,
		to_rgb = function(self)
			return {
				r = self.r,
				g = self.g,
				b = self.b
			}
		end,
		to_perc = function(self, number)
			local c = {
				r = (self.r / 255) * 100,
				g = (self.g / 255) * 100,
				b = (self.b / 255) * 100
			}
			if number then
				return c
			end
			return {
				r = tostring(c.r) .. "%",
				g = tostring(c.g) .. "%",
				b = tostring(c.b) .. "%"
			}
		end,
		to_float = function(self)
			local _tbl_0 = { }
			for k, v in pairs(self:to_perc()) do
				_tbl_0[k] = tonumber(v:sub(1, #v - 1)) / 100
			end
			return _tbl_0
		end,
		to_hex = function(self, prefix)
			local prefix_sym = prefix and "#" or ""
			local callback
			callback = function(item)
				return item:len() == 1 and item:rep(2) or item
			end
			local hex_tbl = map(callback, {
				("%02X"):format(self.r),
				("%02X"):format(self.g),
				("%02X"):format(self.b)
			})
			return tostring(prefix_sym) .. tostring(table.concat(hex_tbl))
		end,
		to_int = function(self)
			return tostring(self.r) .. tostring(self.g) .. tostring(self.b)
		end,
		to_hsl = function(self, unit)
			local c = self:to_float()
			assert(type(c.r) == "number" and type(c.g) == "number" and type(c.b) == "number")
			local max = math.max(c.r, c.g, c.b)
			local min = math.min(c.r, c.g, c.b)
			local h, s
			local l = (max + min) / 2
			if max == min then
				h, s = 0, 0
			else
				local d = max - min
				s = l > 0.5 and (d / (2 - max - min)) or (d / (max + min))
				if max == c.r then
					h = (c.g - c.b) / d + (c.g < c.b and 6 or 0)
				elseif max == c.g then
					h = (c.b - c.r) / d + 2
				elseif max == c.b then
					h = (c.r - c.g) / d + 4
				end
				h = h / 6
			end
			return unit and {
				h = tostring(math.ceil(h * 360)) .. "deg",
				s = tostring(math.ceil(s * 100)) .. "%",
				l = tostring(math.ceil(l * 100)) .. "%"
			} or {
				h = h,
				s = s,
				l = l
			}
		end,
		inc_red = function(self, a)
			local c = self:to_perc(true)
			return Tiny({
				r = tostring(limit(c.r, a, "i")) .. "%",
				g = tostring(c.g) .. "%",
				b = tostring(c.b) .. "%"
			})
		end,
		inc_green = function(self, a)
			local c = self:to_perc(true)
			return Tiny({
				g = tostring(limit(c.g, a, "i")) .. "%",
				r = tostring(c.r) .. "%",
				b = tostring(c.b) .. "%"
			})
		end,
		inc_blue = function(self, a)
			local c = self:to_perc(true)
			return Tiny({
				b = tostring(limit(c.b, a, "i")) .. "%",
				r = tostring(c.r) .. "%",
				g = tostring(c.g) .. "%"
			})
		end,
		dec_red = function(self, a)
			local c = self:to_perc(true)
			return Tiny({
				r = tostring(limit(c.r, a, "d")) .. "%",
				g = tostring(c.g) .. "%",
				b = tostring(c.b) .. "%"
			})
		end,
		dec_green = function(self, a)
			local c = self:to_perc(true)
			return Tiny({
				g = tostring(limit(c.g, a, "d")) .. "%",
				r = tostring(c.r) .. "%",
				b = tostring(c.b) .. "%"
			})
		end,
		dec_blue = function(self, a)
			local c = self:to_perc(true)
			return Tiny({
				b = tostring(limit(c.b, a, "d")) .. "%",
				r = tostring(c.r) .. "%",
				g = tostring(c.g) .. "%"
			})
		end,
		brighten = function(self, a)
			a = a == 0 and 0 or (a or 10)
			return Tiny({
				r = math.max(0, math.min(255, self.r - math.floor(255 * -(a / 100)))),
				g = math.max(0, math.min(255, self.g - math.floor(255 * -(a / 100)))),
				b = math.max(0, math.min(255, self.b - math.floor(255 * -(a / 100))))
			})
		end,
		lighten = function(self, a)
			a = a == 0 and 0 or (a or 10)
			local hsl = self:to_hsl()
			hsl.l = hsl.l + (a / 100)
			hsl.l = clamp(hsl.l)
			local rgb = Tiny.hsl2rgb(hsl.h, hsl.s, hsl.l)
			return Tiny({
				r = rgb.r,
				g = rgb.g,
				b = rgb.b
			})
		end,
		darken = function(self, a)
			a = a == 0 and 0 or a or 10
			local hsl = self:to_hsl()
			hsl.l = hsl.l - (a / 100)
			hsl.l = clamp(hsl.l)
			local rgb = Tiny.hsl2rgb(hsl.h, hsl.s, hsl.l)
			return Tiny({
				r = rgb.r,
				g = rgb.g,
				b = rgb.b
			})
		end,
		shade_altered = function(self, a)
			a = a == 0 and 0 or (a or 5)
			self.r = alter(self.r, a)
			self.g = alter(self.g, a)
			self.b = alter(self.b, a)
			self.r = math.min(self.r, 255)
			self.g = math.min(self.g, 255)
			self.b = math.min(self.b, 255)
			return self
		end,
		shade = function(self, a)
			a = a == 0 and 0 or (a or 10)
			return self:mix(Tiny("black"), a)
		end,
		tint = function(self, a)
			a = a == 0 and 0 or (a or 10)
			return self:mix(Tiny("white"), a)
		end,
		saturate = function(self, a)
			a = a == 0 and 0 or (a or 10)
			local hsl = self:to_hsl()
			hsl.s = hsl.s + (a / 100)
			hsl.s = clamp(hsl.s)
			local rgb = Tiny.hsl2rgb(hsl.h, hsl.s, hsl.l)
			return Tiny({
				r = rgb.r,
				g = rgb.g,
				b = rgb.b
			})
		end,
		desaturate = function(self, a)
			a = a == 0 and 0 or (a or 10)
			local hsl
			hsl = self:to_hsl()
			hsl.s = hsl.s - (a / 100)
			hsl.s = clamp(hsl.s)
			local rgb = Tiny.hsl2rgb(hsl.h, hsl.s, hsl.l)
			return Tiny({
				r = rgb.r,
				g = rgb.g,
				b = rgb.b
			})
		end,
		spin = function(self, a)
			a = a == 0 and 0 or (a or 10)
			local hsl = self:to_hsl()
			local h = (hsl.h + a) % 360
			hsl.h = h < 0 and 360 + h or h
			local rgb = Tiny.hsl2rgb(hsl.h, hsl.s, hsl.l)
			return Tiny({
				r = rgb.r,
				g = rgb.g,
				b = rgb.b
			})
		end,
		mix = function(self, c, a)
			a = a == 0 and 0 or (a or 50)
			local value = a / 100
			return Tiny({
				r = ((c.r - self.r) * value) + self.r,
				g = ((c.g - self.g) * value) + self.g,
				b = ((c.b - self.b) * value) + self.b
			})
		end,
		invert = function(self)
			return Tiny("white") - self
		end,
		rand_color = function(self)
			return Tiny(math.random(0, 255), math.random(0, 255), math.random(0, 255))
		end,
		greyscale = function(self)
			self:desaturate(100)
			return Tiny({
				r = self.r,
				g = self.g,
				b = self.b
			})
		end,
		split_complement = function(self)
			local hsl = self:to_hsl()
			local h = hsl.h
			return {
				self,
				Tiny({
					h = (h + 72) % 360,
					s = hsl.s,
					l = hsl.l
				}),
				Tiny({
					h = (h + 216) % 360,
					s = hsl.s,
					l = hsl.l
				})
			}
		end,
		get_complement = function(self)
			local hsl = self:to_hsl()
			return Tiny({
				h = (hsl.h + 180) % 360,
				s = hsl.s,
				l = hsl.l
			})
		end,
		get_triad = function(self)
			local hsl = self:to_hsl()
			local h = hsl.h
			return {
				self,
				Tiny({
					h = (h + 120) % 360,
					s = hsl.s,
					l = hsl.l
				}),
				Tiny({
					h = (h + 240) % 360,
					s = hsl.s,
					l = hsl.l
				})
			}
		end,
		get_tetrad = function(self)
			local hsl = self:to_hsl()
			local h = hsl.h
			return {
				self,
				Tiny({
					h = (h + 90) % 360,
					s = hsl.s,
					l = hsl.l
				}),
				Tiny({
					h = (h + 180) % 360,
					s = hsl.s,
					l = hsl.l
				}),
				Tiny({
					h = (h + 270) % 360,
					s = hsl.s,
					l = hsl.l
				})
			}
		end,
		get_brightness = function(self)
			return (self.r * 299 + self.g * 587 + self.b * 114) / 1000
		end,
		get_luminance = function(self)
			local RsRGB, GsRGB, BsRGB, R, G, B
			RsRGB = self.r / 255
			GsRGB = self.g / 255
			BsRGB = self.b / 255
			if RsRGB <= 0.03928 then
				R = RsRGB / 12.92
			else
				R = ((RsRGB + 0.055) / 1.055) ^ 2.4
			end
			if GsRGB <= 0.03928 then
				G = GsRGB / 12.92
			else
				G = ((GsRGB + 0.055) / 1.055) ^ 2.4
			end
			if BsRGB <= 0.03928 then
				B = BsRGB / 12.92
			else
				B = ((BsRGB + 0.055) / 1.055) ^ 2.4
			end
			return (0.2126 * R) + (0.7152 * G) + (0.0722 * B)
		end,
		get_readability = function(self, c)
			local sl
			sl = self:get_luminance()
			local cl
			cl = c:get_luminance()
			return (math.max(sl, cl) + 0.05) / (math.min(sl, cl) + 0.05)
		end,
		is_light = function(self)
			return not self:is_dark()
		end,
		is_dark = function(self)
			return self:get_brightness() < 128
		end,
		is_readable = function(self, c, wcag2)
			local validateWCAG2Parms
			validateWCAG2Parms = function(parms)
				parms = parms or {
					level = "AA",
					size = "small"
				}
				local level = (parms.level or "AA"):upper()
				local size = (parms.size or "small"):lower()
				if level ~= "AA" and level ~= "AAA" then
					level = "AA"
				end
				if size ~= "small" and size ~= "large" then
					size = "small"
				end
				return {
					level = level,
					size = size
				}
			end
			local readability = self:get_readability(c)
			local output = false
			local wcag2Parms = validateWCAG2Parms(wcag2)
			local level_size = wcag2Parms.level + wcag2Parms.size
			if level_size == "AAsmall" and level_size == "AAAlarge" then
				output = readability >= 4.5
			elseif level_size == "AAlarge" then
				output = readability >= 3
			elseif level_size == "AAAsmall" then
				output = readability >= 7
			end
			return output
		end,
		__tostring = function(self)
			return self:to_hex(true)
		end,
		__eq = function(self, o)
			return self.r == o.r and self.g == o.g and self.b == o.b
		end,
		__add = function(self, o)
			self.r = self.r + o.r
			self.g = self.g + o.g
			self.b = self.b + o.b
			return self
		end,
		__sub = function(self, self, o)
			self.r = self.r - o.r
			self.g = self.g - o.g
			self.b = self.b - o.b
			return self
		end,
		__lt = function(self, o)
			return sum(self:to_rgb()) > sum(o:to_rgb())
		end
	}
	if _base_0.__index == nil then
		_base_0.__index = _base_0
	end
	_class_0 = setmetatable({
		__init = function(self, ...)
			assert(..., "new param cannot be nil")
			local packed = {
				...
			}
			local rgb = { }
			if #packed == 1 then
				packed = packed[1]
				do
					local _exp_0 = type(packed)
					if "string" == _exp_0 then
						packed = trim(packed)
						if packed:sub(1, 1) == "#" then
							rgb = Tiny.hex2rgb(packed)
						else
							local message = "no color named " .. tostring(packed) .. " and hexes accepted with # prefix"
							rgb = Tiny.hex2rgb(assert(self.named_colors[packed], message))
							self.name = packed
						end
					elseif "table" == _exp_0 then
						if packed.h and packed.s and packed.l then
							rgb = Tiny.hsl2rgb(packed.h, packed.s, packed.l)
						elseif packed.r and packed.g and packed.b then
							rgb = {
								r = math.floor(in_range(packed.r, 256)),
								g = math.floor(in_range(packed.g, 256)),
								b = math.floor(in_range(packed.b, 256))
							}
						else
							error("either [r,g,b] or [h,s,l] table needs to be passed")
						end
					elseif "number" == _exp_0 then
						rgb = Tiny.hex2rgb(("#%06X"):format(packed))
					else
						error("invalid field type, only numbers, string, table are accepted")
					end
				end
				self.r = rgb.r
				self.g = rgb.g
				self.b = rgb.b
			elseif #packed == 3 then
				self.r = math.floor(in_range(packed[1], 256))
				self.g = math.floor(in_range(packed[2], 256))
				self.b = math.floor(in_range(packed[3], 256))
			end
		end,
		__base = _base_0,
		__name = "Tiny"
	}, {
		__index = _base_0,
		__call = function(cls, ...)
			local _self_0 = setmetatable({ }, _base_0)
			cls.__init(_self_0, ...)
			return _self_0
		end
	})
	_base_0.__class = _class_0
	local self = _class_0;
	named_colors = setmetatable({
		aliceblue = "F0F8FF",
		antiquewhite = "FAEBD7",
		aqua = "0FF",
		aquamarine = "7FFFD4",
		azure = "F0FFFF",
		beige = "F5F5DC",
		bisque = "FFE4C4",
		black = "000",
		blanchedalmond = "FFEBCD",
		blue = "00F",
		blueviolet = "8A2BE2",
		brown = "A52A2A",
		burlywood = "DEB887",
		burntsienna = "EA7E5D",
		cadetblue = "5F9EA0",
		chartreuse = "7FFF00",
		chocolate = "D2691E",
		coral = "FF7F50",
		cornflowerblue = "6495ED",
		cornsilk = "FFF8DC",
		crimson = "DC143C",
		cyan = "0FF",
		darkblue = "00008B",
		darkcyan = "008B8B",
		darkgoldenrod = "B8860B",
		darkgray = "A9A9A9",
		darkgreen = "006400",
		darkgrey = "A9A9A9",
		darkkhaki = "BDB76B",
		darkmagenta = "8B008B",
		darkolivegreen = "556b2F",
		darkorange = "FF8C00",
		darkorchid = "9932CC",
		darkred = "8B0000",
		darksalmon = "E9967A",
		darkseagreen = "8FBC8F",
		darkslateblue = "483D8B",
		darkslategray = "2F4F4F",
		darkslategrey = "2F4F4F",
		darkturquoise = "00CED1",
		darkviolet = "9400d3",
		deeppink = "FF1493",
		deepskyblue = "00BFFF",
		dimgray = "696969",
		dimgrey = "696969",
		dodgerblue = "1E90FF",
		firebrick = "B22222",
		floralwhite = "FFFAF0",
		forestgreen = "228B22",
		fuchsia = "F0F",
		gainsboro = "DCDCDC",
		ghostwhite = "F8F8FF",
		gold = "FFD700",
		goldenrod = "DAA520",
		gray = "808080",
		green = "008000",
		greenyellow = "ADFF2F",
		grey = "808080",
		honeydew = "F0FFF0",
		hotpink = "FF69B4",
		indianred = "CD5C5C",
		indigo = "4B0082",
		ivory = "FFFFF0",
		khaki = "F0E68C",
		lavender = "E6E6FA",
		lavenderblush = "FFF0F5",
		lawngreen = "7CFC00",
		lemonchiffon = "FFFACD",
		lightblue = "ADD8E6",
		lightcoral = "F08080",
		lightcyan = "E0FFFF",
		lightgoldenrodyellow = "FAFAD2",
		lightgray = "D3D3D3",
		lightgreen = "90EE90",
		lightgrey = "D3D3D3",
		lightpink = "FFB6C1",
		lightskyblue = "87CEFA",
		lightslategray = "789",
		lightslategrey = "789",
		lightsteelblue = "B0C4DE",
		lightyellow = "FFFFE0",
		lime = "0F0",
		limegreen = "32CD32",
		linen = "FAF0E6",
		magenta = "F0F",
		maroon = "800000",
		mediumaquamarine = "66CDAA",
		mediumblue = "0000CD",
		mediumorchid = "BA55D3",
		mediumpurple = "9370DB",
		mediumseagreen = "3CB371",
		mediumslateblue = "7B68EE",
		mediumspringgreen = "00FA9A",
		mediumturquoise = "48D1CC",
		mediumvioletred = "C71585",
		midnightblue = "191970",
		mintcream = "F5FFFA",
		mistyrose = "FFE4E1",
		moccasin = "FFE4B5",
		navajowhite = "FFDEAD",
		navy = "000080",
		oldlace = "FDF5E6",
		olive = "808000",
		olivedrab = "6B8E23",
		orange = "FFA500",
		orangered = "FF4500",
		orchid = "DA70D6",
		palegoldenrod = "EEE8AA",
		palegreen = "98FB98",
		paleturquoise = "AFEEEE",
		palevioletred = "DB7093",
		papayawhip = "FFEFD5",
		peachpuff = "FFDAB9",
		peru = "CD853F",
		pink = "FFC0CB",
		plum = "DDA0DD",
		powderblue = "B0E0E6",
		purple = "800080",
		rebeccapurple = "663399",
		red = "F00",
		rosybrown = "BC8F8F",
		royalblue = "4169E1",
		saddlebrown = "8B4513",
		salmon = "FA8072",
		sandybrown = "F4A460",
		seagreen = "2E8B57",
		seashell = "FFF5EE",
		sienna = "A0522D",
		silver = "C0C0C0",
		skyblue = "87CEEB",
		slateblue = "6A5ACD",
		slategray = "708090",
		slategrey = "708090",
		snow = "FFFAFA",
		springgreen = "00FF7F",
		steelblue = "4682B4",
		tan = "D2B48C",
		teal = "008080",
		thistle = "D8BFD8",
		tomato = "FF6347",
		turquoise = "40E0D0",
		violet = "EE82EE",
		wheat = "F5DEB3",
		white = "FFF",
		whitesmoke = "F5F5F5",
		yellow = "FF0",
		yellowgreen = "9ACD32",
	}, {
		__call = function(self, prefix)
			if prefix then
				local _tbl_0 = { }
				for k, v in self do
					_tbl_0[k] = "#" .. tostring(v)
				end
				return _tbl_0
			else
				return self
			end
		end
	})
	Tiny = _class_0
	return _class_0
end
