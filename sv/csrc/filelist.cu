PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _21233_archive_1.so
_21233_archive_1.so : archive.39/_21233_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_21233_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_21233_archive_1.so $@


ARCHIVE_OBJS += _21239_archive_1.so
_21239_archive_1.so : archive.39/_21239_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_21239_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_21239_archive_1.so $@


ARCHIVE_OBJS += _21240_archive_1.so
_21240_archive_1.so : archive.39/_21240_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_21240_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_21240_archive_1.so $@


ARCHIVE_OBJS += _21241_archive_1.so
_21241_archive_1.so : archive.39/_21241_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_21241_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_21241_archive_1.so $@


ARCHIVE_OBJS += _21242_archive_1.so
_21242_archive_1.so : archive.39/_21242_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_21242_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_21242_archive_1.so $@


ARCHIVE_OBJS += _21243_archive_1.so
_21243_archive_1.so : archive.39/_21243_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_21243_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_21243_archive_1.so $@


ARCHIVE_OBJS += _21244_archive_1.so
_21244_archive_1.so : archive.39/_21244_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_21244_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_21244_archive_1.so $@


ARCHIVE_OBJS += _21245_archive_1.so
_21245_archive_1.so : archive.39/_21245_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_21245_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_21245_archive_1.so $@


ARCHIVE_OBJS += _21246_archive_1.so
_21246_archive_1.so : archive.39/_21246_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_21246_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_21246_archive_1.so $@






%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \


CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
amcQwB.o objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

