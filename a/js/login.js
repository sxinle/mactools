!function e(t, n, i) {
    function o(s, a) {
        if (!n[s]) {
            if (!t[s]) {
                var l = "function" == typeof require && require;
                if (!a && l)return l(s, !0);
                if (r)return r(s, !0);
                var u = new Error("Cannot find module '" + s + "'");
                throw u.code = "MODULE_NOT_FOUND", u
            }
            var c = n[s] = {exports: {}};
            t[s][0].call(c.exports, function (e) {
                var n = t[s][1][e];
                return o(n ? n : e)
            }, c, c.exports, e, t, n, i)
        }
        return n[s].exports
    }

    for (var r = "function" == typeof require && require, s = 0; s < i.length; s++)o(i[s]);
    return o
}({
    1: [function (e, t, n) {
        +function (e) {
            "use strict";
            function t(t) {
                return this.each(function () {
                    var i = e(this), o = i.data("bs.button"), r = "object" == typeof t && t;
                    o || i.data("bs.button", o = new n(this, r)), "toggle" == t ? o.toggle() : t && o.setState(t)
                })
            }

            var n = function (t, i) {
                this.$element = e(t), this.options = e.extend({}, n.DEFAULTS, i), this.isLoading = !1
            };
            n.VERSION = "3.3.5", n.DEFAULTS = {loadingText: "loading..."}, n.prototype.setState = function (t) {
                var n = "disabled", i = this.$element, o = i.is("input") ? "val" : "html", r = i.data();
                t += "Text", null == r.resetText && i.data("resetText", i[o]()), setTimeout(e.proxy(function () {
                    i[o](null == r[t] ? this.options[t] : r[t]), "loadingText" == t ? (this.isLoading = !0, i.addClass(n).attr(n, n)) : this.isLoading && (this.isLoading = !1, i.removeClass(n).removeAttr(n))
                }, this), 0)
            }, n.prototype.toggle = function () {
                var e = !0, t = this.$element.closest('[data-toggle="buttons"]');
                if (t.length) {
                    var n = this.$element.find("input");
                    "radio" == n.prop("type") ? (n.prop("checked") && (e = !1), t.find(".active").removeClass("active"), this.$element.addClass("active")) : "checkbox" == n.prop("type") && (n.prop("checked") !== this.$element.hasClass("active") && (e = !1), this.$element.toggleClass("active")), n.prop("checked", this.$element.hasClass("active")), e && n.trigger("change")
                } else this.$element.attr("aria-pressed", !this.$element.hasClass("active")), this.$element.toggleClass("active")
            };
            var i = e.fn.button;
            e.fn.button = t, e.fn.button.Constructor = n, e.fn.button.noConflict = function () {
                return e.fn.button = i, this
            }, e(document).on("click.bs.button.data-api", '[data-toggle^="button"]', function (n) {
                var i = e(n.target);
                i.hasClass("btn") || (i = i.closest(".btn")), t.call(i, "toggle"), e(n.target).is('input[type="radio"]') || e(n.target).is('input[type="checkbox"]') || n.preventDefault()
            }).on("focus.bs.button.data-api blur.bs.button.data-api", '[data-toggle^="button"]', function (t) {
                e(t.target).closest(".btn").toggleClass("focus", /^focus(in)?$/.test(t.type))
            })
        }(jQuery)
    }, {}],
    2: [function (e, t, n) {
        !function (e, n) {
            "object" == typeof t && "object" == typeof t.exports ? t.exports = e.document ? n(e, !0) : function (e) {
                if (!e.document)throw new Error("jQuery requires a window with a document");
                return n(e)
            } : n(e)
        }("undefined" != typeof window ? window : this, function (e, t) {
            function n(e) {
                var t = e.length, n = re.type(e);
                return "function" === n || re.isWindow(e) ? !1 : 1 === e.nodeType && t ? !0 : "array" === n || 0 === t || "number" == typeof t && t > 0 && t - 1 in e
            }

            function i(e, t, n) {
                if (re.isFunction(t))return re.grep(e, function (e, i) {
                    return !!t.call(e, i, e) !== n
                });
                if (t.nodeType)return re.grep(e, function (e) {
                    return e === t !== n
                });
                if ("string" == typeof t) {
                    if (fe.test(t))return re.filter(t, e, n);
                    t = re.filter(t, e)
                }
                return re.grep(e, function (e) {
                    return re.inArray(e, t) >= 0 !== n
                })
            }

            function o(e, t) {
                do e = e[t]; while (e && 1 !== e.nodeType);
                return e
            }

            function r(e) {
                var t = we[e] = {};
                return re.each(e.match(xe) || [], function (e, n) {
                    t[n] = !0
                }), t
            }

            function s() {
                me.addEventListener ? (me.removeEventListener("DOMContentLoaded", a, !1), e.removeEventListener("load", a, !1)) : (me.detachEvent("onreadystatechange", a), e.detachEvent("onload", a))
            }

            function a() {
                (me.addEventListener || "load" === event.type || "complete" === me.readyState) && (s(), re.ready())
            }

            function l(e, t, n) {
                if (void 0 === n && 1 === e.nodeType) {
                    var i = "data-" + t.replace(ke, "-$1").toLowerCase();
                    if (n = e.getAttribute(i), "string" == typeof n) {
                        try {
                            n = "true" === n ? !0 : "false" === n ? !1 : "null" === n ? null : +n + "" === n ? +n : Ee.test(n) ? re.parseJSON(n) : n
                        } catch (o) {
                        }
                        re.data(e, t, n)
                    } else n = void 0
                }
                return n
            }

            function u(e) {
                var t;
                for (t in e)if (("data" !== t || !re.isEmptyObject(e[t])) && "toJSON" !== t)return !1;
                return !0
            }

            function c(e, t, n, i) {
                if (re.acceptData(e)) {
                    var o, r, s = re.expando, a = e.nodeType, l = a ? re.cache : e, u = a ? e[s] : e[s] && s;
                    if (u && l[u] && (i || l[u].data) || void 0 !== n || "string" != typeof t)return u || (u = a ? e[s] = Q.pop() || re.guid++ : s), l[u] || (l[u] = a ? {} : {toJSON: re.noop}), ("object" == typeof t || "function" == typeof t) && (i ? l[u] = re.extend(l[u], t) : l[u].data = re.extend(l[u].data, t)), r = l[u], i || (r.data || (r.data = {}), r = r.data), void 0 !== n && (r[re.camelCase(t)] = n), "string" == typeof t ? (o = r[t], null == o && (o = r[re.camelCase(t)])) : o = r, o
                }
            }

            function d(e, t, n) {
                if (re.acceptData(e)) {
                    var i, o, r = e.nodeType, s = r ? re.cache : e, a = r ? e[re.expando] : re.expando;
                    if (s[a]) {
                        if (t && (i = n ? s[a] : s[a].data)) {
                            re.isArray(t) ? t = t.concat(re.map(t, re.camelCase)) : t in i ? t = [t] : (t = re.camelCase(t), t = t in i ? [t] : t.split(" ")), o = t.length;
                            for (; o--;)delete i[t[o]];
                            if (n ? !u(i) : !re.isEmptyObject(i))return
                        }
                        (n || (delete s[a].data, u(s[a]))) && (r ? re.cleanData([e], !0) : ie.deleteExpando || s != s.window ? delete s[a] : s[a] = null)
                    }
                }
            }

            function p() {
                return !0
            }

            function f() {
                return !1
            }

            function h() {
                try {
                    return me.activeElement
                } catch (e) {
                }
            }

            function m(e) {
                var t = qe.split("|"), n = e.createDocumentFragment();
                if (n.createElement)for (; t.length;)n.createElement(t.pop());
                return n
            }

            function g(e, t) {
                var n, i, o = 0, r = typeof e.getElementsByTagName !== Ne ? e.getElementsByTagName(t || "*") : typeof e.querySelectorAll !== Ne ? e.querySelectorAll(t || "*") : void 0;
                if (!r)for (r = [], n = e.childNodes || e; null != (i = n[o]); o++)!t || re.nodeName(i, t) ? r.push(i) : re.merge(r, g(i, t));
                return void 0 === t || t && re.nodeName(e, t) ? re.merge([e], r) : r
            }

            function v(e) {
                je.test(e.type) && (e.defaultChecked = e.checked)
            }

            function y(e, t) {
                return re.nodeName(e, "table") && re.nodeName(11 !== t.nodeType ? t : t.firstChild, "tr") ? e.getElementsByTagName("tbody")[0] || e.appendChild(e.ownerDocument.createElement("tbody")) : e
            }

            function b(e) {
                return e.type = (null !== re.find.attr(e, "type")) + "/" + e.type, e
            }

            function x(e) {
                var t = Qe.exec(e.type);
                return t ? e.type = t[1] : e.removeAttribute("type"), e
            }

            function w(e, t) {
                for (var n, i = 0; null != (n = e[i]); i++)re._data(n, "globalEval", !t || re._data(t[i], "globalEval"))
            }

            function T(e, t) {
                if (1 === t.nodeType && re.hasData(e)) {
                    var n, i, o, r = re._data(e), s = re._data(t, r), a = r.events;
                    if (a) {
                        delete s.handle, s.events = {};
                        for (n in a)for (i = 0, o = a[n].length; o > i; i++)re.event.add(t, n, a[n][i])
                    }
                    s.data && (s.data = re.extend({}, s.data))
                }
            }

            function C(e, t) {
                var n, i, o;
                if (1 === t.nodeType) {
                    if (n = t.nodeName.toLowerCase(), !ie.noCloneEvent && t[re.expando]) {
                        o = re._data(t);
                        for (i in o.events)re.removeEvent(t, i, o.handle);
                        t.removeAttribute(re.expando)
                    }
                    "script" === n && t.text !== e.text ? (b(t).text = e.text, x(t)) : "object" === n ? (t.parentNode && (t.outerHTML = e.outerHTML), ie.html5Clone && e.innerHTML && !re.trim(t.innerHTML) && (t.innerHTML = e.innerHTML)) : "input" === n && je.test(e.type) ? (t.defaultChecked = t.checked = e.checked, t.value !== e.value && (t.value = e.value)) : "option" === n ? t.defaultSelected = t.selected = e.defaultSelected : ("input" === n || "textarea" === n) && (t.defaultValue = e.defaultValue)
                }
            }

            function N(t, n) {
                var i = re(n.createElement(t)).appendTo(n.body), o = e.getDefaultComputedStyle ? e.getDefaultComputedStyle(i[0]).display : re.css(i[0], "display");
                return i.detach(), o
            }

            function E(e) {
                var t = me, n = et[e];
                return n || (n = N(e, t), "none" !== n && n || (Ge = (Ge || re("<iframe frameborder='0' width='0' height='0'/>")).appendTo(t.documentElement), t = (Ge[0].contentWindow || Ge[0].contentDocument).document, t.write(), t.close(), n = N(e, t), Ge.detach()), et[e] = n), n
            }

            function k(e, t) {
                return {
                    get: function () {
                        var n = e();
                        return null != n ? n ? void delete this.get : (this.get = t).apply(this, arguments) : void 0
                    }
                }
            }

            function S(e, t) {
                if (t in e)return t;
                for (var n = t.charAt(0).toUpperCase() + t.slice(1), i = t, o = ft.length; o--;)if (t = ft[o] + n, t in e)return t;
                return i
            }

            function A(e, t) {
                for (var n, i, o, r = [], s = 0, a = e.length; a > s; s++)i = e[s], i.style && (r[s] = re._data(i, "olddisplay"), n = i.style.display, t ? (r[s] || "none" !== n || (i.style.display = ""), "" === i.style.display && De(i) && (r[s] = re._data(i, "olddisplay", E(i.nodeName)))) : r[s] || (o = De(i), (n && "none" !== n || !o) && re._data(i, "olddisplay", o ? n : re.css(i, "display"))));
                for (s = 0; a > s; s++)i = e[s], i.style && (t && "none" !== i.style.display && "" !== i.style.display || (i.style.display = t ? r[s] || "" : "none"));
                return e
            }

            function D(e, t, n) {
                var i = ut.exec(t);
                return i ? Math.max(0, i[1] - (n || 0)) + (i[2] || "px") : t
            }

            function $(e, t, n, i, o) {
                for (var r = n === (i ? "border" : "content") ? 4 : "width" === t ? 1 : 0, s = 0; 4 > r; r += 2)"margin" === n && (s += re.css(e, n + Ae[r], !0, o)), i ? ("content" === n && (s -= re.css(e, "padding" + Ae[r], !0, o)), "margin" !== n && (s -= re.css(e, "border" + Ae[r] + "Width", !0, o))) : (s += re.css(e, "padding" + Ae[r], !0, o), "padding" !== n && (s += re.css(e, "border" + Ae[r] + "Width", !0, o)));
                return s
            }

            function j(e, t, n) {
                var i = !0, o = "width" === t ? e.offsetWidth : e.offsetHeight, r = tt(e), s = ie.boxSizing() && "border-box" === re.css(e, "boxSizing", !1, r);
                if (0 >= o || null == o) {
                    if (o = nt(e, t, r), (0 > o || null == o) && (o = e.style[t]), ot.test(o))return o;
                    i = s && (ie.boxSizingReliable() || o === e.style[t]), o = parseFloat(o) || 0
                }
                return o + $(e, t, n || (s ? "border" : "content"), i, r) + "px"
            }

            function L(e, t, n, i, o) {
                return new L.prototype.init(e, t, n, i, o)
            }

            function O() {
                return setTimeout(function () {
                    ht = void 0
                }), ht = re.now()
            }

            function H(e, t) {
                var n, i = {height: e}, o = 0;
                for (t = t ? 1 : 0; 4 > o; o += 2 - t)n = Ae[o], i["margin" + n] = i["padding" + n] = e;
                return t && (i.opacity = i.width = e), i
            }

            function _(e, t, n) {
                for (var i, o = (xt[t] || []).concat(xt["*"]), r = 0, s = o.length; s > r; r++)if (i = o[r].call(n, t, e))return i
            }

            function F(e, t, n) {
                var i, o, r, s, a, l, u, c, d = this, p = {}, f = e.style, h = e.nodeType && De(e), m = re._data(e, "fxshow");
                n.queue || (a = re._queueHooks(e, "fx"), null == a.unqueued && (a.unqueued = 0, l = a.empty.fire, a.empty.fire = function () {
                    a.unqueued || l()
                }), a.unqueued++, d.always(function () {
                    d.always(function () {
                        a.unqueued--, re.queue(e, "fx").length || a.empty.fire()
                    })
                })), 1 === e.nodeType && ("height" in t || "width" in t) && (n.overflow = [f.overflow, f.overflowX, f.overflowY], u = re.css(e, "display"), c = E(e.nodeName), "none" === u && (u = c), "inline" === u && "none" === re.css(e, "float") && (ie.inlineBlockNeedsLayout && "inline" !== c ? f.zoom = 1 : f.display = "inline-block")), n.overflow && (f.overflow = "hidden", ie.shrinkWrapBlocks() || d.always(function () {
                    f.overflow = n.overflow[0], f.overflowX = n.overflow[1], f.overflowY = n.overflow[2]
                }));
                for (i in t)if (o = t[i], gt.exec(o)) {
                    if (delete t[i], r = r || "toggle" === o, o === (h ? "hide" : "show")) {
                        if ("show" !== o || !m || void 0 === m[i])continue;
                        h = !0
                    }
                    p[i] = m && m[i] || re.style(e, i)
                }
                if (!re.isEmptyObject(p)) {
                    m ? "hidden" in m && (h = m.hidden) : m = re._data(e, "fxshow", {}), r && (m.hidden = !h), h ? re(e).show() : d.done(function () {
                        re(e).hide()
                    }), d.done(function () {
                        var t;
                        re._removeData(e, "fxshow");
                        for (t in p)re.style(e, t, p[t])
                    });
                    for (i in p)s = _(h ? m[i] : 0, i, d), i in m || (m[i] = s.start, h && (s.end = s.start, s.start = "width" === i || "height" === i ? 1 : 0))
                }
            }

            function q(e, t) {
                var n, i, o, r, s;
                for (n in e)if (i = re.camelCase(n), o = t[i], r = e[n], re.isArray(r) && (o = r[1], r = e[n] = r[0]), n !== i && (e[i] = r, delete e[n]), s = re.cssHooks[i], s && "expand" in s) {
                    r = s.expand(r), delete e[i];
                    for (n in r)n in e || (e[n] = r[n], t[n] = o)
                } else t[i] = o
            }

            function R(e, t, n) {
                var i, o, r = 0, s = bt.length, a = re.Deferred().always(function () {
                    delete l.elem
                }), l = function () {
                    if (o)return !1;
                    for (var t = ht || O(), n = Math.max(0, u.startTime + u.duration - t), i = n / u.duration || 0, r = 1 - i, s = 0, l = u.tweens.length; l > s; s++)u.tweens[s].run(r);
                    return a.notifyWith(e, [u, r, n]), 1 > r && l ? n : (a.resolveWith(e, [u]), !1)
                }, u = a.promise({
                    elem: e,
                    props: re.extend({}, t),
                    opts: re.extend(!0, {specialEasing: {}}, n),
                    originalProperties: t,
                    originalOptions: n,
                    startTime: ht || O(),
                    duration: n.duration,
                    tweens: [],
                    createTween: function (t, n) {
                        var i = re.Tween(e, u.opts, t, n, u.opts.specialEasing[t] || u.opts.easing);
                        return u.tweens.push(i), i
                    },
                    stop: function (t) {
                        var n = 0, i = t ? u.tweens.length : 0;
                        if (o)return this;
                        for (o = !0; i > n; n++)u.tweens[n].run(1);
                        return t ? a.resolveWith(e, [u, t]) : a.rejectWith(e, [u, t]), this
                    }
                }), c = u.props;
                for (q(c, u.opts.specialEasing); s > r; r++)if (i = bt[r].call(u, e, c, u.opts))return i;
                return re.map(c, _, u), re.isFunction(u.opts.start) && u.opts.start.call(e, u), re.fx.timer(re.extend(l, {
                    elem: e,
                    anim: u,
                    queue: u.opts.queue
                })), u.progress(u.opts.progress).done(u.opts.done, u.opts.complete).fail(u.opts.fail).always(u.opts.always)
            }

            function M(e) {
                return function (t, n) {
                    "string" != typeof t && (n = t, t = "*");
                    var i, o = 0, r = t.toLowerCase().match(xe) || [];
                    if (re.isFunction(n))for (; i = r[o++];)"+" === i.charAt(0) ? (i = i.slice(1) || "*", (e[i] = e[i] || []).unshift(n)) : (e[i] = e[i] || []).push(n)
                }
            }

            function B(e, t, n, i) {
                function o(a) {
                    var l;
                    return r[a] = !0, re.each(e[a] || [], function (e, a) {
                        var u = a(t, n, i);
                        return "string" != typeof u || s || r[u] ? s ? !(l = u) : void 0 : (t.dataTypes.unshift(u), o(u), !1)
                    }), l
                }

                var r = {}, s = e === zt;
                return o(t.dataTypes[0]) || !r["*"] && o("*")
            }

            function I(e, t) {
                var n, i, o = re.ajaxSettings.flatOptions || {};
                for (i in t)void 0 !== t[i] && ((o[i] ? e : n || (n = {}))[i] = t[i]);
                return n && re.extend(!0, e, n), e
            }

            function P(e, t, n) {
                for (var i, o, r, s, a = e.contents, l = e.dataTypes; "*" === l[0];)l.shift(), void 0 === o && (o = e.mimeType || t.getResponseHeader("Content-Type"));
                if (o)for (s in a)if (a[s] && a[s].test(o)) {
                    l.unshift(s);
                    break
                }
                if (l[0] in n)r = l[0]; else {
                    for (s in n) {
                        if (!l[0] || e.converters[s + " " + l[0]]) {
                            r = s;
                            break
                        }
                        i || (i = s)
                    }
                    r = r || i
                }
                return r ? (r !== l[0] && l.unshift(r), n[r]) : void 0
            }

            function W(e, t, n, i) {
                var o, r, s, a, l, u = {}, c = e.dataTypes.slice();
                if (c[1])for (s in e.converters)u[s.toLowerCase()] = e.converters[s];
                for (r = c.shift(); r;)if (e.responseFields[r] && (n[e.responseFields[r]] = t), !l && i && e.dataFilter && (t = e.dataFilter(t, e.dataType)), l = r, r = c.shift())if ("*" === r)r = l; else if ("*" !== l && l !== r) {
                    if (s = u[l + " " + r] || u["* " + r], !s)for (o in u)if (a = o.split(" "), a[1] === r && (s = u[l + " " + a[0]] || u["* " + a[0]])) {
                        s === !0 ? s = u[o] : u[o] !== !0 && (r = a[0], c.unshift(a[1]));
                        break
                    }
                    if (s !== !0)if (s && e["throws"])t = s(t); else try {
                        t = s(t)
                    } catch (d) {
                        return {state: "parsererror", error: s ? d : "No conversion from " + l + " to " + r}
                    }
                }
                return {state: "success", data: t}
            }

            function z(e, t, n, i) {
                var o;
                if (re.isArray(t))re.each(t, function (t, o) {
                    n || Qt.test(e) ? i(e, o) : z(e + "[" + ("object" == typeof o ? t : "") + "]", o, n, i)
                }); else if (n || "object" !== re.type(t))i(e, t); else for (o in t)z(e + "[" + o + "]", t[o], n, i)
            }

            function U() {
                try {
                    return new e.XMLHttpRequest
                } catch (t) {
                }
            }

            function X() {
                try {
                    return new e.ActiveXObject("Microsoft.XMLHTTP")
                } catch (t) {
                }
            }

            function V(e) {
                return re.isWindow(e) ? e : 9 === e.nodeType ? e.defaultView || e.parentWindow : !1
            }

            var Q = [], Y = Q.slice, J = Q.concat, Z = Q.push, K = Q.indexOf, G = {}, ee = G.toString, te = G.hasOwnProperty, ne = "".trim, ie = {}, oe = "1.11.0", re = function (e, t) {
                return new re.fn.init(e, t)
            }, se = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, ae = /^-ms-/, le = /-([\da-z])/gi, ue = function (e, t) {
                return t.toUpperCase()
            };
            re.fn = re.prototype = {
                jquery: oe, constructor: re, selector: "", length: 0, toArray: function () {
                    return Y.call(this)
                }, get: function (e) {
                    return null != e ? 0 > e ? this[e + this.length] : this[e] : Y.call(this)
                }, pushStack: function (e) {
                    var t = re.merge(this.constructor(), e);
                    return t.prevObject = this, t.context = this.context, t
                }, each: function (e, t) {
                    return re.each(this, e, t)
                }, map: function (e) {
                    return this.pushStack(re.map(this, function (t, n) {
                        return e.call(t, n, t)
                    }))
                }, slice: function () {
                    return this.pushStack(Y.apply(this, arguments))
                }, first: function () {
                    return this.eq(0)
                }, last: function () {
                    return this.eq(-1)
                }, eq: function (e) {
                    var t = this.length, n = +e + (0 > e ? t : 0);
                    return this.pushStack(n >= 0 && t > n ? [this[n]] : [])
                }, end: function () {
                    return this.prevObject || this.constructor(null)
                }, push: Z, sort: Q.sort, splice: Q.splice
            }, re.extend = re.fn.extend = function () {
                var e, t, n, i, o, r, s = arguments[0] || {}, a = 1, l = arguments.length, u = !1;
                for ("boolean" == typeof s && (u = s, s = arguments[a] || {}, a++), "object" == typeof s || re.isFunction(s) || (s = {}), a === l && (s = this, a--); l > a; a++)if (null != (o = arguments[a]))for (i in o)e = s[i], n = o[i], s !== n && (u && n && (re.isPlainObject(n) || (t = re.isArray(n))) ? (t ? (t = !1, r = e && re.isArray(e) ? e : []) : r = e && re.isPlainObject(e) ? e : {}, s[i] = re.extend(u, r, n)) : void 0 !== n && (s[i] = n));
                return s
            }, re.extend({
                expando: "jQuery" + (oe + Math.random()).replace(/\D/g, ""),
                isReady: !0,
                error: function (e) {
                    throw new Error(e)
                },
                noop: function () {
                },
                isFunction: function (e) {
                    return "function" === re.type(e)
                },
                isArray: Array.isArray || function (e) {
                    return "array" === re.type(e)
                },
                isWindow: function (e) {
                    return null != e && e == e.window
                },
                isNumeric: function (e) {
                    return e - parseFloat(e) >= 0
                },
                isEmptyObject: function (e) {
                    var t;
                    for (t in e)return !1;
                    return !0
                },
                isPlainObject: function (e) {
                    var t;
                    if (!e || "object" !== re.type(e) || e.nodeType || re.isWindow(e))return !1;
                    try {
                        if (e.constructor && !te.call(e, "constructor") && !te.call(e.constructor.prototype, "isPrototypeOf"))return !1
                    } catch (n) {
                        return !1
                    }
                    if (ie.ownLast)for (t in e)return te.call(e, t);
                    for (t in e);
                    return void 0 === t || te.call(e, t)
                },
                type: function (e) {
                    return null == e ? e + "" : "object" == typeof e || "function" == typeof e ? G[ee.call(e)] || "object" : typeof e
                },
                globalEval: function (t) {
                    t && re.trim(t) && (e.execScript || function (t) {
                        e.eval.call(e, t)
                    })(t)
                },
                camelCase: function (e) {
                    return e.replace(ae, "ms-").replace(le, ue)
                },
                nodeName: function (e, t) {
                    return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase()
                },
                each: function (e, t, i) {
                    var o, r = 0, s = e.length, a = n(e);
                    if (i) {
                        if (a)for (; s > r && (o = t.apply(e[r], i), o !== !1); r++); else for (r in e)if (o = t.apply(e[r], i), o === !1)break
                    } else if (a)for (; s > r && (o = t.call(e[r], r, e[r]), o !== !1); r++); else for (r in e)if (o = t.call(e[r], r, e[r]), o === !1)break;
                    return e
                },
                trim: ne && !ne.call("\ufeff ") ? function (e) {
                    return null == e ? "" : ne.call(e)
                } : function (e) {
                    return null == e ? "" : (e + "").replace(se, "")
                },
                makeArray: function (e, t) {
                    var i = t || [];
                    return null != e && (n(Object(e)) ? re.merge(i, "string" == typeof e ? [e] : e) : Z.call(i, e)), i
                },
                inArray: function (e, t, n) {
                    var i;
                    if (t) {
                        if (K)return K.call(t, e, n);
                        for (i = t.length, n = n ? 0 > n ? Math.max(0, i + n) : n : 0; i > n; n++)if (n in t && t[n] === e)return n
                    }
                    return -1
                },
                merge: function (e, t) {
                    for (var n = +t.length, i = 0, o = e.length; n > i;)e[o++] = t[i++];
                    if (n !== n)for (; void 0 !== t[i];)e[o++] = t[i++];
                    return e.length = o, e
                },
                grep: function (e, t, n) {
                    for (var i, o = [], r = 0, s = e.length, a = !n; s > r; r++)i = !t(e[r], r), i !== a && o.push(e[r]);
                    return o
                },
                map: function (e, t, i) {
                    var o, r = 0, s = e.length, a = n(e), l = [];
                    if (a)for (; s > r; r++)o = t(e[r], r, i), null != o && l.push(o); else for (r in e)o = t(e[r], r, i), null != o && l.push(o);
                    return J.apply([], l)
                },
                guid: 1,
                proxy: function (e, t) {
                    var n, i, o;
                    return "string" == typeof t && (o = e[t], t = e, e = o), re.isFunction(e) ? (n = Y.call(arguments, 2), i = function () {
                        return e.apply(t || this, n.concat(Y.call(arguments)))
                    }, i.guid = e.guid = e.guid || re.guid++, i) : void 0
                },
                now: function () {
                    return +new Date
                },
                support: ie
            }), re.each("Boolean Number String Function Array Date RegExp Object Error".split(" "), function (e, t) {
                G["[object " + t + "]"] = t.toLowerCase()
            });
            var ce = function (e) {
                function t(e, t, n, i) {
                    var o, r, s, a, l, u, d, h, m, g;
                    if ((t ? t.ownerDocument || t : B) !== L && j(t), t = t || L, n = n || [], !e || "string" != typeof e)return n;
                    if (1 !== (a = t.nodeType) && 9 !== a)return [];
                    if (H && !i) {
                        if (o = ye.exec(e))if (s = o[1]) {
                            if (9 === a) {
                                if (r = t.getElementById(s), !r || !r.parentNode)return n;
                                if (r.id === s)return n.push(r), n
                            } else if (t.ownerDocument && (r = t.ownerDocument.getElementById(s)) && R(t, r) && r.id === s)return n.push(r), n
                        } else {
                            if (o[2])return G.apply(n, t.getElementsByTagName(e)), n;
                            if ((s = o[3]) && C.getElementsByClassName && t.getElementsByClassName)return G.apply(n, t.getElementsByClassName(s)), n
                        }
                        if (C.qsa && (!_ || !_.test(e))) {
                            if (h = d = M, m = t, g = 9 === a && e, 1 === a && "object" !== t.nodeName.toLowerCase()) {
                                for (u = p(e), (d = t.getAttribute("id")) ? h = d.replace(xe, "\\$&") : t.setAttribute("id", h), h = "[id='" + h + "'] ", l = u.length; l--;)u[l] = h + f(u[l]);
                                m = be.test(e) && c(t.parentNode) || t, g = u.join(",")
                            }
                            if (g)try {
                                return G.apply(n, m.querySelectorAll(g)), n
                            } catch (v) {
                            } finally {
                                d || t.removeAttribute("id")
                            }
                        }
                    }
                    return w(e.replace(le, "$1"), t, n, i)
                }

                function n() {
                    function e(n, i) {
                        return t.push(n + " ") > N.cacheLength && delete e[t.shift()], e[n + " "] = i
                    }

                    var t = [];
                    return e
                }

                function i(e) {
                    return e[M] = !0, e
                }

                function o(e) {
                    var t = L.createElement("div");
                    try {
                        return !!e(t)
                    } catch (n) {
                        return !1
                    } finally {
                        t.parentNode && t.parentNode.removeChild(t), t = null
                    }
                }

                function r(e, t) {
                    for (var n = e.split("|"), i = e.length; i--;)N.attrHandle[n[i]] = t
                }

                function s(e, t) {
                    var n = t && e, i = n && 1 === e.nodeType && 1 === t.nodeType && (~t.sourceIndex || Q) - (~e.sourceIndex || Q);
                    if (i)return i;
                    if (n)for (; n = n.nextSibling;)if (n === t)return -1;
                    return e ? 1 : -1
                }

                function a(e) {
                    return function (t) {
                        var n = t.nodeName.toLowerCase();
                        return "input" === n && t.type === e
                    }
                }

                function l(e) {
                    return function (t) {
                        var n = t.nodeName.toLowerCase();
                        return ("input" === n || "button" === n) && t.type === e
                    }
                }

                function u(e) {
                    return i(function (t) {
                        return t = +t, i(function (n, i) {
                            for (var o, r = e([], n.length, t), s = r.length; s--;)n[o = r[s]] && (n[o] = !(i[o] = n[o]))
                        })
                    })
                }

                function c(e) {
                    return e && typeof e.getElementsByTagName !== V && e
                }

                function d() {
                }

                function p(e, n) {
                    var i, o, r, s, a, l, u, c = z[e + " "];
                    if (c)return n ? 0 : c.slice(0);
                    for (a = e, l = [], u = N.preFilter; a;) {
                        (!i || (o = ue.exec(a))) && (o && (a = a.slice(o[0].length) || a), l.push(r = [])), i = !1, (o = ce.exec(a)) && (i = o.shift(), r.push({
                            value: i,
                            type: o[0].replace(le, " ")
                        }), a = a.slice(i.length));
                        for (s in N.filter)!(o = he[s].exec(a)) || u[s] && !(o = u[s](o)) || (i = o.shift(), r.push({
                            value: i,
                            type: s,
                            matches: o
                        }), a = a.slice(i.length));
                        if (!i)break
                    }
                    return n ? a.length : a ? t.error(e) : z(e, l).slice(0)
                }

                function f(e) {
                    for (var t = 0, n = e.length, i = ""; n > t; t++)i += e[t].value;
                    return i
                }

                function h(e, t, n) {
                    var i = t.dir, o = n && "parentNode" === i, r = P++;
                    return t.first ? function (t, n, r) {
                        for (; t = t[i];)if (1 === t.nodeType || o)return e(t, n, r)
                    } : function (t, n, s) {
                        var a, l, u = [I, r];
                        if (s) {
                            for (; t = t[i];)if ((1 === t.nodeType || o) && e(t, n, s))return !0
                        } else for (; t = t[i];)if (1 === t.nodeType || o) {
                            if (l = t[M] || (t[M] = {}), (a = l[i]) && a[0] === I && a[1] === r)return u[2] = a[2];
                            if (l[i] = u, u[2] = e(t, n, s))return !0
                        }
                    }
                }

                function m(e) {
                    return e.length > 1 ? function (t, n, i) {
                        for (var o = e.length; o--;)if (!e[o](t, n, i))return !1;
                        return !0
                    } : e[0]
                }

                function g(e, t, n, i, o) {
                    for (var r, s = [], a = 0, l = e.length, u = null != t; l > a; a++)(r = e[a]) && (!n || n(r, i, o)) && (s.push(r), u && t.push(a));
                    return s
                }

                function v(e, t, n, o, r, s) {
                    return o && !o[M] && (o = v(o)), r && !r[M] && (r = v(r, s)), i(function (i, s, a, l) {
                        var u, c, d, p = [], f = [], h = s.length, m = i || x(t || "*", a.nodeType ? [a] : a, []), v = !e || !i && t ? m : g(m, p, e, a, l), y = n ? r || (i ? e : h || o) ? [] : s : v;
                        if (n && n(v, y, a, l), o)for (u = g(y, f), o(u, [], a, l), c = u.length; c--;)(d = u[c]) && (y[f[c]] = !(v[f[c]] = d));
                        if (i) {
                            if (r || e) {
                                if (r) {
                                    for (u = [], c = y.length; c--;)(d = y[c]) && u.push(v[c] = d);
                                    r(null, y = [], u, l)
                                }
                                for (c = y.length; c--;)(d = y[c]) && (u = r ? te.call(i, d) : p[c]) > -1 && (i[u] = !(s[u] = d))
                            }
                        } else y = g(y === s ? y.splice(h, y.length) : y), r ? r(null, s, y, l) : G.apply(s, y)
                    })
                }

                function y(e) {
                    for (var t, n, i, o = e.length, r = N.relative[e[0].type], s = r || N.relative[" "], a = r ? 1 : 0, l = h(function (e) {
                        return e === t
                    }, s, !0), u = h(function (e) {
                        return te.call(t, e) > -1
                    }, s, !0), c = [function (e, n, i) {
                        return !r && (i || n !== A) || ((t = n).nodeType ? l(e, n, i) : u(e, n, i))
                    }]; o > a; a++)if (n = N.relative[e[a].type])c = [h(m(c), n)]; else {
                        if (n = N.filter[e[a].type].apply(null, e[a].matches), n[M]) {
                            for (i = ++a; o > i && !N.relative[e[i].type]; i++);
                            return v(a > 1 && m(c), a > 1 && f(e.slice(0, a - 1).concat({value: " " === e[a - 2].type ? "*" : ""})).replace(le, "$1"), n, i > a && y(e.slice(a, i)), o > i && y(e = e.slice(i)), o > i && f(e))
                        }
                        c.push(n)
                    }
                    return m(c)
                }

                function b(e, n) {
                    var o = n.length > 0, r = e.length > 0, s = function (i, s, a, l, u) {
                        var c, d, p, f = 0, h = "0", m = i && [], v = [], y = A, b = i || r && N.find.TAG("*", u), x = I += null == y ? 1 : Math.random() || .1, w = b.length;
                        for (u && (A = s !== L && s); h !== w && null != (c = b[h]); h++) {
                            if (r && c) {
                                for (d = 0; p = e[d++];)if (p(c, s, a)) {
                                    l.push(c);
                                    break
                                }
                                u && (I = x)
                            }
                            o && ((c = !p && c) && f--, i && m.push(c))
                        }
                        if (f += h, o && h !== f) {
                            for (d = 0; p = n[d++];)p(m, v, s, a);
                            if (i) {
                                if (f > 0)for (; h--;)m[h] || v[h] || (v[h] = Z.call(l));
                                v = g(v)
                            }
                            G.apply(l, v), u && !i && v.length > 0 && f + n.length > 1 && t.uniqueSort(l)
                        }
                        return u && (I = x, A = y), m
                    };
                    return o ? i(s) : s
                }

                function x(e, n, i) {
                    for (var o = 0, r = n.length; r > o; o++)t(e, n[o], i);
                    return i
                }

                function w(e, t, n, i) {
                    var o, r, s, a, l, u = p(e);
                    if (!i && 1 === u.length) {
                        if (r = u[0] = u[0].slice(0), r.length > 2 && "ID" === (s = r[0]).type && C.getById && 9 === t.nodeType && H && N.relative[r[1].type]) {
                            if (t = (N.find.ID(s.matches[0].replace(we, Te), t) || [])[0], !t)return n;
                            e = e.slice(r.shift().value.length)
                        }
                        for (o = he.needsContext.test(e) ? 0 : r.length; o-- && (s = r[o], !N.relative[a = s.type]);)if ((l = N.find[a]) && (i = l(s.matches[0].replace(we, Te), be.test(r[0].type) && c(t.parentNode) || t))) {
                            if (r.splice(o, 1), e = i.length && f(r), !e)return G.apply(n, i), n;
                            break
                        }
                    }
                    return S(e, u)(i, t, !H, n, be.test(e) && c(t.parentNode) || t), n
                }

                var T, C, N, E, k, S, A, D, $, j, L, O, H, _, F, q, R, M = "sizzle" + -new Date, B = e.document, I = 0, P = 0, W = n(), z = n(), U = n(), X = function (e, t) {
                    return e === t && ($ = !0), 0
                }, V = "undefined", Q = 1 << 31, Y = {}.hasOwnProperty, J = [], Z = J.pop, K = J.push, G = J.push, ee = J.slice, te = J.indexOf || function (e) {
                        for (var t = 0, n = this.length; n > t; t++)if (this[t] === e)return t;
                        return -1
                    }, ne = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped", ie = "[\\x20\\t\\r\\n\\f]", oe = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+", re = oe.replace("w", "w#"), se = "\\[" + ie + "*(" + oe + ")" + ie + "*(?:([*^$|!~]?=)" + ie + "*(?:(['\"])((?:\\\\.|[^\\\\])*?)\\3|(" + re + ")|)|)" + ie + "*\\]", ae = ":(" + oe + ")(?:\\(((['\"])((?:\\\\.|[^\\\\])*?)\\3|((?:\\\\.|[^\\\\()[\\]]|" + se.replace(3, 8) + ")*)|.*)\\)|)", le = new RegExp("^" + ie + "+|((?:^|[^\\\\])(?:\\\\.)*)" + ie + "+$", "g"), ue = new RegExp("^" + ie + "*," + ie + "*"), ce = new RegExp("^" + ie + "*([>+~]|" + ie + ")" + ie + "*"), de = new RegExp("=" + ie + "*([^\\]'\"]*?)" + ie + "*\\]", "g"), pe = new RegExp(ae), fe = new RegExp("^" + re + "$"), he = {
                    ID: new RegExp("^#(" + oe + ")"),
                    CLASS: new RegExp("^\\.(" + oe + ")"),
                    TAG: new RegExp("^(" + oe.replace("w", "w*") + ")"),
                    ATTR: new RegExp("^" + se),
                    PSEUDO: new RegExp("^" + ae),
                    CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + ie + "*(even|odd|(([+-]|)(\\d*)n|)" + ie + "*(?:([+-]|)" + ie + "*(\\d+)|))" + ie + "*\\)|)", "i"),
                    bool: new RegExp("^(?:" + ne + ")$", "i"),
                    needsContext: new RegExp("^" + ie + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + ie + "*((?:-\\d)?\\d*)" + ie + "*\\)|)(?=[^-]|$)", "i")
                }, me = /^(?:input|select|textarea|button)$/i, ge = /^h\d$/i, ve = /^[^{]+\{\s*\[native \w/, ye = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/, be = /[+~]/, xe = /'|\\/g, we = new RegExp("\\\\([\\da-f]{1,6}" + ie + "?|(" + ie + ")|.)", "ig"), Te = function (e, t, n) {
                    var i = "0x" + t - 65536;
                    return i !== i || n ? t : 0 > i ? String.fromCharCode(i + 65536) : String.fromCharCode(i >> 10 | 55296, 1023 & i | 56320)
                };
                try {
                    G.apply(J = ee.call(B.childNodes), B.childNodes), J[B.childNodes.length].nodeType
                } catch (Ce) {
                    G = {
                        apply: J.length ? function (e, t) {
                            K.apply(e, ee.call(t))
                        } : function (e, t) {
                            for (var n = e.length, i = 0; e[n++] = t[i++];);
                            e.length = n - 1
                        }
                    }
                }
                C = t.support = {}, k = t.isXML = function (e) {
                    var t = e && (e.ownerDocument || e).documentElement;
                    return t ? "HTML" !== t.nodeName : !1
                }, j = t.setDocument = function (e) {
                    var t, n = e ? e.ownerDocument || e : B, i = n.defaultView;
                    return n !== L && 9 === n.nodeType && n.documentElement ? (L = n, O = n.documentElement, H = !k(n), i && i !== i.top && (i.addEventListener ? i.addEventListener("unload", function () {
                        j()
                    }, !1) : i.attachEvent && i.attachEvent("onunload", function () {
                        j()
                    })), C.attributes = o(function (e) {
                        return e.className = "i", !e.getAttribute("className")
                    }), C.getElementsByTagName = o(function (e) {
                        return e.appendChild(n.createComment("")), !e.getElementsByTagName("*").length
                    }), C.getElementsByClassName = ve.test(n.getElementsByClassName) && o(function (e) {
                            return e.innerHTML = "<div class='a'></div><div class='a i'></div>", e.firstChild.className = "i", 2 === e.getElementsByClassName("i").length
                        }), C.getById = o(function (e) {
                        return O.appendChild(e).id = M, !n.getElementsByName || !n.getElementsByName(M).length
                    }), C.getById ? (N.find.ID = function (e, t) {
                        if (typeof t.getElementById !== V && H) {
                            var n = t.getElementById(e);
                            return n && n.parentNode ? [n] : []
                        }
                    }, N.filter.ID = function (e) {
                        var t = e.replace(we, Te);
                        return function (e) {
                            return e.getAttribute("id") === t
                        }
                    }) : (delete N.find.ID, N.filter.ID = function (e) {
                        var t = e.replace(we, Te);
                        return function (e) {
                            var n = typeof e.getAttributeNode !== V && e.getAttributeNode("id");
                            return n && n.value === t
                        }
                    }), N.find.TAG = C.getElementsByTagName ? function (e, t) {
                        return typeof t.getElementsByTagName !== V ? t.getElementsByTagName(e) : void 0
                    } : function (e, t) {
                        var n, i = [], o = 0, r = t.getElementsByTagName(e);
                        if ("*" === e) {
                            for (; n = r[o++];)1 === n.nodeType && i.push(n);
                            return i
                        }
                        return r
                    }, N.find.CLASS = C.getElementsByClassName && function (e, t) {
                            return typeof t.getElementsByClassName !== V && H ? t.getElementsByClassName(e) : void 0
                        }, F = [], _ = [], (C.qsa = ve.test(n.querySelectorAll)) && (o(function (e) {
                        e.innerHTML = "<select t=''><option selected=''></option></select>", e.querySelectorAll("[t^='']").length && _.push("[*^$]=" + ie + "*(?:''|\"\")"), e.querySelectorAll("[selected]").length || _.push("\\[" + ie + "*(?:value|" + ne + ")"), e.querySelectorAll(":checked").length || _.push(":checked")
                    }), o(function (e) {
                        var t = n.createElement("input");
                        t.setAttribute("type", "hidden"), e.appendChild(t).setAttribute("name", "D"), e.querySelectorAll("[name=d]").length && _.push("name" + ie + "*[*^$|!~]?="), e.querySelectorAll(":enabled").length || _.push(":enabled", ":disabled"), e.querySelectorAll("*,:x"), _.push(",.*:")
                    })), (C.matchesSelector = ve.test(q = O.webkitMatchesSelector || O.mozMatchesSelector || O.oMatchesSelector || O.msMatchesSelector)) && o(function (e) {
                        C.disconnectedMatch = q.call(e, "div"), q.call(e, "[s!='']:x"), F.push("!=", ae)
                    }), _ = _.length && new RegExp(_.join("|")), F = F.length && new RegExp(F.join("|")), t = ve.test(O.compareDocumentPosition), R = t || ve.test(O.contains) ? function (e, t) {
                        var n = 9 === e.nodeType ? e.documentElement : e, i = t && t.parentNode;
                        return e === i || !(!i || 1 !== i.nodeType || !(n.contains ? n.contains(i) : e.compareDocumentPosition && 16 & e.compareDocumentPosition(i)))
                    } : function (e, t) {
                        if (t)for (; t = t.parentNode;)if (t === e)return !0;
                        return !1
                    }, X = t ? function (e, t) {
                        if (e === t)return $ = !0, 0;
                        var i = !e.compareDocumentPosition - !t.compareDocumentPosition;
                        return i ? i : (i = (e.ownerDocument || e) === (t.ownerDocument || t) ? e.compareDocumentPosition(t) : 1, 1 & i || !C.sortDetached && t.compareDocumentPosition(e) === i ? e === n || e.ownerDocument === B && R(B, e) ? -1 : t === n || t.ownerDocument === B && R(B, t) ? 1 : D ? te.call(D, e) - te.call(D, t) : 0 : 4 & i ? -1 : 1)
                    } : function (e, t) {
                        if (e === t)return $ = !0, 0;
                        var i, o = 0, r = e.parentNode, a = t.parentNode, l = [e], u = [t];
                        if (!r || !a)return e === n ? -1 : t === n ? 1 : r ? -1 : a ? 1 : D ? te.call(D, e) - te.call(D, t) : 0;
                        if (r === a)return s(e, t);
                        for (i = e; i = i.parentNode;)l.unshift(i);
                        for (i = t; i = i.parentNode;)u.unshift(i);
                        for (; l[o] === u[o];)o++;
                        return o ? s(l[o], u[o]) : l[o] === B ? -1 : u[o] === B ? 1 : 0
                    }, n) : L
                }, t.matches = function (e, n) {
                    return t(e, null, null, n)
                }, t.matchesSelector = function (e, n) {
                    if ((e.ownerDocument || e) !== L && j(e), n = n.replace(de, "='$1']"), !(!C.matchesSelector || !H || F && F.test(n) || _ && _.test(n)))try {
                        var i = q.call(e, n);
                        if (i || C.disconnectedMatch || e.document && 11 !== e.document.nodeType)return i
                    } catch (o) {
                    }
                    return t(n, L, null, [e]).length > 0
                }, t.contains = function (e, t) {
                    return (e.ownerDocument || e) !== L && j(e), R(e, t)
                }, t.attr = function (e, t) {
                    (e.ownerDocument || e) !== L && j(e);
                    var n = N.attrHandle[t.toLowerCase()], i = n && Y.call(N.attrHandle, t.toLowerCase()) ? n(e, t, !H) : void 0;
                    return void 0 !== i ? i : C.attributes || !H ? e.getAttribute(t) : (i = e.getAttributeNode(t)) && i.specified ? i.value : null
                }, t.error = function (e) {
                    throw new Error("Syntax error, unrecognized expression: " + e)
                }, t.uniqueSort = function (e) {
                    var t, n = [], i = 0, o = 0;
                    if ($ = !C.detectDuplicates, D = !C.sortStable && e.slice(0), e.sort(X), $) {
                        for (; t = e[o++];)t === e[o] && (i = n.push(o));
                        for (; i--;)e.splice(n[i], 1)
                    }
                    return D = null, e
                }, E = t.getText = function (e) {
                    var t, n = "", i = 0, o = e.nodeType;
                    if (o) {
                        if (1 === o || 9 === o || 11 === o) {
                            if ("string" == typeof e.textContent)return e.textContent;
                            for (e = e.firstChild; e; e = e.nextSibling)n += E(e)
                        } else if (3 === o || 4 === o)return e.nodeValue
                    } else for (; t = e[i++];)n += E(t);
                    return n
                }, N = t.selectors = {
                    cacheLength: 50,
                    createPseudo: i,
                    match: he,
                    attrHandle: {},
                    find: {},
                    relative: {
                        ">": {dir: "parentNode", first: !0},
                        " ": {dir: "parentNode"},
                        "+": {dir: "previousSibling", first: !0},
                        "~": {dir: "previousSibling"}
                    },
                    preFilter: {
                        ATTR: function (e) {
                            return e[1] = e[1].replace(we, Te), e[3] = (e[4] || e[5] || "").replace(we, Te), "~=" === e[2] && (e[3] = " " + e[3] + " "), e.slice(0, 4)
                        }, CHILD: function (e) {
                            return e[1] = e[1].toLowerCase(), "nth" === e[1].slice(0, 3) ? (e[3] || t.error(e[0]), e[4] = +(e[4] ? e[5] + (e[6] || 1) : 2 * ("even" === e[3] || "odd" === e[3])), e[5] = +(e[7] + e[8] || "odd" === e[3])) : e[3] && t.error(e[0]), e
                        }, PSEUDO: function (e) {
                            var t, n = !e[5] && e[2];
                            return he.CHILD.test(e[0]) ? null : (e[3] && void 0 !== e[4] ? e[2] = e[4] : n && pe.test(n) && (t = p(n, !0)) && (t = n.indexOf(")", n.length - t) - n.length) && (e[0] = e[0].slice(0, t), e[2] = n.slice(0, t)), e.slice(0, 3))
                        }
                    },
                    filter: {
                        TAG: function (e) {
                            var t = e.replace(we, Te).toLowerCase();
                            return "*" === e ? function () {
                                return !0
                            } : function (e) {
                                return e.nodeName && e.nodeName.toLowerCase() === t
                            }
                        }, CLASS: function (e) {
                            var t = W[e + " "];
                            return t || (t = new RegExp("(^|" + ie + ")" + e + "(" + ie + "|$)")) && W(e, function (e) {
                                    return t.test("string" == typeof e.className && e.className || typeof e.getAttribute !== V && e.getAttribute("class") || "")
                                })
                        }, ATTR: function (e, n, i) {
                            return function (o) {
                                var r = t.attr(o, e);
                                return null == r ? "!=" === n : n ? (r += "", "=" === n ? r === i : "!=" === n ? r !== i : "^=" === n ? i && 0 === r.indexOf(i) : "*=" === n ? i && r.indexOf(i) > -1 : "$=" === n ? i && r.slice(-i.length) === i : "~=" === n ? (" " + r + " ").indexOf(i) > -1 : "|=" === n ? r === i || r.slice(0, i.length + 1) === i + "-" : !1) : !0
                            }
                        }, CHILD: function (e, t, n, i, o) {
                            var r = "nth" !== e.slice(0, 3), s = "last" !== e.slice(-4), a = "of-type" === t;
                            return 1 === i && 0 === o ? function (e) {
                                return !!e.parentNode
                            } : function (t, n, l) {
                                var u, c, d, p, f, h, m = r !== s ? "nextSibling" : "previousSibling", g = t.parentNode, v = a && t.nodeName.toLowerCase(), y = !l && !a;
                                if (g) {
                                    if (r) {
                                        for (; m;) {
                                            for (d = t; d = d[m];)if (a ? d.nodeName.toLowerCase() === v : 1 === d.nodeType)return !1;
                                            h = m = "only" === e && !h && "nextSibling"
                                        }
                                        return !0
                                    }
                                    if (h = [s ? g.firstChild : g.lastChild], s && y) {
                                        for (c = g[M] || (g[M] = {}), u = c[e] || [], f = u[0] === I && u[1], p = u[0] === I && u[2], d = f && g.childNodes[f]; d = ++f && d && d[m] || (p = f = 0) || h.pop();)if (1 === d.nodeType && ++p && d === t) {
                                            c[e] = [I, f, p];
                                            break
                                        }
                                    } else if (y && (u = (t[M] || (t[M] = {}))[e]) && u[0] === I)p = u[1]; else for (; (d = ++f && d && d[m] || (p = f = 0) || h.pop()) && ((a ? d.nodeName.toLowerCase() !== v : 1 !== d.nodeType) || !++p || (y && ((d[M] || (d[M] = {}))[e] = [I, p]), d !== t)););
                                    return p -= o, p === i || p % i === 0 && p / i >= 0
                                }
                            }
                        }, PSEUDO: function (e, n) {
                            var o, r = N.pseudos[e] || N.setFilters[e.toLowerCase()] || t.error("unsupported pseudo: " + e);
                            return r[M] ? r(n) : r.length > 1 ? (o = [e, e, "", n], N.setFilters.hasOwnProperty(e.toLowerCase()) ? i(function (e, t) {
                                for (var i, o = r(e, n), s = o.length; s--;)i = te.call(e, o[s]), e[i] = !(t[i] = o[s])
                            }) : function (e) {
                                return r(e, 0, o)
                            }) : r
                        }
                    },
                    pseudos: {
                        not: i(function (e) {
                            var t = [], n = [], o = S(e.replace(le, "$1"));
                            return o[M] ? i(function (e, t, n, i) {
                                for (var r, s = o(e, null, i, []), a = e.length; a--;)(r = s[a]) && (e[a] = !(t[a] = r))
                            }) : function (e, i, r) {
                                return t[0] = e, o(t, null, r, n), !n.pop()
                            }
                        }), has: i(function (e) {
                            return function (n) {
                                return t(e, n).length > 0
                            }
                        }), contains: i(function (e) {
                            return function (t) {
                                return (t.textContent || t.innerText || E(t)).indexOf(e) > -1
                            }
                        }), lang: i(function (e) {
                            return fe.test(e || "") || t.error("unsupported lang: " + e), e = e.replace(we, Te).toLowerCase(), function (t) {
                                var n;
                                do if (n = H ? t.lang : t.getAttribute("xml:lang") || t.getAttribute("lang"))return n = n.toLowerCase(), n === e || 0 === n.indexOf(e + "-"); while ((t = t.parentNode) && 1 === t.nodeType);
                                return !1
                            }
                        }), target: function (t) {
                            var n = e.location && e.location.hash;
                            return n && n.slice(1) === t.id
                        }, root: function (e) {
                            return e === O
                        }, focus: function (e) {
                            return e === L.activeElement && (!L.hasFocus || L.hasFocus()) && !!(e.type || e.href || ~e.tabIndex)
                        }, enabled: function (e) {
                            return e.disabled === !1
                        }, disabled: function (e) {
                            return e.disabled === !0
                        }, checked: function (e) {
                            var t = e.nodeName.toLowerCase();
                            return "input" === t && !!e.checked || "option" === t && !!e.selected
                        }, selected: function (e) {
                            return e.parentNode && e.parentNode.selectedIndex, e.selected === !0
                        }, empty: function (e) {
                            for (e = e.firstChild; e; e = e.nextSibling)if (e.nodeType < 6)return !1;
                            return !0
                        }, parent: function (e) {
                            return !N.pseudos.empty(e)
                        }, header: function (e) {
                            return ge.test(e.nodeName)
                        }, input: function (e) {
                            return me.test(e.nodeName)
                        }, button: function (e) {
                            var t = e.nodeName.toLowerCase();
                            return "input" === t && "button" === e.type || "button" === t
                        }, text: function (e) {
                            var t;
                            return "input" === e.nodeName.toLowerCase() && "text" === e.type && (null == (t = e.getAttribute("type")) || "text" === t.toLowerCase())
                        }, first: u(function () {
                            return [0]
                        }), last: u(function (e, t) {
                            return [t - 1]
                        }), eq: u(function (e, t, n) {
                            return [0 > n ? n + t : n]
                        }), even: u(function (e, t) {
                            for (var n = 0; t > n; n += 2)e.push(n);
                            return e
                        }), odd: u(function (e, t) {
                            for (var n = 1; t > n; n += 2)e.push(n);
                            return e
                        }), lt: u(function (e, t, n) {
                            for (var i = 0 > n ? n + t : n; --i >= 0;)e.push(i);
                            return e
                        }), gt: u(function (e, t, n) {
                            for (var i = 0 > n ? n + t : n; ++i < t;)e.push(i);
                            return e
                        })
                    }
                }, N.pseudos.nth = N.pseudos.eq;
                for (T in{radio: !0, checkbox: !0, file: !0, password: !0, image: !0})N.pseudos[T] = a(T);
                for (T in{submit: !0, reset: !0})N.pseudos[T] = l(T);
                return d.prototype = N.filters = N.pseudos, N.setFilters = new d, S = t.compile = function (e, t) {
                    var n, i = [], o = [], r = U[e + " "];
                    if (!r) {
                        for (t || (t = p(e)), n = t.length; n--;)r = y(t[n]), r[M] ? i.push(r) : o.push(r);
                        r = U(e, b(o, i))
                    }
                    return r
                }, C.sortStable = M.split("").sort(X).join("") === M, C.detectDuplicates = !!$, j(), C.sortDetached = o(function (e) {
                    return 1 & e.compareDocumentPosition(L.createElement("div"))
                }), o(function (e) {
                    return e.innerHTML = "<a href='#'></a>", "#" === e.firstChild.getAttribute("href")
                }) || r("type|href|height|width", function (e, t, n) {
                    return n ? void 0 : e.getAttribute(t, "type" === t.toLowerCase() ? 1 : 2)
                }), C.attributes && o(function (e) {
                    return e.innerHTML = "<input/>", e.firstChild.setAttribute("value", ""), "" === e.firstChild.getAttribute("value")
                }) || r("value", function (e, t, n) {
                    return n || "input" !== e.nodeName.toLowerCase() ? void 0 : e.defaultValue
                }), o(function (e) {
                    return null == e.getAttribute("disabled")
                }) || r(ne, function (e, t, n) {
                    var i;
                    return n ? void 0 : e[t] === !0 ? t.toLowerCase() : (i = e.getAttributeNode(t)) && i.specified ? i.value : null
                }), t
            }(e);
            re.find = ce, re.expr = ce.selectors, re.expr[":"] = re.expr.pseudos, re.unique = ce.uniqueSort, re.text = ce.getText, re.isXMLDoc = ce.isXML, re.contains = ce.contains;
            var de = re.expr.match.needsContext, pe = /^<(\w+)\s*\/?>(?:<\/\1>|)$/, fe = /^.[^:#\[\.,]*$/;
            re.filter = function (e, t, n) {
                var i = t[0];
                return n && (e = ":not(" + e + ")"), 1 === t.length && 1 === i.nodeType ? re.find.matchesSelector(i, e) ? [i] : [] : re.find.matches(e, re.grep(t, function (e) {
                    return 1 === e.nodeType
                }))
            }, re.fn.extend({
                find: function (e) {
                    var t, n = [], i = this, o = i.length;
                    if ("string" != typeof e)return this.pushStack(re(e).filter(function () {
                        for (t = 0; o > t; t++)if (re.contains(i[t], this))return !0
                    }));
                    for (t = 0; o > t; t++)re.find(e, i[t], n);
                    return n = this.pushStack(o > 1 ? re.unique(n) : n), n.selector = this.selector ? this.selector + " " + e : e, n
                }, filter: function (e) {
                    return this.pushStack(i(this, e || [], !1))
                }, not: function (e) {
                    return this.pushStack(i(this, e || [], !0))
                }, is: function (e) {
                    return !!i(this, "string" == typeof e && de.test(e) ? re(e) : e || [], !1).length
                }
            });
            var he, me = e.document, ge = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/, ve = re.fn.init = function (e, t) {
                var n, i;
                if (!e)return this;
                if ("string" == typeof e) {
                    if (n = "<" === e.charAt(0) && ">" === e.charAt(e.length - 1) && e.length >= 3 ? [null, e, null] : ge.exec(e), !n || !n[1] && t)return !t || t.jquery ? (t || he).find(e) : this.constructor(t).find(e);
                    if (n[1]) {
                        if (t = t instanceof re ? t[0] : t, re.merge(this, re.parseHTML(n[1], t && t.nodeType ? t.ownerDocument || t : me, !0)), pe.test(n[1]) && re.isPlainObject(t))for (n in t)re.isFunction(this[n]) ? this[n](t[n]) : this.attr(n, t[n]);
                        return this
                    }
                    if (i = me.getElementById(n[2]), i && i.parentNode) {
                        if (i.id !== n[2])return he.find(e);
                        this.length = 1, this[0] = i
                    }
                    return this.context = me, this.selector = e, this
                }
                return e.nodeType ? (this.context = this[0] = e, this.length = 1, this) : re.isFunction(e) ? "undefined" != typeof he.ready ? he.ready(e) : e(re) : (void 0 !== e.selector && (this.selector = e.selector, this.context = e.context), re.makeArray(e, this))
            };
            ve.prototype = re.fn, he = re(me);
            var ye = /^(?:parents|prev(?:Until|All))/, be = {children: !0, contents: !0, next: !0, prev: !0};
            re.extend({
                dir: function (e, t, n) {
                    for (var i = [], o = e[t]; o && 9 !== o.nodeType && (void 0 === n || 1 !== o.nodeType || !re(o).is(n));)1 === o.nodeType && i.push(o), o = o[t];
                    return i
                }, sibling: function (e, t) {
                    for (var n = []; e; e = e.nextSibling)1 === e.nodeType && e !== t && n.push(e);
                    return n
                }
            }), re.fn.extend({
                has: function (e) {
                    var t, n = re(e, this), i = n.length;
                    return this.filter(function () {
                        for (t = 0; i > t; t++)if (re.contains(this, n[t]))return !0
                    })
                }, closest: function (e, t) {
                    for (var n, i = 0, o = this.length, r = [], s = de.test(e) || "string" != typeof e ? re(e, t || this.context) : 0; o > i; i++)for (n = this[i]; n && n !== t; n = n.parentNode)if (n.nodeType < 11 && (s ? s.index(n) > -1 : 1 === n.nodeType && re.find.matchesSelector(n, e))) {
                        r.push(n);
                        break
                    }
                    return this.pushStack(r.length > 1 ? re.unique(r) : r)
                }, index: function (e) {
                    return e ? "string" == typeof e ? re.inArray(this[0], re(e)) : re.inArray(e.jquery ? e[0] : e, this) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1
                }, add: function (e, t) {
                    return this.pushStack(re.unique(re.merge(this.get(), re(e, t))))
                }, addBack: function (e) {
                    return this.add(null == e ? this.prevObject : this.prevObject.filter(e))
                }
            }), re.each({
                parent: function (e) {
                    var t = e.parentNode;
                    return t && 11 !== t.nodeType ? t : null
                }, parents: function (e) {
                    return re.dir(e, "parentNode")
                }, parentsUntil: function (e, t, n) {
                    return re.dir(e, "parentNode", n)
                }, next: function (e) {
                    return o(e, "nextSibling")
                }, prev: function (e) {
                    return o(e, "previousSibling")
                }, nextAll: function (e) {
                    return re.dir(e, "nextSibling")
                }, prevAll: function (e) {
                    return re.dir(e, "previousSibling")
                }, nextUntil: function (e, t, n) {
                    return re.dir(e, "nextSibling", n)
                }, prevUntil: function (e, t, n) {
                    return re.dir(e, "previousSibling", n)
                }, siblings: function (e) {
                    return re.sibling((e.parentNode || {}).firstChild, e)
                }, children: function (e) {
                    return re.sibling(e.firstChild)
                }, contents: function (e) {
                    return re.nodeName(e, "iframe") ? e.contentDocument || e.contentWindow.document : re.merge([], e.childNodes)
                }
            }, function (e, t) {
                re.fn[e] = function (n, i) {
                    var o = re.map(this, t, n);
                    return "Until" !== e.slice(-5) && (i = n), i && "string" == typeof i && (o = re.filter(i, o)), this.length > 1 && (be[e] || (o = re.unique(o)), ye.test(e) && (o = o.reverse())), this.pushStack(o)
                }
            });
            var xe = /\S+/g, we = {};
            re.Callbacks = function (e) {
                e = "string" == typeof e ? we[e] || r(e) : re.extend({}, e);
                var t, n, i, o, s, a, l = [], u = !e.once && [], c = function (r) {
                    for (n = e.memory && r, i = !0, s = a || 0, a = 0, o = l.length, t = !0; l && o > s; s++)if (l[s].apply(r[0], r[1]) === !1 && e.stopOnFalse) {
                        n = !1;
                        break
                    }
                    t = !1, l && (u ? u.length && c(u.shift()) : n ? l = [] : d.disable())
                }, d = {
                    add: function () {
                        if (l) {
                            var i = l.length;
                            !function r(t) {
                                re.each(t, function (t, n) {
                                    var i = re.type(n);
                                    "function" === i ? e.unique && d.has(n) || l.push(n) : n && n.length && "string" !== i && r(n)
                                })
                            }(arguments), t ? o = l.length : n && (a = i, c(n))
                        }
                        return this
                    }, remove: function () {
                        return l && re.each(arguments, function (e, n) {
                            for (var i; (i = re.inArray(n, l, i)) > -1;)l.splice(i, 1), t && (o >= i && o--, s >= i && s--)
                        }), this
                    }, has: function (e) {
                        return e ? re.inArray(e, l) > -1 : !(!l || !l.length)
                    }, empty: function () {
                        return l = [], o = 0, this
                    }, disable: function () {
                        return l = u = n = void 0, this
                    }, disabled: function () {
                        return !l
                    }, lock: function () {
                        return u = void 0, n || d.disable(), this
                    }, locked: function () {
                        return !u
                    }, fireWith: function (e, n) {
                        return !l || i && !u || (n = n || [], n = [e, n.slice ? n.slice() : n], t ? u.push(n) : c(n)), this
                    }, fire: function () {
                        return d.fireWith(this, arguments), this
                    }, fired: function () {
                        return !!i
                    }
                };
                return d
            }, re.extend({
                Deferred: function (e) {
                    var t = [["resolve", "done", re.Callbacks("once memory"), "resolved"], ["reject", "fail", re.Callbacks("once memory"), "rejected"], ["notify", "progress", re.Callbacks("memory")]], n = "pending", i = {
                        state: function () {
                            return n
                        }, always: function () {
                            return o.done(arguments).fail(arguments), this
                        }, then: function () {
                            var e = arguments;
                            return re.Deferred(function (n) {
                                re.each(t, function (t, r) {
                                    var s = re.isFunction(e[t]) && e[t];
                                    o[r[1]](function () {
                                        var e = s && s.apply(this, arguments);
                                        e && re.isFunction(e.promise) ? e.promise().done(n.resolve).fail(n.reject).progress(n.notify) : n[r[0] + "With"](this === i ? n.promise() : this, s ? [e] : arguments)
                                    })
                                }), e = null
                            }).promise()
                        }, promise: function (e) {
                            return null != e ? re.extend(e, i) : i
                        }
                    }, o = {};
                    return i.pipe = i.then, re.each(t, function (e, r) {
                        var s = r[2], a = r[3];
                        i[r[1]] = s.add, a && s.add(function () {
                            n = a
                        }, t[1 ^ e][2].disable, t[2][2].lock), o[r[0]] = function () {
                            return o[r[0] + "With"](this === o ? i : this, arguments), this
                        }, o[r[0] + "With"] = s.fireWith
                    }), i.promise(o), e && e.call(o, o), o
                }, when: function (e) {
                    var t, n, i, o = 0, r = Y.call(arguments), s = r.length, a = 1 !== s || e && re.isFunction(e.promise) ? s : 0, l = 1 === a ? e : re.Deferred(), u = function (e, n, i) {
                        return function (o) {
                            n[e] = this, i[e] = arguments.length > 1 ? Y.call(arguments) : o, i === t ? l.notifyWith(n, i) : --a || l.resolveWith(n, i)
                        }
                    };
                    if (s > 1)for (t = new Array(s), n = new Array(s), i = new Array(s); s > o; o++)r[o] && re.isFunction(r[o].promise) ? r[o].promise().done(u(o, i, r)).fail(l.reject).progress(u(o, n, t)) : --a;
                    return a || l.resolveWith(i, r), l.promise()
                }
            });
            var Te;
            re.fn.ready = function (e) {
                return re.ready.promise().done(e), this
            }, re.extend({
                isReady: !1, readyWait: 1, holdReady: function (e) {
                    e ? re.readyWait++ : re.ready(!0)
                }, ready: function (e) {
                    if (e === !0 ? !--re.readyWait : !re.isReady) {
                        if (!me.body)return setTimeout(re.ready);
                        re.isReady = !0, e !== !0 && --re.readyWait > 0 || (Te.resolveWith(me, [re]), re.fn.trigger && re(me).trigger("ready").off("ready"))
                    }
                }
            }), re.ready.promise = function (t) {
                if (!Te)if (Te = re.Deferred(), "complete" === me.readyState)setTimeout(re.ready); else if (me.addEventListener)me.addEventListener("DOMContentLoaded", a, !1), e.addEventListener("load", a, !1); else {
                    me.attachEvent("onreadystatechange", a), e.attachEvent("onload", a);
                    var n = !1;
                    try {
                        n = null == e.frameElement && me.documentElement
                    } catch (i) {
                    }
                    n && n.doScroll && !function o() {
                        if (!re.isReady) {
                            try {
                                n.doScroll("left")
                            } catch (e) {
                                return setTimeout(o, 50)
                            }
                            s(), re.ready()
                        }
                    }()
                }
                return Te.promise(t)
            };
            var Ce, Ne = "undefined";
            for (Ce in re(ie))break;
            ie.ownLast = "0" !== Ce, ie.inlineBlockNeedsLayout = !1, re(function () {
                var e, t, n = me.getElementsByTagName("body")[0];
                n && (e = me.createElement("div"), e.style.cssText = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px;margin-top:1px", t = me.createElement("div"), n.appendChild(e).appendChild(t), typeof t.style.zoom !== Ne && (t.style.cssText = "border:0;margin:0;width:1px;padding:1px;display:inline;zoom:1", (ie.inlineBlockNeedsLayout = 3 === t.offsetWidth) && (n.style.zoom = 1)), n.removeChild(e), e = t = null)
            }), function () {
                var e = me.createElement("div");
                if (null == ie.deleteExpando) {
                    ie.deleteExpando = !0;
                    try {
                        delete e.test
                    } catch (t) {
                        ie.deleteExpando = !1
                    }
                }
                e = null
            }(), re.acceptData = function (e) {
                var t = re.noData[(e.nodeName + " ").toLowerCase()], n = +e.nodeType || 1;
                return 1 !== n && 9 !== n ? !1 : !t || t !== !0 && e.getAttribute("classid") === t
            };
            var Ee = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/, ke = /([A-Z])/g;
            re.extend({
                cache: {},
                noData: {"applet ": !0, "embed ": !0, "object ": "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"},
                hasData: function (e) {
                    return e = e.nodeType ? re.cache[e[re.expando]] : e[re.expando], !!e && !u(e)
                },
                data: function (e, t, n) {
                    return c(e, t, n)
                },
                removeData: function (e, t) {
                    return d(e, t)
                },
                _data: function (e, t, n) {
                    return c(e, t, n, !0)
                },
                _removeData: function (e, t) {
                    return d(e, t, !0)
                }
            }), re.fn.extend({
                data: function (e, t) {
                    var n, i, o, r = this[0], s = r && r.attributes;
                    if (void 0 === e) {
                        if (this.length && (o = re.data(r), 1 === r.nodeType && !re._data(r, "parsedAttrs"))) {
                            for (n = s.length; n--;)i = s[n].name, 0 === i.indexOf("data-") && (i = re.camelCase(i.slice(5)), l(r, i, o[i]));
                            re._data(r, "parsedAttrs", !0)
                        }
                        return o
                    }
                    return "object" == typeof e ? this.each(function () {
                        re.data(this, e)
                    }) : arguments.length > 1 ? this.each(function () {
                        re.data(this, e, t)
                    }) : r ? l(r, e, re.data(r, e)) : void 0
                }, removeData: function (e) {
                    return this.each(function () {
                        re.removeData(this, e)
                    })
                }
            }), re.extend({
                queue: function (e, t, n) {
                    var i;
                    return e ? (t = (t || "fx") + "queue", i = re._data(e, t), n && (!i || re.isArray(n) ? i = re._data(e, t, re.makeArray(n)) : i.push(n)), i || []) : void 0
                }, dequeue: function (e, t) {
                    t = t || "fx";
                    var n = re.queue(e, t), i = n.length, o = n.shift(), r = re._queueHooks(e, t), s = function () {
                        re.dequeue(e, t)
                    };
                    "inprogress" === o && (o = n.shift(), i--), o && ("fx" === t && n.unshift("inprogress"), delete r.stop, o.call(e, s, r)), !i && r && r.empty.fire()
                }, _queueHooks: function (e, t) {
                    var n = t + "queueHooks";
                    return re._data(e, n) || re._data(e, n, {
                            empty: re.Callbacks("once memory").add(function () {
                                re._removeData(e, t + "queue"), re._removeData(e, n)
                            })
                        })
                }
            }), re.fn.extend({
                queue: function (e, t) {
                    var n = 2;
                    return "string" != typeof e && (t = e, e = "fx", n--), arguments.length < n ? re.queue(this[0], e) : void 0 === t ? this : this.each(function () {
                        var n = re.queue(this, e, t);
                        re._queueHooks(this, e), "fx" === e && "inprogress" !== n[0] && re.dequeue(this, e)
                    })
                }, dequeue: function (e) {
                    return this.each(function () {
                        re.dequeue(this, e)
                    })
                }, clearQueue: function (e) {
                    return this.queue(e || "fx", [])
                }, promise: function (e, t) {
                    var n, i = 1, o = re.Deferred(), r = this, s = this.length, a = function () {
                        --i || o.resolveWith(r, [r])
                    };
                    for ("string" != typeof e && (t = e, e = void 0), e = e || "fx"; s--;)n = re._data(r[s], e + "queueHooks"), n && n.empty && (i++, n.empty.add(a));
                    return a(), o.promise(t)
                }
            });
            var Se = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source, Ae = ["Top", "Right", "Bottom", "Left"], De = function (e, t) {
                return e = t || e, "none" === re.css(e, "display") || !re.contains(e.ownerDocument, e)
            }, $e = re.access = function (e, t, n, i, o, r, s) {
                var a = 0, l = e.length, u = null == n;
                if ("object" === re.type(n)) {
                    o = !0;
                    for (a in n)re.access(e, t, a, n[a], !0, r, s)
                } else if (void 0 !== i && (o = !0, re.isFunction(i) || (s = !0), u && (s ? (t.call(e, i), t = null) : (u = t, t = function (e, t, n) {
                        return u.call(re(e), n)
                    })), t))for (; l > a; a++)t(e[a], n, s ? i : i.call(e[a], a, t(e[a], n)));
                return o ? e : u ? t.call(e) : l ? t(e[0], n) : r
            }, je = /^(?:checkbox|radio)$/i;
            !function () {
                var e = me.createDocumentFragment(), t = me.createElement("div"), n = me.createElement("input");
                if (t.setAttribute("className", "t"), t.innerHTML = "  <link/><table></table><a href='/a'>a</a>", ie.leadingWhitespace = 3 === t.firstChild.nodeType, ie.tbody = !t.getElementsByTagName("tbody").length, ie.htmlSerialize = !!t.getElementsByTagName("link").length, ie.html5Clone = "<:nav></:nav>" !== me.createElement("nav").cloneNode(!0).outerHTML, n.type = "checkbox", n.checked = !0, e.appendChild(n), ie.appendChecked = n.checked, t.innerHTML = "<textarea>x</textarea>", ie.noCloneChecked = !!t.cloneNode(!0).lastChild.defaultValue, e.appendChild(t), t.innerHTML = "<input type='radio' checked='checked' name='t'/>", ie.checkClone = t.cloneNode(!0).cloneNode(!0).lastChild.checked, ie.noCloneEvent = !0, t.attachEvent && (t.attachEvent("onclick", function () {
                        ie.noCloneEvent = !1
                    }), t.cloneNode(!0).click()), null == ie.deleteExpando) {
                    ie.deleteExpando = !0;
                    try {
                        delete t.test
                    } catch (i) {
                        ie.deleteExpando = !1
                    }
                }
                e = t = n = null
            }(), function () {
                var t, n, i = me.createElement("div");
                for (t in{
                    submit: !0,
                    change: !0,
                    focusin: !0
                })n = "on" + t, (ie[t + "Bubbles"] = n in e) || (i.setAttribute(n, "t"), ie[t + "Bubbles"] = i.attributes[n].expando === !1);
                i = null
            }();
            var Le = /^(?:input|select|textarea)$/i, Oe = /^key/, He = /^(?:mouse|contextmenu)|click/, _e = /^(?:focusinfocus|focusoutblur)$/, Fe = /^([^.]*)(?:\.(.+)|)$/;
            re.event = {
                global: {},
                add: function (e, t, n, i, o) {
                    var r, s, a, l, u, c, d, p, f, h, m, g = re._data(e);
                    if (g) {
                        for (n.handler && (l = n, n = l.handler, o = l.selector), n.guid || (n.guid = re.guid++), (s = g.events) || (s = g.events = {}), (c = g.handle) || (c = g.handle = function (e) {
                            return typeof re === Ne || e && re.event.triggered === e.type ? void 0 : re.event.dispatch.apply(c.elem, arguments)
                        }, c.elem = e), t = (t || "").match(xe) || [""], a = t.length; a--;)r = Fe.exec(t[a]) || [], f = m = r[1], h = (r[2] || "").split(".").sort(), f && (u = re.event.special[f] || {}, f = (o ? u.delegateType : u.bindType) || f, u = re.event.special[f] || {}, d = re.extend({
                            type: f,
                            origType: m,
                            data: i,
                            handler: n,
                            guid: n.guid,
                            selector: o,
                            needsContext: o && re.expr.match.needsContext.test(o),
                            namespace: h.join(".")
                        }, l), (p = s[f]) || (p = s[f] = [], p.delegateCount = 0, u.setup && u.setup.call(e, i, h, c) !== !1 || (e.addEventListener ? e.addEventListener(f, c, !1) : e.attachEvent && e.attachEvent("on" + f, c))), u.add && (u.add.call(e, d), d.handler.guid || (d.handler.guid = n.guid)), o ? p.splice(p.delegateCount++, 0, d) : p.push(d), re.event.global[f] = !0);
                        e = null
                    }
                },
                remove: function (e, t, n, i, o) {
                    var r, s, a, l, u, c, d, p, f, h, m, g = re.hasData(e) && re._data(e);
                    if (g && (c = g.events)) {
                        for (t = (t || "").match(xe) || [""], u = t.length; u--;)if (a = Fe.exec(t[u]) || [], f = m = a[1], h = (a[2] || "").split(".").sort(), f) {
                            for (d = re.event.special[f] || {}, f = (i ? d.delegateType : d.bindType) || f, p = c[f] || [], a = a[2] && new RegExp("(^|\\.)" + h.join("\\.(?:.*\\.|)") + "(\\.|$)"), l = r = p.length; r--;)s = p[r], !o && m !== s.origType || n && n.guid !== s.guid || a && !a.test(s.namespace) || i && i !== s.selector && ("**" !== i || !s.selector) || (p.splice(r, 1), s.selector && p.delegateCount--, d.remove && d.remove.call(e, s));
                            l && !p.length && (d.teardown && d.teardown.call(e, h, g.handle) !== !1 || re.removeEvent(e, f, g.handle), delete c[f])
                        } else for (f in c)re.event.remove(e, f + t[u], n, i, !0);
                        re.isEmptyObject(c) && (delete g.handle, re._removeData(e, "events"))
                    }
                },
                trigger: function (t, n, i, o) {
                    var r, s, a, l, u, c, d, p = [i || me], f = te.call(t, "type") ? t.type : t, h = te.call(t, "namespace") ? t.namespace.split(".") : [];
                    if (a = c = i = i || me, 3 !== i.nodeType && 8 !== i.nodeType && !_e.test(f + re.event.triggered) && (f.indexOf(".") >= 0 && (h = f.split("."), f = h.shift(), h.sort()), s = f.indexOf(":") < 0 && "on" + f, t = t[re.expando] ? t : new re.Event(f, "object" == typeof t && t), t.isTrigger = o ? 2 : 3, t.namespace = h.join("."), t.namespace_re = t.namespace ? new RegExp("(^|\\.)" + h.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, t.result = void 0, t.target || (t.target = i), n = null == n ? [t] : re.makeArray(n, [t]), u = re.event.special[f] || {}, o || !u.trigger || u.trigger.apply(i, n) !== !1)) {
                        if (!o && !u.noBubble && !re.isWindow(i)) {
                            for (l = u.delegateType || f, _e.test(l + f) || (a = a.parentNode); a; a = a.parentNode)p.push(a), c = a;
                            c === (i.ownerDocument || me) && p.push(c.defaultView || c.parentWindow || e)
                        }
                        for (d = 0; (a = p[d++]) && !t.isPropagationStopped();)t.type = d > 1 ? l : u.bindType || f, r = (re._data(a, "events") || {})[t.type] && re._data(a, "handle"), r && r.apply(a, n), r = s && a[s], r && r.apply && re.acceptData(a) && (t.result = r.apply(a, n), t.result === !1 && t.preventDefault());
                        if (t.type = f, !o && !t.isDefaultPrevented() && (!u._default || u._default.apply(p.pop(), n) === !1) && re.acceptData(i) && s && i[f] && !re.isWindow(i)) {
                            c = i[s], c && (i[s] = null), re.event.triggered = f;
                            try {
                                i[f]()
                            } catch (m) {
                            }
                            re.event.triggered = void 0, c && (i[s] = c)
                        }
                        return t.result
                    }
                },
                dispatch: function (e) {
                    e = re.event.fix(e);
                    var t, n, i, o, r, s = [], a = Y.call(arguments), l = (re._data(this, "events") || {})[e.type] || [], u = re.event.special[e.type] || {};
                    if (a[0] = e, e.delegateTarget = this, !u.preDispatch || u.preDispatch.call(this, e) !== !1) {
                        for (s = re.event.handlers.call(this, e, l), t = 0; (o = s[t++]) && !e.isPropagationStopped();)for (e.currentTarget = o.elem, r = 0; (i = o.handlers[r++]) && !e.isImmediatePropagationStopped();)(!e.namespace_re || e.namespace_re.test(i.namespace)) && (e.handleObj = i, e.data = i.data, n = ((re.event.special[i.origType] || {}).handle || i.handler).apply(o.elem, a), void 0 !== n && (e.result = n) === !1 && (e.preventDefault(), e.stopPropagation()));
                        return u.postDispatch && u.postDispatch.call(this, e), e.result
                    }
                },
                handlers: function (e, t) {
                    var n, i, o, r, s = [], a = t.delegateCount, l = e.target;
                    if (a && l.nodeType && (!e.button || "click" !== e.type))for (; l != this; l = l.parentNode || this)if (1 === l.nodeType && (l.disabled !== !0 || "click" !== e.type)) {
                        for (o = [], r = 0; a > r; r++)i = t[r], n = i.selector + " ", void 0 === o[n] && (o[n] = i.needsContext ? re(n, this).index(l) >= 0 : re.find(n, this, null, [l]).length), o[n] && o.push(i);
                        o.length && s.push({elem: l, handlers: o})
                    }
                    return a < t.length && s.push({elem: this, handlers: t.slice(a)}), s
                },
                fix: function (e) {
                    if (e[re.expando])return e;
                    var t, n, i, o = e.type, r = e, s = this.fixHooks[o];
                    for (s || (this.fixHooks[o] = s = He.test(o) ? this.mouseHooks : Oe.test(o) ? this.keyHooks : {}), i = s.props ? this.props.concat(s.props) : this.props, e = new re.Event(r), t = i.length; t--;)n = i[t], e[n] = r[n];
                    return e.target || (e.target = r.srcElement || me), 3 === e.target.nodeType && (e.target = e.target.parentNode), e.metaKey = !!e.metaKey, s.filter ? s.filter(e, r) : e
                },
                props: "altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),
                fixHooks: {},
                keyHooks: {
                    props: "char charCode key keyCode".split(" "), filter: function (e, t) {
                        return null == e.which && (e.which = null != t.charCode ? t.charCode : t.keyCode), e
                    }
                },
                mouseHooks: {
                    props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),
                    filter: function (e, t) {
                        var n, i, o, r = t.button, s = t.fromElement;
                        return null == e.pageX && null != t.clientX && (i = e.target.ownerDocument || me, o = i.documentElement, n = i.body, e.pageX = t.clientX + (o && o.scrollLeft || n && n.scrollLeft || 0) - (o && o.clientLeft || n && n.clientLeft || 0), e.pageY = t.clientY + (o && o.scrollTop || n && n.scrollTop || 0) - (o && o.clientTop || n && n.clientTop || 0)), !e.relatedTarget && s && (e.relatedTarget = s === e.target ? t.toElement : s), e.which || void 0 === r || (e.which = 1 & r ? 1 : 2 & r ? 3 : 4 & r ? 2 : 0), e
                    }
                },
                special: {
                    load: {noBubble: !0}, focus: {
                        trigger: function () {
                            if (this !== h() && this.focus)try {
                                return this.focus(), !1
                            } catch (e) {
                            }
                        }, delegateType: "focusin"
                    }, blur: {
                        trigger: function () {
                            return this === h() && this.blur ? (this.blur(), !1) : void 0
                        }, delegateType: "focusout"
                    }, click: {
                        trigger: function () {
                            return re.nodeName(this, "input") && "checkbox" === this.type && this.click ? (this.click(), !1) : void 0
                        }, _default: function (e) {
                            return re.nodeName(e.target, "a")
                        }
                    }, beforeunload: {
                        postDispatch: function (e) {
                            void 0 !== e.result && (e.originalEvent.returnValue = e.result)
                        }
                    }
                },
                simulate: function (e, t, n, i) {
                    var o = re.extend(new re.Event, n, {type: e, isSimulated: !0, originalEvent: {}});
                    i ? re.event.trigger(o, null, t) : re.event.dispatch.call(t, o), o.isDefaultPrevented() && n.preventDefault()
                }
            }, re.removeEvent = me.removeEventListener ? function (e, t, n) {
                e.removeEventListener && e.removeEventListener(t, n, !1)
            } : function (e, t, n) {
                var i = "on" + t;
                e.detachEvent && (typeof e[i] === Ne && (e[i] = null), e.detachEvent(i, n))
            }, re.Event = function (e, t) {
                return this instanceof re.Event ? (e && e.type ? (this.originalEvent = e, this.type = e.type, this.isDefaultPrevented = e.defaultPrevented || void 0 === e.defaultPrevented && (e.returnValue === !1 || e.getPreventDefault && e.getPreventDefault()) ? p : f) : this.type = e, t && re.extend(this, t), this.timeStamp = e && e.timeStamp || re.now(), void(this[re.expando] = !0)) : new re.Event(e, t)
            }, re.Event.prototype = {
                isDefaultPrevented: f,
                isPropagationStopped: f,
                isImmediatePropagationStopped: f,
                preventDefault: function () {
                    var e = this.originalEvent;
                    this.isDefaultPrevented = p, e && (e.preventDefault ? e.preventDefault() : e.returnValue = !1)
                },
                stopPropagation: function () {
                    var e = this.originalEvent;
                    this.isPropagationStopped = p, e && (e.stopPropagation && e.stopPropagation(), e.cancelBubble = !0)
                },
                stopImmediatePropagation: function () {
                    this.isImmediatePropagationStopped = p, this.stopPropagation()
                }
            }, re.each({mouseenter: "mouseover", mouseleave: "mouseout"}, function (e, t) {
                re.event.special[e] = {
                    delegateType: t, bindType: t, handle: function (e) {
                        var n, i = this, o = e.relatedTarget, r = e.handleObj;
                        return (!o || o !== i && !re.contains(i, o)) && (e.type = r.origType, n = r.handler.apply(this, arguments), e.type = t), n
                    }
                }
            }), ie.submitBubbles || (re.event.special.submit = {
                setup: function () {
                    return re.nodeName(this, "form") ? !1 : void re.event.add(this, "click._submit keypress._submit", function (e) {
                        var t = e.target, n = re.nodeName(t, "input") || re.nodeName(t, "button") ? t.form : void 0;
                        n && !re._data(n, "submitBubbles") && (re.event.add(n, "submit._submit", function (e) {
                            e._submit_bubble = !0
                        }), re._data(n, "submitBubbles", !0))
                    })
                }, postDispatch: function (e) {
                    e._submit_bubble && (delete e._submit_bubble, this.parentNode && !e.isTrigger && re.event.simulate("submit", this.parentNode, e, !0))
                }, teardown: function () {
                    return re.nodeName(this, "form") ? !1 : void re.event.remove(this, "._submit")
                }
            }), ie.changeBubbles || (re.event.special.change = {
                setup: function () {
                    return Le.test(this.nodeName) ? (("checkbox" === this.type || "radio" === this.type) && (re.event.add(this, "propertychange._change", function (e) {
                        "checked" === e.originalEvent.propertyName && (this._just_changed = !0)
                    }), re.event.add(this, "click._change", function (e) {
                        this._just_changed && !e.isTrigger && (this._just_changed = !1), re.event.simulate("change", this, e, !0)
                    })), !1) : void re.event.add(this, "beforeactivate._change", function (e) {
                        var t = e.target;
                        Le.test(t.nodeName) && !re._data(t, "changeBubbles") && (re.event.add(t, "change._change", function (e) {
                            !this.parentNode || e.isSimulated || e.isTrigger || re.event.simulate("change", this.parentNode, e, !0)
                        }), re._data(t, "changeBubbles", !0))
                    })
                }, handle: function (e) {
                    var t = e.target;
                    return this !== t || e.isSimulated || e.isTrigger || "radio" !== t.type && "checkbox" !== t.type ? e.handleObj.handler.apply(this, arguments) : void 0
                }, teardown: function () {
                    return re.event.remove(this, "._change"), !Le.test(this.nodeName)
                }
            }), ie.focusinBubbles || re.each({focus: "focusin", blur: "focusout"}, function (e, t) {
                var n = function (e) {
                    re.event.simulate(t, e.target, re.event.fix(e), !0)
                };
                re.event.special[t] = {
                    setup: function () {
                        var i = this.ownerDocument || this, o = re._data(i, t);
                        o || i.addEventListener(e, n, !0), re._data(i, t, (o || 0) + 1)
                    }, teardown: function () {
                        var i = this.ownerDocument || this, o = re._data(i, t) - 1;
                        o ? re._data(i, t, o) : (i.removeEventListener(e, n, !0), re._removeData(i, t))
                    }
                }
            }), re.fn.extend({
                on: function (e, t, n, i, o) {
                    var r, s;
                    if ("object" == typeof e) {
                        "string" != typeof t && (n = n || t, t = void 0);
                        for (r in e)this.on(r, t, n, e[r], o);
                        return this
                    }
                    if (null == n && null == i ? (i = t, n = t = void 0) : null == i && ("string" == typeof t ? (i = n, n = void 0) : (i = n, n = t, t = void 0)), i === !1)i = f; else if (!i)return this;
                    return 1 === o && (s = i, i = function (e) {
                        return re().off(e), s.apply(this, arguments)
                    }, i.guid = s.guid || (s.guid = re.guid++)), this.each(function () {
                        re.event.add(this, e, i, n, t)
                    })
                }, one: function (e, t, n, i) {
                    return this.on(e, t, n, i, 1)
                }, off: function (e, t, n) {
                    var i, o;
                    if (e && e.preventDefault && e.handleObj)return i = e.handleObj, re(e.delegateTarget).off(i.namespace ? i.origType + "." + i.namespace : i.origType, i.selector, i.handler), this;
                    if ("object" == typeof e) {
                        for (o in e)this.off(o, t, e[o]);
                        return this
                    }
                    return (t === !1 || "function" == typeof t) && (n = t, t = void 0), n === !1 && (n = f), this.each(function () {
                        re.event.remove(this, e, n, t)
                    })
                }, trigger: function (e, t) {
                    return this.each(function () {
                        re.event.trigger(e, t, this)
                    })
                }, triggerHandler: function (e, t) {
                    var n = this[0];
                    return n ? re.event.trigger(e, t, n, !0) : void 0
                }
            });
            var qe = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video", Re = / jQuery\d+="(?:null|\d+)"/g, Me = new RegExp("<(?:" + qe + ")[\\s/>]", "i"), Be = /^\s+/, Ie = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/gi, Pe = /<([\w:]+)/, We = /<tbody/i, ze = /<|&#?\w+;/, Ue = /<(?:script|style|link)/i, Xe = /checked\s*(?:[^=]|=\s*.checked.)/i, Ve = /^$|\/(?:java|ecma)script/i, Qe = /^true\/(.*)/, Ye = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g, Je = {
                option: [1, "<select multiple='multiple'>", "</select>"],
                legend: [1, "<fieldset>", "</fieldset>"],
                area: [1, "<map>", "</map>"],
                param: [1, "<object>", "</object>"],
                thead: [1, "<table>", "</table>"],
                tr: [2, "<table><tbody>", "</tbody></table>"],
                col: [2, "<table><tbody></tbody><colgroup>", "</colgroup></table>"],
                td: [3, "<table><tbody><tr>", "</tr></tbody></table>"],
                _default: ie.htmlSerialize ? [0, "", ""] : [1, "X<div>", "</div>"]
            }, Ze = m(me), Ke = Ze.appendChild(me.createElement("div"));
            Je.optgroup = Je.option, Je.tbody = Je.tfoot = Je.colgroup = Je.caption = Je.thead, Je.th = Je.td, re.extend({
                clone: function (e, t, n) {
                    var i, o, r, s, a, l = re.contains(e.ownerDocument, e);
                    if (ie.html5Clone || re.isXMLDoc(e) || !Me.test("<" + e.nodeName + ">") ? r = e.cloneNode(!0) : (Ke.innerHTML = e.outerHTML, Ke.removeChild(r = Ke.firstChild)), !(ie.noCloneEvent && ie.noCloneChecked || 1 !== e.nodeType && 11 !== e.nodeType || re.isXMLDoc(e)))for (i = g(r), a = g(e), s = 0; null != (o = a[s]); ++s)i[s] && C(o, i[s]);
                    if (t)if (n)for (a = a || g(e), i = i || g(r), s = 0; null != (o = a[s]); s++)T(o, i[s]); else T(e, r);
                    return i = g(r, "script"), i.length > 0 && w(i, !l && g(e, "script")), i = a = o = null, r
                }, buildFragment: function (e, t, n, i) {
                    for (var o, r, s, a, l, u, c, d = e.length, p = m(t), f = [], h = 0; d > h; h++)if (r = e[h], r || 0 === r)if ("object" === re.type(r))re.merge(f, r.nodeType ? [r] : r); else if (ze.test(r)) {
                        for (a = a || p.appendChild(t.createElement("div")), l = (Pe.exec(r) || ["", ""])[1].toLowerCase(), c = Je[l] || Je._default, a.innerHTML = c[1] + r.replace(Ie, "<$1></$2>") + c[2], o = c[0]; o--;)a = a.lastChild;
                        if (!ie.leadingWhitespace && Be.test(r) && f.push(t.createTextNode(Be.exec(r)[0])), !ie.tbody)for (r = "table" !== l || We.test(r) ? "<table>" !== c[1] || We.test(r) ? 0 : a : a.firstChild, o = r && r.childNodes.length; o--;)re.nodeName(u = r.childNodes[o], "tbody") && !u.childNodes.length && r.removeChild(u);
                        for (re.merge(f, a.childNodes), a.textContent = ""; a.firstChild;)a.removeChild(a.firstChild);
                        a = p.lastChild
                    } else f.push(t.createTextNode(r));
                    for (a && p.removeChild(a), ie.appendChecked || re.grep(g(f, "input"), v), h = 0; r = f[h++];)if ((!i || -1 === re.inArray(r, i)) && (s = re.contains(r.ownerDocument, r), a = g(p.appendChild(r), "script"), s && w(a), n))for (o = 0; r = a[o++];)Ve.test(r.type || "") && n.push(r);
                    return a = null, p
                }, cleanData: function (e, t) {
                    for (var n, i, o, r, s = 0, a = re.expando, l = re.cache, u = ie.deleteExpando, c = re.event.special; null != (n = e[s]); s++)if ((t || re.acceptData(n)) && (o = n[a], r = o && l[o])) {
                        if (r.events)for (i in r.events)c[i] ? re.event.remove(n, i) : re.removeEvent(n, i, r.handle);
                        l[o] && (delete l[o], u ? delete n[a] : typeof n.removeAttribute !== Ne ? n.removeAttribute(a) : n[a] = null, Q.push(o))
                    }
                }
            }), re.fn.extend({
                text: function (e) {
                    return $e(this, function (e) {
                        return void 0 === e ? re.text(this) : this.empty().append((this[0] && this[0].ownerDocument || me).createTextNode(e))
                    }, null, e, arguments.length)
                }, append: function () {
                    return this.domManip(arguments, function (e) {
                        if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                            var t = y(this, e);
                            t.appendChild(e)
                        }
                    })
                }, prepend: function () {
                    return this.domManip(arguments, function (e) {
                        if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                            var t = y(this, e);
                            t.insertBefore(e, t.firstChild)
                        }
                    })
                }, before: function () {
                    return this.domManip(arguments, function (e) {
                        this.parentNode && this.parentNode.insertBefore(e, this)
                    })
                }, after: function () {
                    return this.domManip(arguments, function (e) {
                        this.parentNode && this.parentNode.insertBefore(e, this.nextSibling)
                    })
                }, remove: function (e, t) {
                    for (var n, i = e ? re.filter(e, this) : this, o = 0; null != (n = i[o]); o++)t || 1 !== n.nodeType || re.cleanData(g(n)), n.parentNode && (t && re.contains(n.ownerDocument, n) && w(g(n, "script")), n.parentNode.removeChild(n));
                    return this
                }, empty: function () {
                    for (var e, t = 0; null != (e = this[t]); t++) {
                        for (1 === e.nodeType && re.cleanData(g(e, !1)); e.firstChild;)e.removeChild(e.firstChild);
                        e.options && re.nodeName(e, "select") && (e.options.length = 0)
                    }
                    return this
                }, clone: function (e, t) {
                    return e = null == e ? !1 : e, t = null == t ? e : t, this.map(function () {
                        return re.clone(this, e, t)
                    })
                }, html: function (e) {
                    return $e(this, function (e) {
                        var t = this[0] || {}, n = 0, i = this.length;
                        if (void 0 === e)return 1 === t.nodeType ? t.innerHTML.replace(Re, "") : void 0;
                        if (!("string" != typeof e || Ue.test(e) || !ie.htmlSerialize && Me.test(e) || !ie.leadingWhitespace && Be.test(e) || Je[(Pe.exec(e) || ["", ""])[1].toLowerCase()])) {
                            e = e.replace(Ie, "<$1></$2>");
                            try {
                                for (; i > n; n++)t = this[n] || {}, 1 === t.nodeType && (re.cleanData(g(t, !1)), t.innerHTML = e);
                                t = 0
                            } catch (o) {
                            }
                        }
                        t && this.empty().append(e)
                    }, null, e, arguments.length)
                }, replaceWith: function () {
                    var e = arguments[0];
                    return this.domManip(arguments, function (t) {
                        e = this.parentNode, re.cleanData(g(this)), e && e.replaceChild(t, this)
                    }), e && (e.length || e.nodeType) ? this : this.remove()
                }, detach: function (e) {
                    return this.remove(e, !0)
                }, domManip: function (e, t) {
                    e = J.apply([], e);
                    var n, i, o, r, s, a, l = 0, u = this.length, c = this, d = u - 1, p = e[0], f = re.isFunction(p);
                    if (f || u > 1 && "string" == typeof p && !ie.checkClone && Xe.test(p))return this.each(function (n) {
                        var i = c.eq(n);
                        f && (e[0] = p.call(this, n, i.html())), i.domManip(e, t)
                    });
                    if (u && (a = re.buildFragment(e, this[0].ownerDocument, !1, this), n = a.firstChild, 1 === a.childNodes.length && (a = n), n)) {
                        for (r = re.map(g(a, "script"), b), o = r.length; u > l; l++)i = a, l !== d && (i = re.clone(i, !0, !0), o && re.merge(r, g(i, "script"))), t.call(this[l], i, l);
                        if (o)for (s = r[r.length - 1].ownerDocument, re.map(r, x), l = 0; o > l; l++)i = r[l], Ve.test(i.type || "") && !re._data(i, "globalEval") && re.contains(s, i) && (i.src ? re._evalUrl && re._evalUrl(i.src) : re.globalEval((i.text || i.textContent || i.innerHTML || "").replace(Ye, "")));
                        a = n = null
                    }
                    return this
                }
            }), re.each({
                appendTo: "append",
                prependTo: "prepend",
                insertBefore: "before",
                insertAfter: "after",
                replaceAll: "replaceWith"
            }, function (e, t) {
                re.fn[e] = function (e) {
                    for (var n, i = 0, o = [], r = re(e), s = r.length - 1; s >= i; i++)n = i === s ? this : this.clone(!0), re(r[i])[t](n), Z.apply(o, n.get());
                    return this.pushStack(o)
                }
            });
            var Ge, et = {};
            !function () {
                var e, t, n = me.createElement("div"), i = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;padding:0;margin:0;border:0";
                n.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", e = n.getElementsByTagName("a")[0], e.style.cssText = "float:left;opacity:.5", ie.opacity = /^0.5/.test(e.style.opacity), ie.cssFloat = !!e.style.cssFloat, n.style.backgroundClip = "content-box", n.cloneNode(!0).style.backgroundClip = "", ie.clearCloneStyle = "content-box" === n.style.backgroundClip, e = n = null, ie.shrinkWrapBlocks = function () {
                    var e, n, o, r;
                    if (null == t) {
                        if (e = me.getElementsByTagName("body")[0], !e)return;
                        r = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px", n = me.createElement("div"), o = me.createElement("div"), e.appendChild(n).appendChild(o), t = !1, typeof o.style.zoom !== Ne && (o.style.cssText = i + ";width:1px;padding:1px;zoom:1", o.innerHTML = "<div></div>", o.firstChild.style.width = "5px", t = 3 !== o.offsetWidth), e.removeChild(n), e = n = o = null
                    }
                    return t
                }
            }();
            var tt, nt, it = /^margin/, ot = new RegExp("^(" + Se + ")(?!px)[a-z%]+$", "i"), rt = /^(top|right|bottom|left)$/;
            e.getComputedStyle ? (tt = function (e) {
                return e.ownerDocument.defaultView.getComputedStyle(e, null)
            }, nt = function (e, t, n) {
                var i, o, r, s, a = e.style;
                return n = n || tt(e), s = n ? n.getPropertyValue(t) || n[t] : void 0, n && ("" !== s || re.contains(e.ownerDocument, e) || (s = re.style(e, t)), ot.test(s) && it.test(t) && (i = a.width, o = a.minWidth, r = a.maxWidth, a.minWidth = a.maxWidth = a.width = s, s = n.width, a.width = i, a.minWidth = o, a.maxWidth = r)), void 0 === s ? s : s + ""
            }) : me.documentElement.currentStyle && (tt = function (e) {
                return e.currentStyle
            }, nt = function (e, t, n) {
                var i, o, r, s, a = e.style;
                return n = n || tt(e), s = n ? n[t] : void 0, null == s && a && a[t] && (s = a[t]), ot.test(s) && !rt.test(t) && (i = a.left, o = e.runtimeStyle, r = o && o.left, r && (o.left = e.currentStyle.left), a.left = "fontSize" === t ? "1em" : s, s = a.pixelLeft + "px", a.left = i, r && (o.left = r)), void 0 === s ? s : s + "" || "auto"
            }), !function () {
                function t() {
                    var t, n, i = me.getElementsByTagName("body")[0];
                    i && (t = me.createElement("div"), n = me.createElement("div"), t.style.cssText = u, i.appendChild(t).appendChild(n), n.style.cssText = "-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;position:absolute;display:block;padding:1px;border:1px;width:4px;margin-top:1%;top:1%", re.swap(i, null != i.style.zoom ? {zoom: 1} : {}, function () {
                        o = 4 === n.offsetWidth
                    }), r = !0, s = !1, a = !0, e.getComputedStyle && (s = "1%" !== (e.getComputedStyle(n, null) || {}).top, r = "4px" === (e.getComputedStyle(n, null) || {width: "4px"}).width), i.removeChild(t), n = i = null)
                }

                var n, i, o, r, s, a, l = me.createElement("div"), u = "border:0;width:0;height:0;position:absolute;top:0;left:-9999px", c = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;padding:0;margin:0;border:0";
                l.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", n = l.getElementsByTagName("a")[0], n.style.cssText = "float:left;opacity:.5", ie.opacity = /^0.5/.test(n.style.opacity), ie.cssFloat = !!n.style.cssFloat, l.style.backgroundClip = "content-box", l.cloneNode(!0).style.backgroundClip = "", ie.clearCloneStyle = "content-box" === l.style.backgroundClip, n = l = null, re.extend(ie, {
                    reliableHiddenOffsets: function () {
                        if (null != i)return i;
                        var e, t, n, o = me.createElement("div"), r = me.getElementsByTagName("body")[0];
                        return r ? (o.setAttribute("className", "t"), o.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", e = me.createElement("div"), e.style.cssText = u, r.appendChild(e).appendChild(o), o.innerHTML = "<table><tr><td></td><td>t</td></tr></table>", t = o.getElementsByTagName("td"), t[0].style.cssText = "padding:0;margin:0;border:0;display:none", n = 0 === t[0].offsetHeight, t[0].style.display = "", t[1].style.display = "none", i = n && 0 === t[0].offsetHeight, r.removeChild(e), o = r = null, i) : void 0
                    }, boxSizing: function () {
                        return null == o && t(), o
                    }, boxSizingReliable: function () {
                        return null == r && t(), r
                    }, pixelPosition: function () {
                        return null == s && t(), s
                    }, reliableMarginRight: function () {
                        var t, n, i, o;
                        if (null == a && e.getComputedStyle) {
                            if (t = me.getElementsByTagName("body")[0], !t)return;
                            n = me.createElement("div"), i = me.createElement("div"), n.style.cssText = u, t.appendChild(n).appendChild(i), o = i.appendChild(me.createElement("div")), o.style.cssText = i.style.cssText = c, o.style.marginRight = o.style.width = "0", i.style.width = "1px", a = !parseFloat((e.getComputedStyle(o, null) || {}).marginRight), t.removeChild(n)
                        }
                        return a
                    }
                })
            }(), re.swap = function (e, t, n, i) {
                var o, r, s = {};
                for (r in t)s[r] = e.style[r], e.style[r] = t[r];
                o = n.apply(e, i || []);
                for (r in t)e.style[r] = s[r];
                return o
            };
            var st = /alpha\([^)]*\)/i, at = /opacity\s*=\s*([^)]*)/, lt = /^(none|table(?!-c[ea]).+)/, ut = new RegExp("^(" + Se + ")(.*)$", "i"), ct = new RegExp("^([+-])=(" + Se + ")", "i"), dt = {
                position: "absolute",
                visibility: "hidden",
                display: "block"
            }, pt = {letterSpacing: 0, fontWeight: 400}, ft = ["Webkit", "O", "Moz", "ms"];
            re.extend({
                cssHooks: {
                    opacity: {
                        get: function (e, t) {
                            if (t) {
                                var n = nt(e, "opacity");
                                return "" === n ? "1" : n
                            }
                        }
                    }
                },
                cssNumber: {
                    columnCount: !0,
                    fillOpacity: !0,
                    fontWeight: !0,
                    lineHeight: !0,
                    opacity: !0,
                    order: !0,
                    orphans: !0,
                    widows: !0,
                    zIndex: !0,
                    zoom: !0
                },
                cssProps: {"float": ie.cssFloat ? "cssFloat" : "styleFloat"},
                style: function (e, t, n, i) {
                    if (e && 3 !== e.nodeType && 8 !== e.nodeType && e.style) {
                        var o, r, s, a = re.camelCase(t), l = e.style;
                        if (t = re.cssProps[a] || (re.cssProps[a] = S(l, a)), s = re.cssHooks[t] || re.cssHooks[a], void 0 === n)return s && "get" in s && void 0 !== (o = s.get(e, !1, i)) ? o : l[t];
                        if (r = typeof n, "string" === r && (o = ct.exec(n)) && (n = (o[1] + 1) * o[2] + parseFloat(re.css(e, t)), r = "number"), null != n && n === n && ("number" !== r || re.cssNumber[a] || (n += "px"), ie.clearCloneStyle || "" !== n || 0 !== t.indexOf("background") || (l[t] = "inherit"), !(s && "set" in s && void 0 === (n = s.set(e, n, i)))))try {
                            l[t] = "", l[t] = n
                        } catch (u) {
                        }
                    }
                },
                css: function (e, t, n, i) {
                    var o, r, s, a = re.camelCase(t);
                    return t = re.cssProps[a] || (re.cssProps[a] = S(e.style, a)), s = re.cssHooks[t] || re.cssHooks[a], s && "get" in s && (r = s.get(e, !0, n)), void 0 === r && (r = nt(e, t, i)), "normal" === r && t in pt && (r = pt[t]), "" === n || n ? (o = parseFloat(r), n === !0 || re.isNumeric(o) ? o || 0 : r) : r
                }
            }), re.each(["height", "width"], function (e, t) {
                re.cssHooks[t] = {
                    get: function (e, n, i) {
                        return n ? 0 === e.offsetWidth && lt.test(re.css(e, "display")) ? re.swap(e, dt, function () {
                            return j(e, t, i)
                        }) : j(e, t, i) : void 0
                    }, set: function (e, n, i) {
                        var o = i && tt(e);
                        return D(e, n, i ? $(e, t, i, ie.boxSizing() && "border-box" === re.css(e, "boxSizing", !1, o), o) : 0)
                    }
                }
            }), ie.opacity || (re.cssHooks.opacity = {
                get: function (e, t) {
                    return at.test((t && e.currentStyle ? e.currentStyle.filter : e.style.filter) || "") ? .01 * parseFloat(RegExp.$1) + "" : t ? "1" : ""
                }, set: function (e, t) {
                    var n = e.style, i = e.currentStyle, o = re.isNumeric(t) ? "alpha(opacity=" + 100 * t + ")" : "", r = i && i.filter || n.filter || "";
                    n.zoom = 1, (t >= 1 || "" === t) && "" === re.trim(r.replace(st, "")) && n.removeAttribute && (n.removeAttribute("filter"), "" === t || i && !i.filter) || (n.filter = st.test(r) ? r.replace(st, o) : r + " " + o)
                }
            }), re.cssHooks.marginRight = k(ie.reliableMarginRight, function (e, t) {
                return t ? re.swap(e, {display: "inline-block"}, nt, [e, "marginRight"]) : void 0
            }), re.each({margin: "", padding: "", border: "Width"}, function (e, t) {
                re.cssHooks[e + t] = {
                    expand: function (n) {
                        for (var i = 0, o = {}, r = "string" == typeof n ? n.split(" ") : [n]; 4 > i; i++)o[e + Ae[i] + t] = r[i] || r[i - 2] || r[0];
                        return o
                    }
                }, it.test(e) || (re.cssHooks[e + t].set = D)
            }), re.fn.extend({
                css: function (e, t) {
                    return $e(this, function (e, t, n) {
                        var i, o, r = {}, s = 0;
                        if (re.isArray(t)) {
                            for (i = tt(e), o = t.length; o > s; s++)r[t[s]] = re.css(e, t[s], !1, i);
                            return r
                        }
                        return void 0 !== n ? re.style(e, t, n) : re.css(e, t)
                    }, e, t, arguments.length > 1)
                }, show: function () {
                    return A(this, !0)
                }, hide: function () {
                    return A(this)
                }, toggle: function (e) {
                    return "boolean" == typeof e ? e ? this.show() : this.hide() : this.each(function () {
                        De(this) ? re(this).show() : re(this).hide()
                    })
                }
            }), re.Tween = L, L.prototype = {
                constructor: L, init: function (e, t, n, i, o, r) {
                    this.elem = e, this.prop = n, this.easing = o || "swing", this.options = t, this.start = this.now = this.cur(), this.end = i, this.unit = r || (re.cssNumber[n] ? "" : "px")
                }, cur: function () {
                    var e = L.propHooks[this.prop];
                    return e && e.get ? e.get(this) : L.propHooks._default.get(this)
                }, run: function (e) {
                    var t, n = L.propHooks[this.prop];
                    return this.pos = t = this.options.duration ? re.easing[this.easing](e, this.options.duration * e, 0, 1, this.options.duration) : e, this.now = (this.end - this.start) * t + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), n && n.set ? n.set(this) : L.propHooks._default.set(this), this
                }
            }, L.prototype.init.prototype = L.prototype, L.propHooks = {
                _default: {
                    get: function (e) {
                        var t;
                        return null == e.elem[e.prop] || e.elem.style && null != e.elem.style[e.prop] ? (t = re.css(e.elem, e.prop, ""), t && "auto" !== t ? t : 0) : e.elem[e.prop]
                    }, set: function (e) {
                        re.fx.step[e.prop] ? re.fx.step[e.prop](e) : e.elem.style && (null != e.elem.style[re.cssProps[e.prop]] || re.cssHooks[e.prop]) ? re.style(e.elem, e.prop, e.now + e.unit) : e.elem[e.prop] = e.now
                    }
                }
            }, L.propHooks.scrollTop = L.propHooks.scrollLeft = {
                set: function (e) {
                    e.elem.nodeType && e.elem.parentNode && (e.elem[e.prop] = e.now)
                }
            }, re.easing = {
                linear: function (e) {
                    return e
                }, swing: function (e) {
                    return .5 - Math.cos(e * Math.PI) / 2
                }
            }, re.fx = L.prototype.init, re.fx.step = {};
            var ht, mt, gt = /^(?:toggle|show|hide)$/, vt = new RegExp("^(?:([+-])=|)(" + Se + ")([a-z%]*)$", "i"), yt = /queueHooks$/, bt = [F], xt = {
                "*": [function (e, t) {
                    var n = this.createTween(e, t), i = n.cur(), o = vt.exec(t), r = o && o[3] || (re.cssNumber[e] ? "" : "px"), s = (re.cssNumber[e] || "px" !== r && +i) && vt.exec(re.css(n.elem, e)), a = 1, l = 20;
                    if (s && s[3] !== r) {
                        r = r || s[3], o = o || [], s = +i || 1;
                        do a = a || ".5", s /= a, re.style(n.elem, e, s + r); while (a !== (a = n.cur() / i) && 1 !== a && --l)
                    }
                    return o && (s = n.start = +s || +i || 0, n.unit = r, n.end = o[1] ? s + (o[1] + 1) * o[2] : +o[2]), n
                }]
            };
            re.Animation = re.extend(R, {
                tweener: function (e, t) {
                    re.isFunction(e) ? (t = e, e = ["*"]) : e = e.split(" ");
                    for (var n, i = 0, o = e.length; o > i; i++)n = e[i], xt[n] = xt[n] || [], xt[n].unshift(t)
                }, prefilter: function (e, t) {
                    t ? bt.unshift(e) : bt.push(e)
                }
            }), re.speed = function (e, t, n) {
                var i = e && "object" == typeof e ? re.extend({}, e) : {
                    complete: n || !n && t || re.isFunction(e) && e,
                    duration: e,
                    easing: n && t || t && !re.isFunction(t) && t
                };
                return i.duration = re.fx.off ? 0 : "number" == typeof i.duration ? i.duration : i.duration in re.fx.speeds ? re.fx.speeds[i.duration] : re.fx.speeds._default, (null == i.queue || i.queue === !0) && (i.queue = "fx"), i.old = i.complete, i.complete = function () {
                    re.isFunction(i.old) && i.old.call(this), i.queue && re.dequeue(this, i.queue)
                }, i
            }, re.fn.extend({
                fadeTo: function (e, t, n, i) {
                    return this.filter(De).css("opacity", 0).show().end().animate({opacity: t}, e, n, i)
                }, animate: function (e, t, n, i) {
                    var o = re.isEmptyObject(e), r = re.speed(t, n, i), s = function () {
                        var t = R(this, re.extend({}, e), r);
                        (o || re._data(this, "finish")) && t.stop(!0)
                    };
                    return s.finish = s, o || r.queue === !1 ? this.each(s) : this.queue(r.queue, s)
                }, stop: function (e, t, n) {
                    var i = function (e) {
                        var t = e.stop;
                        delete e.stop, t(n)
                    };
                    return "string" != typeof e && (n = t, t = e, e = void 0), t && e !== !1 && this.queue(e || "fx", []), this.each(function () {
                        var t = !0, o = null != e && e + "queueHooks", r = re.timers, s = re._data(this);
                        if (o)s[o] && s[o].stop && i(s[o]); else for (o in s)s[o] && s[o].stop && yt.test(o) && i(s[o]);
                        for (o = r.length; o--;)r[o].elem !== this || null != e && r[o].queue !== e || (r[o].anim.stop(n), t = !1, r.splice(o, 1));
                        (t || !n) && re.dequeue(this, e)
                    })
                }, finish: function (e) {
                    return e !== !1 && (e = e || "fx"), this.each(function () {
                        var t, n = re._data(this), i = n[e + "queue"], o = n[e + "queueHooks"], r = re.timers, s = i ? i.length : 0;
                        for (n.finish = !0, re.queue(this, e, []), o && o.stop && o.stop.call(this, !0), t = r.length; t--;)r[t].elem === this && r[t].queue === e && (r[t].anim.stop(!0), r.splice(t, 1));
                        for (t = 0; s > t; t++)i[t] && i[t].finish && i[t].finish.call(this);
                        delete n.finish
                    })
                }
            }), re.each(["toggle", "show", "hide"], function (e, t) {
                var n = re.fn[t];
                re.fn[t] = function (e, i, o) {
                    return null == e || "boolean" == typeof e ? n.apply(this, arguments) : this.animate(H(t, !0), e, i, o)
                }
            }), re.each({
                slideDown: H("show"),
                slideUp: H("hide"),
                slideToggle: H("toggle"),
                fadeIn: {opacity: "show"},
                fadeOut: {opacity: "hide"},
                fadeToggle: {opacity: "toggle"}
            }, function (e, t) {
                re.fn[e] = function (e, n, i) {
                    return this.animate(t, e, n, i)
                }
            }), re.timers = [], re.fx.tick = function () {
                var e, t = re.timers, n = 0;
                for (ht = re.now(); n < t.length; n++)e = t[n], e() || t[n] !== e || t.splice(n--, 1);
                t.length || re.fx.stop(), ht = void 0
            }, re.fx.timer = function (e) {
                re.timers.push(e), e() ? re.fx.start() : re.timers.pop()
            }, re.fx.interval = 13, re.fx.start = function () {
                mt || (mt = setInterval(re.fx.tick, re.fx.interval))
            }, re.fx.stop = function () {
                clearInterval(mt), mt = null
            }, re.fx.speeds = {slow: 600, fast: 200, _default: 400}, re.fn.delay = function (e, t) {
                return e = re.fx ? re.fx.speeds[e] || e : e, t = t || "fx", this.queue(t, function (t, n) {
                    var i = setTimeout(t, e);
                    n.stop = function () {
                        clearTimeout(i)
                    }
                })
            }, function () {
                var e, t, n, i, o = me.createElement("div");
                o.setAttribute("className", "t"), o.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", e = o.getElementsByTagName("a")[0], n = me.createElement("select"), i = n.appendChild(me.createElement("option")), t = o.getElementsByTagName("input")[0], e.style.cssText = "top:1px", ie.getSetAttribute = "t" !== o.className, ie.style = /top/.test(e.getAttribute("style")), ie.hrefNormalized = "/a" === e.getAttribute("href"), ie.checkOn = !!t.value, ie.optSelected = i.selected, ie.enctype = !!me.createElement("form").enctype, n.disabled = !0, ie.optDisabled = !i.disabled, t = me.createElement("input"), t.setAttribute("value", ""), ie.input = "" === t.getAttribute("value"), t.value = "t", t.setAttribute("type", "radio"), ie.radioValue = "t" === t.value, e = t = n = i = o = null
            }();
            var wt = /\r/g;
            re.fn.extend({
                val: function (e) {
                    var t, n, i, o = this[0];
                    return arguments.length ? (i = re.isFunction(e), this.each(function (n) {
                        var o;
                        1 === this.nodeType && (o = i ? e.call(this, n, re(this).val()) : e, null == o ? o = "" : "number" == typeof o ? o += "" : re.isArray(o) && (o = re.map(o, function (e) {
                            return null == e ? "" : e + ""
                        })), t = re.valHooks[this.type] || re.valHooks[this.nodeName.toLowerCase()], t && "set" in t && void 0 !== t.set(this, o, "value") || (this.value = o))
                    })) : o ? (t = re.valHooks[o.type] || re.valHooks[o.nodeName.toLowerCase()], t && "get" in t && void 0 !== (n = t.get(o, "value")) ? n : (n = o.value, "string" == typeof n ? n.replace(wt, "") : null == n ? "" : n)) : void 0
                }
            }), re.extend({
                valHooks: {
                    option: {
                        get: function (e) {
                            var t = re.find.attr(e, "value");
                            return null != t ? t : re.text(e)
                        }
                    }, select: {
                        get: function (e) {
                            for (var t, n, i = e.options, o = e.selectedIndex, r = "select-one" === e.type || 0 > o, s = r ? null : [], a = r ? o + 1 : i.length, l = 0 > o ? a : r ? o : 0; a > l; l++)if (n = i[l], !(!n.selected && l !== o || (ie.optDisabled ? n.disabled : null !== n.getAttribute("disabled")) || n.parentNode.disabled && re.nodeName(n.parentNode, "optgroup"))) {
                                if (t = re(n).val(), r)return t;
                                s.push(t)
                            }
                            return s
                        }, set: function (e, t) {
                            for (var n, i, o = e.options, r = re.makeArray(t), s = o.length; s--;)if (i = o[s], re.inArray(re.valHooks.option.get(i), r) >= 0)try {
                                i.selected = n = !0
                            } catch (a) {
                                i.scrollHeight
                            } else i.selected = !1;
                            return n || (e.selectedIndex = -1), o
                        }
                    }
                }
            }), re.each(["radio", "checkbox"], function () {
                re.valHooks[this] = {
                    set: function (e, t) {
                        return re.isArray(t) ? e.checked = re.inArray(re(e).val(), t) >= 0 : void 0
                    }
                }, ie.checkOn || (re.valHooks[this].get = function (e) {
                    return null === e.getAttribute("value") ? "on" : e.value
                })
            });
            var Tt, Ct, Nt = re.expr.attrHandle, Et = /^(?:checked|selected)$/i, kt = ie.getSetAttribute, St = ie.input;
            re.fn.extend({
                attr: function (e, t) {
                    return $e(this, re.attr, e, t, arguments.length > 1)
                }, removeAttr: function (e) {
                    return this.each(function () {
                        re.removeAttr(this, e)
                    })
                }
            }), re.extend({
                attr: function (e, t, n) {
                    var i, o, r = e.nodeType;
                    return e && 3 !== r && 8 !== r && 2 !== r ? typeof e.getAttribute === Ne ? re.prop(e, t, n) : (1 === r && re.isXMLDoc(e) || (t = t.toLowerCase(), i = re.attrHooks[t] || (re.expr.match.bool.test(t) ? Ct : Tt)), void 0 === n ? i && "get" in i && null !== (o = i.get(e, t)) ? o : (o = re.find.attr(e, t), null == o ? void 0 : o) : null !== n ? i && "set" in i && void 0 !== (o = i.set(e, n, t)) ? o : (e.setAttribute(t, n + ""), n) : void re.removeAttr(e, t)) : void 0
                }, removeAttr: function (e, t) {
                    var n, i, o = 0, r = t && t.match(xe);
                    if (r && 1 === e.nodeType)for (; n = r[o++];)i = re.propFix[n] || n, re.expr.match.bool.test(n) ? St && kt || !Et.test(n) ? e[i] = !1 : e[re.camelCase("default-" + n)] = e[i] = !1 : re.attr(e, n, ""), e.removeAttribute(kt ? n : i)
                }, attrHooks: {
                    type: {
                        set: function (e, t) {
                            if (!ie.radioValue && "radio" === t && re.nodeName(e, "input")) {
                                var n = e.value;
                                return e.setAttribute("type", t), n && (e.value = n), t
                            }
                        }
                    }
                }
            }), Ct = {
                set: function (e, t, n) {
                    return t === !1 ? re.removeAttr(e, n) : St && kt || !Et.test(n) ? e.setAttribute(!kt && re.propFix[n] || n, n) : e[re.camelCase("default-" + n)] = e[n] = !0, n
                }
            }, re.each(re.expr.match.bool.source.match(/\w+/g), function (e, t) {
                var n = Nt[t] || re.find.attr;
                Nt[t] = St && kt || !Et.test(t) ? function (e, t, i) {
                    var o, r;
                    return i || (r = Nt[t], Nt[t] = o, o = null != n(e, t, i) ? t.toLowerCase() : null, Nt[t] = r), o
                } : function (e, t, n) {
                    return n ? void 0 : e[re.camelCase("default-" + t)] ? t.toLowerCase() : null
                }
            }), St && kt || (re.attrHooks.value = {
                set: function (e, t, n) {
                    return re.nodeName(e, "input") ? void(e.defaultValue = t) : Tt && Tt.set(e, t, n)
                }
            }), kt || (Tt = {
                set: function (e, t, n) {
                    var i = e.getAttributeNode(n);
                    return i || e.setAttributeNode(i = e.ownerDocument.createAttribute(n)), i.value = t += "", "value" === n || t === e.getAttribute(n) ? t : void 0
                }
            }, Nt.id = Nt.name = Nt.coords = function (e, t, n) {
                var i;
                return n ? void 0 : (i = e.getAttributeNode(t)) && "" !== i.value ? i.value : null
            }, re.valHooks.button = {
                get: function (e, t) {
                    var n = e.getAttributeNode(t);
                    return n && n.specified ? n.value : void 0
                }, set: Tt.set
            }, re.attrHooks.contenteditable = {
                set: function (e, t, n) {
                    Tt.set(e, "" === t ? !1 : t, n)
                }
            }, re.each(["width", "height"], function (e, t) {
                re.attrHooks[t] = {
                    set: function (e, n) {
                        return "" === n ? (e.setAttribute(t, "auto"), n) : void 0
                    }
                }
            })), ie.style || (re.attrHooks.style = {
                get: function (e) {
                    return e.style.cssText || void 0
                }, set: function (e, t) {
                    return e.style.cssText = t + ""
                }
            });
            var At = /^(?:input|select|textarea|button|object)$/i, Dt = /^(?:a|area)$/i;
            re.fn.extend({
                prop: function (e, t) {
                    return $e(this, re.prop, e, t, arguments.length > 1)
                }, removeProp: function (e) {
                    return e = re.propFix[e] || e, this.each(function () {
                        try {
                            this[e] = void 0, delete this[e]
                        } catch (t) {
                        }
                    })
                }
            }), re.extend({
                propFix: {"for": "htmlFor", "class": "className"}, prop: function (e, t, n) {
                    var i, o, r, s = e.nodeType;
                    return e && 3 !== s && 8 !== s && 2 !== s ? (r = 1 !== s || !re.isXMLDoc(e), r && (t = re.propFix[t] || t, o = re.propHooks[t]), void 0 !== n ? o && "set" in o && void 0 !== (i = o.set(e, n, t)) ? i : e[t] = n : o && "get" in o && null !== (i = o.get(e, t)) ? i : e[t]) : void 0
                }, propHooks: {
                    tabIndex: {
                        get: function (e) {
                            var t = re.find.attr(e, "tabindex");
                            return t ? parseInt(t, 10) : At.test(e.nodeName) || Dt.test(e.nodeName) && e.href ? 0 : -1
                        }
                    }
                }
            }), ie.hrefNormalized || re.each(["href", "src"], function (e, t) {
                re.propHooks[t] = {
                    get: function (e) {
                        return e.getAttribute(t, 4)
                    }
                }
            }), ie.optSelected || (re.propHooks.selected = {
                get: function (e) {
                    var t = e.parentNode;
                    return t && (t.selectedIndex, t.parentNode && t.parentNode.selectedIndex), null
                }
            }), re.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function () {
                re.propFix[this.toLowerCase()] = this
            }), ie.enctype || (re.propFix.enctype = "encoding");
            var $t = /[\t\r\n\f]/g;
            re.fn.extend({
                addClass: function (e) {
                    var t, n, i, o, r, s, a = 0, l = this.length, u = "string" == typeof e && e;
                    if (re.isFunction(e))return this.each(function (t) {
                        re(this).addClass(e.call(this, t, this.className))
                    });
                    if (u)for (t = (e || "").match(xe) || []; l > a; a++)if (n = this[a], i = 1 === n.nodeType && (n.className ? (" " + n.className + " ").replace($t, " ") : " ")) {
                        for (r = 0; o = t[r++];)i.indexOf(" " + o + " ") < 0 && (i += o + " ");
                        s = re.trim(i), n.className !== s && (n.className = s)
                    }
                    return this
                }, removeClass: function (e) {
                    var t, n, i, o, r, s, a = 0, l = this.length, u = 0 === arguments.length || "string" == typeof e && e;
                    if (re.isFunction(e))return this.each(function (t) {
                        re(this).removeClass(e.call(this, t, this.className))
                    });
                    if (u)for (t = (e || "").match(xe) || []; l > a; a++)if (n = this[a], i = 1 === n.nodeType && (n.className ? (" " + n.className + " ").replace($t, " ") : "")) {
                        for (r = 0; o = t[r++];)for (; i.indexOf(" " + o + " ") >= 0;)i = i.replace(" " + o + " ", " ");
                        s = e ? re.trim(i) : "", n.className !== s && (n.className = s)
                    }
                    return this
                }, toggleClass: function (e, t) {
                    var n = typeof e;
                    return "boolean" == typeof t && "string" === n ? t ? this.addClass(e) : this.removeClass(e) : this.each(re.isFunction(e) ? function (n) {
                        re(this).toggleClass(e.call(this, n, this.className, t), t)
                    } : function () {
                        if ("string" === n)for (var t, i = 0, o = re(this), r = e.match(xe) || []; t = r[i++];)o.hasClass(t) ? o.removeClass(t) : o.addClass(t); else(n === Ne || "boolean" === n) && (this.className && re._data(this, "__className__", this.className), this.className = this.className || e === !1 ? "" : re._data(this, "__className__") || "")
                    })
                }, hasClass: function (e) {
                    for (var t = " " + e + " ", n = 0, i = this.length; i > n; n++)if (1 === this[n].nodeType && (" " + this[n].className + " ").replace($t, " ").indexOf(t) >= 0)return !0;
                    return !1
                }
            }), re.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function (e, t) {
                re.fn[t] = function (e, n) {
                    return arguments.length > 0 ? this.on(t, null, e, n) : this.trigger(t)
                }
            }), re.fn.extend({
                hover: function (e, t) {
                    return this.mouseenter(e).mouseleave(t || e)
                }, bind: function (e, t, n) {
                    return this.on(e, null, t, n)
                }, unbind: function (e, t) {
                    return this.off(e, null, t)
                }, delegate: function (e, t, n, i) {
                    return this.on(t, e, n, i)
                }, undelegate: function (e, t, n) {
                    return 1 === arguments.length ? this.off(e, "**") : this.off(t, e || "**", n)
                }
            });
            var jt = re.now(), Lt = /\?/, Ot = /(,)|(\[|{)|(}|])|"(?:[^"\\\r\n]|\\["\\\/bfnrt]|\\u[\da-fA-F]{4})*"\s*:?|true|false|null|-?(?!0\d)\d+(?:\.\d+|)(?:[eE][+-]?\d+|)/g;
            re.parseJSON = function (t) {
                if (e.JSON && e.JSON.parse)return e.JSON.parse(t + "");
                var n, i = null, o = re.trim(t + "");
                return o && !re.trim(o.replace(Ot, function (e, t, o, r) {
                    return n && t && (i = 0), 0 === i ? e : (n = o || t, i += !r - !o, "")
                })) ? Function("return " + o)() : re.error("Invalid JSON: " + t)
            }, re.parseXML = function (t) {
                var n, i;
                if (!t || "string" != typeof t)return null;
                try {
                    e.DOMParser ? (i = new DOMParser, n = i.parseFromString(t, "text/xml")) : (n = new ActiveXObject("Microsoft.XMLDOM"), n.async = "false", n.loadXML(t))
                } catch (o) {
                    n = void 0
                }
                return n && n.documentElement && !n.getElementsByTagName("parsererror").length || re.error("Invalid XML: " + t), n
            };
            var Ht, _t, Ft = /#.*$/, qt = /([?&])_=[^&]*/, Rt = /^(.*?):[ \t]*([^\r\n]*)\r?$/gm, Mt = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/, Bt = /^(?:GET|HEAD)$/, It = /^\/\//, Pt = /^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/, Wt = {}, zt = {}, Ut = "*/".concat("*");
            try {
                _t = location.href
            } catch (Xt) {
                _t = me.createElement("a"), _t.href = "", _t = _t.href
            }
            Ht = Pt.exec(_t.toLowerCase()) || [], re.extend({
                active: 0,
                lastModified: {},
                etag: {},
                ajaxSettings: {
                    url: _t,
                    type: "GET",
                    isLocal: Mt.test(Ht[1]),
                    global: !0,
                    processData: !0,
                    async: !0,
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    accepts: {
                        "*": Ut,
                        text: "text/plain",
                        html: "text/html",
                        xml: "application/xml, text/xml",
                        json: "application/json, text/javascript"
                    },
                    contents: {xml: /xml/, html: /html/, json: /json/},
                    responseFields: {xml: "responseXML", text: "responseText", json: "responseJSON"},
                    converters: {"* text": String, "text html": !0, "text json": re.parseJSON, "text xml": re.parseXML},
                    flatOptions: {url: !0, context: !0}
                },
                ajaxSetup: function (e, t) {
                    return t ? I(I(e, re.ajaxSettings), t) : I(re.ajaxSettings, e)
                },
                ajaxPrefilter: M(Wt),
                ajaxTransport: M(zt),
                ajax: function (e, t) {
                    function n(e, t, n, i) {
                        var o, c, v, y, x, T = t;
                        2 !== b && (b = 2, a && clearTimeout(a), u = void 0, s = i || "", w.readyState = e > 0 ? 4 : 0, o = e >= 200 && 300 > e || 304 === e, n && (y = P(d, w, n)), y = W(d, y, w, o), o ? (d.ifModified && (x = w.getResponseHeader("Last-Modified"), x && (re.lastModified[r] = x), x = w.getResponseHeader("etag"), x && (re.etag[r] = x)), 204 === e || "HEAD" === d.type ? T = "nocontent" : 304 === e ? T = "notmodified" : (T = y.state, c = y.data, v = y.error, o = !v)) : (v = T, (e || !T) && (T = "error", 0 > e && (e = 0))), w.status = e, w.statusText = (t || T) + "", o ? h.resolveWith(p, [c, T, w]) : h.rejectWith(p, [w, T, v]), w.statusCode(g), g = void 0, l && f.trigger(o ? "ajaxSuccess" : "ajaxError", [w, d, o ? c : v]), m.fireWith(p, [w, T]), l && (f.trigger("ajaxComplete", [w, d]), --re.active || re.event.trigger("ajaxStop")))
                    }

                    "object" == typeof e && (t = e, e = void 0), t = t || {};
                    var i, o, r, s, a, l, u, c, d = re.ajaxSetup({}, t), p = d.context || d, f = d.context && (p.nodeType || p.jquery) ? re(p) : re.event, h = re.Deferred(), m = re.Callbacks("once memory"), g = d.statusCode || {}, v = {}, y = {}, b = 0, x = "canceled", w = {
                        readyState: 0,
                        getResponseHeader: function (e) {
                            var t;
                            if (2 === b) {
                                if (!c)for (c = {}; t = Rt.exec(s);)c[t[1].toLowerCase()] = t[2];
                                t = c[e.toLowerCase()]
                            }
                            return null == t ? null : t
                        },
                        getAllResponseHeaders: function () {
                            return 2 === b ? s : null
                        },
                        setRequestHeader: function (e, t) {
                            var n = e.toLowerCase();
                            return b || (e = y[n] = y[n] || e, v[e] = t), this
                        },
                        overrideMimeType: function (e) {
                            return b || (d.mimeType = e), this
                        },
                        statusCode: function (e) {
                            var t;
                            if (e)if (2 > b)for (t in e)g[t] = [g[t], e[t]]; else w.always(e[w.status]);
                            return this
                        },
                        abort: function (e) {
                            var t = e || x;
                            return u && u.abort(t), n(0, t), this
                        }
                    };
                    if (h.promise(w).complete = m.add, w.success = w.done, w.error = w.fail, d.url = ((e || d.url || _t) + "").replace(Ft, "").replace(It, Ht[1] + "//"), d.type = t.method || t.type || d.method || d.type, d.dataTypes = re.trim(d.dataType || "*").toLowerCase().match(xe) || [""], null == d.crossDomain && (i = Pt.exec(d.url.toLowerCase()), d.crossDomain = !(!i || i[1] === Ht[1] && i[2] === Ht[2] && (i[3] || ("http:" === i[1] ? "80" : "443")) === (Ht[3] || ("http:" === Ht[1] ? "80" : "443")))), d.data && d.processData && "string" != typeof d.data && (d.data = re.param(d.data, d.traditional)), B(Wt, d, t, w), 2 === b)return w;
                    l = d.global, l && 0 === re.active++ && re.event.trigger("ajaxStart"), d.type = d.type.toUpperCase(), d.hasContent = !Bt.test(d.type), r = d.url, d.hasContent || (d.data && (r = d.url += (Lt.test(r) ? "&" : "?") + d.data, delete d.data), d.cache === !1 && (d.url = qt.test(r) ? r.replace(qt, "$1_=" + jt++) : r + (Lt.test(r) ? "&" : "?") + "_=" + jt++)), d.ifModified && (re.lastModified[r] && w.setRequestHeader("If-Modified-Since", re.lastModified[r]), re.etag[r] && w.setRequestHeader("If-None-Match", re.etag[r])), (d.data && d.hasContent && d.contentType !== !1 || t.contentType) && w.setRequestHeader("Content-Type", d.contentType), w.setRequestHeader("Accept", d.dataTypes[0] && d.accepts[d.dataTypes[0]] ? d.accepts[d.dataTypes[0]] + ("*" !== d.dataTypes[0] ? ", " + Ut + "; q=0.01" : "") : d.accepts["*"]);
                    for (o in d.headers)w.setRequestHeader(o, d.headers[o]);
                    if (d.beforeSend && (d.beforeSend.call(p, w, d) === !1 || 2 === b))return w.abort();
                    x = "abort";
                    for (o in{success: 1, error: 1, complete: 1})w[o](d[o]);
                    if (u = B(zt, d, t, w)) {
                        w.readyState = 1, l && f.trigger("ajaxSend", [w, d]), d.async && d.timeout > 0 && (a = setTimeout(function () {
                            w.abort("timeout")
                        }, d.timeout));
                        try {
                            b = 1, u.send(v, n)
                        } catch (T) {
                            if (!(2 > b))throw T;
                            n(-1, T)
                        }
                    } else n(-1, "No Transport");
                    return w
                },
                getJSON: function (e, t, n) {
                    return re.get(e, t, n, "json")
                },
                getScript: function (e, t) {
                    return re.get(e, void 0, t, "script")
                }
            }), re.each(["get", "post"], function (e, t) {
                re[t] = function (e, n, i, o) {
                    return re.isFunction(n) && (o = o || i, i = n, n = void 0), re.ajax({
                        url: e,
                        type: t,
                        dataType: o,
                        data: n,
                        success: i
                    })
                }
            }), re.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function (e, t) {
                re.fn[t] = function (e) {
                    return this.on(t, e)
                }
            }), re._evalUrl = function (e) {
                return re.ajax({url: e, type: "GET", dataType: "script", async: !1, global: !1, "throws": !0})
            }, re.fn.extend({
                wrapAll: function (e) {
                    if (re.isFunction(e))return this.each(function (t) {
                        re(this).wrapAll(e.call(this, t))
                    });
                    if (this[0]) {
                        var t = re(e, this[0].ownerDocument).eq(0).clone(!0);
                        this[0].parentNode && t.insertBefore(this[0]), t.map(function () {
                            for (var e = this; e.firstChild && 1 === e.firstChild.nodeType;)e = e.firstChild;
                            return e
                        }).append(this)
                    }
                    return this
                }, wrapInner: function (e) {
                    return this.each(re.isFunction(e) ? function (t) {
                        re(this).wrapInner(e.call(this, t))
                    } : function () {
                        var t = re(this), n = t.contents();
                        n.length ? n.wrapAll(e) : t.append(e)
                    })
                }, wrap: function (e) {
                    var t = re.isFunction(e);
                    return this.each(function (n) {
                        re(this).wrapAll(t ? e.call(this, n) : e)
                    })
                }, unwrap: function () {
                    return this.parent().each(function () {
                        re.nodeName(this, "body") || re(this).replaceWith(this.childNodes)
                    }).end()
                }
            }), re.expr.filters.hidden = function (e) {
                return e.offsetWidth <= 0 && e.offsetHeight <= 0 || !ie.reliableHiddenOffsets() && "none" === (e.style && e.style.display || re.css(e, "display"))
            }, re.expr.filters.visible = function (e) {
                return !re.expr.filters.hidden(e)
            };
            var Vt = /%20/g, Qt = /\[\]$/, Yt = /\r?\n/g, Jt = /^(?:submit|button|image|reset|file)$/i, Zt = /^(?:input|select|textarea|keygen)/i;
            re.param = function (e, t) {
                var n, i = [], o = function (e, t) {
                    t = re.isFunction(t) ? t() : null == t ? "" : t, i[i.length] = encodeURIComponent(e) + "=" + encodeURIComponent(t)
                };
                if (void 0 === t && (t = re.ajaxSettings && re.ajaxSettings.traditional), re.isArray(e) || e.jquery && !re.isPlainObject(e))re.each(e, function () {
                    o(this.name, this.value)
                }); else for (n in e)z(n, e[n], t, o);
                return i.join("&").replace(Vt, "+")
            }, re.fn.extend({
                serialize: function () {
                    return re.param(this.serializeArray())
                }, serializeArray: function () {
                    return this.map(function () {
                        var e = re.prop(this, "elements");
                        return e ? re.makeArray(e) : this
                    }).filter(function () {
                        var e = this.type;
                        return this.name && !re(this).is(":disabled") && Zt.test(this.nodeName) && !Jt.test(e) && (this.checked || !je.test(e))
                    }).map(function (e, t) {
                        var n = re(this).val();
                        return null == n ? null : re.isArray(n) ? re.map(n, function (e) {
                            return {name: t.name, value: e.replace(Yt, "\r\n")}
                        }) : {name: t.name, value: n.replace(Yt, "\r\n")}
                    }).get()
                }
            }), re.ajaxSettings.xhr = void 0 !== e.ActiveXObject ? function () {
                return !this.isLocal && /^(get|post|head|put|delete|options)$/i.test(this.type) && U() || X()
            } : U;
            var Kt = 0, Gt = {}, en = re.ajaxSettings.xhr();
            e.ActiveXObject && re(e).on("unload", function () {
                for (var e in Gt)Gt[e](void 0, !0)
            }), ie.cors = !!en && "withCredentials" in en, en = ie.ajax = !!en, en && re.ajaxTransport(function (e) {
                if (!e.crossDomain || ie.cors) {
                    var t;
                    return {
                        send: function (n, i) {
                            var o, r = e.xhr(), s = ++Kt;
                            if (r.open(e.type, e.url, e.async, e.username, e.password), e.xhrFields)for (o in e.xhrFields)r[o] = e.xhrFields[o];
                            e.mimeType && r.overrideMimeType && r.overrideMimeType(e.mimeType), e.crossDomain || n["X-Requested-With"] || (n["X-Requested-With"] = "XMLHttpRequest");
                            for (o in n)void 0 !== n[o] && r.setRequestHeader(o, n[o] + "");
                            r.send(e.hasContent && e.data || null), t = function (n, o) {
                                var a, l, u;
                                if (t && (o || 4 === r.readyState))if (delete Gt[s], t = void 0, r.onreadystatechange = re.noop, o)4 !== r.readyState && r.abort(); else {
                                    u = {}, a = r.status, "string" == typeof r.responseText && (u.text = r.responseText);
                                    try {
                                        l = r.statusText
                                    } catch (c) {
                                        l = ""
                                    }
                                    a || !e.isLocal || e.crossDomain ? 1223 === a && (a = 204) : a = u.text ? 200 : 404
                                }
                                u && i(a, l, u, r.getAllResponseHeaders())
                            }, e.async ? 4 === r.readyState ? setTimeout(t) : r.onreadystatechange = Gt[s] = t : t()
                        }, abort: function () {
                            t && t(void 0, !0)
                        }
                    }
                }
            }), re.ajaxSetup({
                accepts: {script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},
                contents: {script: /(?:java|ecma)script/},
                converters: {
                    "text script": function (e) {
                        return re.globalEval(e), e
                    }
                }
            }), re.ajaxPrefilter("script", function (e) {
                void 0 === e.cache && (e.cache = !1), e.crossDomain && (e.type = "GET", e.global = !1)
            }), re.ajaxTransport("script", function (e) {
                if (e.crossDomain) {
                    var t, n = me.head || re("head")[0] || me.documentElement;
                    return {
                        send: function (i, o) {
                            t = me.createElement("script"), t.async = !0, e.scriptCharset && (t.charset = e.scriptCharset), t.src = e.url, t.onload = t.onreadystatechange = function (e, n) {
                                (n || !t.readyState || /loaded|complete/.test(t.readyState)) && (t.onload = t.onreadystatechange = null, t.parentNode && t.parentNode.removeChild(t), t = null, n || o(200, "success"))
                            }, n.insertBefore(t, n.firstChild)
                        }, abort: function () {
                            t && t.onload(void 0, !0)
                        }
                    }
                }
            });
            var tn = [], nn = /(=)\?(?=&|$)|\?\?/;
            re.ajaxSetup({
                jsonp: "callback", jsonpCallback: function () {
                    var e = tn.pop() || re.expando + "_" + jt++;
                    return this[e] = !0, e
                }
            }), re.ajaxPrefilter("json jsonp", function (t, n, i) {
                var o, r, s, a = t.jsonp !== !1 && (nn.test(t.url) ? "url" : "string" == typeof t.data && !(t.contentType || "").indexOf("application/x-www-form-urlencoded") && nn.test(t.data) && "data");
                return a || "jsonp" === t.dataTypes[0] ? (o = t.jsonpCallback = re.isFunction(t.jsonpCallback) ? t.jsonpCallback() : t.jsonpCallback, a ? t[a] = t[a].replace(nn, "$1" + o) : t.jsonp !== !1 && (t.url += (Lt.test(t.url) ? "&" : "?") + t.jsonp + "=" + o), t.converters["script json"] = function () {
                    return s || re.error(o + " was not called"), s[0]
                }, t.dataTypes[0] = "json", r = e[o], e[o] = function () {
                    s = arguments
                }, i.always(function () {
                    e[o] = r, t[o] && (t.jsonpCallback = n.jsonpCallback, tn.push(o)), s && re.isFunction(r) && r(s[0]), s = r = void 0
                }), "script") : void 0
            }), re.parseHTML = function (e, t, n) {
                if (!e || "string" != typeof e)return null;
                "boolean" == typeof t && (n = t, t = !1), t = t || me;
                var i = pe.exec(e), o = !n && [];
                return i ? [t.createElement(i[1])] : (i = re.buildFragment([e], t, o), o && o.length && re(o).remove(), re.merge([], i.childNodes))
            };
            var on = re.fn.load;
            re.fn.load = function (e, t, n) {
                if ("string" != typeof e && on)return on.apply(this, arguments);
                var i, o, r, s = this, a = e.indexOf(" ");
                return a >= 0 && (i = e.slice(a, e.length), e = e.slice(0, a)), re.isFunction(t) ? (n = t, t = void 0) : t && "object" == typeof t && (r = "POST"), s.length > 0 && re.ajax({
                    url: e,
                    type: r,
                    dataType: "html",
                    data: t
                }).done(function (e) {
                    o = arguments, s.html(i ? re("<div>").append(re.parseHTML(e)).find(i) : e)
                }).complete(n && function (e, t) {
                        s.each(n, o || [e.responseText, t, e])
                    }), this
            }, re.expr.filters.animated = function (e) {
                return re.grep(re.timers, function (t) {
                    return e === t.elem
                }).length
            };
            var rn = e.document.documentElement;
            re.offset = {
                setOffset: function (e, t, n) {
                    var i, o, r, s, a, l, u, c = re.css(e, "position"), d = re(e), p = {};
                    "static" === c && (e.style.position = "relative"), a = d.offset(), r = re.css(e, "top"), l = re.css(e, "left"), u = ("absolute" === c || "fixed" === c) && re.inArray("auto", [r, l]) > -1, u ? (i = d.position(), s = i.top, o = i.left) : (s = parseFloat(r) || 0, o = parseFloat(l) || 0), re.isFunction(t) && (t = t.call(e, n, a)), null != t.top && (p.top = t.top - a.top + s), null != t.left && (p.left = t.left - a.left + o), "using" in t ? t.using.call(e, p) : d.css(p)
                }
            }, re.fn.extend({
                offset: function (e) {
                    if (arguments.length)return void 0 === e ? this : this.each(function (t) {
                        re.offset.setOffset(this, e, t)
                    });
                    var t, n, i = {top: 0, left: 0}, o = this[0], r = o && o.ownerDocument;
                    return r ? (t = r.documentElement, re.contains(t, o) ? (typeof o.getBoundingClientRect !== Ne && (i = o.getBoundingClientRect()), n = V(r), {
                        top: i.top + (n.pageYOffset || t.scrollTop) - (t.clientTop || 0),
                        left: i.left + (n.pageXOffset || t.scrollLeft) - (t.clientLeft || 0)
                    }) : i) : void 0
                }, position: function () {
                    if (this[0]) {
                        var e, t, n = {top: 0, left: 0}, i = this[0];
                        return "fixed" === re.css(i, "position") ? t = i.getBoundingClientRect() : (e = this.offsetParent(), t = this.offset(), re.nodeName(e[0], "html") || (n = e.offset()), n.top += re.css(e[0], "borderTopWidth", !0), n.left += re.css(e[0], "borderLeftWidth", !0)), {
                            top: t.top - n.top - re.css(i, "marginTop", !0),
                            left: t.left - n.left - re.css(i, "marginLeft", !0)
                        }
                    }
                }, offsetParent: function () {
                    return this.map(function () {
                        for (var e = this.offsetParent || rn; e && !re.nodeName(e, "html") && "static" === re.css(e, "position");)e = e.offsetParent;
                        return e || rn
                    })
                }
            }), re.each({scrollLeft: "pageXOffset", scrollTop: "pageYOffset"}, function (e, t) {
                var n = /Y/.test(t);
                re.fn[e] = function (i) {
                    return $e(this, function (e, i, o) {
                        var r = V(e);
                        return void 0 === o ? r ? t in r ? r[t] : r.document.documentElement[i] : e[i] : void(r ? r.scrollTo(n ? re(r).scrollLeft() : o, n ? o : re(r).scrollTop()) : e[i] = o)
                    }, e, i, arguments.length, null)
                }
            }), re.each(["top", "left"], function (e, t) {
                re.cssHooks[t] = k(ie.pixelPosition, function (e, n) {
                    return n ? (n = nt(e, t), ot.test(n) ? re(e).position()[t] + "px" : n) : void 0
                })
            }), re.each({Height: "height", Width: "width"}, function (e, t) {
                re.each({padding: "inner" + e, content: t, "": "outer" + e}, function (n, i) {
                    re.fn[i] = function (i, o) {
                        var r = arguments.length && (n || "boolean" != typeof i), s = n || (i === !0 || o === !0 ? "margin" : "border");
                        return $e(this, function (t, n, i) {
                            var o;
                            return re.isWindow(t) ? t.document.documentElement["client" + e] : 9 === t.nodeType ? (o = t.documentElement, Math.max(t.body["scroll" + e], o["scroll" + e], t.body["offset" + e], o["offset" + e], o["client" + e])) : void 0 === i ? re.css(t, n, s) : re.style(t, n, i, s)
                        }, t, r ? i : void 0, r, null)
                    }
                })
            }), re.fn.size = function () {
                return this.length
            }, re.fn.andSelf = re.fn.addBack, "function" == typeof define && define.amd && define("jquery", [], function () {
                return re
            });
            var sn = e.jQuery, an = e.$;
            return re.noConflict = function (t) {
                return e.$ === re && (e.$ = an), t && e.jQuery === re && (e.jQuery = sn), re
            }, typeof t === Ne && (e.jQuery = e.$ = re), re
        })
    }, {}],
    3: [function (e, t, n) {
        window.$ = window.jQuery = e("./jquery-1.11.0.min"), e("./tooltip"), e("./popover"), e("./modal"), e("./button"), function (e) {
            function t(n, i) {
                e("#" + n).hasClass("error") ? e("#" + n).hasClass("error") && e("#" + n).removeClass("error") : e("#" + n).addClass("error"), 0 > i || (i -= 1, setTimeout(function () {
                    t(n, i)
                }, 150))
            }

            function n(n, i) {
                e(n).submit(function () {
                    var n = !1, s = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;
                    return e(".require", this).each(function () {
                        "" == e.trim(e(this).val()) ?
                            (t(e(this).attr("id"), 4), n = !0) :
                            ("email" != e(this).attr("name")
                            || s.test(e.trim(e(this).val()))
                            || (o("email", "邮箱格式不正确"), n = !0), "nickname" == e(this).attr("name") && (e.trim(e(this).val()).length < 2 || e.trim(e(this).val()).length > 12) && (o("nickname", "昵称长度为2-12位"), n = !0), "password" == e(this).attr("name") && (e.trim(e(this).val()).length < 6 || e.trim(e(this).val()).length > 32) && (o("password", "密码长度为6-32位"), n = !0), "password2" == e(this).attr("name") && e.trim(e("#password").val()) != e.trim(e("#password2").val()) && (o("password2", "两次密码输入不一致"), n = !0), e(this).bind("focus", function () {
                                r(e(this).attr("id"))
                            }))
                    }), n || e.post(i, e(this).serialize(), function (t) {
                        if (0 == t.errcode) {
                            var n, i = new RegExp("(^|&)from=([^&]*)(&|$)"), o = window.location.search.substr(1).match(i);
                            n = o ? decodeURIComponent(o[2]) : "/member", window.location.href = n
                        } else e("#j-errmsg").fadeIn(50, function () {
                            e(this).html(t.errmsg)
                        })
                    }, "json"), !1
                })
            }

            function i() {
                e(".captcha-img").on("click", function () {
                    e("img", this).attr("src", "/member/captcha?t=" + (new Date).valueOf())
                }), e('input[type="text"],input[type="password"]').on("click", function () {
                    e("#j-errmsg").fadeOut(50)
                }), n("#logForm", "/json/login.do"), n("#regForm", "/json/register.do")
            }

            function o(t, n) {
                e("#" + t).popover({content: n, trigger: "manual", container: "body"}), e("#" + t).popover("show")
            }

            function r(t) {
                e("#" + t).popover("hide")
            }

            i(), e("#rForm").on("submit", function () {
                e("#rForm .btn-loading").button("loading");
                var t = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/, n = e.trim(e("#rForm #email").val());
                return t.test(n) ? e.post("/json/resetpw.do", e(this).serialize(), function (t) {
                    0 == t.errcode ? (alert(t.errmsg), e("#rForm .btn-loading").button("reset"), e("#rBox").modal("hide")) : (e("#rForm .btn-loading").button("reset"), e("#rForm #email").next().html(t.errmsg))
                }, "json") : (e("#rForm #email").parent().parent().addClass("has-error"), e("#rForm #email").next().html("电子邮箱格式不正确"), e("#rForm .btn-loading").button("reset")), e("#rForm #email").bind("focus", function () {
                    e("#rForm #email").parent().parent().removeClass("has-error"), e("#rForm #email").next().html(" ")
                }), !1
            })
        }(jQuery)
    }, {"./button": 1, "./jquery-1.11.0.min": 2, "./modal": 4, "./popover": 5, "./tooltip": 6}],
    4: [function (e, t, n) {
        +function (e) {
            "use strict";
            function t(t, i) {
                return this.each(function () {
                    var o = e(this), r = o.data("bs.modal"), s = e.extend({}, n.DEFAULTS, o.data(), "object" == typeof t && t);
                    r || o.data("bs.modal", r = new n(this, s)), "string" == typeof t ? r[t](i) : s.show && r.show(i)
                })
            }

            var n = function (t, n) {
                this.options = n, this.$body = e(document.body), this.$element = e(t), this.$dialog = this.$element.find(".modal-dialog"), this.$backdrop = null, this.isShown = null, this.originalBodyPad = null, this.scrollbarWidth = 0, this.ignoreBackdropClick = !1, this.options.remote && this.$element.find(".modal-content").load(this.options.remote, e.proxy(function () {
                    this.$element.trigger("loaded.bs.modal")
                }, this))
            };
            n.VERSION = "3.3.5", n.TRANSITION_DURATION = 300, n.BACKDROP_TRANSITION_DURATION = 150, n.DEFAULTS = {
                backdrop: !0,
                keyboard: !0,
                show: !0
            }, n.prototype.toggle = function (e) {
                return this.isShown ? this.hide() : this.show(e)
            }, n.prototype.show = function (t) {
                var i = this, o = e.Event("show.bs.modal", {relatedTarget: t});
                this.$element.trigger(o), this.isShown || o.isDefaultPrevented() || (this.isShown = !0, this.checkScrollbar(), this.setScrollbar(), this.$body.addClass("modal-open"), this.escape(), this.resize(), this.$element.on("click.dismiss.bs.modal", '[data-dismiss="modal"]', e.proxy(this.hide, this)), this.$dialog.on("mousedown.dismiss.bs.modal", function () {
                    i.$element.one("mouseup.dismiss.bs.modal", function (t) {
                        e(t.target).is(i.$element) && (i.ignoreBackdropClick = !0)
                    })
                }), this.backdrop(function () {
                    var o = e.support.transition && i.$element.hasClass("fade");
                    i.$element.parent().length || i.$element.appendTo(i.$body), i.$element.show().scrollTop(0), i.adjustDialog(), o && i.$element[0].offsetWidth, i.$element.addClass("in"), i.enforceFocus();
                    var r = e.Event("shown.bs.modal", {relatedTarget: t});
                    o ? i.$dialog.one("bsTransitionEnd", function () {
                        i.$element.trigger("focus").trigger(r)
                    }).emulateTransitionEnd(n.TRANSITION_DURATION) : i.$element.trigger("focus").trigger(r)
                }))
            }, n.prototype.hide = function (t) {
                t && t.preventDefault(), t = e.Event("hide.bs.modal"), this.$element.trigger(t), this.isShown && !t.isDefaultPrevented() && (this.isShown = !1, this.escape(), this.resize(), e(document).off("focusin.bs.modal"), this.$element.removeClass("in").off("click.dismiss.bs.modal").off("mouseup.dismiss.bs.modal"), this.$dialog.off("mousedown.dismiss.bs.modal"), e.support.transition && this.$element.hasClass("fade") ? this.$element.one("bsTransitionEnd", e.proxy(this.hideModal, this)).emulateTransitionEnd(n.TRANSITION_DURATION) : this.hideModal())
            }, n.prototype.enforceFocus = function () {
                e(document).off("focusin.bs.modal").on("focusin.bs.modal", e.proxy(function (e) {
                    this.$element[0] === e.target || this.$element.has(e.target).length || this.$element.trigger("focus")
                }, this))
            }, n.prototype.escape = function () {
                this.isShown && this.options.keyboard ? this.$element.on("keydown.dismiss.bs.modal", e.proxy(function (e) {
                    27 == e.which && this.hide()
                }, this)) : this.isShown || this.$element.off("keydown.dismiss.bs.modal")
            }, n.prototype.resize = function () {
                this.isShown ? e(window).on("resize.bs.modal", e.proxy(this.handleUpdate, this)) : e(window).off("resize.bs.modal")
            }, n.prototype.hideModal = function () {
                var e = this;
                this.$element.hide(), this.backdrop(function () {
                    e.$body.removeClass("modal-open"), e.resetAdjustments(), e.resetScrollbar(), e.$element.trigger("hidden.bs.modal")
                })
            }, n.prototype.removeBackdrop = function () {
                this.$backdrop && this.$backdrop.remove(), this.$backdrop = null
            }, n.prototype.backdrop = function (t) {
                var i = this, o = this.$element.hasClass("fade") ? "fade" : "";
                if (this.isShown && this.options.backdrop) {
                    var r = e.support.transition && o;
                    if (this.$backdrop = e(document.createElement("div")).addClass("modal-backdrop " + o).appendTo(this.$body), this.$element.on("click.dismiss.bs.modal", e.proxy(function (e) {
                            return this.ignoreBackdropClick ? void(this.ignoreBackdropClick = !1) : void(e.target === e.currentTarget && ("static" == this.options.backdrop ? this.$element[0].focus() : this.hide()))
                        }, this)), r && this.$backdrop[0].offsetWidth, this.$backdrop.addClass("in"), !t)return;
                    r ? this.$backdrop.one("bsTransitionEnd", t).emulateTransitionEnd(n.BACKDROP_TRANSITION_DURATION) : t()
                } else if (!this.isShown && this.$backdrop) {
                    this.$backdrop.removeClass("in");
                    var s = function () {
                        i.removeBackdrop(), t && t()
                    };
                    e.support.transition && this.$element.hasClass("fade") ? this.$backdrop.one("bsTransitionEnd", s).emulateTransitionEnd(n.BACKDROP_TRANSITION_DURATION) : s()
                } else t && t()
            }, n.prototype.handleUpdate = function () {
                this.adjustDialog()
            }, n.prototype.adjustDialog = function () {
                var e = this.$element[0].scrollHeight > document.documentElement.clientHeight;
                this.$element.css({
                    paddingLeft: !this.bodyIsOverflowing && e ? this.scrollbarWidth : "",
                    paddingRight: this.bodyIsOverflowing && !e ? this.scrollbarWidth : ""
                })
            }, n.prototype.resetAdjustments = function () {
                this.$element.css({paddingLeft: "", paddingRight: ""})
            }, n.prototype.checkScrollbar = function () {
                var e = window.innerWidth;
                if (!e) {
                    var t = document.documentElement.getBoundingClientRect();
                    e = t.right - Math.abs(t.left)
                }
                this.bodyIsOverflowing = document.body.clientWidth < e, this.scrollbarWidth = this.measureScrollbar()
            }, n.prototype.setScrollbar = function () {
                var e = parseInt(this.$body.css("padding-right") || 0, 10);
                this.originalBodyPad = document.body.style.paddingRight || "", this.bodyIsOverflowing && this.$body.css("padding-right", e + this.scrollbarWidth)
            }, n.prototype.resetScrollbar = function () {
                this.$body.css("padding-right", this.originalBodyPad)
            }, n.prototype.measureScrollbar = function () {
                var e = document.createElement("div");
                e.className = "modal-scrollbar-measure", this.$body.append(e);
                var t = e.offsetWidth - e.clientWidth;
                return this.$body[0].removeChild(e), t
            };
            var i = e.fn.modal;
            e.fn.modal = t, e.fn.modal.Constructor = n, e.fn.modal.noConflict = function () {
                return e.fn.modal = i, this
            }, e(document).on("click.bs.modal.data-api", '[data-toggle="modal"]', function (n) {
                var i = e(this), o = i.attr("href"), r = e(i.attr("data-target") || o && o.replace(/.*(?=#[^\s]+$)/, "")), s = r.data("bs.modal") ? "toggle" : e.extend({remote: !/#/.test(o) && o}, r.data(), i.data());
                i.is("a") && n.preventDefault(), r.one("show.bs.modal", function (e) {
                    e.isDefaultPrevented() || r.one("hidden.bs.modal", function () {
                        i.is(":visible") && i.trigger("focus")
                    })
                }), t.call(r, s, this)
            })
        }(jQuery)
    }, {}],
    5: [function (e, t, n) {
        +function (e) {
            "use strict";
            function t(t) {
                return this.each(function () {
                    var i = e(this), o = i.data("bs.popover"), r = "object" == typeof t && t;
                    (o || !/destroy|hide/.test(t)) && (o || i.data("bs.popover", o = new n(this, r)), "string" == typeof t && o[t]())
                })
            }

            var n = function (e, t) {
                this.init("popover", e, t)
            };
            if (!e.fn.tooltip)throw new Error("Popover requires tooltip.js");
            n.VERSION = "3.3.5", n.DEFAULTS = e.extend({}, e.fn.tooltip.Constructor.DEFAULTS, {
                placement: "right",
                trigger: "click",
                content: "",
                template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
            }), n.prototype = e.extend({}, e.fn.tooltip.Constructor.prototype), n.prototype.constructor = n, n.prototype.getDefaults = function () {
                return n.DEFAULTS
            }, n.prototype.setContent = function () {
                var e = this.tip(), t = this.getTitle(), n = this.getContent();
                e.find(".popover-title")[this.options.html ? "html" : "text"](t), e.find(".popover-content").children().detach().end()[this.options.html ? "string" == typeof n ? "html" : "append" : "text"](n), e.removeClass("fade top bottom left right in"), e.find(".popover-title").html() || e.find(".popover-title").hide()
            }, n.prototype.hasContent = function () {
                return this.getTitle() || this.getContent()
            }, n.prototype.getContent = function () {
                var e = this.$element, t = this.options;
                return e.attr("data-content") || ("function" == typeof t.content ? t.content.call(e[0]) : t.content)
            }, n.prototype.arrow = function () {
                return this.$arrow = this.$arrow || this.tip().find(".arrow")
            };
            var i = e.fn.popover;
            e.fn.popover = t, e.fn.popover.Constructor = n, e.fn.popover.noConflict = function () {
                return e.fn.popover = i, this
            }
        }(jQuery)
    }, {}],
    6: [function (e, t, n) {
        +function (e) {
            "use strict";
            function t(t) {
                return this.each(function () {
                    var i = e(this), o = i.data("bs.tooltip"), r = "object" == typeof t && t;
                    (o || !/destroy|hide/.test(t)) && (o || i.data("bs.tooltip", o = new n(this, r)), "string" == typeof t && o[t]())
                })
            }

            var n = function (e, t) {
                this.type = null, this.options = null, this.enabled = null, this.timeout = null, this.hoverState = null, this.$element = null, this.inState = null, this.init("tooltip", e, t)
            };
            n.VERSION = "3.3.5", n.TRANSITION_DURATION = 150, n.DEFAULTS = {
                animation: !0,
                placement: "top",
                selector: !1,
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
                trigger: "hover focus",
                title: "",
                delay: 0,
                html: !1,
                container: !1,
                viewport: {selector: "body", padding: 0}
            }, n.prototype.init = function (t, n, i) {
                if (this.enabled = !0, this.type = t, this.$element = e(n), this.options = this.getOptions(i), this.$viewport = this.options.viewport && e(e.isFunction(this.options.viewport) ? this.options.viewport.call(this, this.$element) : this.options.viewport.selector || this.options.viewport), this.inState = {
                        click: !1,
                        hover: !1,
                        focus: !1
                    }, this.$element[0] instanceof document.constructor && !this.options.selector)throw new Error("`selector` option must be specified when initializing " + this.type + " on the window.document object!");
                for (var o = this.options.trigger.split(" "), r = o.length; r--;) {
                    var s = o[r];
                    if ("click" == s)this.$element.on("click." + this.type, this.options.selector, e.proxy(this.toggle, this)); else if ("manual" != s) {
                        var a = "hover" == s ? "mouseenter" : "focusin", l = "hover" == s ? "mouseleave" : "focusout";
                        this.$element.on(a + "." + this.type, this.options.selector, e.proxy(this.enter, this)), this.$element.on(l + "." + this.type, this.options.selector, e.proxy(this.leave, this))
                    }
                }
                this.options.selector ? this._options = e.extend({}, this.options, {
                    trigger: "manual",
                    selector: ""
                }) : this.fixTitle()
            }, n.prototype.getDefaults = function () {
                return n.DEFAULTS
            }, n.prototype.getOptions = function (t) {
                return t = e.extend({}, this.getDefaults(), this.$element.data(), t), t.delay && "number" == typeof t.delay && (t.delay = {
                    show: t.delay,
                    hide: t.delay
                }), t
            }, n.prototype.getDelegateOptions = function () {
                var t = {}, n = this.getDefaults();
                return this._options && e.each(this._options, function (e, i) {
                    n[e] != i && (t[e] = i)
                }), t
            }, n.prototype.enter = function (t) {
                var n = t instanceof this.constructor ? t : e(t.currentTarget).data("bs." + this.type);
                return n || (n = new this.constructor(t.currentTarget, this.getDelegateOptions()), e(t.currentTarget).data("bs." + this.type, n)), t instanceof e.Event && (n.inState["focusin" == t.type ? "focus" : "hover"] = !0), n.tip().hasClass("in") || "in" == n.hoverState ? void(n.hoverState = "in") : (clearTimeout(n.timeout), n.hoverState = "in", n.options.delay && n.options.delay.show ? void(n.timeout = setTimeout(function () {
                    "in" == n.hoverState && n.show()
                }, n.options.delay.show)) : n.show())
            }, n.prototype.isInStateTrue = function () {
                for (var e in this.inState)if (this.inState[e])return !0;
                return !1
            }, n.prototype.leave = function (t) {
                var n = t instanceof this.constructor ? t : e(t.currentTarget).data("bs." + this.type);
                return n || (n = new this.constructor(t.currentTarget, this.getDelegateOptions()), e(t.currentTarget).data("bs." + this.type, n)), t instanceof e.Event && (n.inState["focusout" == t.type ? "focus" : "hover"] = !1), n.isInStateTrue() ? void 0 : (clearTimeout(n.timeout), n.hoverState = "out", n.options.delay && n.options.delay.hide ? void(n.timeout = setTimeout(function () {
                    "out" == n.hoverState && n.hide()
                }, n.options.delay.hide)) : n.hide())
            }, n.prototype.show = function () {
                var t = e.Event("show.bs." + this.type);
                if (this.hasContent() && this.enabled) {
                    this.$element.trigger(t);
                    var i = e.contains(this.$element[0].ownerDocument.documentElement, this.$element[0]);
                    if (t.isDefaultPrevented() || !i)return;
                    var o = this, r = this.tip(), s = this.getUID(this.type);
                    this.setContent(), r.attr("id", s), this.$element.attr("aria-describedby", s), this.options.animation && r.addClass("fade");
                    var a = "function" == typeof this.options.placement ? this.options.placement.call(this, r[0], this.$element[0]) : this.options.placement, l = /\s?auto?\s?/i, u = l.test(a);
                    u && (a = a.replace(l, "") || "top"), r.detach().css({
                        top: 0,
                        left: 0,
                        display: "block"
                    }).addClass(a).data("bs." + this.type, this), this.options.container ? r.appendTo(this.options.container) : r.insertAfter(this.$element), this.$element.trigger("inserted.bs." + this.type);
                    var c = this.getPosition(), d = r[0].offsetWidth, p = r[0].offsetHeight;
                    if (u) {
                        var f = a, h = this.getPosition(this.$viewport);
                        a = "bottom" == a && c.bottom + p > h.bottom ? "top" : "top" == a && c.top - p < h.top ? "bottom" : "right" == a && c.right + d > h.width ? "left" : "left" == a && c.left - d < h.left ? "right" : a, r.removeClass(f).addClass(a)
                    }
                    var m = this.getCalculatedOffset(a, c, d, p);
                    this.applyPlacement(m, a);
                    var g = function () {
                        var e = o.hoverState;
                        o.$element.trigger("shown.bs." + o.type), o.hoverState = null, "out" == e && o.leave(o)
                    };
                    e.support.transition && this.$tip.hasClass("fade") ? r.one("bsTransitionEnd", g).emulateTransitionEnd(n.TRANSITION_DURATION) : g()
                }
            }, n.prototype.applyPlacement = function (t, n) {
                var i = this.tip(), o = i[0].offsetWidth, r = i[0].offsetHeight, s = parseInt(i.css("margin-top"), 10), a = parseInt(i.css("margin-left"), 10);
                isNaN(s) && (s = 0), isNaN(a) && (a = 0), t.top += s, t.left += a, e.offset.setOffset(i[0], e.extend({
                    using: function (e) {
                        i.css({top: Math.round(e.top), left: Math.round(e.left)})
                    }
                }, t), 0), i.addClass("in");
                var l = i[0].offsetWidth, u = i[0].offsetHeight;
                "top" == n && u != r && (t.top = t.top + r - u);
                var c = this.getViewportAdjustedDelta(n, t, l, u);
                c.left ? t.left += c.left : t.top += c.top;
                var d = /top|bottom/.test(n), p = d ? 2 * c.left - o + l : 2 * c.top - r + u, f = d ? "offsetWidth" : "offsetHeight";
                i.offset(t), this.replaceArrow(p, i[0][f], d)
            }, n.prototype.replaceArrow = function (e, t, n) {
                this.arrow().css(n ? "left" : "top", 50 * (1 - e / t) + "%").css(n ? "top" : "left", "")
            }, n.prototype.setContent = function () {
                var e = this.tip(), t = this.getTitle();
                e.find(".tooltip-inner")[this.options.html ? "html" : "text"](t), e.removeClass("fade in top bottom left right")
            }, n.prototype.hide = function (t) {
                function i() {
                    "in" != o.hoverState && r.detach(), o.$element.removeAttr("aria-describedby").trigger("hidden.bs." + o.type), t && t()
                }

                var o = this, r = e(this.$tip), s = e.Event("hide.bs." + this.type);
                return this.$element.trigger(s), s.isDefaultPrevented() ? void 0 : (r.removeClass("in"), e.support.transition && r.hasClass("fade") ? r.one("bsTransitionEnd", i).emulateTransitionEnd(n.TRANSITION_DURATION) : i(), this.hoverState = null, this)
            }, n.prototype.fixTitle = function () {
                var e = this.$element;
                (e.attr("title") || "string" != typeof e.attr("data-original-title")) && e.attr("data-original-title", e.attr("title") || "").attr("title", "")
            }, n.prototype.hasContent = function () {
                return this.getTitle()
            }, n.prototype.getPosition = function (t) {
                t = t || this.$element;
                var n = t[0], i = "BODY" == n.tagName, o = n.getBoundingClientRect();
                null == o.width && (o = e.extend({}, o, {width: o.right - o.left, height: o.bottom - o.top}));
                var r = i ? {
                    top: 0,
                    left: 0
                } : t.offset(), s = {scroll: i ? document.documentElement.scrollTop || document.body.scrollTop : t.scrollTop()}, a = i ? {
                    width: e(window).width(),
                    height: e(window).height()
                } : null;
                return e.extend({}, o, s, a, r)
            }, n.prototype.getCalculatedOffset = function (e, t, n, i) {
                return "bottom" == e ? {
                    top: t.top + t.height,
                    left: t.left + t.width / 2 - n / 2
                } : "top" == e ? {
                    top: t.top - i,
                    left: t.left + t.width / 2 - n / 2
                } : "left" == e ? {
                    top: t.top + t.height / 2 - i / 2,
                    left: t.left - n
                } : {top: t.top + t.height / 2 - i / 2, left: t.left + t.width}
            }, n.prototype.getViewportAdjustedDelta = function (e, t, n, i) {
                var o = {top: 0, left: 0};
                if (!this.$viewport)return o;
                var r = this.options.viewport && this.options.viewport.padding || 0, s = this.getPosition(this.$viewport);
                if (/right|left/.test(e)) {
                    var a = t.top - r - s.scroll, l = t.top + r - s.scroll + i;
                    a < s.top ? o.top = s.top - a : l > s.top + s.height && (o.top = s.top + s.height - l)
                } else {
                    var u = t.left - r, c = t.left + r + n;
                    u < s.left ? o.left = s.left - u : c > s.right && (o.left = s.left + s.width - c)
                }
                return o
            }, n.prototype.getTitle = function () {
                var e, t = this.$element, n = this.options;
                return e = t.attr("data-original-title") || ("function" == typeof n.title ? n.title.call(t[0]) : n.title)
            }, n.prototype.getUID = function (e) {
                do e += ~~(1e6 * Math.random()); while (document.getElementById(e));
                return e
            }, n.prototype.tip = function () {
                if (!this.$tip && (this.$tip = e(this.options.template), 1 != this.$tip.length))throw new Error(this.type + " `template` option must consist of exactly 1 top-level element!");
                return this.$tip
            }, n.prototype.arrow = function () {
                return this.$arrow = this.$arrow || this.tip().find(".tooltip-arrow")
            }, n.prototype.enable = function () {
                this.enabled = !0
            }, n.prototype.disable = function () {
                this.enabled = !1
            }, n.prototype.toggleEnabled = function () {
                this.enabled = !this.enabled
            }, n.prototype.toggle = function (t) {
                var n = this;
                t && (n = e(t.currentTarget).data("bs." + this.type), n || (n = new this.constructor(t.currentTarget, this.getDelegateOptions()), e(t.currentTarget).data("bs." + this.type, n))), t ? (n.inState.click = !n.inState.click, n.isInStateTrue() ? n.enter(n) : n.leave(n)) : n.tip().hasClass("in") ? n.leave(n) : n.enter(n)
            }, n.prototype.destroy = function () {
                var e = this;
                clearTimeout(this.timeout), this.hide(function () {
                    e.$element.off("." + e.type).removeData("bs." + e.type), e.$tip && e.$tip.detach(), e.$tip = null, e.$arrow = null, e.$viewport = null
                })
            };
            var i = e.fn.tooltip;
            e.fn.tooltip = t, e.fn.tooltip.Constructor = n, e.fn.tooltip.noConflict = function () {
                return e.fn.tooltip = i, this
            }
        }(jQuery)
    }, {}]
}, {}, [3]);