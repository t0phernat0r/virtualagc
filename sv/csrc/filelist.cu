PIC_LD=ld

ARCHIVE_OBJS=
ARCHIVE_OBJS += _5473_archive_1.so
_5473_archive_1.so : archive.17/_5473_archive_1.a
	@$(AR) -s $<
	@$(PIC_LD) -shared  -o .//../simv.daidir//_5473_archive_1.so --whole-archive $< --no-whole-archive
	@rm -f $@
	@ln -sf .//../simv.daidir//_5473_archive_1.so $@


ARCHIVE_OBJS += _prev_archive_1.so
_prev_archive_1.so : archive.17/_prev_archive_1.a
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

