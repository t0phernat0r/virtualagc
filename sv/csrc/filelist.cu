PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _19875_archive_1.so
_19875_archive_1.so : archive.0/_19875_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19875_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19875_archive_1.so $@


ARCHIVE_OBJS += _19881_archive_1.so
_19881_archive_1.so : archive.0/_19881_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19881_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19881_archive_1.so $@


ARCHIVE_OBJS += _19882_archive_1.so
_19882_archive_1.so : archive.0/_19882_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19882_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19882_archive_1.so $@


ARCHIVE_OBJS += _19883_archive_1.so
_19883_archive_1.so : archive.0/_19883_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19883_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19883_archive_1.so $@


ARCHIVE_OBJS += _19884_archive_1.so
_19884_archive_1.so : archive.0/_19884_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19884_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19884_archive_1.so $@


ARCHIVE_OBJS += _19885_archive_1.so
_19885_archive_1.so : archive.0/_19885_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19885_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19885_archive_1.so $@


ARCHIVE_OBJS += _19886_archive_1.so
_19886_archive_1.so : archive.0/_19886_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19886_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19886_archive_1.so $@


ARCHIVE_OBJS += _19887_archive_1.so
_19887_archive_1.so : archive.0/_19887_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19887_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19887_archive_1.so $@


ARCHIVE_OBJS += _19888_archive_1.so
_19888_archive_1.so : archive.0/_19888_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19888_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19888_archive_1.so $@


ARCHIVE_OBJS += _19889_archive_1.so
_19889_archive_1.so : archive.0/_19889_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_19889_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_19889_archive_1.so $@






%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \


CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
amcQwB.o objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

