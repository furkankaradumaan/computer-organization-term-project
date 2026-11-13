#define N       37U // 24 + (D2 mod 25), D2=13
#define R       26U
#define B       65U

const int SID = 1240013;
unsigned numbers[N];
unsigned checksum;
unsigned decrypt_ok;

unsigned get_next_number(unsigned*);
void initialize_numbers();
unsigned decrypt_successful();
unsigned rotate_left(unsigned);
unsigned calculate_checksum();
void xor_numbers(unsigned K);

int main() {
        unsigned K;
        if (SID % 256 == 0) K = 0xA5;
        else K = SID % 256;
        initialize_numbers();
        
        xor_numbers(K);
        checksum = calculate_checksum();
        
        xor_numbers(K);
        decrypt_ok = decrypt_successful();
        
        return 0;
}
unsigned get_next_number(unsigned *x) {
        *x = 1664525U * (*x) + 1013904223U;
        return ((*x) >> 16) % R + B;
}
void initialize_numbers() {
        unsigned x = SID;
        for (int i = 0; i < N; i++) numbers[i] = get_next_number(&x);
}
unsigned decrypt_successful() {
        unsigned x = SID;
        unsigned is_same = 1;
        for (int i = 0; i < N && is_same; i++) is_same = numbers[i] == get_next_number(&x);
        return is_same;
}
unsigned rotate_left(unsigned x) { 
        return (x << 1) | ((x >> 31) & 1); 
}
unsigned calculate_checksum() {
        unsigned c = 0;
        for (int i = 0; i < N; i++) c = rotate_left(c) + numbers[i];
        return c;
}
void xor_numbers(unsigned K) {
        for (int i = 0; i < N; i++) numbers[i] ^= K;
}
