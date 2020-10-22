// mappings
map("H", "S"); // go back in history (navigation)
map("S", "D"); // go forward in history (navigation)
map("<Ctrl-h>", "E");
map("<Ctrl-s>", "R");

// open url mappings
map("oc", "go");
map("ob", "gf");
map("ot", "af");

// buffer mappings
unmap("b");
map("bd", "x");

// custom mappings
mapkey("R", "#4Hard reload the page", function () {
  RUNTIME("reloadTab", { nocache: true });
});

// settings
Hints.numericHints = true;

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
map("gt", "T");

// an example to remove mapkey `Ctrl-i`
unmap("<Ctrl-i>");

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
