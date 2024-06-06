# euckr-d

Simple EUC-KR to UTF-8 decoder.

EUC-KR Table in here: [uic.io](https://uic.io/en/charset/show/euc-kr)

## Specs

* No need `std(phobos)`, dependencies nothing
* `@safe`:⭕
* `betterC`:❌

## Install

I have no any plan for registering on [dub repo](https://code.dlang.org) cause my code so sucks.

Just use `add-repo` by `dub`.

```.sh
cd your_workspace
git clone https://github.com/davidjung-kr/euckr-d
dub add-local ./euckr-d
```
Check out [dub.pm#dub-add-local](https://dub.pm/cli-reference/dub-add-local).

## Example

```.d
ubyte[9] rok = [0xB4, 0xEB, 0xC7, 0xD1, 0x20, 0xB9, 0xCE, 0xB1, 0xB9];
wchar[] x = EucKr.decode(rok);
assert(x=="대한 민국");
```

## License

MIT
