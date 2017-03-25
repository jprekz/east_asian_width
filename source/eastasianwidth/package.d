module eastasianwidth;

public import eastasianwidth.eastasianwidth;

import std.traits;

///
enum AmbiguousCharWidth : bool {
    narrow,
    wide
}

/// returns monospace display width of a character
size_t displayWidth(T)(T ch, AmbiguousCharWidth acw = AmbiguousCharWidth.narrow)
if (isSomeChar!T) {
    auto prop = eastAsianWidth(ch);
    if (prop == EastAsianWidthProperty.F || prop == EastAsianWidthProperty.W) {
        return 2;
    } else if (prop == EastAsianWidthProperty.A) {
        return (acw == AmbiguousCharWidth.narrow) ? 1 : 2;
    } else {
        return 1;
    }
}

/// returns monospace display width of a string
size_t displayWidth(T)(T str, AmbiguousCharWidth acw = AmbiguousCharWidth.narrow)
if (isSomeString!T) {
    size_t width;
    foreach (dchar ch; str) {
        width += displayWidth(ch, acw);
    }
    return width;
}

///
@safe pure @nogc unittest {
    assert(displayWidth("あいうえお") == 10);

    // '☆' is Ambiguous characters
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
}

@safe pure @nogc nothrow unittest {
    assert(eastAsianWidth('Ａ') == EastAsianWidthProperty.F);
    assert(eastAsianWidth('！') == EastAsianWidthProperty.F);
    assert(eastAsianWidth('￦') == EastAsianWidthProperty.F);

    assert(eastAsianWidth('ｱ') == EastAsianWidthProperty.H);
    assert(eastAsianWidth('￩') == EastAsianWidthProperty.H);
    assert(eastAsianWidth('₩') == EastAsianWidthProperty.H);

    assert(eastAsianWidth('ア') == EastAsianWidthProperty.W);
    assert(eastAsianWidth('𛀀') == EastAsianWidthProperty.W);
    assert(eastAsianWidth('뀀') == EastAsianWidthProperty.W);

    assert(eastAsianWidth('A') == EastAsianWidthProperty.Na);
    assert(eastAsianWidth('¢') == EastAsianWidthProperty.Na);
    assert(eastAsianWidth('⟦') == EastAsianWidthProperty.Na);

    assert(eastAsianWidth('¿') == EastAsianWidthProperty.A);
    assert(eastAsianWidth('Σ') == EastAsianWidthProperty.A);
    assert(eastAsianWidth('℃') == EastAsianWidthProperty.A);

    assert(eastAsianWidth('©') == EastAsianWidthProperty.N);
    assert(eastAsianWidth('À') == EastAsianWidthProperty.N);
    assert(eastAsianWidth('ي') == EastAsianWidthProperty.N);
}

@safe pure @nogc nothrow unittest {
    assert(displayWidth('Ａ') == 2);
    assert(displayWidth('！') == 2);
    assert(displayWidth('￦') == 2);

    assert(displayWidth('ｱ') == 1);
    assert(displayWidth('￩') == 1);
    assert(displayWidth('₩') == 1);

    assert(displayWidth('ア') == 2);
    assert(displayWidth('𛀀') == 2);
    assert(displayWidth('뀀') == 2);

    assert(displayWidth('A') == 1);
    assert(displayWidth('¢') == 1);
    assert(displayWidth('⟦') == 1);

    assert(displayWidth('¿') == 1);
    assert(displayWidth('Σ') == 1);
    assert(displayWidth('℃') == 1);

    assert(displayWidth('©') == 1);
    assert(displayWidth('À') == 1);
    assert(displayWidth('ي') == 1);
}

@safe pure @nogc nothrow unittest {
    assert(displayWidth('Ａ', AmbiguousCharWidth.wide) == 2);
    assert(displayWidth('！', AmbiguousCharWidth.wide) == 2);
    assert(displayWidth('￦', AmbiguousCharWidth.wide) == 2);

    assert(displayWidth('ｱ', AmbiguousCharWidth.wide) == 1);
    assert(displayWidth('￩', AmbiguousCharWidth.wide) == 1);
    assert(displayWidth('₩', AmbiguousCharWidth.wide) == 1);

    assert(displayWidth('ア', AmbiguousCharWidth.wide) == 2);
    assert(displayWidth('𛀀', AmbiguousCharWidth.wide) == 2);
    assert(displayWidth('뀀', AmbiguousCharWidth.wide) == 2);

    assert(displayWidth('A', AmbiguousCharWidth.wide) == 1);
    assert(displayWidth('¢', AmbiguousCharWidth.wide) == 1);
    assert(displayWidth('⟦', AmbiguousCharWidth.wide) == 1);

    assert(displayWidth('¿', AmbiguousCharWidth.wide) == 2);
    assert(displayWidth('Σ', AmbiguousCharWidth.wide) == 2);
    assert(displayWidth('℃', AmbiguousCharWidth.wide) == 2);

    assert(displayWidth('©', AmbiguousCharWidth.wide) == 1);
    assert(displayWidth('À', AmbiguousCharWidth.wide) == 1);
    assert(displayWidth('ي', AmbiguousCharWidth.wide) == 1);
}

@safe pure @nogc unittest {
    assert(displayWidth("D-Man") == 5);
    assert(displayWidth("D-Man", AmbiguousCharWidth.wide) == 5);
    assert(displayWidth("｢Ｄ言語くん｣") == 12);
    assert(displayWidth("｢Ｄ言語くん｣", AmbiguousCharWidth.wide) == 12);
    assert(displayWidth("Ελληνικά") == 8);
    assert(displayWidth("Ελληνικά", AmbiguousCharWidth.wide) == 15);
    assert(displayWidth("اللغة العربية") == 13);
    assert(displayWidth("اللغة العربية", AmbiguousCharWidth.wide) == 13);
    assert(displayWidth("ლ(́⊙ɛ⊙`)ლ") == 9);
    assert(displayWidth("ლ(́⊙ɛ⊙`)ლ", AmbiguousCharWidth.wide) == 12);
}
