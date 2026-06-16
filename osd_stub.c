/*
 * osd_stub.c — Fortran-free replacement for osdwspr.f90.
 *
 * OSD (ordered-statistics deep decode) is dead code by default: wsprd.c
 * starts ndepth=-1 and only calls osdwspr_ under `if((ndepth>=0)&&...)`,
 * which requires the `-o` flag. This no-op satisfies the linker so the
 * binary builds with gcc alone (no gfortran). The trade-off is the `-o`
 * deep-decode tier, intentionally dropped: it adds ~10% weakest/lowest-
 * confidence decodes, which we exclude at the source for dataset hygiene.
 *
 * osdwspr.f90 / indexx.f90 remain in the tree but are not compiled.
 */
void osdwspr_(float a[], unsigned char b[], int *c,
              unsigned char d[], int *e, float *f)
{
    (void)a; (void)b; (void)c; (void)d; (void)e; (void)f;
}
