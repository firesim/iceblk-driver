ifneq ($(KERNELRELEASE),)

obj-m += iceblk.o

else

ifndef LINUXSRC
$(error Please set the LINUXSRC environment variable to the path of your Linux source)
endif

KMAKE=make -C $(LINUXSRC) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu- M=$(PWD)

iceblk.ko: iceblk.c
	$(KMAKE)

clean:
	$(KMAKE) clean

endif
