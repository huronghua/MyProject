// JavaScript Document

$.fn.smartFloat = function() {
var position = function(element) {
var top = element.position().top, pos = element.css("position");
$(window).scroll(function() {
var scrolls = $(this).scrollTop();
if (scrolls > top-40) {
if (window.XMLHttpRequest) {
element.css({
position: "fixed",
top: 40
});
} else {
element.css({
top: scrolls,
padding:0
});
}
}else {
element.css({
position: pos,
padding:0
});
}
});
};
return $(this).each(function() {
position($(this));
});
}; 