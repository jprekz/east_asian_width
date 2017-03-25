module eastasianwidth.eastasianwidth;

/// East_Asian_Width property
enum EastAsianWidthProperty {
    A, F, H, N, Na, W
}

/// returns East_Asian_Width property of a character
EastAsianWidthProperty eastAsianWidth(dchar ch) @safe pure @nogc nothrow {
    const uint codePoint =  ch;
    if ((codePoint == 12288) ||
        (65281 <= codePoint && codePoint <= 65376) ||
        (65504 <= codePoint && codePoint <= 65510)) return EastAsianWidthProperty.F;
    if ((codePoint == 8361) ||
        (65377 <= codePoint && codePoint <= 65470) ||
        (65474 <= codePoint && codePoint <= 65479) ||
        (65482 <= codePoint && codePoint <= 65487) ||
        (65490 <= codePoint && codePoint <= 65495) ||
        (65498 <= codePoint && codePoint <= 65500) ||
        (65512 <= codePoint && codePoint <= 65518)) return EastAsianWidthProperty.H;
    if ((4352 <= codePoint && codePoint <= 4447) ||
        (8986 <= codePoint && codePoint <= 8987) ||
        (9001 <= codePoint && codePoint <= 9002) ||
        (9193 <= codePoint && codePoint <= 9196) ||
        (codePoint == 9200) ||
        (codePoint == 9203) ||
        (9725 <= codePoint && codePoint <= 9726) ||
        (9748 <= codePoint && codePoint <= 9749) ||
        (9800 <= codePoint && codePoint <= 9811) ||
        (codePoint == 9855) ||
        (codePoint == 9875) ||
        (codePoint == 9889) ||
        (9898 <= codePoint && codePoint <= 9899) ||
        (9917 <= codePoint && codePoint <= 9918) ||
        (9924 <= codePoint && codePoint <= 9925) ||
        (codePoint == 9934) ||
        (codePoint == 9940) ||
        (codePoint == 9962) ||
        (9970 <= codePoint && codePoint <= 9971) ||
        (codePoint == 9973) ||
        (codePoint == 9978) ||
        (codePoint == 9981) ||
        (codePoint == 9989) ||
        (9994 <= codePoint && codePoint <= 9995) ||
        (codePoint == 10024) ||
        (codePoint == 10060) ||
        (codePoint == 10062) ||
        (10067 <= codePoint && codePoint <= 10069) ||
        (codePoint == 10071) ||
        (10133 <= codePoint && codePoint <= 10135) ||
        (codePoint == 10160) ||
        (codePoint == 10175) ||
        (11035 <= codePoint && codePoint <= 11036) ||
        (codePoint == 11088) ||
        (codePoint == 11093) ||
        (11904 <= codePoint && codePoint <= 11929) ||
        (11931 <= codePoint && codePoint <= 12019) ||
        (12032 <= codePoint && codePoint <= 12245) ||
        (12272 <= codePoint && codePoint <= 12283) ||
        (12289 <= codePoint && codePoint <= 12350) ||
        (12353 <= codePoint && codePoint <= 12438) ||
        (12441 <= codePoint && codePoint <= 12543) ||
        (12549 <= codePoint && codePoint <= 12589) ||
        (12593 <= codePoint && codePoint <= 12686) ||
        (12688 <= codePoint && codePoint <= 12730) ||
        (12736 <= codePoint && codePoint <= 12771) ||
        (12784 <= codePoint && codePoint <= 12830) ||
        (12832 <= codePoint && codePoint <= 12871) ||
        (12880 <= codePoint && codePoint <= 13054) ||
        (13056 <= codePoint && codePoint <= 19903) ||
        (19968 <= codePoint && codePoint <= 42124) ||
        (42128 <= codePoint && codePoint <= 42182) ||
        (43360 <= codePoint && codePoint <= 43388) ||
        (44032 <= codePoint && codePoint <= 55203) ||
        (63744 <= codePoint && codePoint <= 64255) ||
        (65040 <= codePoint && codePoint <= 65049) ||
        (65072 <= codePoint && codePoint <= 65106) ||
        (65108 <= codePoint && codePoint <= 65126) ||
        (65128 <= codePoint && codePoint <= 65131) ||
        (codePoint == 94176) ||
        (94208 <= codePoint && codePoint <= 100332) ||
        (100352 <= codePoint && codePoint <= 101106) ||
        (110592 <= codePoint && codePoint <= 110593) ||
        (codePoint == 126980) ||
        (codePoint == 127183) ||
        (codePoint == 127374) ||
        (127377 <= codePoint && codePoint <= 127386) ||
        (127488 <= codePoint && codePoint <= 127490) ||
        (127504 <= codePoint && codePoint <= 127547) ||
        (127552 <= codePoint && codePoint <= 127560) ||
        (127568 <= codePoint && codePoint <= 127569) ||
        (127744 <= codePoint && codePoint <= 127776) ||
        (127789 <= codePoint && codePoint <= 127797) ||
        (127799 <= codePoint && codePoint <= 127868) ||
        (127870 <= codePoint && codePoint <= 127891) ||
        (127904 <= codePoint && codePoint <= 127946) ||
        (127951 <= codePoint && codePoint <= 127955) ||
        (127968 <= codePoint && codePoint <= 127984) ||
        (codePoint == 127988) ||
        (127992 <= codePoint && codePoint <= 128062) ||
        (codePoint == 128064) ||
        (128066 <= codePoint && codePoint <= 128252) ||
        (128255 <= codePoint && codePoint <= 128317) ||
        (128331 <= codePoint && codePoint <= 128334) ||
        (128336 <= codePoint && codePoint <= 128359) ||
        (codePoint == 128378) ||
        (128405 <= codePoint && codePoint <= 128406) ||
        (codePoint == 128420) ||
        (128507 <= codePoint && codePoint <= 128591) ||
        (128640 <= codePoint && codePoint <= 128709) ||
        (codePoint == 128716) ||
        (128720 <= codePoint && codePoint <= 128722) ||
        (128747 <= codePoint && codePoint <= 128748) ||
        (128756 <= codePoint && codePoint <= 128758) ||
        (129296 <= codePoint && codePoint <= 129310) ||
        (129312 <= codePoint && codePoint <= 129319) ||
        (codePoint == 129328) ||
        (129331 <= codePoint && codePoint <= 129342) ||
        (129344 <= codePoint && codePoint <= 129355) ||
        (129360 <= codePoint && codePoint <= 129374) ||
        (129408 <= codePoint && codePoint <= 129425) ||
        (codePoint == 129472) ||
        (131072 <= codePoint && codePoint <= 196605) ||
        (196608 <= codePoint && codePoint <= 262141)) return EastAsianWidthProperty.W;
    if ((32 <= codePoint && codePoint <= 126) ||
        (162 <= codePoint && codePoint <= 163) ||
        (165 <= codePoint && codePoint <= 166) ||
        (codePoint == 172) ||
        (codePoint == 175) ||
        (10214 <= codePoint && codePoint <= 10221) ||
        (10629 <= codePoint && codePoint <= 10630)) return EastAsianWidthProperty.Na;
    if ((codePoint == 161) ||
        (codePoint == 164) ||
        (167 <= codePoint && codePoint <= 168) ||
        (codePoint == 170) ||
        (173 <= codePoint && codePoint <= 174) ||
        (176 <= codePoint && codePoint <= 180) ||
        (182 <= codePoint && codePoint <= 186) ||
        (188 <= codePoint && codePoint <= 191) ||
        (codePoint == 198) ||
        (codePoint == 208) ||
        (215 <= codePoint && codePoint <= 216) ||
        (222 <= codePoint && codePoint <= 225) ||
        (codePoint == 230) ||
        (232 <= codePoint && codePoint <= 234) ||
        (236 <= codePoint && codePoint <= 237) ||
        (codePoint == 240) ||
        (242 <= codePoint && codePoint <= 243) ||
        (247 <= codePoint && codePoint <= 250) ||
        (codePoint == 252) ||
        (codePoint == 254) ||
        (codePoint == 257) ||
        (codePoint == 273) ||
        (codePoint == 275) ||
        (codePoint == 283) ||
        (294 <= codePoint && codePoint <= 295) ||
        (codePoint == 299) ||
        (305 <= codePoint && codePoint <= 307) ||
        (codePoint == 312) ||
        (319 <= codePoint && codePoint <= 322) ||
        (codePoint == 324) ||
        (328 <= codePoint && codePoint <= 331) ||
        (codePoint == 333) ||
        (338 <= codePoint && codePoint <= 339) ||
        (358 <= codePoint && codePoint <= 359) ||
        (codePoint == 363) ||
        (codePoint == 462) ||
        (codePoint == 464) ||
        (codePoint == 466) ||
        (codePoint == 468) ||
        (codePoint == 470) ||
        (codePoint == 472) ||
        (codePoint == 474) ||
        (codePoint == 476) ||
        (codePoint == 593) ||
        (codePoint == 609) ||
        (codePoint == 708) ||
        (codePoint == 711) ||
        (713 <= codePoint && codePoint <= 715) ||
        (codePoint == 717) ||
        (codePoint == 720) ||
        (728 <= codePoint && codePoint <= 731) ||
        (codePoint == 733) ||
        (codePoint == 735) ||
        (768 <= codePoint && codePoint <= 879) ||
        (913 <= codePoint && codePoint <= 929) ||
        (931 <= codePoint && codePoint <= 937) ||
        (945 <= codePoint && codePoint <= 961) ||
        (963 <= codePoint && codePoint <= 969) ||
        (codePoint == 1025) ||
        (1040 <= codePoint && codePoint <= 1103) ||
        (codePoint == 1105) ||
        (codePoint == 8208) ||
        (8211 <= codePoint && codePoint <= 8214) ||
        (8216 <= codePoint && codePoint <= 8217) ||
        (8220 <= codePoint && codePoint <= 8221) ||
        (8224 <= codePoint && codePoint <= 8226) ||
        (8228 <= codePoint && codePoint <= 8231) ||
        (codePoint == 8240) ||
        (8242 <= codePoint && codePoint <= 8243) ||
        (codePoint == 8245) ||
        (codePoint == 8251) ||
        (codePoint == 8254) ||
        (codePoint == 8308) ||
        (codePoint == 8319) ||
        (8321 <= codePoint && codePoint <= 8324) ||
        (codePoint == 8364) ||
        (codePoint == 8451) ||
        (codePoint == 8453) ||
        (codePoint == 8457) ||
        (codePoint == 8467) ||
        (codePoint == 8470) ||
        (8481 <= codePoint && codePoint <= 8482) ||
        (codePoint == 8486) ||
        (codePoint == 8491) ||
        (8531 <= codePoint && codePoint <= 8532) ||
        (8539 <= codePoint && codePoint <= 8542) ||
        (8544 <= codePoint && codePoint <= 8555) ||
        (8560 <= codePoint && codePoint <= 8569) ||
        (codePoint == 8585) ||
        (8592 <= codePoint && codePoint <= 8601) ||
        (8632 <= codePoint && codePoint <= 8633) ||
        (codePoint == 8658) ||
        (codePoint == 8660) ||
        (codePoint == 8679) ||
        (codePoint == 8704) ||
        (8706 <= codePoint && codePoint <= 8707) ||
        (8711 <= codePoint && codePoint <= 8712) ||
        (codePoint == 8715) ||
        (codePoint == 8719) ||
        (codePoint == 8721) ||
        (codePoint == 8725) ||
        (codePoint == 8730) ||
        (8733 <= codePoint && codePoint <= 8736) ||
        (codePoint == 8739) ||
        (codePoint == 8741) ||
        (8743 <= codePoint && codePoint <= 8748) ||
        (codePoint == 8750) ||
        (8756 <= codePoint && codePoint <= 8759) ||
        (8764 <= codePoint && codePoint <= 8765) ||
        (codePoint == 8776) ||
        (codePoint == 8780) ||
        (codePoint == 8786) ||
        (8800 <= codePoint && codePoint <= 8801) ||
        (8804 <= codePoint && codePoint <= 8807) ||
        (8810 <= codePoint && codePoint <= 8811) ||
        (8814 <= codePoint && codePoint <= 8815) ||
        (8834 <= codePoint && codePoint <= 8835) ||
        (8838 <= codePoint && codePoint <= 8839) ||
        (codePoint == 8853) ||
        (codePoint == 8857) ||
        (codePoint == 8869) ||
        (codePoint == 8895) ||
        (codePoint == 8978) ||
        (9312 <= codePoint && codePoint <= 9449) ||
        (9451 <= codePoint && codePoint <= 9547) ||
        (9552 <= codePoint && codePoint <= 9587) ||
        (9600 <= codePoint && codePoint <= 9615) ||
        (9618 <= codePoint && codePoint <= 9621) ||
        (9632 <= codePoint && codePoint <= 9633) ||
        (9635 <= codePoint && codePoint <= 9641) ||
        (9650 <= codePoint && codePoint <= 9651) ||
        (9654 <= codePoint && codePoint <= 9655) ||
        (9660 <= codePoint && codePoint <= 9661) ||
        (9664 <= codePoint && codePoint <= 9665) ||
        (9670 <= codePoint && codePoint <= 9672) ||
        (codePoint == 9675) ||
        (9678 <= codePoint && codePoint <= 9681) ||
        (9698 <= codePoint && codePoint <= 9701) ||
        (codePoint == 9711) ||
        (9733 <= codePoint && codePoint <= 9734) ||
        (codePoint == 9737) ||
        (9742 <= codePoint && codePoint <= 9743) ||
        (codePoint == 9756) ||
        (codePoint == 9758) ||
        (codePoint == 9792) ||
        (codePoint == 9794) ||
        (9824 <= codePoint && codePoint <= 9825) ||
        (9827 <= codePoint && codePoint <= 9829) ||
        (9831 <= codePoint && codePoint <= 9834) ||
        (9836 <= codePoint && codePoint <= 9837) ||
        (codePoint == 9839) ||
        (9886 <= codePoint && codePoint <= 9887) ||
        (codePoint == 9919) ||
        (9926 <= codePoint && codePoint <= 9933) ||
        (9935 <= codePoint && codePoint <= 9939) ||
        (9941 <= codePoint && codePoint <= 9953) ||
        (codePoint == 9955) ||
        (9960 <= codePoint && codePoint <= 9961) ||
        (9963 <= codePoint && codePoint <= 9969) ||
        (codePoint == 9972) ||
        (9974 <= codePoint && codePoint <= 9977) ||
        (9979 <= codePoint && codePoint <= 9980) ||
        (9982 <= codePoint && codePoint <= 9983) ||
        (codePoint == 10045) ||
        (10102 <= codePoint && codePoint <= 10111) ||
        (11094 <= codePoint && codePoint <= 11097) ||
        (12872 <= codePoint && codePoint <= 12879) ||
        (57344 <= codePoint && codePoint <= 63743) ||
        (65024 <= codePoint && codePoint <= 65039) ||
        (codePoint == 65533) ||
        (127232 <= codePoint && codePoint <= 127242) ||
        (127248 <= codePoint && codePoint <= 127277) ||
        (127280 <= codePoint && codePoint <= 127337) ||
        (127344 <= codePoint && codePoint <= 127373) ||
        (127375 <= codePoint && codePoint <= 127376) ||
        (127387 <= codePoint && codePoint <= 127404) ||
        (917760 <= codePoint && codePoint <= 917999) ||
        (983040 <= codePoint && codePoint <= 1048573) ||
        (1048576 <= codePoint && codePoint <= 1114109)) return EastAsianWidthProperty.A;
    return EastAsianWidthProperty.N;
}
