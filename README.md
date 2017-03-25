# east_asian_width
Unicode library for getting [East Asian Width](http://www.unicode.org/reports/tr11/) property

```d
import eastasianwidth;

assert(displayWidth("あいうえお") == 10);

// '☆' is Ambiguous character
assert(displayWidth('☆') == 1);
assert(displayWidth('☆', AmbiguousCharWidth.wide) == 2);
assert(displayWidth("☆D言語くん☆") == 11);
assert(displayWidth("☆D言語くん☆", AmbiguousCharWidth.wide) == 13);

assert(eastAsianWidth('Ａ') == EastAsianWidthProperty.F); // Fullwidth
assert(eastAsianWidth('ｱ') == EastAsianWidthProperty.H);  // Halfwidth
assert(eastAsianWidth('ア') == EastAsianWidthProperty.W); // Wide
assert(eastAsianWidth('A') == EastAsianWidthProperty.Na); // Narrow
assert(eastAsianWidth('☆') == EastAsianWidthProperty.A); // Ambiguous
assert(eastAsianWidth('À') == EastAsianWidthProperty.N);  // Neutral
```
