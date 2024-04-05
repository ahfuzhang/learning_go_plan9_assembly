#include "../caesar/fastcgo/caesar.h"
#include "../caesar/fastcgo/caesar_avx2.h"
#include "../caesar/fastcgo/caesar_avx512.h"

void init_caesar_table(CaesarTable* table){
    for (int i=0; i<26; i++){
        for (int j=0; j<256; j++){
            if (j>='a' && j<='z'){
                (*table)[i][j] = (uint8_t)((j-'a'+i)%26 + 'a');
            } else if (j>='A' && j<='Z'){
                (*table)[i][j] = (uint8_t)((j-'A'+i)%26 + 'A');
            } else {
                (*table)[i][j] = j;
            }
        }
    }
}

typedef void (*CaesarCryptFunc)(SliceHeader* out, const SliceHeader* in, int rotate, const CaesarTable* table);

void testCaesar(){
    CaesarTable t;
    init_caesar_table(&t);
    const char* s = "abcdefghijklmnopqrstuvwxyz.ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789...";
    int len = strlen(s);
    uint8_t* out_buf = malloc(len+1);
    int rot = 0;
    //
    SliceHeader in = {.ptr=(uint64_t)s, .len=(uint64_t)len, .cap=(uint64_t)len};
    SliceHeader out = {.ptr=(uint64_t)out_buf, .len=(uint64_t)len, .cap=(uint64_t)len};
	//
	CaesarCryptFunc funcs[] = {
		caesar_crypt,
		caesar_crypt_avx2,
		caesar_crypt_avx512,
	};
	for (int i=0; i<sizeof(funcs)/sizeof(funcs[0]); i++){
		funcs[i](&out, &in, rot, &t);
	}
    //caesar_crypt(&out, &in, rot, &t);
    out_buf[len] = '\0';
    printf("in :%s\n", s);
    printf("out:%s | caesar_crypt c\n", out_buf);
}

int main(){
	testCaesar();
	return 0;
}
