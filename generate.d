// generate "eastasianwidth/eastasianwidth.d"

import std.net.curl;
import std.conv;
import std.string;
import std.algorithm;
import std.range;

string generateSourceString() {
    uint[] fullwidth, halfwidth, wide, narrow, ambiguous, neutral;
    string eaw = get("http://www.unicode.org/Public/UCD/latest/ucd/EastAsianWidth.txt").to!string;
    eaw
        .lineSplitter
        .map!(line => line.findSplitBefore("#")[0].strip)
        .filter!(line => line.length != 0)
        .each!((line) {
            auto _line = line.findSplit(";");
            string range = _line[0];
            string prop  = _line[2];
            uint start, end;
            if (range.canFind("..")) {
                auto _range = range.findSplit("..");
                start = _range[0].parse!uint(16);
                end   = _range[2].parse!uint(16);
            } else {
                start = end = range.parse!uint(16);
            }
            if (prop == "A") {
                ambiguous ~= [start, end];
            } else if (prop == "F") {
                fullwidth ~= [start, end];
            } else if (prop == "H") {
                halfwidth ~= [start, end];
            } else if (prop == "N") {
                neutral ~= [start, end];
            } else if (prop == "Na") {
                narrow ~= [start, end];
            } else if (prop == "W") {
                wide ~= [start, end];
            }
        });

    alias toConditionString = rangeArr =>
        rangeArr
            .simplify
            .chunks(2)
            .map!(range => 
                (range[0] == range[1])
                    ? "(codePoint == " ~ range[0].to!string ~ ")"
                    : "(" ~ range[0].to!string ~ " <= codePoint && codePoint <= " ~ range[1].to!string ~ ")")
            .join(" ||\n        ");

    string condF = toConditionString(fullwidth);
    string condH = toConditionString(halfwidth);
    string condW = toConditionString(wide);
    string condNa = toConditionString(narrow);
    string condA = toConditionString(ambiguous);

    return "module eastasianwidth.eastasianwidth;

enum EastAsianWidthProperty {
    A, F, H, N, Na, W
}

EastAsianWidthProperty eastAsianWidth(dchar ch) @safe pure @nogc nothrow {
    const uint codePoint = ch;
    if (" ~ condF ~ ") return EastAsianWidthProperty.F;
    if (" ~ condH ~ ") return EastAsianWidthProperty.H;
    if (" ~ condW ~ ") return EastAsianWidthProperty.W;
    if (" ~ condNa ~ ") return EastAsianWidthProperty.Na;
    if (" ~ condA ~ ") return EastAsianWidthProperty.A;
    return EastAsianWidthProperty.N;
}";
}

uint[] simplify(uint[] rangeArr) {
    if (rangeArr.empty) return [];
    uint[] newRangeArr;
    newRangeArr ~= rangeArr[0];
    for (size_t i = 1; i < rangeArr.length - 1; i += 2) {
        if (rangeArr[i] + 1 == rangeArr[i + 1]) continue;
        newRangeArr ~= rangeArr[i];
        newRangeArr ~= rangeArr[i + 1];
    }
    newRangeArr ~= rangeArr[$ - 1];
    return newRangeArr;
}

void main() {
    import std.stdio : writeln;
    generateSourceString.writeln;
}
