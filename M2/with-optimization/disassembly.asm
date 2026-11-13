
main-o1.elf:     file format elf32-littleriscv


Disassembly of section .text:

00010094 <get_next_number>:
        decrypt_ok = decrypt_successful();
        
        return 0;
}
unsigned get_next_number(unsigned *x) {
        *x = 1664525U * (*x) + 1013904223U;
   10094:	00052783          	lw	a5,0(a0)
   10098:	00196737          	lui	a4,0x196
   1009c:	60d70713          	addi	a4,a4,1549 # 19660d <__global_pointer$+0x184bc9>
   100a0:	02e787b3          	mul	a5,a5,a4
   100a4:	3c6ef737          	lui	a4,0x3c6ef
   100a8:	35f70713          	addi	a4,a4,863 # 3c6ef35f <__global_pointer$+0x3c6dd91b>
   100ac:	00e787b3          	add	a5,a5,a4
   100b0:	00f52023          	sw	a5,0(a0)
        return ((*x) >> 16) % R + B;
   100b4:	0107d513          	srli	a0,a5,0x10
   100b8:	4ec4f7b7          	lui	a5,0x4ec4f
   100bc:	c4f78793          	addi	a5,a5,-945 # 4ec4ec4f <__global_pointer$+0x4ec3d20b>
   100c0:	02f537b3          	mulhu	a5,a0,a5
   100c4:	0037d793          	srli	a5,a5,0x3
   100c8:	01a00713          	li	a4,26
   100cc:	02e787b3          	mul	a5,a5,a4
   100d0:	40f50533          	sub	a0,a0,a5
}
   100d4:	04150513          	addi	a0,a0,65
   100d8:	00008067          	ret

000100dc <initialize_numbers>:
void initialize_numbers() {
   100dc:	fe010113          	addi	sp,sp,-32
   100e0:	00112e23          	sw	ra,28(sp)
   100e4:	00812c23          	sw	s0,24(sp)
   100e8:	00912a23          	sw	s1,20(sp)
   100ec:	01212823          	sw	s2,16(sp)
        unsigned x = SID;
   100f0:	0012f7b7          	lui	a5,0x12f
   100f4:	bcd78793          	addi	a5,a5,-1075 # 12ebcd <__global_pointer$+0x11d189>
   100f8:	00f12623          	sw	a5,12(sp)
        for (int i = 0; i < N; i++) numbers[i] = get_next_number(&x);
   100fc:	80c18413          	addi	s0,gp,-2036 # 11250 <numbers>
   10100:	09440913          	addi	s2,s0,148
   10104:	00c10493          	addi	s1,sp,12
   10108:	00048513          	mv	a0,s1
   1010c:	f89ff0ef          	jal	10094 <get_next_number>
   10110:	00a42023          	sw	a0,0(s0)
   10114:	00440413          	addi	s0,s0,4
   10118:	ff2418e3          	bne	s0,s2,10108 <initialize_numbers+0x2c>
}
   1011c:	01c12083          	lw	ra,28(sp)
   10120:	01812403          	lw	s0,24(sp)
   10124:	01412483          	lw	s1,20(sp)
   10128:	01012903          	lw	s2,16(sp)
   1012c:	02010113          	addi	sp,sp,32
   10130:	00008067          	ret

00010134 <decrypt_successful>:
unsigned decrypt_successful() {
   10134:	fd010113          	addi	sp,sp,-48
   10138:	02112623          	sw	ra,44(sp)
   1013c:	02812423          	sw	s0,40(sp)
   10140:	02912223          	sw	s1,36(sp)
   10144:	03212023          	sw	s2,32(sp)
   10148:	01312e23          	sw	s3,28(sp)
        unsigned x = SID;
   1014c:	0012f7b7          	lui	a5,0x12f
   10150:	bcd78793          	addi	a5,a5,-1075 # 12ebcd <__global_pointer$+0x11d189>
   10154:	00f12623          	sw	a5,12(sp)
        unsigned is_same = 1;
        for (int i = 0; i < N && is_same; i++) is_same = numbers[i] == get_next_number(&x);
   10158:	80c18413          	addi	s0,gp,-2036 # 11250 <numbers>
   1015c:	09040993          	addi	s3,s0,144
   10160:	00c10913          	addi	s2,sp,12
   10164:	00042483          	lw	s1,0(s0)
   10168:	00090513          	mv	a0,s2
   1016c:	f29ff0ef          	jal	10094 <get_next_number>
   10170:	03340663          	beq	s0,s3,1019c <decrypt_successful+0x68>
   10174:	00440413          	addi	s0,s0,4
   10178:	fea486e3          	beq	s1,a0,10164 <decrypt_successful+0x30>
   1017c:	00000513          	li	a0,0
        return is_same;
}
   10180:	02c12083          	lw	ra,44(sp)
   10184:	02812403          	lw	s0,40(sp)
   10188:	02412483          	lw	s1,36(sp)
   1018c:	02012903          	lw	s2,32(sp)
   10190:	01c12983          	lw	s3,28(sp)
   10194:	03010113          	addi	sp,sp,48
   10198:	00008067          	ret
        for (int i = 0; i < N && is_same; i++) is_same = numbers[i] == get_next_number(&x);
   1019c:	40a48533          	sub	a0,s1,a0
   101a0:	00153513          	seqz	a0,a0
        return is_same;
   101a4:	fddff06f          	j	10180 <decrypt_successful+0x4c>

000101a8 <rotate_left>:
unsigned rotate_left(unsigned x) { 
        return (x << 1) | ((x >> 31) & 1); 
   101a8:	01f55793          	srli	a5,a0,0x1f
   101ac:	00151513          	slli	a0,a0,0x1
}
   101b0:	00f56533          	or	a0,a0,a5
   101b4:	00008067          	ret

000101b8 <calculate_checksum>:
unsigned calculate_checksum() {
        unsigned c = 0;
        for (int i = 0; i < N; i++) c = rotate_left(c) + numbers[i];
   101b8:	80c18793          	addi	a5,gp,-2036 # 11250 <numbers>
   101bc:	09478693          	addi	a3,a5,148
        unsigned c = 0;
   101c0:	00000513          	li	a0,0
        return (x << 1) | ((x >> 31) & 1); 
   101c4:	01f55713          	srli	a4,a0,0x1f
   101c8:	00151513          	slli	a0,a0,0x1
   101cc:	00e56533          	or	a0,a0,a4
        for (int i = 0; i < N; i++) c = rotate_left(c) + numbers[i];
   101d0:	0007a703          	lw	a4,0(a5)
   101d4:	00e50533          	add	a0,a0,a4
   101d8:	00478793          	addi	a5,a5,4
   101dc:	fed794e3          	bne	a5,a3,101c4 <calculate_checksum+0xc>
        return c;
}
   101e0:	00008067          	ret

000101e4 <xor_numbers>:
void xor_numbers(unsigned K) {
        for (int i = 0; i < N; i++) numbers[i] ^= K;
   101e4:	80c18793          	addi	a5,gp,-2036 # 11250 <numbers>
   101e8:	09478693          	addi	a3,a5,148
   101ec:	0007a703          	lw	a4,0(a5)
   101f0:	00a74733          	xor	a4,a4,a0
   101f4:	00e7a023          	sw	a4,0(a5)
   101f8:	00478793          	addi	a5,a5,4
   101fc:	fed798e3          	bne	a5,a3,101ec <xor_numbers+0x8>
}
   10200:	00008067          	ret

00010204 <main>:
int main() {
   10204:	ff010113          	addi	sp,sp,-16
   10208:	00112623          	sw	ra,12(sp)
        initialize_numbers();
   1020c:	ed1ff0ef          	jal	100dc <initialize_numbers>
        xor_numbers(K);
   10210:	0cd00513          	li	a0,205
   10214:	fd1ff0ef          	jal	101e4 <xor_numbers>
        checksum = calculate_checksum();
   10218:	fa1ff0ef          	jal	101b8 <calculate_checksum>
   1021c:	80a1a423          	sw	a0,-2040(gp) # 1124c <checksum>
        xor_numbers(K);
   10220:	0cd00513          	li	a0,205
   10224:	fc1ff0ef          	jal	101e4 <xor_numbers>
        decrypt_ok = decrypt_successful();
   10228:	f0dff0ef          	jal	10134 <decrypt_successful>
   1022c:	000117b7          	lui	a5,0x11
   10230:	24a7a423          	sw	a0,584(a5) # 11248 <decrypt_ok>
}
   10234:	00000513          	li	a0,0
   10238:	00c12083          	lw	ra,12(sp)
   1023c:	01010113          	addi	sp,sp,16
   10240:	00008067          	ret
