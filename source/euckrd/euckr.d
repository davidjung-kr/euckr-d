module euckrd.euckr;

import euckrd.table;

struct EucKr {
    @safe
    private static int floor(double x) {
        return cast(int)x - ((x>0) ? 0:1);
    }

    @safe
    public static wchar[] decodeFromStr(string str) {
        return decode(cast(ubyte[])str.dup);
    }

    @safe
    public static wchar[] decode(ubyte[] chars) {
        wchar[] result;
        result.reserve(chars.length);
        int i=0;
        while(i<chars.length) {
            bool kYn = chars[i]>=161 && chars[i]<=253;
            if (kYn) {
                ushort a = cast(ushort)(chars[i]-161);
                ushort b = cast(ushort)(chars[i+1]-160);
                ushort x = cast(ushort)(b%16);
                ushort y = cast(ushort)(a*6+floor(b/16));
                result ~= EUC_KR_MAP[y][x];
            } else {
                ubyte a = chars[i];
                result ~= a;
            }
            i += kYn ? 2:1;
        }
        return result;
    }

    unittest {
        assert(floor(75/16)==4);
    }
}

unittest {
    assert(EucKr.decode([0xB4, 0xEB, 0xC7, 0xD1, 0x20, 0xB9, 0xCE, 0xB1, 0xB9])=="대한 민국");
    assert(EucKr.decode([0x20])==" ");
    assert(EucKr.decode([0xB4, 0xEB])=="대");
    assert(EucKr.decode([0xC8, 0xC6, 0xB9, 0xDF, 0xB3, 0xF0])=="훈발놈");
}