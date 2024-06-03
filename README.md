# euckr-d

Simple EUC-KR to UTF-8 decoder.

EUC-KR Table in here: [uic.io](https://uic.io/en/charset/show/euc-kr)

## Specs

* `@safe`:⭕
* `betterC`:❌

## Example

```.d
ubyte[9] rok = [0xB4, 0xEB, 0xC7, 0xD1, 0x20, 0xB9, 0xCE, 0xB1, 0xB9];
wchar[] x = EucKr.decode(rok);
assert(x=="대한 민국");
```

## License

MIT

