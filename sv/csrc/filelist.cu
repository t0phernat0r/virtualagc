PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _4164_archive_1.so
_4164_archive_1.so : archive.0/_4164_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4164_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4164_archive_1.so $@


ARCHIVE_OBJS += _4170_archive_1.so
_4170_archive_1.so : archive.0/_4170_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4170_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4170_archive_1.so $@


ARCHIVE_OBJS += _4171_archive_1.so
_4171_archive_1.so : archive.0/_4171_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4171_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4171_archive_1.so $@


ARCHIVE_OBJS += _4172_archive_1.so
_4172_archive_1.so : archive.0/_4172_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4172_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4172_archive_1.so $@


ARCHIVE_OBJS += _4173_archive_1.so
_4173_archive_1.so : archive.0/_4173_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4173_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4173_archive_1.so $@


ARCHIVE_OBJS += _4174_archive_1.so
_4174_archive_1.so : archive.0/_4174_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4174_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4174_archive_1.so $@


ARCHIVE_OBJS += _4175_archive_1.so
_4175_archive_1.so : archive.0/_4175_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4175_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4175_archive_1.so $@


ARCHIVE_OBJS += _4176_archive_1.so
_4176_archive_1.so : archive.0/_4176_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4176_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4176_archive_1.so $@


ARCHIVE_OBJS += _4177_archive_1.so
_4177_archive_1.so : archive.0/_4177_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4177_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4177_archive_1.so $@


ARCHIVE_OBJS += _4178_archive_1.so
_4178_archive_1.so : archive.0/_4178_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_4178_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_4178_archive_1.so $@






%.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \


CU_LVL_OBJS = \
SIM_l.o 

MAIN_OBJS = \
amcQwB.o objs/amcQw_d.o 

CU_OBJS = $(MAIN_OBJS) $(ARCHIVE_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)

