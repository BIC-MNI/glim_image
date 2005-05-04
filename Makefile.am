ACLOCAL_AMFLAGS = -I m4

bin_PROGRAMS = glim_image

glim_image_SOURCES = glim.c \
	glim_image.c \
	matrix.c \
	smoothness.c

noinst_HEADERS = glim.h \
	matrix.h \
	smoothness.h

EXTRA_DIST = $(m4_files)

m4_files = m4/mni_REQUIRE_LIB.m4 \
	m4/mni_REQUIRE_MNILIBS.m4 \
	m4/smr_WITH_BUILD_PATH.m4



