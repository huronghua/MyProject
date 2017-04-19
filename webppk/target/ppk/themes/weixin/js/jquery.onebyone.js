/** @type {Array} */
var _0x3ba3 = ["rollIn", "fadeIn", "fadeInUp", "fadeInDown", "fadeInLeft", "fadeInRight", "bounceIn", "bounceInDown", "bounceInUp", "bounceInLeft", "bounceInRight", "rotateIn", "rotateInDownLeft", "rotateInDownRight", "rotateInUpLeft", "rotateInUpRight", "fadeInLeftBig", "fadeInRightBig", "fadeInUpBig", "fadeInDownBig", "flipInX", "flipInY", "lightSpeedIn", "length", "oneByOne", "fn", "oneByOne_item", "extend", "width", "height", '<div class="', "className", '"/>', "wrap", "parent", "overflow", "hidden",
"css", "hide", "left", "each", ".", "sliderClassName", "find", "touchstart", "touches", "originalEvent", "changedTouches", "mouseX", "pageX", "minWidth", "bind", "touchmove", "slideShow", "touchend", "tolerance", "fadeOut", "delay", "autoHideButton", "enableDrag", "mousedown", "mousemove", "mouseup", "mouseleave", "pauseByHover", "mouseover", "showButton", '<div class="buttonArea"><div class="buttonCon"></div></div>', "append", ".buttonCon", "cursor", "pointer", '<a class="theButton" rel="', '">',
"</a>", "click", "active", "hasClass", "rel", "attr", ".buttonCon a", "showArrow", '<div class="arrowButton"><div class="prevArrow"></div><div class="nextArrow"></div></div>', ".nextArrow", ".prevArrow", "slideShowDelay", "interval", "data", "msie", "browser", "opera", "version", "opacity", "children", "removeClass", ".buttonArea a:eq(", ")", "addClass", "toLowerCase", "easeType", "random", "", "animate", "show", " ", "responsive", "img", "is", "floor", "queue", "stop", "load", "resize", "display",
"none", "span", "top"];
(function ($) {
    /** @type {Array} */
    var args = [_0x3ba3[0], _0x3ba3[1], _0x3ba3[2], _0x3ba3[3], _0x3ba3[4], _0x3ba3[5], _0x3ba3[5], _0x3ba3[6], _0x3ba3[7], _0x3ba3[8], _0x3ba3[9], _0x3ba3[10], _0x3ba3[11], _0x3ba3[12], _0x3ba3[13], _0x3ba3[14], _0x3ba3[15], _0x3ba3[16], _0x3ba3[17], _0x3ba3[18], _0x3ba3[19], _0x3ba3[20], _0x3ba3[21], _0x3ba3[22]];
    var pageY = args[_0x3ba3[23]];
    //alert(_0x3ba3[113]);
    //alert(_0x3ba3[65]);
    /**
    * @param {?} entities
    * @return {?}
    */
    $[_0x3ba3[25]][_0x3ba3[24]] = function (entities) {
        /**
        * @param {number} key
        * @return {undefined}
        */
        function ready(key) {
            if (settings[_0x3ba3[53]]) {
                done();
            }
            ctx[_0x3ba3[110]](true, true)[_0x3ba3[102]]({
                left: -key * i
            }, settings[_0x3ba3[57]], function () {
                if (key != from) {
                    j = from;
                    if (buf[j]) {
                        if (!($[_0x3ba3[89]][_0x3ba3[88]] || $[_0x3ba3[89]][_0x3ba3[90]])) {
                            buf[j][_0x3ba3[56]]();
                        }
                        if ($[_0x3ba3[89]][_0x3ba3[88]] && $[_0x3ba3[89]][_0x3ba3[91]] <= 9) {
                            buf[j][_0x3ba3[93]]()[_0x3ba3[40]](function (dataAndEvents) {
                                $(this)[_0x3ba3[37]](_0x3ba3[92], 0);
                            });
                        }
                        $(_0x3ba3[95] + j + _0x3ba3[96], self)[_0x3ba3[94]](_0x3ba3[76]);
                    }
                    $(_0x3ba3[95] + key + _0x3ba3[96], self)[_0x3ba3[97]](_0x3ba3[76]);
                    if (settings[_0x3ba3[99]][_0x3ba3[98]]() != _0x3ba3[100]) {
                        buf[key][_0x3ba3[103]]()[_0x3ba3[93]]()[_0x3ba3[40]](function (actualObject) {
                            /** @type {number} */
                            var object = actualObject;
                            var collection = $(this);
                            var resp = _0x3ba3[101];
                            /** @type {boolean} */
                            var _0xea3fx1a = false;
                            if ($(this)[_0x3ba3[77]](settings[_0x3ba3[99]])) {
                                $(this)[_0x3ba3[94]](settings[_0x3ba3[99]]);
                                $(this)[_0x3ba3[38]]();
                            }
                            if (collection[_0x3ba3[87]](_0x3ba3[102])) {
                                /** @type {boolean} */
                                _0xea3fx1a = true;
                                resp = collection[_0x3ba3[87]](_0x3ba3[102]);
                                collection[_0x3ba3[94]](resp);
                                collection[_0x3ba3[38]]();
                            }
                            if ($[_0x3ba3[89]][_0x3ba3[88]] && $[_0x3ba3[89]][_0x3ba3[91]] <= 9) {
                                collection[_0x3ba3[37]](_0x3ba3[92], 0);
                                collection[_0x3ba3[103]]()[_0x3ba3[102]]({
                                    opacity: 1
                                }, 200 + 200 * object);
                            } else {
                                if (_0xea3fx1a) {
                                    collection[_0x3ba3[103]]()[_0x3ba3[97]](_0x3ba3[102] + object + _0x3ba3[104] + resp);
                                } else {
                                    collection[_0x3ba3[103]]()[_0x3ba3[97]](_0x3ba3[102] + object + _0x3ba3[104] + settings[_0x3ba3[99]]);
                                }
                                if (settings[_0x3ba3[105]] && (width < settings[_0x3ba3[50]] && !$(this)[_0x3ba3[107]](_0x3ba3[106]))) {
                                    collection[_0x3ba3[38]]();
                                }
                            }
                        });
                    } else {
                        value = args[Math[_0x3ba3[108]](Math[_0x3ba3[100]]() * pageY)];
                        flags[key] = value;
                        if (buf[j]) {
                            buf[j][_0x3ba3[93]]()[_0x3ba3[40]](function (dataAndEvents) {
                                if ($(this)[_0x3ba3[77]](flags[j])) {
                                    $(this)[_0x3ba3[94]](flags[j]);
                                    $(this)[_0x3ba3[38]]();
                                }
                            });
                        }
                        buf[key][_0x3ba3[103]]()[_0x3ba3[93]]()[_0x3ba3[40]](function (actualObject) {
                            /** @type {number} */
                            var object = actualObject;
                            var collection = $(this);
                            var resp = _0x3ba3[101];
                            /** @type {boolean} */
                            var _0xea3fx1a = false;
                            if (collection[_0x3ba3[87]](_0x3ba3[102])) {
                                /** @type {boolean} */
                                _0xea3fx1a = true;
                                resp = collection[_0x3ba3[87]](_0x3ba3[102]);
                                collection[_0x3ba3[94]](resp);
                                collection[_0x3ba3[38]]();
                            }
                            if ($[_0x3ba3[89]][_0x3ba3[88]] && $[_0x3ba3[89]][_0x3ba3[91]] <= 9) {
                                collection[_0x3ba3[37]](_0x3ba3[92], 0);
                                collection[_0x3ba3[103]]()[_0x3ba3[102]]({
                                    opacity: 1
                                }, 200 + 200 * object);
                            } else {
                                if (_0xea3fx1a) {
                                    collection[_0x3ba3[103]]()[_0x3ba3[97]](_0x3ba3[102] + object + _0x3ba3[104] + resp);
                                } else {
                                    collection[_0x3ba3[103]]()[_0x3ba3[97]](_0x3ba3[102] + object + _0x3ba3[104] + value);
                                }
                                if (settings[_0x3ba3[105]] && (width < settings[_0x3ba3[50]] && !$(this)[_0x3ba3[107]](_0x3ba3[106]))) {
                                    collection[_0x3ba3[38]]();
                                }
                            }
                        });
                    }
                    ctx[_0x3ba3[57]](buf[key][_0x3ba3[93]]()[_0x3ba3[23]] * 200)[_0x3ba3[109]](function () {
                        if (settings[_0x3ba3[53]] && _0xea3fx18) {
                            run();
                        }
                    });
                    if (e) {
                        e[_0x3ba3[37]](_0x3ba3[70], _0x3ba3[71]);
                    }
                    /** @type {number} */
                    from = key;
                }
            });
        }
        /**
        * @param {?} context
        * @return {undefined}
        */
        function attach(context) {
            width = ctx[_0x3ba3[34]]()[_0x3ba3[28]]();
            ctx[_0x3ba3[34]]()[_0x3ba3[37]](_0x3ba3[29], factor * width / len);
            ctx[_0x3ba3[43]](_0x3ba3[41] + settings[_0x3ba3[42]])[_0x3ba3[40]](function (dataAndEvents) {
                $(this)[_0x3ba3[37]](_0x3ba3[29], factor * width / len);
                if (width < settings[_0x3ba3[50]]) {
                    $(this)[_0x3ba3[43]](_0x3ba3[115])[_0x3ba3[37]](_0x3ba3[113], _0x3ba3[114]);
                    e[_0x3ba3[37]](_0x3ba3[113], _0x3ba3[114]);
                } else {
                    $(this)[_0x3ba3[43]](_0x3ba3[115])[_0x3ba3[37]](_0x3ba3[113], _0x3ba3[101]);
                    e[_0x3ba3[37]](_0x3ba3[113], _0x3ba3[101]);
                }
            });
            if (_0xea3fx1f) {
                _0xea3fx1f[_0x3ba3[37]](_0x3ba3[116], factor * width / len * 0.5 - 40);
            }
            if (_0xea3fx20) {
                _0xea3fx20[_0x3ba3[37]](_0x3ba3[116], factor * width / len * 0.5 - 40);
            }
        }
        /**
        * @return {undefined}
        */
        function done() {
            clearInterval(ctx[_0x3ba3[87]](_0x3ba3[86]));
        }
        /**
        * @return {undefined}
        */
        function run() {
            clearInterval(ctx[_0x3ba3[87]](_0x3ba3[86]));
            /** @type {number} */
            slideShowInt = setInterval(function () {
                setup();
            }, settings[_0x3ba3[85]]);
            ctx[_0x3ba3[87]](_0x3ba3[86], slideShowInt);
        }
        /**
        * @return {undefined}
        */
        function setup() {
            var index = from;
            index++;
            index = index >= count ? 0 : index;
            ready(index);
        }
        /**
        * @return {undefined}
        */
        function completed() {
            var index = from;
            index--;
            index = index < 0 ? count - 1 : index;
            ready(index);
        }
        var settings = {
            className: _0x3ba3[24],
            sliderClassName: _0x3ba3[26],
            pauseByHover: true,
            easeType: _0x3ba3[4],
            width: 960,
            height: 420,
            minWidth: 480,
            delay: 300,
            tolerance: 0.25,
            enableDrag: true,
            showArrow: true,
            showButton: true,
            slideShow: false,
            slideShowDelay: 5E3,
            responsive: false,
            autoHideButton: true
        };
        if (entities) {
            $[_0x3ba3[27]](settings, entities);
        }
        var self;
        var ctx;
        /** @type {number} */
        var from = -1;
        var i = settings[_0x3ba3[28]];
        var osSettings = settings[_0x3ba3[29]];
        var len = i;
        var factor = osSettings;
        /** @type {number} */
        var offset = 0;
        /** @type {boolean} */
        var _0xea3fxe = false;
        /** @type {boolean} */
        var _0xea3fxf = false;
        /** @type {Array} */
        var flags = [];
        var value;
        /** @type {Array} */
        var buf = [];
        /** @type {number} */
        var count = 0;
        /** @type {number} */
        var j = 0;
        var className;
        var _0xea3fx16;
        var e;
        /** @type {boolean} */
        var _0xea3fx18 = false;
        ctx = this;
        ctx[_0x3ba3[33]](_0x3ba3[30] + settings[_0x3ba3[31]] + _0x3ba3[32]);
        self = ctx[_0x3ba3[34]]();
        self[_0x3ba3[37]](_0x3ba3[35], _0x3ba3[36]);
        ctx[_0x3ba3[43]](_0x3ba3[41] + settings[_0x3ba3[42]])[_0x3ba3[40]](function (off) {
            $(this)[_0x3ba3[38]]();
            count++;
            $(this)[_0x3ba3[37]](_0x3ba3[39], i * off);
            buf[off] = $(this);
        });
        ctx[_0x3ba3[51]](_0x3ba3[44], function (dataAndEvents) {
            var _0xea3fx1a = dataAndEvents[_0x3ba3[46]][_0x3ba3[45]][0] || dataAndEvents[_0x3ba3[46]][_0x3ba3[47]][0];
            if (!_0xea3fxe) {
                /** @type {boolean} */
                _0xea3fxe = true;
                this[_0x3ba3[48]] = _0xea3fx1a[_0x3ba3[49]];
            }
            if (_0xea3fx16) {
                _0xea3fx16[_0x3ba3[1]]();
            }
            if (e && width > settings[_0x3ba3[50]]) {
                e[_0x3ba3[1]]();
            }
        });
        ctx[_0x3ba3[51]](_0x3ba3[52], function (dataAndEvents) {
            var _0xea3fx1a = dataAndEvents[_0x3ba3[46]][_0x3ba3[45]][0] || dataAndEvents[_0x3ba3[46]][_0x3ba3[47]][0];
            if (_0xea3fxe) {
                /** @type {number} */
                offset = _0xea3fx1a[_0x3ba3[49]] - this[_0x3ba3[48]];
                ctx[_0x3ba3[37]](_0x3ba3[39], -from * i + offset);
                if (settings[_0x3ba3[53]]) {
                    done();
                }
            }
            return false;
        });
        ctx[_0x3ba3[51]](_0x3ba3[54], function (dataAndEvents) {
            var index = from;
            var _0xea3fx1b = dataAndEvents[_0x3ba3[46]][_0x3ba3[45]][0] || dataAndEvents[_0x3ba3[46]][_0x3ba3[47]][0];
            /** @type {boolean} */
            _0xea3fxe = false;
            if (!offset) {
                return false;
            }
            var w = width || parseInt(settings[_0x3ba3[28]]);
            /** @type {number} */
            var cx = w / 2;
            if (-offset > cx - w * settings[_0x3ba3[55]]) {
                index++;
                index = index >= count ? count - 1 : index;
                ready(index);
            } else {
                if (offset > cx - w * settings[_0x3ba3[55]]) {
                    index--;
                    index = index < 0 ? 0 : index;
                    ready(index);
                } else {
                    ready(index);
                    if (settings[_0x3ba3[53]]) {
                        run();
                    }
                }
            }
            /** @type {number} */
            offset = 0;
            if (_0xea3fx16) {
                _0xea3fx16[_0x3ba3[57]](400)[_0x3ba3[56]]();
            }
            if (e && settings[_0x3ba3[58]]) {
                e[_0x3ba3[57]](400)[_0x3ba3[56]]();
            }
            return false;
        });
        if (settings[_0x3ba3[59]]) {
            ctx[_0x3ba3[60]](function (dataAndEvents) {
                if (!_0xea3fxe) {
                    /** @type {boolean} */
                    _0xea3fxe = true;
                    this[_0x3ba3[48]] = dataAndEvents[_0x3ba3[49]];
                }
            });
            ctx[_0x3ba3[61]](function (dataAndEvents) {
                if (_0xea3fxe) {
                    /** @type {number} */
                    offset = dataAndEvents[_0x3ba3[49]] - this[_0x3ba3[48]];
                    ctx[_0x3ba3[37]](_0x3ba3[39], -from * i + offset);
                    if (settings[_0x3ba3[53]]) {
                        done();
                    }
                }
                return false;
            });
            ctx[_0x3ba3[62]](function (dataAndEvents) {
                /** @type {boolean} */
                _0xea3fxe = false;
                var index = from;
                if (!offset) {
                    return false;
                }
                var w = width || parseInt(settings[_0x3ba3[28]]);
                /** @type {number} */
                var cx = w / 2;
                if (-offset > cx - w * settings[_0x3ba3[55]]) {
                    index++;
                    index = index >= count ? count - 1 : index;
                    ready(index);
                } else {
                    if (offset > cx - w * settings[_0x3ba3[55]]) {
                        index--;
                        index = index < 0 ? 0 : index;
                        ready(index);
                    } else {
                        ready(index);
                        if (settings[_0x3ba3[53]]) {
                            run();
                        }
                    }
                }
                /** @type {number} */
                offset = 0;
                return false;
            });
            ctx[_0x3ba3[63]](function (dataAndEvents) {
                $(this)[_0x3ba3[62]]();
            });
        }
        self[_0x3ba3[65]](function (dataAndEvents) {
//            if (_0xea3fx16) {
//                _0xea3fx16[_0x3ba3[1]]();
//            }
            if (e && width > settings[_0x3ba3[50]]) {
                e[_0x3ba3[1]]();
            }
            if (settings[_0x3ba3[64]]) {
                done();
                /** @type {boolean} */
                _0xea3fx18 = false;
            }
        });
        self[_0x3ba3[63]](function (dataAndEvents) {
//            if (_0xea3fx16) {
//                _0xea3fx16[_0x3ba3[56]]();
//            }
            if (e && settings[_0x3ba3[58]]) {
                e[_0x3ba3[56]]();
            }
            if (settings[_0x3ba3[64]] && settings[_0x3ba3[53]]) {
                run();
                /** @type {boolean} */
                _0xea3fx18 = true;
            }
        });
        if (settings[_0x3ba3[66]]) {
            className = $(_0x3ba3[67]);
            self[_0x3ba3[68]](className);
            _0xea3fx16 = className[_0x3ba3[43]](_0x3ba3[69]);
            /** @type {number} */
            var c = 0;
            for (; c < count; c++) {
                _0xea3fx16[_0x3ba3[68]](_0x3ba3[72] + c + _0x3ba3[73] + (c + 1) + _0x3ba3[74])[_0x3ba3[37]](_0x3ba3[70], _0x3ba3[71]);
            }
            $(_0x3ba3[80], className)[_0x3ba3[51]](_0x3ba3[75], function (dataAndEvents) {
                if ($(this)[_0x3ba3[77]](_0x3ba3[76])) {
                    return false;
                }
                var camelKey = $(this)[_0x3ba3[79]](_0x3ba3[78]);
                ready(camelKey);
            });
        }
        if (settings[_0x3ba3[81]]) {
            e = $(_0x3ba3[82]);
            self[_0x3ba3[68]](e);
            var _0xea3fx1f = $(_0x3ba3[83], e)[_0x3ba3[51]](_0x3ba3[75], function (dataAndEvents) {
                setup();
            });
            var _0xea3fx20 = $(_0x3ba3[84], e)[_0x3ba3[51]](_0x3ba3[75], function (dataAndEvents) {
                completed();
            });
        }
        if (_0xea3fx16) {
           _0xea3fx16[_0x3ba3[38]]();
        }
        if (e && settings[_0x3ba3[58]]) {
            e[_0x3ba3[38]]();
        }
        ready(0);
        if (settings[_0x3ba3[53]]) {
            /** @type {number} */
            slideShowInt = setInterval(function () {
                setup();
            }, settings[_0x3ba3[85]]);
            ctx[_0x3ba3[87]](_0x3ba3[86], slideShowInt);
            /** @type {boolean} */
            _0xea3fx18 = true;
        }
        var width = ctx[_0x3ba3[34]]()[_0x3ba3[28]]();
        if (settings[_0x3ba3[105]]) {
            ctx[_0x3ba3[34]]()[_0x3ba3[37]](_0x3ba3[29], factor * width / len);
            $(window)[_0x3ba3[111]](attach);
            $(window)[_0x3ba3[112]](attach);
        }
        return this;
    };
})(jQuery);