From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] elf(5): document notes
Date: Sat, 26 Nov 2016 22:31:37 -0500
Message-ID: <20161127033137.31756-1-vapier@gentoo.org>
References: <20161117205939.2295-1-vapier@gentoo.org>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117205939.2295-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a rough first pass for documenting the Elf{32,64}_Nhdr structure,
the sections/segments that contain notes, and how to interpret them.  I've
been lazy and only included the GNU extensions here, especially as others
are not defined in the elf.h header file as shipped by glibc.

I've mostly used binutils, glibc, breakpad, and the GABI ELF spec as
sources of data for these fields.

Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
---
v2
	- integrated feedback & rewrote much of the main content

 man5/elf.5 | 308 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 298 insertions(+), 10 deletions(-)

diff --git a/man5/elf.5 b/man5/elf.5
index 2e731f2e4094..cebdd0f3dd32 100644
--- a/man5/elf.5
+++ b/man5/elf.5
@@ -708,7 +708,7 @@ However it may not occur more than once in a file.
 If it is present, it must precede any loadable segment entry.
 .TP
 .BR PT_NOTE
-The array element specifies the location and size for auxiliary information.
+The array element specifies the location of notes (ElfN_Nhdr).
 .TP
 .BR PT_SHLIB
 This segment type is reserved but has unspecified semantics.
@@ -970,7 +970,7 @@ An object file may
 have only one dynamic section.
 .TP
 .BR SHT_NOTE
-This section holds information that marks the file in some way.
+This section holds notes (ElfN_Nhdr).
 .TP
 .BR SHT_NOBITS
 A section of this type occupies no space in the file but otherwise
@@ -1281,17 +1281,31 @@ This section is of type
 No attribute types are used.
 .TP
 .IR .note
-This section holds information in the
-"Note Section"
-format.
+This section holds various notes.
 This section is of type
 .BR SHT_NOTE .
 No attribute types are used.
-OpenBSD
-native executables usually contain a
-.I .note.openbsd.ident
-section to identify themselves, for the kernel to bypass any compatibility
-ELF binary emulation tests when loading the file.
+.TP
+.IR .note.ABI-tag
+This section is used to declare the expected runtime ABI of the ELF.
+It may include the operating system name and its runtime versions.
+This section is of type
+.BR SHT_NOTE .
+The only attribute used is
+.BR SHF_ALLOC .
+.TP
+.IR .note.gnu.build-id
+This section is used to hold an ID that uniquely identifies the contents of the
+ELF.
+Different files with the same build ID should contain the same executable
+content.
+See the
+.IR \-\-build\-id
+option to the GNU linker (\fBld\fR (1)) for more details.
+This section is of type
+.BR SHT_NOTE .
+The only attribute used is
+.BR SHF_ALLOC .
 .TP
 .IR .note.GNU-stack
 This section is used in Linux object files for declaring stack attributes.
@@ -1302,6 +1316,11 @@ The only attribute used is
 This indicates to the GNU linker that the object file requires an
 executable stack.
 .TP
+.IR .note.openbsd.ident
+OpenBSD native executables usually contain this section to identify themselves
+so the kernel can bypass any compatibility ELF binary emulation tests when
+loading the file.
+.TP
 .IR .plt
 This section holds the procedure linkage table.
 This section is of type
@@ -1801,6 +1820,275 @@ Array containing all the dynamic structures in the
 .I .dynamic
 section.
 This is automatically populated by the linker.
+.\" GABI ELF Reference for Note Sections:
+.\" http://www.sco.com/developers/gabi/latest/ch5.pheader.html#note_section
+.\"
+.\" Note that it implies the sizes and alignments of notes depend on the ELF
+.\" size (e.g. 32-bit ELFs have three 4-byte words and use 4-byte alignment
+.\" while 64-bit ELFs use 8-byte words & alignment), but that is not the case
+.\" in the real world.  Notes always have three 4-byte words as can be seen
+.\" in the source links below (remember that Elf64_Word is a 32-bit quantity).
+.\" glibc:    https://sourceware.org/git/?p=glibc.git;a=blob;f=elf/elf.h;h=9e59b3275917549af0cebe1f2de9ded3b7b10bf2#l1173
+.\" binutils: https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=binutils/readelf.c;h=274ddd17266aef6e4ad1f67af8a13a21500ff2af#l15943
+.\" Linux:    https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/elf.h?h=v4.8#n422
+.\" Solaris:  https://docs.oracle.com/cd/E23824_01/html/819-0690/chapter6-18048.html
+.\" FreeBSD:  https://svnweb.freebsd.org/base/head/sys/sys/elf_common.h?revision=303677&view=markup#l33
+.\" NetBSD:   https://www.netbsd.org/docs/kernel/elf-notes.html
+.\" OpenBSD:  https://github.com/openbsd/src/blob/master/sys/sys/exec_elf.h#L533
+.SS Notes (Nhdr)
+ELF notes allow for appending arbitrary information for the system to use.
+They are largely used by core files (\fIe_type\fR of \fIET_CORE\fR),
+but many projects define their own set of extensions.
+For example, the GNU project passes info from the linker to the C library.
+
+Note sections contain a series of notes (see the structs below).
+Each note is followed by the name field (whose length is defined in
+\fIn_namesz\fR) and then by the descriptor field (whose length is defined in
+\fIn_descsz\fR) and whose starting address has a 4 byte alignment.
+Neither field is defined in the note struct due to their arbitrary lengths.
+
+An example for parsing out two consecutive notes should clarify their layout
+in memory.
+
+.in +4n
+.nf
+void *memory, *name, *desc;
+Elf64_Nhdr *note, *next_note;
+
+/* The buffer is pointing to the start of the section/segment. */
+note = memory;
+/* If the name is defined, it follows the note. */
+name = note->n_namesz == 0 ? NULL : memory + sizeof(*note);
+/* If the descriptor is defined, it follows the name (with alignment). */
+desc = note->n_descsz == 0 ? NULL :
+       memory + sizeof(*note) + ALIGN_UP(note->n_namesz, 4);
+/* The next note follows both (with alignment). */
+next_note = memory + sizeof(*note) +
+            ALIGN_UP(note->n_namesz, 4) + ALIGN_UP(note->n_descsz, 4);
+.fi
+.in
+
+Keep in mind that the interpretation of
+.I n_type
+depends on the namespace defined by the
+.I n_namesz
+field.
+After, of course, whether the ELF image has been determined to be a core.
+.in +4n
+.nf
+
+typedef struct {
+    Elf32_Word n_namesz;
+    Elf32_Word n_descsz;
+    Elf32_Word n_type;
+} Elf32_Nhdr;
+.fi
+.in
+.in +4n
+.nf
+
+typedef struct {
+    Elf64_Word n_namesz;
+    Elf64_Word n_descsz;
+    Elf64_Word n_type;
+} Elf64_Nhdr;
+.fi
+.in
+.TP \n[l1_indent]
+.IR n_namesz
+The length of the name field in bytes.
+The contents will immediately follow this note in memory.
+The name is null terminated.
+For example, if the name is "GNU", then
+.I n_namesz
+will be set to 4.
+.TP
+.IR n_descsz
+The length of the descriptor field in bytes.
+The contents will immediately follow the name field in memory.
+.TP
+.IR n_type
+Depending on the value of the name field, this member may have any of the
+following values:
+.RS \n[l1_indent]
+.TP 5
+.B Core files (e_type = ET_CORE)
+Notes used by all core files.
+These are highly operating system or architecture specific and often require
+close coordination with kernels, C libraries, and debuggers.
+.RS
+.TP 21
+.PD 0
+.B NT_PRSTATUS
+prstatus struct
+.TP
+.B NT_FPREGSET
+fpregset struct
+.TP
+.B NT_PRPSINFO
+prpsinfo struct
+.TP
+.B NT_PRXREG
+prxregset struct
+.TP
+.B NT_TASKSTRUCT
+task structure
+.TP
+.B NT_PLATFORM
+String from sysinfo(SI_PLATFORM)
+.TP
+.B NT_AUXV
+auxv array
+.TP
+.B NT_GWINDOWS
+gwindows struct
+.TP
+.B NT_ASRS
+asrset struct
+.TP
+.B NT_PSTATUS
+pstatus struct
+.TP
+.B NT_PSINFO
+psinfo struct
+.TP
+.B NT_PRCRED
+prcred struct
+.TP
+.B NT_UTSNAME
+utsname struct
+.TP
+.B NT_LWPSTATUS
+lwpstatus struct
+.TP
+.B NT_LWPSINFO
+lwpinfo struct
+.TP
+.B NT_PRFPXREG
+fprxregset struct
+.TP
+.B NT_SIGINFO
+siginfo_t (size might increase over time)
+.TP
+.B NT_FILE
+Contains information about mapped files
+.TP
+.B NT_PRXFPREG
+user_fxsr_struct
+.TP
+.B NT_PPC_VMX
+PowerPC Altivec/VMX registers
+.TP
+.B NT_PPC_SPE
+PowerPC SPE/EVR registers
+.TP
+.B NT_PPC_VSX
+PowerPC VSX registers
+.TP
+.B NT_386_TLS
+i386 TLS slots (struct user_desc)
+.TP
+.B NT_386_IOPERM
+x86 io permission bitmap (1=deny)
+.TP
+.B NT_X86_XSTATE
+x86 extended state using xsave
+.TP
+.B NT_S390_HIGH_GPRS
+s390 upper register halves
+.TP
+.B NT_S390_TIMER
+s390 timer register
+.TP
+.B NT_S390_TODCMP
+s390 time-of-day (TOD) clock comparator register
+.TP
+.B NT_S390_TODPREG
+s390 time-of-day (TOD) programmable register
+.TP
+.B NT_S390_CTRS
+s390 control registers
+.TP
+.B NT_S390_PREFIX
+s390 prefix register
+.TP
+.B NT_S390_LAST_BREAK
+s390 breaking event address
+.TP
+.B NT_S390_SYSTEM_CALL
+s390 system call restart data
+.TP
+.B NT_S390_TDB
+s390 transaction diagnostic block
+.TP
+.B NT_ARM_VFP
+ARM VFP/NEON registers
+.TP
+.B NT_ARM_TLS
+ARM TLS register
+.TP
+.B NT_ARM_HW_BREAK
+ARM hardware breakpoint registers
+.TP
+.B NT_ARM_HW_WATCH
+ARM hardware watchpoint registers
+.TP
+.B NT_ARM_SYSTEM_CALL
+ARM system call number
+.PD
+.RE
+
+.TP
+.B n_name = GNU
+Extensions used by the GNU tool chain.
+.RS
+.TP 21
+.PD 0
+.B NT_GNU_ABI_TAG
+OS ABI information.
+The desc field will be 4 words:
+  word 0: OS descriptor (\fBELF_NOTE_OS_LINUX\fR, \fBELF_NOTE_OS_GNU\fR, etc...)
+  word 1: major version of the ABI
+  word 2: minor version of the ABI
+  word 3: subminor version of the ABI
+.TP
+.B NT_GNU_HWCAP
+Synthetic hwcap information.
+The desc field begins with two words:
+  word 0: number of entries
+  word 1: bitmask of enabled entries
+.br
+Then follow variable-length entries, one byte followed by a null-terminated
+hwcap name string.
+The byte gives the bit number to test if enabled, (1U << bit) & bitmask.
+.TP
+.B NT_GNU_BUILD_ID
+Unique build ID as generated by GNU ld's \fI--build-id\fR.
+The desc consists of any nonzero number of bytes.
+.TP
+.B NT_GNU_GOLD_VERSION
+The desc contains the GNU Gold linker version used.
+.PD
+.RE
+
+.TP
+.B Unknown system
+The fallback set of note types when the namespace is unknown.
+Usually the name field will be omitted (i.e.
+.B n_namesz
+will be set to 0).
+.RS
+.TP 21
+.PD 0
+.B NT_VERSION
+A version string of some sort.
+.TP
+.B NT_ARCH
+Architecture information.
+.PD
+.RE
+
+.RE
 .SH NOTES
 .\" OpenBSD
 .\" ELF support first appeared in
-- 
2.11.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
