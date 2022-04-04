PIC_LD=ld

ARCHIVE_OBJS=
<<<<<<< HEAD
ARCHIVE_OBJS += _30882_archive_1.so
_30882_archive_1.so : archive.20/_30882_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30882_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30882_archive_1.so $@


ARCHIVE_OBJS += _30888_archive_1.so
_30888_archive_1.so : archive.20/_30888_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30888_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30888_archive_1.so $@


ARCHIVE_OBJS += _30889_archive_1.so
_30889_archive_1.so : archive.20/_30889_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30889_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30889_archive_1.so $@


ARCHIVE_OBJS += _30890_archive_1.so
_30890_archive_1.so : archive.20/_30890_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30890_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30890_archive_1.so $@


ARCHIVE_OBJS += _30891_archive_1.so
_30891_archive_1.so : archive.20/_30891_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30891_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30891_archive_1.so $@


ARCHIVE_OBJS += _30892_archive_1.so
_30892_archive_1.so : archive.20/_30892_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30892_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30892_archive_1.so $@


ARCHIVE_OBJS += _30893_archive_1.so
_30893_archive_1.so : archive.20/_30893_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30893_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30893_archive_1.so $@


ARCHIVE_OBJS += _30894_archive_1.so
_30894_archive_1.so : archive.20/_30894_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30894_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30894_archive_1.so $@


ARCHIVE_OBJS += _30895_archive_1.so
_30895_archive_1.so : archive.20/_30895_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_30895_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_30895_archive_1.so $@


ARCHIVE_OBJS += _prev_archive_1.so
_prev_archive_1.so : archive.20/_prev_archive_1.a
=======
ARCHIVE_OBJS += _418_archive_1.so
_418_archive_1.so : archive.26/_418_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_418_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_418_archive_1.so $@


ARCHIVE_OBJS += _prev_archive_1.so
_prev_archive_1.so : archive.26/_prev_archive_1.a
>>>>>>> 0a35184ec1a5591d98d24617779581bab1275538
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

