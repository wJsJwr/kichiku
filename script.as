//━━ヽ(｀･д･´)ﾉ━━!!(。´・д・)エッ
load("libBitmap", function() {});
if ($G._get("singleton") == undefined || $G._get("singleton") == null) {
	var colorNormal = 0xFF606060;
	var colorDark = 0xFF404040;
	var colorWhite = 0xFFF8F8F8;
	var skills = $G._get("skills");
	var textLib = $G._get("text_lib");
	var fontLib = $G._get("font_lib");
	var fontSm = $G._get("font_sm");
	var items = $G._get("items");
	var pokes = $G._get("pokes");
	var g = {};
	var font = [];
	var smfont = [];
	var tlib = [];
	var lot = [];
	var tm = {};
	var eGuid = 0;
	var renderList = [];
	var scStack = [];
	var cStack = [];
	var sStack = [];
	var renderSrc = [];
	var cursor = null;
	var aniAct = [];
	var inAni = false;
	var aniTypeBlink = 0;
	var inLongText = false;
	var output = Bitmap.createBitmapData(240, 160, true);
	var scRect = Bitmap.createRectangle(0, 0, 240, 160);
	var kc = 0;
	var mcp_pos = [[61, 72], [60, 6], [114, 1], [182, 22], [181, 91], [115, 152]];
	var mcp_ptr = 0;
	var mr = [0, 1, 2, 3, 4, 5];
	var rbp_tpos = [[176, 75], [176, 91]];
	var rbp_ptr = 0;
	var rbp_bpos = [160, 66];
	var rbp_cpos = [[169, 76], [169, 92]];
	var r4p_tpos = [[196, 39], [196, 55], [196, 71], [196, 87]];
	var r4p_ptr = 0;
	var r4p_bpos = [180, 30];
	var r4p_cpos = [189, 40];
	var tip_bpos = [1, 115];
	var tip_tpos = [[15, 123], [15, 139]];
	//var mbp_tpos = [18, 121];
	var shp_mpos = [40, 14];
	var shp_tpos = [122, 19];
	var shp_epos = [6, 72];
	var shp_ipos = [6, 106];
	var shp_ppos = [198, 19];
	var shp_ptr = 0;
	var ltp_price = [[3, 0], [1, 0, 0], [2, 0, 0], [5, 0, 0], [1, 0, 0, 0], [4, 0, 0, 0]];
	var ltp_ptr = 0;
	var ltp_v = [30, 100, 200, 500, 1000, 4000];
	var lcmat = [
	[1 / 10, 1 / 10, 4 / 5, 0.001, 0, 100],
	[1 / 3, 1 / 3, 1 / 3, 0.01, 0, 100],
	[0.4, 0.4, 0.2, 0.02, 0, 200],
	[0.5, 0.4, 0.1, 0.05, 100, 500],
	[2 / 3, 1 / 3, 0, 0.1, 200, 1000],
	[4 / 5, 1 / 5, 0, 0.5, 200, 1000]];
	var hbp_cpos = [[88, 30], [136, 6], [136, 30], [136, 54], [129, 86]];
	var hbp_bpos = [81, 0];
	var hbp_ptr = 0;
	var chg_p = [[97, 27], [237, 27], [237, 49], [97, 49]];
	var chg_ptr = 0;
	var chg_apos = [[5, 32], [93, 28], [93, 52], [93, 76]];
	var chg_tpos = [[32, 35], [115, 32], [115, 56], [115, 80]];
	var chg_lpos = [[40, 48], [126, 42], [126, 66], [126, 90]];
	var chg_htpos = [[46, 65], [198, 42], [198, 66], [198, 90]];
	var chg_hppos = [[32, 59], [184, 36], [184, 60], [184, 84]];
	var chg_hl = 48;
	var hp_c_0 = 0xFF58D080;
	var hp_c_1 = 0xFF70F8A8;
	var pro = [];
	var e_s = 0;
	var pmmat = $.createMatrix();
	pmmat.scale(1 / 3, 1 / 3);
	var mapn = [];
	var itemn = [];
	var dali = [];
	var dali_eff = 0;
	var ltr = [];
	var lr_type = 0;
	var lr_id = 0;
	var lr_lv = 0;
	var slp_ptr = 0;
	var slp_ipos = [5, 95];
	var slp_ppos = [90, 25];
	var slp_apos = [11, 20];
	var slp_cx = 0;
	var slp_cy = 0;
	var bptr = 0;
	var p_c = [];
	var p_s = [];
	var p_coin = 200;
	var p_map_c = 1;
	var p_map_lock = [4, 4, 4, 4, 4, 1];
	var p_goods = [0, 3, 3, 1, 0];
	var p_ct = [];
	var p_end_0 = false;
	var p_end_1 = false;
	var prc = 0;
	var bat_st = 0;
	var bat_type = 0;
	var bat_exp = [];
	var bat_eff = [];
	var bat_fri = {};
	var bat_eni = {};
	var bat_dam = [];
	var bat_used = 0;
	var bat_last = 0;
	var bat_ptr = 0;
	var bat_act_ptr = 0;
	var bat_win = 0;
	var bat_npos = [[20, 20], [142, 78]];
	var bat_pmpos = [[180, 2], [30, 51]];
	var bat_hppos = [[52, 33], [174, 91]];
	var bat_htpos = [195, 96];
	var bat_lvpos = [[78, 21], [200, 79]];
	var bat_rtpos = [[136, 123], [192, 123], [136, 139], [192, 139]];
	var bat_ltpos = [[16, 123], [121, 123], [16, 139], [121, 139]];
	var bat_bpos = [120, 112];
	var cstr = [];
	var ne = [];
	var tes = [];
	var te = [];
	var tr = [];
	var epl = 0;
	var e_rf = false;
	var tani_st = 0;
	var tani_es = 0;
	var tani_ptrs = [];
	var tani_h = [];
	var eSbg = ["map1", "map1", "shop2", "box", "shop2", "bat", "bag", "change", "map1", "br", "bat", "bat", "map1", "map1", "welcome", "map1", "welcome", "map1"];
	var keys = [];
	var invkey = [38, 38, 40, 40, 37, 37, 39, 39, 68, 68, 68, 68];
	var rendered = false;
	var filterColor = [0x1900FF00, 0x1900FFFF, 0x19FF0000, 0x19FF00FF, 0x190000FF, 0x19FFFF00];
	var filterMasks = [];
	var bgmState = 0;
	var gameStage;
	var gScale = 0.0;
	var loadStage = 0;
	var loadComment;
	var frameId = 0;
	var asyncAni = false;
	var sourceScale = false;
	var nextSentence = false;
	var textWidth = 0;
	var firstSelection = 0;
	$G._set("singleton", 1);
}

function mref(i) {
	return mr[i];
}

function gid() {
	return eGuid++;
}

function hash(arr) {
	var a = 1315423911;
	for (var i = 0; i &lt; arr.length; i++) {
		a ^= ((a &lt;&lt; 5) + arr[i] + (a &gt;&gt; 2));
	}
	return a;
}

function dec(_c) {
	var c = _c.charCodeAt();
	if (c &gt;= 65 &amp;&amp; c &lt;= 90) {
		return c - 65;
	} else if (c &gt;= 97 &amp;&amp; c &lt;= 122) {
		return 26 + c - 97;
	} else if (c &gt;= 48 &amp;&amp; c &lt;= 57) {
		return 52 + c - 48;
	} else if (c == 43) {
		return 62;
	} else if (c == 45) {
		return 63;
	} else {
		return 0;
	}
}

function b64decode(s) {
	var result = [];
	for (var i = 0; i &lt; s.length; i += 4) {
		result.push((((dec(s.charAt(i)) &amp; 0x3F) &lt;&lt; 2) | ((dec(s.charAt(i + 1)) &gt;&gt; 4) &amp; 0x3)));
		result.push(((dec(s.charAt(i + 1)) &amp; 0xF) &lt;&lt; 4) | ((dec(s.charAt(i + 2)) &gt;&gt; 2) &amp; 0xF));
		result.push((((dec(s.charAt(i + 2))) &amp; 0x3) &lt;&lt; 6) | (dec(s.charAt(i + 3)) &amp; 0x3F));
	}
	if (s.charAt(s.length - 1) == "=") {
		result.pop();
		if (s.charAt(s.length - 2) == "=") {
			result.pop();
		}
	}
	return result;
}

function loadGraphicSrc(src) {
	for (var i = 0; i &lt; src.length; i++) {
		var s = b64decode(src[i][1]);
		var w = (s[0] &amp; 0xFF);
		var h = (s[1] &amp; 0xFF);
		var b = Bitmap.createBitmapData(w, h, true, 0);
		b.lock();
		if (s[2] == 0) {
			var idx = 3;
			for (var j = 0; j &lt; h; j++) {
				for (var k = 0; k &lt; w; k++) {
					b.setPixel32(k, j, (((s[idx] &amp; 0xff) &lt;&lt; 24) | ((s[idx + 1] &amp; 0xff) &lt;&lt; 16) | ((s[idx + 2] &amp; 0xff) &lt;&lt; 8) | (s[idx + 3] &amp; 0xff)));
					idx += 4;
				}
			}
		} else {
			var colc = s[2];
			var cs = [];
			var idx = 3;
			for (var j = 0; j &lt; colc; j++) {
				cs.push((((s[idx] &amp; 0xff) &lt;&lt; 24) | ((s[idx + 1] &amp; 0xff) &lt;&lt; 16) | ((s[idx + 2] &amp; 0xff) &lt;&lt; 8) | (s[idx + 3] &amp; 0xff)));
				idx += 4;
			}
			var dc = s[idx];
			idx += 1;
			var d = [];
			for (var j = 0; j &lt; dc; j++) {
				d.push([s[idx], s[idx + 1], s[idx + 2]]);
				idx += 3;
			}
			var _w = 0,
				_h = 0,
				x = 0;
			for (; idx &lt; s.length; idx++) {
				if ((s[idx] &amp; 0x80) == 0) {
					x = s[idx];
					b.setPixel32(_w, _h, cs[x]);
					if (++_w &gt;= w) {
						_w = 0;
						_h++;
					}
				} else {
					for (var j = 0; j &lt; s[idx + 1]; j++) {
						for (var k = 0; k &lt; 3; k++) {
							x = (d[(s[idx] &amp; 0x7F)][k]);
							b.setPixel32(_w, _h, cs[x]);
							if (++_w &gt;= w) {
								_w = 0;
								_h++;
							}
						}
					}
					idx += 1;
				}
			}
		}
		b.unlock();
		g[src[i][0]] = b;
	}
}

function loadFontSrc() {
	for (var i = 0; i &lt; fontLib.length; i++) {
		var s = b64decode(fontLib[i][1]);
		font[parseInt(fontLib[i][0])] = s;
	}
	for (var i = 0; i &lt; fontSm.length; i++) {
		var s = b64decode(fontSm[i][1]);
		smfont[parseInt(fontSm[i][0])] = s;
	}
}

function loadTextSrc() {
	for (var i = 0; i &lt; textLib.length; i++) {
		var d = b64decode(textLib[i][0]);
		var r = [];
		for (var j = 0; j &lt; d.length; j++) {
			if ((d[j] &amp; 0x80) == 0) {
				r.push(d[j]);
			} else {
				r.push((d[j] &lt;&lt; 8) | d[++j]);
			}
		}
		if (textLib[i].length == 2) {
			tlib[parseInt(textLib[i][1])] = r;
		} else {
			if (textLib[i][1] == "map") {
				mapn[textLib[i][2]] = r;
			} else if (textLib[i][1] == "ltr") {
				ltr[textLib[i][2]] = r;
			} else if (textLib[i][1] == "pro") {
				pro[textLib[i][2]] = r;
			} else if (textLib[i][1] == "dali") {
				dali[textLib[i][2]] = r;
			} else if (textLib[i][1] == "ne") {
				ne[textLib[i][2]] = r;
			} else if (textLib[i][1] == "te") {
				te[textLib[i][2]] = r;
			} else if (textLib[i][1] == "tes") {
				tes[textLib[i][2]] = r;
			} else if (textLib[i][1] == "tr") {
				tr[textLib[i][2]] = r;
			} else if (textLib[i][1] == "lot") {
				lot[textLib[i][2]] = r;
			} else {
				tm[textLib[i][1]] = r;
			}
		}
	}
}

function expandPokemon() {
	for (var i = 0; i &lt; pokes.length; i++) {
		if (pokes[i][9] == "") {
			pokes[i].push(3);
		} else {
			pokes[i].push(4);
		}
	}
}

function ri(_t, _s, _x, _y, _c, _a) {
	if (_x == undefined || _x == null) _x = 0;
	if (_y == undefined || _y == null) _y = 0;
	if (_c == undefined || _c == null) _c = 0xFF606060;
	if (_a == undefined) _a = null;
	var r = {
		type: _t,
		x: _x,
		y: _y
	};
	r.pid = gid();
	if (_t == 0) {
		r.bmp = _s;
	} else if (_t == 8) {
		r.type = 1;
		r.text = _s;
		r.color = _c;
	} else if (_t == 1) {
		if (_s.length &gt; 16) {
			r.type = 2;
			r.ptr = 0;
		}
		r.text = _s;
		r.color = _c;
	} else if (_t == 2) {
		r.text = _s;
		r.ptr = 0;
		r.color = _c;
	} else if (_t == 3) {
		r.bmp = _s;
	} else if (_t == 7) {
		r.text = _s;
		r.color = _c;
	} else if (_t == 4) {
		r.bmp = _s;
		r.aani = true;
	} else if (_t == 5) {
		r.bmp = _s;
		r.type = 3;
		r.aani = true;
		r.y0 = r.y;
	}
	if (_t == 1 || _t == 2) {
		var sh = hash(_s);
		if (_x == tip_tpos[0][0] &amp;&amp; _y == tip_tpos[0][1] &amp;&amp; tani_h.every(function(it, id, ar) {
				return it != sh;
			})) {
			tani_ptrs[r.pid] = 0;
			tani_h.push(sh);
		}
	}
	if (_a != null) r.a = _a;
	return r;
}

function rm(_s, _x, _y, _m) {
	var r = {
		type: 0,
		bmp: _s
	};
	var m = _m.clone();
	m.translate(_x, _y);
	r.mat = m;
	renderSrc.push(r);
}

function r(_t, _s, _p, _c) {
	if (_c == undefined || _c == null) _c = 0xFF606060;
	if (_p.x == undefined || _p.x == null) {
		renderSrc.push(ri(_t, _s, _p[0], _p[1], _c));
	} else {
		renderSrc.push(ri(_t, _s, _p.x, _p.y, _c));
	}
}

function ra(_s, _p, _a, _m) {
	if (_m == undefined) _m = null;
	var r = {
		type: 0,
		bmp: _s
	};
	var x = 0,
		y = 0;
	if (_p.x == undefined || _p.x == null) {
		x = _p[0];
		y = _p[1];
	} else {
		x = _p.x;
		y = _p.y;
	}
	if (_m != null) {
		var m = _m.clone();
		m.translate(x, y);
		r.mat = m;
	} else {
		r.x = x;
		r.y = y;
	}
	r.a = _a;
	renderSrc.push(r);
}

function setaani(type, interval) {
	var target = renderSrc[renderSrc.length - 1];
	target.aatype = type;
	target.aani = interval;
	if (type == 1) {
		target.y0 = target.y;
	}
}

function gblink(times, interval, cb) {
	if (cb == undefined) cb == null;
	return {
		type: 0,
		times: times,
		interval: interval,
		tick: 0,
		blink: false,
		callback: cb
	};
}

function dr(_x, _y, _w, _h) {
	renderSrc.push({
		type: 5,
		x: _x,
		y: _y,
		w: _w,
		h: _h
	});
}

function dw(_s, _x, _y, _c, _m) {
	var r = {
		type: 7
	};
	r.text = _s;
	r.color = _c;
	r.mat = _m.clone();
	r.mat.translate(_x, _y);
	renderSrc.push(r);
}

function dl(x1, y1, x2, y2, _w, _c) {
	renderSrc.push({
		type: 6,
		f: {
			x: x1,
			y: y1
		},
		t: {
			x: x2,
			y: y2
		},
		w: _w,
		c: _c
	});
}

function itoa(i) {
	var a = [];
	if (i &lt;= 0) return [0];
	i = Math.round(i);
	while (i &gt;= 1) {
		a.push(i % 10);
		i -= i % 10;
		i /= 10;
	}
	return a.reverse();
}

function addCoin(c) {
	p_coin += c;
	if (p_coin &gt; 999999) p_coin = 999999;
}

function rf() {
	e_rf = true;
}

function pushSc(i) {
	scStack.push(i);
	cStack.push(cursor);
	cursor = null;
	sStack.push(e_s);
	e_s = 0;
}

function popSc(es) {
	if (es == undefined || es == null) es = false;
	scStack.pop();
	if (cStack.length &gt; 0) cursor = cStack.pop();
	renderSrc = [];
	if (sStack.length &gt; 0) e_s = sStack.pop();
	if (!es) e_s = 0;
}

function maxhp(id, lv) {
	return Math.round(pokes[id][10] * lv / 50 + lv + 10);
}

function lvup(pm) {
	pm.lv++;
	pm.exp -= pm.mexp;
	var pmid = pm.id;
	pm.atk = Math.round(pokes[pmid][11] * pm.lv / 50 + 5);
	pm.def = Math.round(pokes[pmid][12] * pm.lv / 50 + 5);
	pm.agi = Math.round(pokes[pmid][13] * pm.lv / 50 + 5);
	pm.mexp = pm.lv * 50;
	pm.mhp = maxhp(pmid, pm.lv);
	pm.hp = maxhp(pmid, pm.lv);
	if (pm.exp &gt;= pm.mexp) {
		lvup(pm);
	}
}

function gexp(pm, e) {
	if (pm.lv &gt;= 100) return;
	pm.exp += e;
	if (pm.exp &gt;= pm.mexp) {
		lvup(pm);
	}
}

function addhp(pm, h) {
	pm.hp += h;
	if (pm.hp &gt; pm.mhp) pm.hp = pm.mhp;
}

function gpm(_id, _lv) {
	var pm = {
		id: _id,
		lv: _lv,
		exp: 0,
		atk: 0,
		def: 0,
		agi: 0,
		mexp: _lv * 50
	};
	pm.pid = gid();
	pm.mhp = maxhp(_id, _lv);
	pm.hp = maxhp(_id, _lv);
	pm.atk = Math.round(pokes[_id][11] * _lv / 50 + 5);
	pm.def = Math.round(pokes[_id][12] * _lv / 50 + 5);
	pm.agi = Math.round(pokes[_id][13] * _lv / 50 + 5);
	return pm;
}

function cast(sk, oppo) {
	if (oppo == undefined || oppo == null) oppo == false;
	var r = {
		type: 0,
		hit: true,
		damage: 0,
		sk: 0,
		cri: false,
		ow: false,
		can: true
	};
	var a = oppo ? bat_eni : bat_fri;
	var d = oppo ? bat_fri : bat_eni;
	var af = bat_eff[oppo ? 1 : 0];
	var df = bat_eff[oppo ? 0 : 1];
	var w = a.id;
	r.cri = Math.random() &lt; pokes[w][13] / 512;
	if (sk == -1) {
		r.type = -1;
		addhp(bat_eni, Math.round(bat_eni.mhp / 2));
		return r;
	}
	r.type = skills[sk][1];
	r.sk = sk;
	r.sig = (skills[sk][2] == 2);
	r.hit = Math.random() &lt; skills[sk][3] * 3 / (3 - af.hit) / 100;
	if (r.hit) {
		switch (skills[sk][1]) {
			case 0:
				r.ow = false;
				for (var i = 4; i &lt; skills[sk].length; i++) {
					if (skills[sk][i] == d.id) r.ow = true;
				}
				r.damage = Math.round((a.lv / 2.5 + 2) * skills[sk][2] * (a.atk * af.atk) * (r.ow ? 2 : 1) * (r.cri ? 2 : 1) / (d.def * df.def) / 50);
				break;
			case 10:
				r.damage = Math.ceil(d.mhp * skills[sk][2] / 100);
				break;
			case 11:
			case 12:
				r.damage = Math.ceil(a.mhp * skills[sk][2] / 100);
				break;
			case 1:
				r.can = df.atk &gt; 0.4;
				if (r.can) df.atk -= skills[sk][2] / 10;
				break;
			case 2:
				r.can = df.def &gt; 0.4;
				if (r.can) df.def -= skills[sk][2] / 10;
				break;
			case 3:
				r.can = df.agi &gt; 0.4;
				if (r.can) df.agi -= skills[sk][2] / 10;
				break;
			case 4:
				r.can = df.hit &gt; -6;
				if (r.can) df.hit -= 1;
				break;
			case 5:
				r.can = af.atk &lt; 1.6;
				if (r.can) af.atk += skills[sk][2] / 10;
				break;
			case 6:
				r.can = af.def &lt; 1.6;
				if (r.can) af.def += skills[sk][2] / 10;
				break;
			case 7:
				r.can = af.agi &lt; 1.6;
				if (r.can) af.agi += skills[sk][2] / 10;
				break;
			case 8:
				r.can = af.hit &lt; 6;
				if (r.can) af.hit += 1;
				break;
		}
	}
	if (bat_eff[0].inv &gt; 0 &amp;&amp; oppo) {
		r.damage = 0;
	}
	return r;
}

function ai() {
	bat_eff[0].inv--;
	var en = bat_eni;
	var eni = bat_eni.id;
	var skl = 0;
	if (bat_type == 0) {
		var w = 6 + Math.floor(Math.random() * pokes[eni][14]);
		skl = pokes[eni][w];
		return skl;
	}
	if (en.hp / en.mhp &gt; 0.66) {
		do {
			var w = 6 + Math.floor(Math.random() * pokes[eni][14]);
			skl = pokes[eni][w];
		} while (skills[skl][1] == 12 || skills[skl][1] == 11);
		return skl;
	} else if (en.hp / en.mhp &gt; 0.33) {
		for (var i = 0; i &lt; pokes[eni][14]; i++) {
			skl = pokes[eni][6 + i];
			if (skills[skl][1] == 12) return skl;
		}
		do {
			var w = 6 + Math.floor(Math.random() * pokes[eni][14]);
			skl = pokes[eni][w];
		} while (skills[skl][1] == 11);
		return skl;
	} else {
		var attSk = [];
		for (var i = 0; i &lt; pokes[eni][14]; i++) {
			skl = pokes[eni][6 + i];
			if (skills[skl][1] == 0 || skills[skl][1] == 10) attSk.push(i);
			if (skills[skl][1] == 12) return skl;
		}
		if (Math.random() &lt; 0.1) return -1;
		if (attSk.length &gt; 0) {
			if (Math.random() &lt; 0.7) {
				var raid = Math.floor(Math.random() * attSk.length);
				var sid = attSk[raid] + 6;
				return pokes[eni][sid];
			}
		}
		do {
			var w = 6 + Math.floor(Math.random() * pokes[eni][14]);
			skl = pokes[eni][w];
		} while (skills[skl][1] == 11);
		return skl;
	}
	return skl;
}

function geff() {
	return {
		atk: 1,
		def: 1,
		agi: 1,
		hit: 0,
		inv: -1
	};
}

function save() {
	var s_c = [];
	for (var i = 0; i &lt; p_c.length; i++) {
		s_c.push(gpm(p_c[i].id, p_c[i].lv));
		s_c[i].exp = p_c[i].exp;
		s_c[i].hp = p_c[i].hp;
		s_c[i].pid = p_c[i].pid;
	}
	var s_s = [];
	for (var i = 0; i &lt; p_s.length; i++) {
		s_s.push(gpm(p_s[i].id, p_s[i].lv));
		s_s[i].exp = p_s[i].exp;
		s_s[i].hp = p_s[i].hp;
		s_s[i].pid = p_s[i].pid;
	}
	var coin = p_coin;
	var map_c = p_map_c;
	var map_lock = [];
	var goods = [];
	for (var i = 0; i &lt; 6; i++) map_lock[i] = p_map_lock[i];
	for (var i = 0; i &lt; 5; i++) goods[i] = p_goods[i];
	$G._set("s_c", s_c);
	$G._set("s_s", s_s);
	$G._set("coin", coin);
	$G._set("map_c", map_c);
	$G._set("map_lock", map_lock);
	$G._set("goods", goods);
}

function load() {
	if ($G._get("s_c") != undefined) {
		var s_c = $G._get("s_c");
		p_c = [];
		for (var i = 0; i &lt; s_c.length; i++) {
			p_c.push(gpm(s_c[i].id, s_c[i].lv));
			p_c[i].exp = s_c[i].exp;
			p_c[i].hp = s_c[i].hp;
			p_c[i].pid = s_c[i].pid;
		}
		var s_s = $G._get("s_s");
		p_s = [];
		for (var i = 0; i &lt; s_s.length; i++) {
			p_s.push(gpm(s_s[i].id, s_s[i].lv));
			p_s[i].exp = s_s[i].exp;
			p_s[i].hp = s_s[i].hp;
			p_s[i].pid = s_s[i].pid;
		}
		var map_lock = $G._get("map_lock");
		p_map_lock = [];
		var goods = $G._get("goods");
		p_goods = [];
		for (var i = 0; i &lt; 6; i++) p_map_lock[i] = map_lock[i];
		for (var i = 0; i &lt; 5; i++) p_goods[i] = goods[i];
		p_coin = $G._get("coin");
		p_map_c = $G._get("map_c");
	}
}

function map() {
	bgmState = 2;
	// status 0 =&gt; choose entry
	// status 1 =&gt; confirm entry
	// status 2 =&gt; select info
	if (e_s == 0) {
		if (kc == 65) {
			e_s = 1;
			rbp_ptr = 0;
			rf();
		} else if (kc == 87) {
			e_s = 2;
			rf();
			return;
		} else {
			var c = mcp_ptr;
			if (kc == 37 &amp;&amp; (c != 1 &amp;&amp; c != 0)) {
				mcp_ptr = (c + ((c &gt; 0 &amp;&amp; c &lt; 4) ? 5 : 1)) % 6;
			} else if (kc == 39 &amp;&amp; (c != 3 &amp;&amp; c != 4)) {
				mcp_ptr = (c + ((c &gt; 0 &amp;&amp; c &lt; 4) ? 1 : 5)) % 6;
			} else if (kc == 38 &amp;&amp; c != 2) {
				mcp_ptr = (c + ((c &gt; 1 &amp;&amp; c &lt; 5) ? 5 : 1)) % 6;
			} else if (kc == 40 &amp;&amp; c != 5) {
				mcp_ptr = (c + ((c &gt; 1 &amp;&amp; c &lt; 5) ? 1 : 5)) % 6;
			}
			cursor = ri(5, g.cdh, mcp_pos[mcp_ptr][0], mcp_pos[mcp_ptr][1]);
		}
	} else if (e_s == 1) {
		r(0, g.tip1, tip_bpos);
		var t = [];
		var wantselect = true;
		switch (mcp_ptr) {
			case 0:
				t = tm.pc;
				break;
			case 1:
				cursor = ri(5, g.cdh, mcp_pos[mcp_ptr][0], mcp_pos[mcp_ptr][1]);
				pushSc(2);
				run();
				return;
			case 2:
				if (p_map_c &gt; 4) {
					t = tm.noway;
					wantselect = false;
				} else if (p_map_lock[mref(p_map_c)] &gt; 0) {
					t = tm.forbid;
					wantselect = false;
				} else {
					t = t.concat(tm.goto, mapn[mref(p_map_c + 1)], tm.qmark);
				}
				break;
			case 3:
				if (!p_c.some(function(it, idx, ar) {
						return it.hp &gt; 0;
					})) {
					t = tm.nofight;
					wantselect = false;
				} else {
					if (p_map_lock[mref(p_map_c)] &gt; 0) {
						if (p_map_c &lt; 5) {
							p_map_lock[mref(p_map_c)] = 4;
						} else {
							p_map_lock[mref(p_map_c)] = 1;
						}
						t = tm.gym;
					} else {
						t = tm.nogym;
						wantselect = false;
					}
				}
				break;
			case 4:
				if (!p_c.some(function(it, idx, ar) {
						return it.hp &gt; 0;
					})) {
					t = tm.nofight;
					wantselect = false;
				} else {
					t = tm.field;
				}
				break;
			case 5:
				if (p_map_c &gt; 1) {
					t = t.concat(tm.goto, mapn[mref(p_map_c - 1)], tm.qmark);
				} else {
					t = tm.noway;
					wantselect = false;
				}
				break;
		}
		r(1, t, tip_tpos[0]);
		if (wantselect) {
			r(0, g.sel2, rbp_bpos);
			cursor = ri(3, g.cxz, rbp_cpos[rbp_ptr][0], rbp_cpos[rbp_ptr][1]);
		}
		if (mcp_ptr == 0) {
			r(1, tm.pcc, rbp_tpos[0]);
			r(1, tm.draw, rbp_tpos[1]);
		} else {
			if (wantselect) {
				r(1, tm.yes, rbp_tpos[0]);
				r(1, tm.no, rbp_tpos[1]);
			} else {
				cursor = ri(4, g.cdh);
			}
		}
		if (kc == 38 || kc == 40) {
			if (wantselect) {
				rbp_ptr ^= 1;
				cursor = ri(3, g.cxz, rbp_cpos[rbp_ptr][0], rbp_cpos[rbp_ptr][1]);
			}
		} else if (kc == 65) {
			switch (mcp_ptr) {
				case 0:
					cursor = ri(5, g.cdh, mcp_pos[mcp_ptr][0], mcp_pos[mcp_ptr][1]);
					if (rbp_ptr == 0 &amp;&amp; p_s.length == 0) {
						renderSrc = [];
						r(0, g.tip1, tip_bpos);
						r(1, tm.empty, tip_tpos[0]);
						cursor = null;
						e_s = 0;
						return;
					}
					pushSc(rbp_ptr == 0 ? 3 : 4);
					slp_ptr = 0;
					break;
				case 2:
					if (wantselect &amp;&amp; rbp_ptr == 0) {
						p_map_c++;
						pushSc(13);
						run();
						return;
					} else {
						e_s = 0;
					}
					break;
				case 3:
					if (wantselect) {
						cursor = ri(5, g.cdh, mcp_pos[mcp_ptr][0], mcp_pos[mcp_ptr][1]);
						if (rbp_ptr == 0) {
							pushSc(10);
						} else {
							e_s = 0;
						}
					} else {
						e_s = 0;
					}
					break;
				case 4:
					if (wantselect) {
						cursor = ri(5, g.cdh, mcp_pos[mcp_ptr][0], mcp_pos[mcp_ptr][1]);
						if (rbp_ptr == 0) {
							pushSc(11);
						} else {
							e_s = 0;
						}
					} else {
						e_s = 0;
					}
					break;
				case 5:
					if (wantselect &amp;&amp; rbp_ptr == 0) {
						p_map_c--;
						pushSc(13);
						run();
					} else {
						e_s = 0;
					}
			}
			rf();
		} else if (kc == 83) {
			// back to prev status
			e_s = 0;
			rf();
		}
	} else if (e_s == 2) {
		r(0, g.menu, r4p_bpos);
		r(0, g.tip1, tip_bpos);
		r(1, tm.nowat.concat(mapn[mref(p_map_c)]), tip_tpos[0]);
		r(1, tm.bag, r4p_tpos[0]);
		r(1, tm.pm, r4p_tpos[1]);
		r(1, tm.sa, r4p_tpos[2]);
		r(1, tm.lo, r4p_tpos[3]);
		if (kc == 38) {
			r4p_ptr = (r4p_ptr + 3) % 4;
		} else if (kc == 40) {
			r4p_ptr = (r4p_ptr + 1) % 4;
		}
		cursor = ri(3, g.cxz, r4p_cpos[0], r4p_cpos[1] + r4p_ptr * 16);
		if (kc == 65) {
			if (r4p_ptr == 0) {
				pushSc(6);
				rf();
				return;
			} else if (r4p_ptr == 1) {
				pushSc(7);
				rf();
				return;
			} else if (r4p_ptr == 2) {
				pushSc(12);
				e_s = 0;
				run();
				return;
			} else if (r4p_ptr == 3) {
				pushSc(12);
				e_s = ($G._get("s_c") == undefined) ? 4 : 1;
				run();
				return;
			}
		} else if (kc == 83) {
			e_s = 0;
			rf();
			return;
		}
	}
}

function shop() {
	for (var i = 0; i &lt; items.length; i++) {
		var p = items[i][0];
		r(1, tlib[p], [shp_tpos[0], shp_tpos[1] + i * 16]);
		var x = items[i][1];
		var ar = itoa(x);
		r(1, ar.concat(tm.b), [shp_ppos[0] + (4 - ar.length) * 6, shp_ppos[1] + i * 16]);
	}
	var ar = itoa(p_coin);
	r(1, ar.concat(tm.b), [shp_mpos[0] + (7 - ar.length) * 6, shp_mpos[1]]);
	if (e_s == 0) {
		if (kc == 65) {
			e_s = 1;
			rbp_ptr = 0;
			rf();
			return;
		} else if (kc == 83) {
			scStack.pop();
			rf();
			return;
		} else if (kc == 38) {
			shp_ptr = (shp_ptr + 4) % 5;
		} else if (kc == 40) {
			shp_ptr = (shp_ptr + 1) % 5;
		}
		var x = items[shp_ptr][3];
		r(1, tlib[x], shp_ipos);
		cursor = ri(3, g.cxz, shp_tpos[0] - 8, shp_tpos[1] + shp_ptr * 16 + 2);
	} else if (e_s == 1) {
		r(0, g.sel2, rbp_bpos);
		r(1, tm.yes, rbp_tpos[0]);
		r(1, tm.no, rbp_tpos[1]);
		var x = items[shp_ptr][3];
		r(1, tlib[x], shp_ipos);
		r(0, g.tip1, tip_bpos);
		if (shp_ptr == 0) {
			r(1, tlib[43].concat(tm.btip1, itoa(items[shp_ptr][1]), tm.b, tm.btip2), tip_tpos[0]);
		} else {
			x = items[shp_ptr][0];
			r(1, tm.btip0.concat(tlib[x], tm.btip1, itoa(items[shp_ptr][1]), tm.b, tm.btip2), tip_tpos[0]);
		}
		cursor = ri(3, g.cxz, rbp_cpos[rbp_ptr][0], rbp_cpos[rbp_ptr][1]);
		if (kc == 38 || kc == 40) {
			rbp_ptr ^= 1;
			rf();
		} else if (kc == 65) {
			if (rbp_ptr == 1) {
				e_s = 0;
				rf();
			} else {
				if (items[shp_ptr][1] &gt; p_coin) {
					e_s = 2;
					rf();
				} else {
					p_coin -= items[shp_ptr][1];
					e_s = (shp_ptr == 0) ? 3 : 4;
					p_goods[shp_ptr] += p_goods[shp_ptr] &gt; 998 ? 0 : 1;
					rf();
				}
			}
		} else if (kc == 83) {
			e_s = 0;
			rf();
		}
	} else if (e_s &gt;= 2) {
		r(0, g.tip1, tip_bpos);
		if (e_s == 2) {
			r(1, tm.nomoney, tip_tpos[0]);
		} else if (e_s == 3) {
			for (var i = 0; i &lt; p_c.length; i++) {
				p_c[i].hp = p_c[i].mhp;
			}
			r(1, tlib[53].concat(tm.re, tm.thx), tip_tpos[0]);
		} else if (e_s == 4) {
			r(1, tm.thx, tip_tpos[0]);
		}
		cursor = ri(4, g.cdh);
		if (kc == 65 || kc == 83) {
			e_s = 0;
			run();
		}
	}
}

function sell() {
	for (var i = 0; i &lt; p_s.length; i++) {
		// width 20, interval 4
		var ps = p_s[i].id;
		var p = pokes[ps][2];
		rm(g[p], slp_ppos[0] + (i % 6) * 24, slp_ppos[1] + Math.floor(i / 6) * 25, pmmat);
	}
	if (e_s == 0) {
		if (kc == 83) {
			popSc();
			rf();
			return;
		} else if (kc == 37) {
			if (slp_cx &gt; 0) slp_cx--;
		} else if (kc == 38) {
			if (slp_cy &gt; 0) slp_cy--;
		} else if (kc == 39) {
			if (slp_cx &lt; 5) slp_cx++;
		} else if (kc == 40) {
			if (slp_cy &lt; Math.floor(p_s.length / 6)) slp_cy++;
		}
		slp_ptr = slp_cy * 6 + slp_cx;
		if (slp_ptr &gt;= p_s.length) {
			slp_ptr = p_s.length - 1;
			slp_cy = Math.floor(p_s.length / 6);
			slp_cx = (p_s.length + 5) % 6;
		}
		if (slp_ptr &lt; 0) {
			slp_ptr = 0;
			slp_cx = 0;
			slp_cy = 0;
		}
		var ps = p_s[slp_ptr].id;
		var p = pokes[ps][2];
		r(0, g[p], slp_apos);
		p = pokes[ps][1];
		r(1, tlib[p], slp_ipos, colorWhite);
		r(1, tm.lv.concat(itoa(p_s[slp_ptr].lv)), [slp_ipos[0], slp_ipos[1] + 16], colorWhite);
		cursor = ri(5, g.cdh, slp_ppos[0] + (slp_ptr % 6) * 24 + 7, slp_ppos[1] + Math.floor(slp_ptr / 6) * 25 - 3);
		if (kc == 65) {
			e_s = 1;
			rf();
		}
	} else if (e_s == 1) {
		var ps = p_s[slp_ptr].id;
		var p = pokes[ps][2];
		r(0, g[p], slp_apos);
		p = pokes[ps][1];
		r(1, tlib[p], slp_ipos, colorWhite);
		r(1, tm.lv.concat(itoa(p_s[slp_ptr].lv)), [slp_ipos[0], slp_ipos[1] + 16], colorWhite);
		if (kc == 83) {
			e_s = 0;
			rf();
		} else if (kc == 38 || kc == 40) rbp_ptr ^= 1;
		else if (kc == 65) {
			if (rbp_ptr == 1) e_s = 2;
			else e_s = 3;
			rf();
		}
		r(0, g.sel2, rbp_bpos);
		cursor = ri(3, g.cxz, rbp_cpos[rbp_ptr][0], rbp_cpos[rbp_ptr][1]);
		r(1, tm.sell, rbp_tpos[1]);
		r(1, tm.pch, rbp_tpos[0]);
	} else if (e_s == 2) {
		var price = 100 + p_s[slp_ptr].lv * 10;
		var ps = p_s[slp_ptr].id;
		if (pokes[ps][5] == 1) price += 500;
		var p = pokes[ps][2];
		r(0, g[p], slp_apos);
		p = pokes[ps][1];
		r(1, tlib[p], slp_ipos, colorWhite);
		r(1, tm.lv.concat(itoa(p_s[slp_ptr].lv)), [slp_ipos[0], slp_ipos[1] + 16], colorWhite);
		r(0, g.sel2, rbp_bpos);
		r(1, tm.yes, rbp_tpos[0]);
		r(1, tm.no, rbp_tpos[1]);
		r(0, g.tip1, tip_bpos);
		r(1, tm.pval0.concat(itoa(price), tm.pval1), tip_tpos[0]);
		if (kc == 83) {
			e_s = 0;
			rf();
		} else if (kc == 38 || kc == 40) {
			rbp_ptr ^= 1;
		} else if (kc == 65) {
			if (rbp_ptr == 0) {
				var pa = p_s.splice(slp_ptr, 1);
				var p = pa[0].id;
				var lv = pa[0].lv;
				addCoin(lv * 10 + ((pokes[p][5] == 1) ? 600 : 100));
				slp_ptr = 0;
				if (p_s.length &lt;= 0) {
					popSc();
					rf();
					return;
				}
			}
			e_s = 0;
			rf();
		}
		cursor = ri(3, g.cxz, rbp_cpos[rbp_ptr][0], rbp_cpos[rbp_ptr][1]);
	} else if (e_s == 3) {
		r(0, g.hand, hbp_bpos);
		if (kc == 38) {
			hbp_ptr = (hbp_ptr + 4) % 5;
		} else if (kc == 40) {
			hbp_ptr = (hbp_ptr + 1) % 5;
		}
		if (hbp_ptr == 4) {
			cursor = ri(3, g.cxz, hbp_cpos[4][0], hbp_cpos[4][1]);
		} else {
			cursor = dr(hbp_cpos[hbp_ptr][0], hbp_cpos[hbp_ptr][1], 30, 23);
		}
		for (var i = 0; i &lt; p_c.length; i++) {
			var ps = p_c[i].id;
			var p = pokes[ps][2];
			rm(g[p], hbp_cpos[i][0] + 4, hbp_cpos[i][1] + 1, pmmat);
		}
		if (kc == 83) {
			e_s = 0;
			rf();
			return;
		} else if (kc == 65) {
			if (hbp_ptr &lt; 4) {
				if (p_c[hbp_ptr] == undefined || p_c[hbp_ptr] == null) {
					p_c[hbp_ptr] = (p_s.splice(slp_ptr, 1))[0];
					slp_ptr = 0;
					slp_cx = 0;
					slp_cy = 0;
				} else {
					var p = p_c[hbp_ptr];
					p_c[hbp_ptr] = p_s[slp_ptr];
					p_s[slp_ptr] = p;
				}
			}
			e_s = 0;
			rf();
			return;
		}
		if (p_c[hbp_ptr] != undefined || p_c[hbp_ptr] != null) {
			var ps = p_c[hbp_ptr].id;
			var p = pokes[ps][2];
			r(0, g[p], slp_apos);
			p = pokes[ps][1];
			r(1, tlib[p], slp_ipos, colorWhite);
			r(1, tm.lv.concat(itoa(p_c[hbp_ptr].lv)), [slp_ipos[0], slp_ipos[1] + 16], colorWhite);
		}
	}
}

function lottery() {
	for (var i = 0; i &lt; lot.length; i++) {
		r(8, lot[i], [shp_tpos[0], shp_tpos[1] + i * 16]);
	}
	var ar = itoa(p_coin);
	r(1, ar.concat(tm.b), [shp_mpos[0] + (7 - ar.length) * 6, shp_mpos[1]]);

	// status 0 =&gt; choose item
	// status 1 =&gt; confirm buy
	// status 2 =&gt; no money
	if (e_s == 0) {
		if (kc == 65) {
			e_s = 1;
			rbp_ptr = 0;
			rf();
			return;
		} else if (kc == 83) {
			scStack.pop();
			rf();
			return;
		} else if (kc == 38) {
			ltp_ptr = (ltp_ptr + 5) % 6;
		} else if (kc == 40) {
			ltp_ptr = (ltp_ptr + 1) % 6;
		}
		r(1, tm.pay.concat(ltp_price[ltp_ptr], tm.b), shp_ipos);
		r(1, tm.lott, [shp_ipos[0], shp_ipos[1] + 16]);
		cursor = ri(3, g.cxz, shp_tpos[0] - 8, shp_tpos[1] + ltp_ptr * 16 + 2);
	} else if (e_s == 1) {
		r(0, g.sel2, rbp_bpos);
		r(1, tm.lty, rbp_tpos[0]);
		r(1, tm.ltn, rbp_tpos[1]);
		r(1, [].concat(tm.pay, ltp_price[ltp_ptr], tm.b), shp_ipos);
		r(1, tm.lott, [shp_ipos[0], shp_ipos[1] + 16]);
		cursor = ri(3, g.cxz, rbp_cpos[rbp_ptr][0], rbp_cpos[rbp_ptr][1]);
		if (kc == 38 || kc == 40) {
			rbp_ptr ^= 1;
			rf();
		} else if (kc == 65) {
			if (rbp_ptr == 1) {
				e_s = 0;
				rf();
			} else {
				if (ltp_v[ltp_ptr] &gt; p_coin) {
					e_s = 2;
					rf();
				} else {
					p_coin -= ltp_v[ltp_ptr];
					pushSc(9);
					rf();
				}
			}
		} else if (kc == 83) {
			e_s = 0;
			rf();
		}
	} else if (e_s == 2) {
		r(0, g.tip1, tip_bpos);
		r(1, tm.nomoney, tip_tpos[0]);
		cursor = ri(4, g.cdh);
		if (kc == 65 || kc == 83) {
			e_s = 0;
			rf();
		}
	}
}

function battle() {
	if (e_s == 0) {
		switch (bat_st) {
			case 0:
				var id = bat_eni.id;
				var eid = pokes[id][1];
				if (bat_type == 0) {
					r(1, tm.bf.concat(tlib[eid]), tip_tpos[0], colorWhite);
				} else {
					r(1, tm.bg.concat(tlib[eid]), tip_tpos[0], colorWhite);
				}
				break;
			case 9:
			case 1:
				var id = bat_fri.id;
				var fid = pokes[id][1];
				r(1, tm.fight.concat(tlib[fid]), tip_tpos[0], colorWhite);
				break;
			case 2:
				// run
				r(1, tm.run, tip_tpos[0], colorWhite);
				break;
			case 13:
			case 3:
				var id = bat_eni.id;
				var eid = pokes[id][1];
				r(1, tlib[eid].concat(tm.cannot), tip_tpos[0], colorWhite);
				break;
			case 4:
				// player die
				var id = bat_fri.id;
				var fid = pokes[id][1];
				r(1, tlib[fid].concat(tm.broken), tip_tpos[0], colorWhite);
				break;
			case 5:
				var id = bat_eni.id;
				var eid = pokes[id][1];
				r(1, tlib[eid].concat(tm.broken), tip_tpos[0], colorWhite);
				break;
			case 6:
				r(1, tm.lose, tip_tpos[0], colorWhite);
				break;
			case 7:
				var be = bat_exp[0][0];
				var pi = p_c[be].id;
				var po = pokes[pi][1];
				var pn = tlib[po];
				var s = pn.concat(tm.gain, itoa(bat_exp[0][1]), tm.exp);
				var p = p_c[be];
				if (p.exp + bat_exp[0][1] &gt; p.mexp &amp;&amp; p.lv &lt; 100) {
					s = s.concat(pn, tm.lvup);
				}
				r(1, s, tip_tpos[0], colorWhite);
				break;
			case 8:
				var lid = 0;
				for (var i = 0; i &lt; p_c.length; i++) {
					if (p_c[i].pid == bat_last) {
						lid = p_c[i].id;
						break;
					}
				}
				var x = pokes[lid][1];
				r(1, tm.back.concat(tlib[x], tm.comma), tip_tpos[0], colorWhite);
				break;
			case 10:
				var id = bat_fri.id;
				var fid = pokes[id][1];
				r(1, tlib[fid].concat(tm.uses, tlib[42], tm.comma, tlib[52], tm.crmark), tip_tpos[0], colorWhite);
				break;
			case 11:
				r(1, dali[dali_eff], tip_tpos[0], colorWhite);
				break;
			case 12:
				r(1, tm.win.concat(itoa(bat_win), tm.b), tip_tpos[0], colorWhite);
				break;
		}
		cursor = ri(4, g.cdh);
		if (kc == 65) {
			switch (bat_st) {
				case 3:
				case 1:
					e_s = 1;
					break;
				case 6:
				case 2:
					popSc();
					run();
					return;
				case 4:
					if (p_c.some(function(el, i, a) {
							return (el.hp &gt; 0);
						})) {
						e_s = 5;
					} else {
						bat_st = 6;
					}
					break;
				case 5:
					bat_exp = [];
					for (var i = 0; i &lt; p_c.length; i++) {
						var x = p_c[i].pid;
						if (p_c[i].hp &gt; 0 &amp;&amp; bat_dam[x] != undefined) {
							bat_exp.push([i, 0]);
						}
					}
					var exp = Math.ceil(75 * bat_eni.lv / bat_exp.length + Math.random() * 10);
					for (var i = 0; i &lt; bat_exp.length; i++) {
						bat_exp[i][1] = exp;
					}
					bat_st = 7;
					break;
				case 7:
					var x = bat_exp[0][0];
					gexp(p_c[x], (bat_exp[0][1]));
					if (bat_exp.length &gt; 1) {
						bat_exp.shift();
					} else {
						bat_st = 12;
						bat_win = bat_eni.lv * ((bat_type == 0) ? 5 : 20) + Math.round(Math.random() * bat_eni.lv);
					}
					break;
				case 12:
					addCoin(bat_win);
					if (bat_type == 1) {
						p_map_lock[mref(p_map_c)]--;
					}
					popSc();
					run();
					return;
				case 8:
					bat_last = bat_fri.pid;
					bat_st = 9;
					break;
				case 11:
					if (bat_fri.hp &lt;= 0) {
						bat_st = 4;
						break;
					}
				case 13:
				case 9:
					cstr = cast(ai(), true);
					e_s = 3;
					bat_st = 15;
					rf();
					break;
				case 10:
					var w = Math.floor(Math.random() * 4);
					if (w == 0) {
						bat_eff[0].atk *= 2;
					} else if (w == 1) {
						bat_eff[0].def *= 2;
					} else if (w == 2) {
						bat_eff[0].inv = 3;
					} else {
						bat_fri.hp -= Math.ceil(bat_fri.mhp / 2);
					}
					dali_eff = w;
				default:
					bat_st++;
			}
			cursor = null;
			rf();
		}
	} else if (e_s == 1) {
		if (bat_fri.pid != bat_last) {
			e_s = 0;
			bat_st = 8;
			run();
			return;
		}
		r(1, tm.want, tip_tpos[0], colorWhite);
		var id = bat_fri.id;
		var f = pokes[id][1];
		r(1, tlib[f].concat(tm.dosth), tip_tpos[1], colorWhite);
		r(0, g.sel4, [121, 113]);
		r(1, tm.sk, bat_rtpos[0]);
		r(1, tm.bag, bat_rtpos[1]);
		r(1, tm.pm, bat_rtpos[2]);
		r(1, tm.ru, bat_rtpos[3]);
		if (kc == 37 || kc == 39) {
			bat_act_ptr ^= 1;
		} else if (kc == 38 || kc == 40) {
			bat_act_ptr ^= 2;
		}
		cursor = ri(3, g.cxz, bat_rtpos[bat_act_ptr][0] - 5, bat_rtpos[bat_act_ptr][1]);
		if (kc == 65) {
			switch (bat_act_ptr) {
				case 0:
					e_s = 2;
					rf();
					break;
				case 1:
					e_s = 4;
					pushSc(6);
					run();
					return;
				case 2:
					pushSc(7);
					run();
					return;
				case 3:
					if (bat_type == 0) {
						if (bat_fri.agi &gt; bat_eni.agi) {
							bat_st = 2;
						} else {
							if (Math.random() &lt; 0.67) {
								bat_st = 2;
							} else {
								bat_st = 13;
							}
						}
					} else {
						bat_st = 3;
					}
					e_s = 0;
					rf();
			}
			bat_act_ptr = 0;
		}
	} else if (e_s == 2) {
		r(0, g.cast, [0, 113]);
		//15
		var w = bat_fri.id;
		for (var i = 0; i &lt; pokes[w][14]; i++) {
			var x = pokes[w][i + 6];
			var y = skills[x][0];
			r(1, tlib[y], bat_ltpos[i]);
		}
		if (kc == 37 || kc == 39) {
			bat_ptr ^= 1;
		} else if (kc == 38 || kc == 40) {
			bat_ptr ^= 2;
		}
		if (bat_ptr &gt;= pokes[w][14]) bat_ptr--;
		cursor = ri(3, g.cxz, bat_ltpos[bat_ptr][0] - 5, bat_ltpos[bat_ptr][1]);
		if (kc == 65) {
			// skill
			if (bat_fri.agi * bat_eff[0].agi &gt;= bat_eni.agi * bat_eff[1].agi) {
				cstr = cast(pokes[w][6 + bat_ptr]);
				e_s = 3;
				bat_st = 0;
			} else {
				cstr = cast(ai(), true);
				e_s = 3;
				bat_st = 10;
			}
			rf();
		} else if (kc == 83) {
			e_s = 1;
			rf();
		}
	} else if (e_s == 3) {
		var a = (bat_st &lt; 10) ? bat_fri : bat_eni;
		var d = (bat_st &lt; 10) ? bat_eni : bat_fri;
		switch (bat_st) {
			case 11:
			case 16:
				if ((cstr.type &gt; 4 &amp;&amp; cstr.type &lt; 9) || cstr.type &gt; 10) {
					var w = a.id;
					var g1 = pokes[w][3];
					ra(g[g1], [bat_pmpos[0][0] - g[g1].width / 2, 73 - g[g1].height], gblink(4, 1));
					w = d.id;
					g1 = pokes[w][2];
					r(0, g[g1], bat_pmpos[1]);
				} else {
					var w = d.id;
					var g1 = pokes[w][2];
					ra(g[g1], bat_pmpos[1], gblink(4, 1));
					w = a.id;
					g1 = pokes[w][3];
					r(0, g[g1], [bat_pmpos[0][0] - g[g1].width / 2, 73 - g[g1].height]);
				}
				bat_st++;
				var w = a.id;
				var aid = pokes[w][1];
				if (cstr.type &gt;= 0) {
					var t = cstr.sk;
					var csk = skills[t][0];
					r(1, tlib[aid].concat(tm.cast, tlib[csk]), tip_tpos[0], colorWhite);
				} else {
					r(1, tlib[aid].concat(tm.uses, tlib[44], tm.comma), tip_tpos[0], colorWhite);
				}
				break;
			case 6:
			case 1:
				if ((cstr.type &gt; 4 &amp;&amp; cstr.type &lt; 9) || cstr.type &gt; 10) {
					var w = a.id;
					var g1 = pokes[w][2];
					ra(g[g1], bat_pmpos[1], gblink(4, 1));
					w = d.id;
					g1 = pokes[w][3];
					r(0, g[g1], [bat_pmpos[0][0] - g[g1].width / 2, 73 - g[g1].height]);
				} else {
					var w = d.id;
					var g1 = pokes[w][3];
					ra(g[g1], [bat_pmpos[0][0] - g[g1].width / 2, 73 - g[g1].height], gblink(4, 1));
					w = a.id;
					g1 = pokes[w][2];
					r(0, g[g1], bat_pmpos[1]);
				}
				bat_st++;
				var w = a.id;
				var aid = pokes[w][1];
				if (cstr.type &gt;= 0) {
					var t = cstr.sk;
					var csk = skills[t][0];
					r(1, tlib[aid].concat(tm.cast, tlib[csk]), tip_tpos[0], colorWhite);
				} else {
					r(1, tlib[aid].concat(tm.uses, tlib[44], tm.comma), tip_tpos[0], colorWhite);
				}
				break;
			case 7:
			case 17:
			case 12:
			case 2:
				var w = bat_eni.id;
				var g1 = pokes[w][3];
				r(0, g[g1], [bat_pmpos[0][0] - g[g1].width / 2, 73 - g[g1].height]);
				w = bat_fri.id;
				g1 = pokes[w][2];
				r(0, g[g1], bat_pmpos[1]);
				w = a.id;
				var aid = pokes[w][1];
				if (cstr.type &gt;= 0) {
					var t = cstr.sk;
					var csk = skills[t][0];
					r(1, tlib[aid].concat(tm.cast, tlib[csk]), tip_tpos[0], colorWhite);
				} else {
					r(1, tlib[aid].concat(tm.uses, tlib[44], tm.comma), tip_tpos[0], colorWhite);
				}
				if (kc == 65) {
					bat_st++;
					if (cstr.type == 12) {
						a.hp += cstr.damage;
						if (a.hp &gt; a.mhp) a.hp = a.mhp;
					} else if (cstr.type == 0 || cstr.type == 10) {
						if (cstr.hit) {
							d.hp -= cstr.damage;
						}
					} else if (cstr.type == 11) {
						a.hp -= cstr.damage;
					}
					rf();
					//return;
				}
				break;

			case 10:
			case 15:
			case 5:
			case 0:
				var w = bat_eni.id;
				var g1 = pokes[w][3];
				r(0, g[g1], [bat_pmpos[0][0] - g[g1].width / 2, 73 - g[g1].height]);
				w = bat_fri.id;
				g1 = pokes[w][2];
				r(0, g[g1], bat_pmpos[1]);
				w = a.id;
				var aid = pokes[w][1];
				if (cstr.type &gt;= 0) {
					var t = cstr.sk;
					var csk = skills[t][0];
					r(1, tlib[aid].concat(tm.cast, tlib[csk]), tip_tpos[0], colorWhite);
				} else {
					r(1, tlib[aid].concat(tm.uses, tlib[44], tm.comma), tip_tpos[0], colorWhite);
				}
				if (kc == 65) {
					bat_st++;
					rf();
					//return;
				}
				break;
			case 8:
			case 18:
			case 13:
			case 3:
				var info = [];
				if (!cstr.hit) {
					info = tm.hit0;
				} else {
					if (cstr.type == -1) {
						var w = bat_eni.id;
						var f = pokes[w][1];
						info = tlib[f].concat(tm.yoo);
					} else if (cstr.type == 0 || cstr.type == 10) {
						if (cstr.cri) info = info.concat(tm.cri);
						if (cstr.ow) info = info.concat(tm.ow);
						var percent = cstr.damage / d.mhp;
						var w = d.id;
						var f = pokes[w][1];
						if (percent &gt;= 0.5) {
							info = info.concat(tlib[f], tm.hit1);
						} else if (percent &lt; 0.5 &amp;&amp; percent &gt;= 0.1) {
							info = info.concat(tlib[f], tm.hit2);
						} else {
							info = info.concat(tm.hit3);
						}
					} else {
						var w = a.id;
						var f = pokes[w][1];
						if (cstr.type == 12) {
							info = info.concat(tlib[f], tm.de, tm.hpv, tlib[f], tm.yoo);
						} else if (cstr.type == 11) {
							info = info.concat(tlib[f], tm.fool);
						} else {
							if (!cstr.can) {
								info = info.concat(tm.hit3);
							} else {
								var t = d.id;
								var u = pokes[t][1];
								if (cstr.type &lt; 5) {
									info = info.concat(tlib[u]);
								} else {
									info = info.concat(tlib[f]);
								}
								switch ((cstr.type - 1) % 4) {
									case 0:
										info = info.concat(tm.atk);
										break;
									case 1:
										info = info.concat(tm.def);
										break;
									case 2:
										info = info.concat(tm.agi);
										break;
									case 3:
										info = info.concat(tm.aim);
										break;
								}
								if (cstr.sig) {
									info = info.concat(tm.sig);
								}
								if (cstr.type &lt; 5) {
									info = info.concat(tm.down, tlib[u], tm.feelbad);
								} else {
									info = info.concat(tm.up, tlib[f], tm.yoo);
								}
							}
						}
					}
				}
				if (bat_eff[0].inv == 0) info = info.concat(tm.dot, dali[4]);
				r(1, info, tip_tpos[0], colorWhite);
				if (kc == 65) {
					if (bat_fri.hp &lt;= 0) {
						e_s = 0;
						bat_st = 4;
					} else if (bat_eni.hp &lt;= 0) {
						e_s = 0;
						bat_st = 5;
					} else {
						if (bat_st &lt; 5) {
							cstr = cast(ai(), true);
							bat_st = 15;
						} else if (bat_st &gt; 9 &amp;&amp; bat_st &lt; 15) {
							var f = bat_fri.id;
							cstr = cast(pokes[f][6 + bat_ptr]);
							bat_st = 5;
						} else {
							e_s = 1;
						}
					}
					rf();
				}
				var f = bat_eni.id;
				var c = pokes[f][3];
				r(0, g[c], [bat_pmpos[0][0] - g[c].width / 2, 73 - g[c].height]);
				f = bat_fri.id;
				c = pokes[f][2];
				r(0, g[c], bat_pmpos[1]);
				break;
		}
		cursor = ri(4, g.cdh);
	} else if (e_s == 4) {
		if (bat_st == 100) {
			cstr = cast(ai(), true);
			e_s = 3;
			bat_st = 15;
			run();
			return;
		} else if (bat_st == 101) {
			e_s = 0;
			bat_st = 10;
			run();
			return;
		}
	} else if (e_s == 5) {
		if (bat_fri.pid == bat_last) {
			pushSc(7);
			run();
			return;
		} else {
			e_s = 0;
			bat_st = 8;
			run();
			return;
		}
	} else if (e_s == 6) {
		switch (bat_st) {
			case 0:
				r(1, tm.kbc.concat(tm.uses, tlib[41]), tip_tpos[0], colorWhite);
				r(0, g.ball, [bat_pmpos[0][0], 50]);
				break;
			case 1:
				var w = bat_eni.id;
				var k = pokes[w][1];
				var s = tm.gotcha0.concat(tlib[k], tm.gotcha1);
				if (p_c.length == 4) {
					s = s.concat(ltr[2]);
					if (p_s.length &gt;= 30) s = s.concat(ltr[3]);
				}
				r(1, s, tip_tpos[0], colorWhite);
				r(0, g.ball, [bat_pmpos[0][0], 50]);
				break;
			case 2:
				r(1, tm.nop, tip_tpos[0], colorWhite);
				var w = bat_eni.id;
				var u = pokes[w][3];
				r(0, g[u], [bat_pmpos[0][0] - g[u].width / 2, 73 - g[u].height]);
				break;
		}
		cursor = ri(4, g.cdh);
		if (kc == 65) {
			if (bat_st == 0) {
				// TODO: CATACH
				var w = bat_eni.id;
				if (Math.random() &lt;= Math.sin(Math.PI * bat_eni.hp / bat_eni.mhp) / (pokes[w][5] + 1)) {
					bat_st = 1;
					p_ct[w] = 1;
				} else {
					bat_st = 2;
				}
				rf();
			} else if (bat_st == 1) {
				if (p_c.length == 4) {
					if (p_s.length &lt; 30) p_s.push(bat_eni);
				} else {
					p_c.push(bat_eni);
				}
				popSc();
				run();
				return;
			} else if (bat_st == 2) {
				cstr = cast(ai(), true);
				e_s = 3;
				bat_st = 15;
				rf();
			}
		}
	}
	var w = bat_eni.id;
	var bi = pokes[w][3];
	if (!(e_s == 3 || e_s == 6)) {
		r(0, g[bi], [bat_pmpos[0][0] - g[bi].width / 2, 73 - g[bi].height]);
		if (w == 20) {
			setaani(1, 4);
		}
	}
	var t = bat_fri.id;
	var li = pokes[t][2];
	if (!(e_s == 3 || (e_s == 0 &amp;&amp; bat_st == 8))) {
		r(0, g[li], bat_pmpos[1]);
		if (e_s == 2 || e_s == 1) setaani(1, 20);
	}
	bi = pokes[w][1];
	r(7, tlib[bi], bat_npos[0], colorDark);
	li = pokes[t][1];
	r(7, tlib[li], bat_npos[1], colorDark);
	r(7, tm.lv.concat(itoa(bat_eni.lv)), bat_lvpos[0], colorDark);
	r(7, tm.lv.concat(itoa(bat_fri.lv)), bat_lvpos[1], colorDark);
	var f = itoa(bat_fri.hp);
	r(7, f.concat(tm.slash, itoa(bat_fri.mhp)), bat_htpos, colorDark);
	var ml = bat_eni.hp;
	var gb = bat_eni.mhp;
	f = bat_hppos[0][0];
	var u = Math.floor(ml * 47 / gb);
	var c = bat_hppos[0][1];
	var k = bat_hppos[1][0];
	var b = bat_hppos[1][1];
	var il = f + u;
	dl(f, c, il, c, 1, hp_c_0);
	dl(f, c + 1, f + u, c + 1, 1, hp_c_1);
	ml = bat_fri.hp;
	gb = bat_fri.mhp;
	u = Math.floor(ml * 47 / gb);
	dl(k, b, k + u, b, 1, hp_c_0);
	dl(k, b + 1, k + u, b + 1, 1, hp_c_1);

}

function useitem() {
	for (var i = 1; i &lt; 5; i++) {
		var f = items[i][0];
		r(1, tlib[f], [shp_tpos[0], shp_tpos[1] + (i - 1) * 16]);
		var u = itoa(p_goods[i]);
		r(1, u.concat(tm.ge), [shp_ppos[0] + (2 - u.length) * 6, shp_ppos[1] + (i - 1) * 16]);
	}
	if (e_s == 0) {
		if (scStack.length == 2) {
			if (kc == 83) {
				popSc();
				run();
				return;
			}
		} else {
			if (kc == 65) {
				if (p_goods[bptr + 1] &gt; 0) {
					bat_used = bptr + 1;
					switch (bat_used) {
						case 1:
							if (bat_type == 0) {
								p_goods[bat_used]--;
								popSc();
								e_s = 6;
								bat_st = 0;
							} else {
								popSc();
								e_s = 0;
								bat_st = 3;
							}
							run();
							return;
						case 2:
						case 3:
							e_s = 1;
							rbp_ptr = 0;
							pushSc(7);
							run();
							return;
						case 4:
							p_goods[bat_used]--;
							popSc(true);
							bat_st = 101;
							run();
							return;
					}
				}
			} else if (kc == 83) {
				popSc();
				e_s = 1;
				run();
				return;
			}
		}
		if (kc == 38) {
			bptr = (bptr + 3) % 4;
		} else if (kc == 40) {
			bptr = (bptr + 1) % 4;
		}
		var c = items[bptr + 1][3];
		r(1, tlib[c], shp_ipos);
		cursor = ri(3, g.cxz, shp_tpos[0] - 8, shp_tpos[1] + bptr * 16 + 2);
	} else if (e_s == 1) {
		popSc(true);
		bat_st = 100;
		run();
		return;
	}
}

function change() {
	if (e_s == 0) {
		if (kc == 38 || kc == 37) {
			chg_ptr = (chg_ptr + p_c.length - 1) % p_c.length;
		} else if (kc == 40 || kc == 39) {
			chg_ptr = (chg_ptr + 1) % p_c.length;
		} else if (kc == 83) {
			if (scStack.length == 2) {
				popSc();
				run();
				return;
			} else if (scStack[scStack.length - 2] == 5) {
				if (sStack[sStack.length - 1] != 5) {
					popSc(true);
					run();
					return;
				}
			} else if (scStack[scStack.length - 2] == 6) {
				popSc();
				run();
				return;
			}
		} else if (kc == 65) {
			if (scStack.length == 2) {
				if (chg_ptr &gt; 0 &amp;&amp; p_c[chg_ptr] != undefined) {
					var p = p_c[0];
					p_c[0] = p_c[chg_ptr];
					p_c[chg_ptr] = p;
				}
				rf();
				return;
			} else if (scStack[scStack.length - 2] == 5) {
				if (p_c[chg_ptr].hp &gt; 0) {
					bat_last = bat_fri.pid;
					bat_fri = p_c[chg_ptr];
					bat_eff[0] = geff();
					var w = bat_fri.pid;
					bat_dam[w] = 1;
					popSc(true);
					run();
					return;
				}
			} else if (scStack[scStack.length - 2] == 6) {
				if (bat_used == 2) {
					if (p_c[chg_ptr].hp &gt; 0) {
						addhp(p_c[chg_ptr], Math.round(p_c[chg_ptr].mhp / 2));
						p_goods[bat_used]--;
						bat_used = 0;
					}
				}
				if (bat_used == 3) {
					if (p_c[chg_ptr].hp &lt;= 0) {
						p_c[chg_ptr].hp = 0;
						addhp(p_c[chg_ptr], Math.round(p_c[chg_ptr].mhp * 0.3));
						p_goods[bat_used]--;
						bat_used = 0;
					}
				}
				e_s = 1;
				rf();
			}
		}
		if (scStack.length == 2) {
			r(1, tm.chi, tip_tpos[1]);
		} else if (scStack[scStack.length - 2] == 5) {
			if (p_c[chg_ptr].hp &lt;= 0) {
				r(1, tm.chi3, tip_tpos[1]);
			} else {
				r(1, tm.chi2, tip_tpos[1]);
			}
		} else if (scStack[scStack.length - 2] == 6) {
			r(1, tm.chi4, tip_tpos[1]);
		}
		if (chg_ptr == 0) {
			dl(22, 26, 84, 26, 2, 0xFFF87030);
			dl(84, 27, 84, 73, 2, 0xFFF87030);
			dl(9, 73, 84, 73, 2, 0xFFF87030);
			dl(8, 40, 8, 73, 2, 0xFFF87030);
		} else {
			dl(chg_p[0][0], chg_p[0][1] + (chg_ptr - 1) * 24, chg_p[1][0], chg_p[1][1] + (chg_ptr - 1) * 24, 2, 0xFFF87030);
			dl(chg_p[1][0], chg_p[1][1] + (chg_ptr - 1) * 24 + 1, chg_p[2][0], chg_p[2][1] + (chg_ptr - 1) * 24, 2, 0xFFF87030);
			dl(chg_p[3][0], chg_p[3][1] + (chg_ptr - 1) * 24, chg_p[2][0], chg_p[2][1] + (chg_ptr - 1) * 24, 2, 0xFFF87030);
		}
	} else if (e_s == 1) {
		if (bat_used == 2 &amp;&amp; p_c[chg_ptr].hp &lt;= 0) {
			r(1, tm.chi5, tip_tpos[1]);
		} else if (bat_used == 3 &amp;&amp; p_c[chg_ptr].hp &gt; 0) {
			r(1, tm.chi6, tip_tpos[1]);
		} else {
			var k = p_c[chg_ptr].id;
			var u = pokes[k][1];
			r(1, tlib[u].concat(tm.yoo), tip_tpos[1]);
		}
		if (kc == 65) {
			if (bat_used == 0) {
				popSc(true);
				run();
				return;
			} else {
				e_s = 0;
				rf();
			}
		}
	}
	for (var i = 0; i &lt; p_c.length; i++) {
		var bi = p_c[i].id;
		var li = pokes[bi][2];
		rm(g[li], chg_apos[i][0], chg_apos[i][1], pmmat);
		li = pokes[bi][1];
		r(7, tlib[li], chg_tpos[i], colorWhite);
		r(7, tm.lv.concat(itoa(p_c[i].lv)), chg_lpos[i], colorWhite);
		r(7, (itoa(p_c[i].hp)).concat(tm.slash, itoa(p_c[i].mhp)), chg_htpos[i], colorWhite);
		dl(chg_hppos[i][0], chg_hppos[i][1], chg_hppos[i][0] + Math.floor(47 * p_c[i].hp / p_c[i].mhp), chg_hppos[i][1], 2, hp_c_0);
		dl(chg_hppos[i][0], chg_hppos[i][1] + 1, chg_hppos[i][0] + Math.floor(47 * p_c[i].hp / p_c[i].mhp), chg_hppos[i][1] + 1, 2, hp_c_1);
	}
}

function prologue() {
	if (e_s == 0) {
		bgmState = 0;
		var b = Bitmap.createBitmapData(240, 160, true, 0xFF000000);
		r(0, b, [0, 0]);
		for (var i = 0; i &lt; tm.title.length; i++) {
			renderSrc.push({
				type: 1,
				text: tm.title.slice(i, i + 1),
				x: 39 + i * 12,
				y: 40,
				color: colorWhite
			});
		}
		var submat = $.createMatrix();
		submat.scale(2, 2);
		for (var i = 0; i &lt; 4; i++) {
			rm(rt(tm.subtitle.slice(i, i + 1), colorWhite), 56 + i * 36, 60, submat);
		}
		renderSrc.push({
			type: 1,
			text: tm.start,
			x: 51,
			y: 120,
			color: colorWhite
		});
		setaani(0, 40);
		if (kc == 65) {
			e_s = 1;
			rf();
			return;
		}
	} else if (e_s &gt; 0 &amp;&amp; e_s &lt;= 4) {
		bgmState = 1;
		r(0, g.welcome, [0, 0]);
		r(1, pro[e_s - 1], tip_tpos[0]);
		cursor = ri(4, g.cdh);
		if (kc == 65) {
			e_s++;
			rf();
			return;
		}
	} else if (e_s == 5) {
		r(0, g.welcome, [0, 0]);
		r(0, g.zhujue, [25, 55]);
		r(1, pro[4], tip_tpos[0]);
		cursor = ri(4, g.cdh);
		if (kc == 65) {
			e_s++;
			cursor = null;
			rf();
			return;
		}
	} else if (e_s == 6) {
		cursor = null;
		r(0, g.xuanren, [0, 0]);
		if (kc == 37) prc = (prc + 2) % 3;
		else if (kc == 39) prc = (prc + 1) % 3;
		r(0, Bitmap.createBitmapData(80, 160, true, 0x90000000), [80 * ((prc + 2) % 3), 0]);
		r(0, Bitmap.createBitmapData(80, 160, true, 0x90000000), [80 * ((prc + 1) % 3), 0]);
		r(1, tm.cho0, [9, 120], ((prc == 0) ? colorDark : colorWhite));
		r(1, tm.cho1, [89, 120], ((prc == 1) ? colorDark : colorWhite));
		r(1, tm.cho2, [169, 120], ((prc == 2) ? colorDark : colorWhite));
		if (kc == 65) {
			e_s++;
			rf();
			return;
		}
	} else if (e_s == 7) {
		r(0, g.welcome, [0, 0]);
		r(0, g.zhujue, [25, 55]);
		r(1, (pro[10]).concat(tm["cho" + (prc).toString()], pro[11]), tip_tpos[0]);
		r(0, g.sel2, rbp_bpos);
		cursor = ri(3, g.cxz, rbp_cpos[rbp_ptr][0], rbp_cpos[rbp_ptr][1]);
		r(1, tm.yes, rbp_tpos[0]);
		r(1, tm.no, rbp_tpos[1]);
		if (kc == 65) {
			if (rbp_ptr == 0) {
				e_s++;
				firstSelection = prc;
				prc = ((prc == 2) ? 2 : (prc ^ 1));
				rf();
				return;
			} else {
				e_s--;
				rf();
				return;
			}
		} else if (kc == 83) {
			e_s--;
			rf();
			return;
		} else if (kc == 38 || kc == 40) {
			rbp_ptr ^= 1;
			run();
		}
	} else if (e_s == 8) {
		r(0, g.welcome, [0, 0]);
		r(0, g.zhujue, [25, 55]);
		var s = "";
		if (prc == 2) {
			s = "cho2";
		} else if (prc == 1) {
			s = "cho0";
		} else if (prc == 0) {
			s = "cho1";
		}
		r(1, pro[12].concat(tm[s], pro[5]), tip_tpos[0]);
		var cho = pokes[prc * 4][3];
		r(0, g[cho], [143, 33]);
		cursor = ri(4, g.cdh);
		if (kc == 65) {
			p_c[0] = gpm(prc * 4, 5);
			if (prc != 0) {
				mr[0] = prc;
				mr[prc] = 0;
			}
			e_s++;
			rf();
			return;
		}
	} else if (e_s &gt;= 9 &amp;&amp; e_s &lt; 12) {
		r(0, g.welcome, [0, 0]);
		r(0, g.zhujue, [25, 55]);
		var cho = pokes[prc * 4][3];
		r(0, g[cho], [143, 33]);
		r(1, pro[e_s - 3], tip_tpos[0]);
		cursor = ri(4, g.cdh);
		if (kc == 65) {
			e_s++;
			rf();
			return;
		}
	} else if (e_s == 12) {
		r(0, g.tip1, tip_bpos);
		r(2, pro[9], tip_tpos[0]);
		cursor = ri(4, g.cdh);
		if (kc == 65) {
			popSc();
			pushSc(1);
			run();
		}
	}
}

function epilogue() {}

function lt_result() {
	if (e_s == 0) {
		r(1, ltr[0], tip_tpos[0], colorWhite);
		cursor = ri(4, g.cdh);
		if (kc == 65) {
			e_s = 1;
			var ran = Math.random();
			if (ran &lt; lcmat[ltp_ptr][0]) {
				// poke
				if (Math.random() &lt; lcmat[ltp_ptr][3]) {
					// rare poke
					lr_type = 0;
					lr_id = mref(p_map_c - 1) * 4 + 3;
					lr_lv = p_map_c * 10;
					p_ct[lr_id] = 1;
				} else {
					lr_type = 1;
					lr_id = mref(p_map_c - 1) * 4 + Math.floor(Math.random() * 3);
					lr_lv = (p_map_c - 1) * 10 + 5;
					p_ct[lr_id] = 1;
				}
			} else if (ran &lt; lcmat[ltp_ptr][0] + lcmat[ltp_ptr][1]) {
				// item
				lr_type = 2;
				lr_id = ((ltp_ptr == 3) ? 3 : 1) + Math.round(Math.random() * ((ltp_ptr == 2) ? 2 : 1));
				p_goods[lr_id] += 1;
			} else {
				// nothing
				lr_type = 3;
			}
			rf();
		}
	} else if (e_s == 1) {
		if (kc != 0) {
			popSc();
			rf();
			return;
		}
		var s = [];
		var w = pokes[lr_id][1];
		switch (lr_type) {
			case 0:
				s = ltr[5].concat(tlib[w], tm.crmark);
				break;
			case 1:
				s = ltr[1].concat(tlib[w], tm.crmark);
				break;
			case 2:
				var t = items[lr_id][0];
				s = ltr[1].concat(tlib[t], tm.crmark);
				break;
			case 3:
				s = ltr[4];
				break;
		}
		if (lr_type &lt; 2) {
			var pm = gpm(lr_id, lr_lv);
			if (p_c.length &gt;= 4) {
				if (p_s.length &gt;= 30) {
					s = s.concat(ltr[3]);
				} else {
					s = s.concat(ltr[2]);
					p_s.push(pm);
				}
			} else {
				p_c.push(pm);
			}
			var f = pokes[lr_id][3];
			r(0, g[f], [(240 - g[f].width) / 2, 20]);
		}
		r(1, s, tip_tpos[0], colorWhite);
		cursor = ri(4, g.cdh);
	}
}

function gym() {
	var m = mr[p_map_c];
	if (p_map_c == 5) {
		bgmState = 5;
	} else {
		bgmState = 4;
	}
	if (p_map_lock[m] &gt; 0) {
		if (!p_c.some(function(it, idx, ar) {
				return it.hp &gt; 0;
			})) {
			popSc();
			run();
			return;
		} else {
			bat_type = 1;
			bat_st = 0;
			if (p_map_c == 5) {
				bat_eni = gpm(20, p_map_c * 10);
			} else {
				bat_eni = gpm((m * 4 + (4 - p_map_lock[m])), p_map_c * 10);
			}
			if ((p_map_c &lt; 5 &amp;&amp; p_map_lock[m] == 4) || p_map_c == 5) {
				for (var i = 0; i &lt; p_c.length; i++) {
					if (p_c[i].hp &gt; 0) {
						bat_fri = p_c[i];
						bat_last = p_c[i].pid;
						break;
					}
				}
			}
			bat_ptr = 0;
			bat_win = 0;
			bat_eff = [geff()];
			bat_eff.push(geff());
			bat_dam = [];
			var w = bat_fri.pid;
			bat_dam[w] = 1;
			pushSc(5);
			run();
			return;
		}
	} else {
		if (p_map_c == 5) {
			if (p_map_lock[m] == 0) {
				if (p_c.some(function(it, idx, ar) {
						var f = it.id;
						return pokes[f][5] == 1;
					})) {
					// goto true end
					popSc();
					pushSc(15);
					bat_win = 0;
					epl = 0;
					run();
					return;
				} else {
					// goto normal end
					popSc();
					pushSc(14);
					epl = 0;
					run();
					return;
				}
			}
		} else {
			r(0, g.tip1, tip_bpos);
			r(1, tm.cango, tip_tpos[0]);
			cursor = ri(4, g.cdh);
			if (kc == 65 || kc == 83) {
				popSc();
				run();
				return;
			}
		}
	}
}

function field() {
	bgmState = 3;
	bat_type = 0;
	bat_st = 0;
	var p = Math.floor(Math.random() * 3);
	var lv = (p_map_c - 1) * 10 + Math.ceil(Math.random() * 9);
	bat_eni = gpm(mr[p_map_c - 1] * 4 + p, lv);
	for (var i = 0; i &lt; p_c.length; i++) {
		if (p_c[i].hp &gt; 0) {
			bat_fri = p_c[i];
			bat_last = p_c[i].pid;
			break;
		}
	}
	bat_ptr = 0;
	bat_win = 0;
	bat_eff = [geff()];
	bat_eff.push(geff());
	bat_dam = [];
	bat_dam[bat_fri.pid] = 1;
	popSc();
	pushSc(5);
	run();
}

function saveload() {
	r(0, g.tip1, tip_bpos);
	switch (e_s) {
		case 0:
			var s = tm.confirm.concat(tm.sa, tm.qmark);
			if ($G._get("s_c") != undefined) {
				s = s.concat(tm.overwrite);
			}
			r(1, s, tip_tpos[0]);
			r(0, g.sel2, rbp_bpos);
			r(1, tm.yes, rbp_tpos[0]);
			r(1, tm.no, rbp_tpos[1]);
			break;
		case 1:
			r(1, tm.confirm.concat(tm.lo, tm.qmark), tip_tpos[0]);
			r(0, g.sel2, rbp_bpos);
			r(1, tm.yes, rbp_tpos[0]);
			r(1, tm.no, rbp_tpos[1]);
			break;
		case 2:
			r(1, tm.sa.concat(tm.success), tip_tpos[0]);
			break;
		case 3:
			r(1, tm.lo.concat(tm.success), tip_tpos[0]);
			break;
		case 4:
			r(1, tm.nosave, tip_tpos[0]);
			break;
	}
	if (kc == 38 || kc == 40) {
		rbp_ptr ^= 1;
	}
	if (e_s &lt; 2) cursor = ri(3, g.cxz, rbp_cpos[rbp_ptr][0], rbp_cpos[rbp_ptr][1]);
	else cursor = null;
	if (kc == 65) {
		if (rbp_ptr == 0) {
			switch (e_s) {
				case 0:
					save();
					e_s = 2;
					rf();
					break;
				case 1:
					if ($G._get("s_c") == undefined) {
						e_s = 4;
						rf();
						return;
					}
					load();
					e_s = 3;
					rf();
				case 2:
					popSc(true);
					run();
					return;
				case 3:
					e_s = 0;
					while (scStack.length &gt; 0) popSc();
					pushSc(1);
					run();
					return;
				case 4:
					popSc(true);
					run();
					return;
			}
		} else {
			popSc(true);
			run();
			return;
		}
	}
}

function maptip() {
	r(0, g.tip1, tip_bpos);
	var m = mr[p_map_c];
	r(1, mapn[m], tip_tpos[0]);
	cursor = ri(4, g.cdh);
	if (kc == 65 || kc == 83) {
		popSc();
		run();
		return;
	}
}

function normalEnd() {
	bgmState = 6;
	if (epl == 0) {
		r(0, g.lan2, [104, 30]);
	} else if (epl &gt; 2 &amp;&amp; epl &lt; 9) {
		r(0, g.zhujue, [80, 40]);
	}
	r(1, ne[epl], tip_tpos[0]);
	cursor = ri(4, g.cdh);
	if (kc == 65) {
		if (epl &lt; 7) {
			epl++;
			rf();
		} else {
			popSc();
			pushSc(17);
			p_end_0 = true;
			epl = 0;
			run();
			return;
		}
	}
}

function trueEndStart() {
	bgmState = 5;
	if (epl &lt; 10) {
		r(0, g.tip1, tip_bpos);
		r(1, tes[epl], tip_tpos[0]);
		cursor = ri(4, g.cdh);
	} else if (epl == 10) {
		if (bat_win &gt; 0) {
			popSc();
			pushSc(16);
			epl = 0;
			run();
			return;
		}
		if (!p_c.some(function(it, idx, ar) {
				return it.hp &gt; 0;
			})) {
			p_map_lock[5] = 1;
			popSc();
			run();
			return;
		}
	}
	if (kc == 65) {
		if (epl &lt; 9) {
			epl++;
			rf();
		} else {
			epl = 10;
			bat_type = 1;
			bat_st = 0;
			bat_eni = gpm(21, 50);
			bat_ptr = 0;
			bat_win = 0;
			bat_eff = [geff()];
			bat_eff.push(geff());
			bat_dam = [];
			bat_dam[bat_fri.pid] = 1;
			pushSc(5);
			run();
			return;
		}
	}
}

function trueEnd() {
	bgmState = 6;
	if (epl == 0) {
		r(0, g.aipc2, [104, 30]);
	}
	if (epl == 4) {
		r(0, g.lan2, [104, 30]);
	}
	if (epl &gt;= 5) {
		r(0, g.zhujue, [80, 40]);
	}
	if (epl &lt; 7) {
		r(0, g.tip1, tip_bpos);
		r(1, te[epl], tip_tpos[0]);
	} else {
		r(1, te[7].concat(te[firstSelection + 9], te[8]), tip_tpos[0]);
	}
	cursor = ri(4, g.cdh);
	if (kc == 65) {
		if (epl &lt; 7) {
			epl++;
			rf();
		} else {
			popSc();
			pushSc(17);
			cursor = null;
			p_end_1 = true;
			epl = 0;
			run();
			return;
		}
	}
}

function trophies() {
	bgmState = 6;
	r(0, Bitmap.createBitmapData(240, 160, true, 0xFF000000), [0, 0]);
	var acs = 0;
	if (p_end_0) {
		r(1, tm.maru.concat(tr[0]), [40, 40], 0xFFB87333);
		acs++;
	}
	if (p_end_1) {
		r(1, tm.maru.concat(tr[1]), [40, 40 + acs * 16], 0xFFBFB8A5);
		acs++;
	}
	var nlen = 0;
	var alen = 0;
	for (var i = p_ct.length - 1; i &gt;= 0; i--) {
		if (!(p_ct[i] == undefined || p_ct[i] == null)) {
			if (i % 4 != 3) nlen++;
			alen++;
		}
	};
	if (nlen == 15) {
		r(1, tm.maru.concat(tr[2]), [40, 40 + acs * 16], 0xFFB87333);
		acs++;
	}
	if (alen == 20) {
		r(1, tm.maru.concat(tr[3]), [40, 40 + acs * 16], 0xFFBFB8A5);
		acs++;
	}
	if (acs == 4) {
		r(1, tm.maru.concat(tr[4]), [40, 40 + acs * 16], 0xFFFFD700);
		acs++;
	}
	r(1, tm.achieve, [40, 20], colorWhite);
	r(1, (itoa(acs)).concat(tm.slash, [5]), [182, 20], colorWhite);
	r(1, tm.lo, [60, 130], colorWhite);
	r(1, tm.restart, [136, 130], colorWhite);
	if (kc == 37 || kc == 39) {
		epl ^= 1;
	}
	if ($G._get("s_c") == undefined) epl = 1;
	if (epl == 0) {
		dl(60, 142, 84, 142, 2, colorWhite);
	} else {
		dl(136, 142, 184, 142, 2, colorWhite);
	}
	if (kc == 65) {
		if (epl == 0) {
			load();
			pushSc(12);
			e_s = 3;
			run();
			return;
		} else if (epl == 1) {
			p_c = [];
			p_s = [];
			p_coin = 200;
			p_map_c = 1;
			p_map_lock = [4, 4, 4, 4, 4, 1];
			p_goods = [0, 3, 3, 1, 0];
			mr = [0, 1, 2, 3, 4, 5];
			while (scStack.length &gt; 0) popSc();
			pushSc(0);
			run();
		}
	}
}

function rt(arr, c, small) {
	if (c == undefined || c == null) c = 0xFF606060;
	if (small == undefined || small == null) small = false;
	var b = Bitmap.createBitmapData((small ? 10 : 12) * arr.length, (small ? 10 : 12), true, 0);
	b.lock();
	var x = 0;
	for (var i = 0; i &lt; arr.length; i++) {
		var q = arr[i];
		var s = small ? smfont[q] : font[q];
		//if (arr[i] &lt; 10) x -= 3;
		var maxx = 0;
		for (var j = 0; j &lt; s.length; j++) {
			b.setPixel32(((s[j] &gt;&gt; 4) &amp; 0xF) + x, (s[j] &amp; 0xF), c);
			if (((s[j] &gt;&gt; 4) &amp; 0xF) &gt; maxx) maxx = ((s[j] &gt;&gt; 4) &amp; 0xF);
		}
		if (small) {
			x += (arr[i] &lt; 10 || (maxx &lt;= 5 &amp;&amp; arr[i] &gt; 13)) ? ((maxx &gt; 0) ? maxx + 1 : 4) : 9;
		} else {
			x += (arr[i] &lt; 10 || (maxx &lt;= 6 &amp;&amp; arr[i] &gt; 13)) ? 6 : 12;
		}
	}
	textWidth = x;
	b.unlock();
	return b;
}

function prerender() {
	renderList = [];
	//trace(scStack.length, eSbg.length, renderSrc.length, invkey.length);
	// deal with background
	for (var i = 0; i &lt; scStack.length; i++) {
		var s = scStack[i];
		var p = eSbg[s];
		renderList.push({
			bmp: g[p],
			x: 0,
			y: 0
		});
		if (p == "map1") {
			renderList.push({
				bmp: filterMasks[mref(p_map_c)],
				x: 0,
				y: 0
			});
		}
	}
	inAni = false;
	asyncAni = false;
	var nocur = false;
	// push bitmaps
	for (var i = 0; i &lt; renderSrc.length; i++) {
		var r = renderSrc[i];
		var f = r.pid;
		switch (r.type) {
			case 1:
				// static text
				if (tani_ptrs[f] == undefined || tani_ptrs[f] == r.text.length) {
					renderList.push({
						bmp: rt(r.text, r.color),
						x: r.x,
						y: r.y
					});
					if (cursor != null &amp;&amp; cursor.type == 4) {
						cursor.x = r.x + textWidth + 2;
						cursor.y = r.y + 3;
						cursor.y0 = cursor.y;
					}
				} else {
					renderList.push({
						bmp: rt(r.text.slice(0, tani_ptrs[f] + 1), r.color),
						x: r.x,
						y: r.y
					});
					if (cursor != null &amp;&amp; cursor.type == 4) {
						nocur = true;
					}
					tani_ptrs[f] += 1;
					//if (tani_ptrs[r.pid] &gt; r.text.length)  tani_ptrs[r.pid] = r.text.length;
					inAni = true;
				}
				break;
			case 2:
				// paragraph
				// text width: 12
				// text wrap: 16
				// TODO: fix the position
				if (tani_ptrs[f] == undefined || tani_ptrs[f] == r.text.length || tani_ptrs[f] % 32 == 31) {
					var ypos = 0;
					if (r.text.length - r.ptr &gt; 16) {
						renderList.push({
							bmp: rt(r.text.slice(r.ptr, r.ptr + 16), r.color),
							x: r.x,
							y: r.y
						});
						if (r.text.length - r.ptr &gt; 32) {
							renderList.push({
								bmp: rt(r.text.slice(r.ptr + 16, r.ptr + 32), r.color),
								x: r.x,
								y: r.y + 16
							});
						} else {
							renderList.push({
								bmp: rt(r.text.slice(r.ptr + 16, r.text.length), r.color),
								x: r.x,
								y: r.y + 16
							});
						}
						ypos = 1;
					} else {
						renderList.push({
							bmp: rt(r.text.slice(r.ptr, r.text.length), r.color),
							x: r.x,
							y: r.y
						});
						ypos = 0;
					}
					inLongText = r.text.length - r.ptr &gt; 32;
					if (cursor != null &amp;&amp; cursor.type == 4) {
						cursor.x = r.x + textWidth + 2;
						cursor.y = r.y + ypos * 16 + 7;
						cursor.y0 = cursor.y;
					}
					if (inLongText &amp;&amp; nextSentence) {
						renderSrc[i].ptr += 32;
						if (tani_ptrs[f] != undefined) tani_ptrs[f]++;
					}
				} else {
					if (tani_ptrs[f] % 32 &lt; 16) {
						renderList.push({
							bmp: rt(r.text.slice(r.ptr, r.ptr + (tani_ptrs[f] % 32) + 1), r.color),
							x: r.x,
							y: r.y
						});
					} else {
						renderList.push({
							bmp: rt(r.text.slice(r.ptr, r.ptr + 16), r.color),
							x: r.x,
							y: r.y
						});
						var s = r.text.slice(r.ptr + 16, r.ptr + (tani_ptrs[f] % 32) + 1);
						renderList.push({
							bmp: rt(s, r.color),
							x: r.x,
							y: r.y + 16
						});
					}
					if (cursor != null &amp;&amp; cursor.type == 4) {
						nocur = true;
					}
					tani_ptrs[f]++;
					if (tani_ptrs[f] % 32 == 31 || tani_ptrs[f] == r.text.length) {
						nextSentence = false;
					}
					inAni = true;
				}
				break;
			case 7:
				renderList.push({
					bmp: rt(r.text, r.color, true),
					x: r.x,
					y: r.y
				});
				break;
			default:
				if (r.bmp == g.niao1) {
					if (r.x == bat_pmpos[1][0] &amp;&amp; r.y == bat_pmpos[1][1]) {
						r.x = 0;
					}
				}
				if (r.a != undefined &amp;&amp; r.a != null) {
					switch (r.a.type) {
						case 0:
							//trace(r.a.blink, r.a.tick, r.a.times);
							if (r.a.tick == 0) {
								if (r.a.times &gt;= 0) {
									inAni = true;
									r.a.times--;
									r.a.tick = r.a.interval;
									r.a.blink = !r.a.blink;
								} else {
									if (r.a.callback != null) r.a.callback();
									rf();
								}
							} else {
								r.a.tick--;
								inAni = true;
								if (r.a.blink) {
									renderList.push(r);
								}
							}
							break;
					}
				} else {
					renderList.push(r);
				}
				break;
		}
		if (r.aani != undefined) {
			asyncAni = true;
			switch (r.aatype) {
				case 0:
					// blink
					if (frameId % r.aani &lt; r.aani / 2) {
						renderList.pop();
					}
					break;
				case 1:
					// jitter
					if (frameId % r.aani &lt; r.aani / 2) {
						renderList[renderList.length - 1].y = renderList[renderList.length - 1].y0 + 2;
					} else {
						renderList[renderList.length - 1].y = renderList[renderList.length - 1].y0;
					}
					break;
			}
		}
	}
	// push cursor
	if (cursor != null &amp;&amp; !nocur) {
		if (cursor.aani) {
			if (frameId % 10 &lt; 5) {
				cursor.y = cursor.y0 + 2;
			} else {
				cursor.y = cursor.y0;
			}
			asyncAni = true;
		}
		renderList.push(cursor);
	}
}

function render() {
	prerender();
	output.lock();
	//trace(renderList.length);
	// copy bitmaps in renderList
	for (var i = 0; i &lt; renderList.length; i++) {
		if (renderList[i].type != undefined) {
			if (renderList[i].type == 5) {
				var r = renderList[i];
				// draw
				for (var j = 0; j &lt; r.w; j++) {
					output.setPixel32(j + r.x, r.y, 0xFFE02010);
					output.setPixel32(j + r.x, r.y + r.h - 1, 0xFFE02010);
				}
				for (var j = 0; j &lt; r.h; j++) {
					output.setPixel32(r.x, r.y + j, 0xFFE02010);
					output.setPixel32(r.x + r.w - 1, r.y + j, 0xFFE02010);
				}
				continue;
			} else if (renderList[i].type == 6) {
				var r = renderList[i];
				for (var j = 0; j &lt; r.w; j++) {
					if (r.f.x == r.t.x) {
						for (var k = 0; r.f.y + k &lt;= r.t.y; k++) output.setPixel32(r.f.x + j, r.f.y + k, r.c);
					} else {
						for (var k = 0; r.f.x + k &lt;= r.t.x; k++) output.setPixel32(r.f.x + k, r.f.y + j, r.c);
					}
				}
				continue;
			}
		}
		if (renderList[i].mat == undefined || renderList[i].mat == null) {
			// copy pixel
			output.copyPixels(renderList[i].bmp, Bitmap.createRectangle(0, 0, renderList[i].bmp.width, renderList[i].bmp.height), $.createPoint(renderList[i].x, renderList[i].y), null, null, true);
		} else {
			output.draw(renderList[i].bmp, renderList[i].mat);
		}
	}
	output.unlock();
}

function getScale() {
	return Math.min(Player.width / 240.0, Player.height / 160.0);
}

function prepare() {
	Player.pause();
	switch (loadStage) {
		case 0:
			loadComment = $.createComment("正在形成基本元素…", {
				x: 5,
				y: 5,
				fontsize: 36,
				lifeTime: 60000
			});
			break;
		case 1:
			loadComment.text = "正在构建世界…";
			loadGraphicSrc($G._get("g_src0"));
			break;
		case 2:
			loadComment.text = "正在创造角色…";
			loadGraphicSrc($G._get("g_src1"));
			break;
		case 3:
			loadComment.text = "正在塑造角色的灵魂…";
			loadGraphicSrc($G._get("g_src2"));
			break;
		case 4:
			loadComment.text = "正在赋予角色生命…";
			loadGraphicSrc($G._get("g_src3"));
			break;
		case 5:
			loadComment.text = "正在让世界活起来…";
			loadGraphicSrc($G._get("g_src4"));
			loadFontSrc();
			loadTextSrc();
			expandPokemon();
			gameStage = Bitmap.createBitmap({
				bitmapData: output,
				x: 0,
				y: 0,
				lifeTime: 0x7FFFFFFF,
				scale: getScale(),
				smoothing: true
			});
			gameStage.x = (Player.width - gameStage.width) / 2;
			gameStage.y = (Player.height - gameStage.height) / 2;
			gScale = getScale();
			for (var i = 0; i &lt; 6; i++) {
				filterMasks[i] = Bitmap.createBitmapData(240, 160, true, filterColor[i]);
			}
			Player.keyTrigger(key_listener, 0x7fffffff, true);
			scStack.push(0);
			break;
		case 6:
			loadComment.text = "";
			Player.play();
			start();
			trace("fire");
			return;
	}
	loadStage++;
	timer(prepare, 25);
}

function key_listener(key) {
	kc = key;
	if (key == 68) {
		sourceScale = !sourceScale;
		if (sourceScale) {
			gameStage.width = 240;
			gameStage.height = 160;
			gameStage.x = (Player.width - 240) / 2;
			gameStage.y = (Player.height - 160) / 2;
		} else {
			gScale = getScale();
			gameStage.width = gScale * 240;
			gameStage.height = gScale * 160;
			gameStage.x = (Player.width - gameStage.width) / 2;
			gameStage.y = (Player.height - gameStage.height) / 2;
		}
	}
	keys.push(kc);
	if (keys.length &gt; 12) keys.shift();
	if (keys.length == 12 &amp;&amp; keys.every(function(it, idx, ar) {
			return it == invkey[idx];
		})) {
		//
		p_coin = 999999;
		for (var i = 0; i &lt; 4; i++) {
			p_c[i] = gpm(i * 4 + 3, 50);
		}
		for (var i = 0; i &lt; 20; i++) {
			p_s[i] = gpm(i, 50);
		}
	}
}
var scenes = [prologue, map, shop, sell, lottery, battle, useitem, change, epilogue, lt_result, gym, field, saveload, maptip, normalEnd, trueEndStart, trueEnd, trophies];

function run(force) {
	if (force == undefined || force == null) force = true;
	if (!(tani_st == scStack[scStack.length - 1] &amp;&amp; tani_es == e_s)) {
		tani_ptrs = [];
		tani_h = [];
		tani_st = scStack[scStack.length - 1];
		tani_es = e_s;
	}
	if (force) {
		kc = 0;
	}
	if (inAni) {
		// block all
		render();
		kc = 0;
	} else {
		if (kc != 0) {
			if (inLongText) {
				// scroll text
				if (kc == 65) {
					nextSentence = true;
					render();
				}
				kc = 0;
			} else {
				// scene
				renderSrc = [];
				scenes[scStack[scStack.length - 1]]();
				render();
				kc = 0;
			}
		} else {
			// no key event
			// do nothing except blink the cursor
			if (force || e_rf) {
				renderSrc = [];
				scenes[scStack[scStack.length - 1]]();
				render();
				kc = 0;
				e_rf = false;
			} else {
				if (asyncAni) {
					render();
				}
				//trace("frame skipped");
			}
		}
	}
}

function start() {
	//p_c[0] = gpm(19, 100);
	run(true);
	rendered = true;
	interval(function() {
		frameId = (frameId + 1) % 3628800;
		if (!rendered) {
			//trace("lost frame");
		} else {
			rendered = false;
			run(false);
			rendered = true;
		}
	}, 25, 0);
	interval(function() {
		if (getScale() != gScale) {
			gScale = getScale();
			gameStage.width = gScale * 240;
			gameStage.height = gScale * 160;
			gameStage.x = (Player.width - gameStage.width) / 2;
			gameStage.y = (Player.height - gameStage.height) / 2;
		}
		switch (bgmState) {
			case 0:
			case 1:
				if (Player.time &lt; 20000 || Player.time &gt; 120000) {
					Player.seek(20000);
				}
				break;
			case 2:
				if (Player.time &lt; 130000 || Player.time &gt; 230000) {
					Player.seek(130000);
				}
				break;
			case 3:
				if (Player.time &lt; 240000 || Player.time &gt; 330000) {
					Player.seek(240000);
				}
				break;
			case 4:
				if (Player.time &lt; 340000 || Player.time &gt; 440000) {
					Player.seek(340000);
				}
				break;
			case 5:
				if (Player.time &lt; 450000 || Player.time &gt; 550000) {
					Player.seek(450000);
				}
				break;
			case 6:
				if (Player.time &lt; 560000 || Player.time &gt; 730000) {
					Player.seek(560000);
				}
				break;
		}
	}, 100, 0);

}

if ($G._get("en") == undefined || $G._get("en") == null) {
	prepare();
	$G._set("en", 6666);
	trace("finished prepare");
}