PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _4329_archive_1.so
_4329_archive_1.so : archive.21/_4329_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4329_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4329_archive_1.so $@


ARCHIVE_OBJS += _4334_archive_1.so
_4334_archive_1.so : archive.21/_4334_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4334_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4334_archive_1.so $@


ARCHIVE_OBJS += _4335_archive_1.so
_4335_archive_1.so : archive.21/_4335_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4335_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4335_archive_1.so $@


ARCHIVE_OBJS += _4336_archive_1.so
_4336_archive_1.so : archive.21/_4336_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4336_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4336_archive_1.so $@


ARCHIVE_OBJS += _4337_archive_1.so
_4337_archive_1.so : archive.21/_4337_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4337_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4337_archive_1.so $@


ARCHIVE_OBJS += _4338_archive_1.so
_4338_archive_1.so : archive.21/_4338_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4338_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4338_archive_1.so $@


ARCHIVE_OBJS += _4339_archive_1.so
_4339_archive_1.so : archive.21/_4339_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4339_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4339_archive_1.so $@


ARCHIVE_OBJS += _4340_archive_1.so
_4340_archive_1.so : archive.21/_4340_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4340_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4340_archive_1.so $@


ARCHIVE_OBJS += _4341_archive_1.so
_4341_archive_1.so : archive.21/_4341_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4341_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4341_archive_1.so $@


ARCHIVE_OBJS += _prev_archive_1.so
_prev_archive_1.so : archive.21/_prev_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_prev_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_prev_archive_1.so $@






%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \


CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
amcQwB.o objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

