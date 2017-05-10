From: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ld.so.8: ffix, tfix, wfix
Date: Wed, 10 May 2017 00:32:41 -0400
Message-ID: <20170510043239.ycgvwc7b5ohga7i4@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="myjm4b4pz3hr4pe6"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--myjm4b4pz3hr4pe6
Content-Type: multipart/mixed; boundary="2jfcspawskvrhukt"
Content-Disposition: inline


--2jfcspawskvrhukt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

    ld.so.8: ffix, tfix, wfix

    * Use correct hyphen-minus in "ld-linux.so" in Name section; this does
      not confuse lexgrog(1).

    * Render names of ELF sections in italics, not bold, for consistency
      with elf(5).

    * Use conventional markup for synopsis instead of the style used in
      usage messages (no font changes, capitals for variables).

    * Respell filename reference to ld-linux.so to reflect the greater
      variation of its name on multi-arch-aware hosts.  Call out the usage
      of a shell glob in the notation since this is not commonly seen in
      the name of a command being documented.

    * Replace LP macro with more commonly-used PP macro.

    * Mark up itemized lists using the prevailing man-pages convention.

    * Use font macros instead of font escapes, obtaining italic correction
      where applicable.

    * Recast libc5 vs. glibc coverage to be more prose-like.

    * Fix misplaced parenthesis and sentence fragment.

    * Generalize specific reference to "ld.so" to "the dynamic linker".

    * Improve markup of shell command examples.
      + Use groff_man(7)'s .EX/.EE macros to obtain a constant-width font
        (harmless if not available).
      + Use explicit indentation requests (.in) instead of spaces in the
        input file.  (See man-pages(7), "Indentation of structure
        definitions, shell session logs, and so on".)

    * Unhyphenate "execution-time" when used as a noun phrase.

    * Fix doubled word.

    * Use directional quotation marks in prose quotations.

    * Fix missing \- in "\-\-inhibit-cache".

    * Mark up "readelf -n" as bold instead of italic since it's a literal
      and not a filename, and make its space unbreakable.

    * Use .IP without arguments to get a further indented paragraph at the
      prevailing indentation level, instead of a blank input line, which has
      different semantics and introduces too much vertical whitespace, as
      can be seen with man -Tps.

    * Consistently hyphenate adjective phrase "secure-execution" [mode].

    * Use default inter-paragraph distance in Files section.

    * Mark up filename literals in italics, even "lib*.so*".

    * Remove subsection heading from Notes section; there is no
      non-subsection material and only one subsection.

--=20
Regards,
Branden

--2jfcspawskvrhukt
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="ld.so.8-style-fixes.diff"

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index f55d6938a..a4b405bb7 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -4,38 +4,45 @@
 .\"
 .TH LD.SO 8 2017-05-03 "GNU" "Linux Programmer's Manual"
 .SH NAME
-ld.so, ld-linux.so \- dynamic linker/loader
+ld.so, ld\-linux.so \- dynamic linker/loader
 .SH SYNOPSIS
 The dynamic linker can be run either indirectly by running some
 dynamically linked program or shared object
 (in which case no command-line options
 to the dynamic linker can be passed and, in the ELF case, the dynamic linker
 which is stored in the
-.B .interp
+.I .interp
 section of the program is executed) or directly by running:
-.P
-.I /lib/ld-linux.so.*
-[OPTIONS] [PROGRAM [ARGUMENTS]]
+.PP
+.BR ld\-linux * .so. *\~\c
+.RI [ options ]
+.RI [ program
+.RI [ arguments ]]
 .SH DESCRIPTION
 The programs
 .B ld.so
 and
-.B ld-linux.so*
+.BR ld-linux * .so *
 find and load the shared objects (shared libraries) needed by a program,
 prepare the program to run, and then run it.
-.LP
+.PP
 Linux binaries require dynamic linking (linking at run time)
 unless the
 .B \-static
 option was given to
 .BR ld (1)
 during compilation.
-.LP
+.PP
 The program
 .B ld.so
 handles a.out binaries, a format used long ago;
-.B ld-linux.so*
-(\fI/lib/ld-linux.so.1\fP for libc5, \fI/lib/ld-linux.so.2\fP for glibc2)
+.BR ld\-linux.so *
+.RI ( /lib/ld\-linux.so.1
+for Linux libc5, and
+.I /lib/ld\-linux.so.2
+or similar
+for the GNU C Library
+.RI 2. x )
 handles ELF,
 which everybody has been using for years now.
 Otherwise, both have the same behavior, and use the same
@@ -44,7 +51,7 @@ support files and programs
 .BR ldconfig (8),
 and
 .IR /etc/ld.so.conf .
-.LP
+.PP
 When resolving shared object dependencies,
 the dynamic linker first inspects each dependency
 string to see if it contains a slash (this can occur if
@@ -52,24 +59,24 @@ a shared object pathname containing slashes was specified at link time).
 If a slash is found, then the dependency string is interpreted as
 a (relative or absolute) pathname,
 and the shared object is loaded using that pathname.
-.LP
+.PP
 If a shared object dependency does not contain a slash,
 then it is searched for in the following order:
-.IP o 3
+.IP \(bu 3
 Using the directories specified in the
 DT_RPATH dynamic section attribute
 of the binary if present and DT_RUNPATH attribute does not exist.
 Use of DT_RPATH is deprecated.
-.IP o
+.IP \(bu
 Using the environment variable
-.BR LD_LIBRARY_PATH
-(unless the executable is being run in secure-execution mode; see below).
-in which case it is ignored.
-.IP o
+.BR LD_LIBRARY_PATH ,
+unless the executable is being run in secure-execution mode (see below),
+in which case the variable is ignored.
+.IP \(bu
 Using the directories specified in the
 DT_RUNPATH dynamic section attribute
 of the binary if present.
-.IP o
+.IP \(bu
 From the cache file
 .IR /etc/ld.so.cache ,
 which contains a compiled list of candidate shared objects previously found
@@ -79,7 +86,7 @@ If, however, the binary was linked with the
 linker option, shared objects in the default paths are skipped.
 Shared objects installed in hardware capability directories (see below)
 are preferred to other shared objects.
-.IP o
+.IP \(bu
 In the default path
 .IR /lib ,
 and then
@@ -91,9 +98,10 @@ and then
 If the binary was linked with the
 .B \-z nodeflib
 linker option, this step is skipped.
+.\"
 .SS Rpath token expansion
 .PP
-.B ld.so
+The dynamic linker
 understands certain token strings in an rpath specification
 (DT_RPATH or DT_RUNPATH).
 Those strings are substituted as follows:
@@ -104,15 +112,17 @@ the directory containing the program or shared object.
 Thus, an application located in
 .I somedir/app
 could be compiled with
-
-    gcc \-Wl,\-rpath,\(aq$ORIGIN/../lib\(aq
-
+.EX
+.in +4
+.RB $ " gcc \-Wl,\-rpath,\(aq$ORIGIN/../lib\(aq"
+.in
+.EE
 so that it finds an associated shared object in
 .I somedir/lib
 no matter where
 .I somedir
 is located in the directory hierarchy.
-This facilitates the creation of "turn-key" applications that
+This facilitates the creation of \(lqturn-key\(rq applications that
 do not need to be installed into special directories,
 but can instead be unpacked into any directory
 and still find their own shared objects.
@@ -131,7 +141,7 @@ on x86-32, it expands to
 .TP
 .IR $PLATFORM " (or equivalently " ${PLATFORM} )
 This expands to a string corresponding to the processor type
-of the host system (e.g., "x86_64").
+of the host system (e.g., \(lqx86_64\(rq).
 On some architectures, the Linux kernel doesn't provide a platform
 string to the dynamic linker.
 The value of this string is taken from the
@@ -155,7 +165,7 @@ List all dependencies and how they are resolved.
 Verify that program is dynamically linked and this dynamic linker can handle
 it.
 .TP
-.B \-\-inhibit-cache
+.B \-\-inhibit\-cache
 Do not use
 .IR /etc/ld.so.cache .
 .TP
@@ -198,15 +208,15 @@ entry in the auxiliary vector (see
 .BR getauxval (3))
 has a nonzero value.
 This entry may have a nonzero value for various reasons, including:
-.IP * 3
+.IP \(bu 3
 The process's real and effective user IDs differ,
 or the real and effective group IDs differ.
 This typically occurs as a result of executing
 a set-user-ID or set-group-ID program.
-.IP *
+.IP \(bu
 A process with a non-root user ID executed a binary that
 conferred permitted or effective capabilities.
-.IP *
+.IP \(bu
 A nonzero value may have been set by a Linux Security Module.
 .\"
 .SS Environment variables
@@ -216,14 +226,14 @@ Among the more important environment variables are the following:
 Each shared object can inform the dynamic linker of the minimum kernel ABI
 version that it requires.
 (This requirement is encoded in an ELF note section that is viewable via
-.IR "readelf\ \-n"
+.B readelf\~\-n
 as a section labeled
 .BR NT_GNU_ABI_TAG .)
 At run time,
 the dynamic linker determines the ABI version of the running kernel and
 will reject loading shared objects that specify minimum ABI versions
 that exceed that ABI version.
-
+.IP
 .BR LD_ASSUME_KERNEL
 can be used to
 cause the dynamic linker to assume that it is running on a system with
@@ -232,13 +242,11 @@ For example, the following command line causes the
 dynamic linker to assume it is running on Linux 2.2.5 when loading
 the shared objects required by
 .IR myprog :
-
-.in +4n
-.nf
-$ \fBLD_ASSUME_KERNEL=2.2.5 ./myprog\fP
-.fi
+.EX
+.in +4
+.RB $ " LD_ASSUME_KERNEL=2.2.5 ./myprog"
 .in
-
+.EE
 On systems that provide multiple versions of a shared object
 (in different directories in the search path) that have
 different minimum kernel ABI version requirements,
@@ -263,14 +271,14 @@ This is useful when using a debugger.
 .TP
 .B LD_LIBRARY_PATH
 A list of directories in which to search for
-ELF libraries at execution-time.
+ELF libraries at execution time.
 The items in the list are separated by either colons or semicolons.
 Similar to the
 .B PATH
 environment variable.
-
+.IP
 This variable is ignored in secure-execution mode.
-
+.IP
 Within the pathnames specified in
 .BR LD_LIBRARY_PATH ,
 the dynamic linker expands the tokens
@@ -287,9 +295,11 @@ the following would cause a library to be searched for in either the
 or
 .I lib64
 subdirectory below the directory containing the program to be executed:
-
-    $ \fBLD_LIBRARY_PATH='$ORIGIN/$LIB' prog\fP
-
+.EX
+.in +4
+.RB $ " LD_LIBRARY_PATH=\(aq$ORIGIN/$LIB\(aq prog"
+.in
+.EE
 (Note the use of single quotes, which prevent expansion of
 .I $ORIGIN
 and
@@ -302,13 +312,13 @@ objects to be loaded before all others.
 The items of the list can be separated by spaces or colons.
 This can be used to selectively override functions in other shared objects.
 The objects are searched for using the rules given under DESCRIPTION.
-
+.IP
 In secure-execution mode,
 preload pathnames containing slashes are ignored.
 Furthermore, shared objects are preloaded only
-from the standard search directories and and only
+from the standard search directories and only
 if they have set-user-ID mode bit enabled (which is not typical).
-
+.IP
 Within the names specified in the
 .BR LD_PRELOAD
 list, the dynamic linker understands the tokens
@@ -333,7 +343,7 @@ If set (to any value), causes the program to list its dynamic
 dependencies, as if run by
 .BR ldd (1),
 instead of running normally.
-.LP
+.PP
 Then there are lots of more or less obscure variables,
 many obsolete or only for internal use.
 .TP
@@ -343,10 +353,10 @@ to be loaded before all others in a separate linker namespace
 (i.e., one that does not intrude upon the normal symbol bindings that
 would occur in the process).
 These objects can be used to audit the operation of the dynamic linker.
-
+.IP
 .B LD_AUDIT
 is ignored in secure-execution mode.
-
+.IP
 The dynamic linker will notify the audit
 shared objects at so-called auditing checkpoints\(emfor example,
 loading a new shared object, resolving a symbol,
@@ -359,7 +369,7 @@ as described in its
 .IR "Linker and Libraries Guide" ,
 in the chapter
 .IR "Runtime Linker Auditing Interface" .
-
+.IP
 Within the names specified in the
 .BR LD_AUDIT
 list, the dynamic linker understands the tokens
@@ -372,7 +382,7 @@ as described above in
 .IR "Rpath token expansion" .
 (See also the discussion of quoting under the description of
 .BR LD_LIBRARY_PATH .)
-
+.IP
 Since glibc 2.13,
 .\" commit 8e9f92e9d5d7737afdacf79b76d98c4c42980508
 in secure-execution mode,
@@ -437,7 +447,7 @@ The value in
 .BR LD_DEBUG
 can specify multiple categories, separated by colons, commas,
 or (if the value is quoted) spaces.
-
+.IP
 Since glibc 2.3.4,
 .B LD_DEBUG
 is ignored in secure-execution mode, unless the file
@@ -449,14 +459,14 @@ File in which
 .B LD_DEBUG
 output should be written.
 The default is standard error.
-
+.IP
 .B LD_DEBUG_OUTPUT
 is ignored in secure-execution mode.
 .TP
 .BR LD_DYNAMIC_WEAK " (since glibc 2.1.91)"
 By default, when searching shared libraries to resolve a symbol reference,
 the dynamic linker will resolve to the first definition it finds.
-
+.IP
 Old glibc versions (before 2.2), provided a different behavior:
 if the linker found a symbol that was weak,
 it would remember that symbol and
@@ -465,7 +475,7 @@ If it subsequently found a strong definition of the same symbol,
 then it would instead use that definition.
 (If no further symbol was found,
 then the dynamic linker would use the weak symbol that it initially found.)
-
+.IP
 The old glibc behavior was nonstandard.
 (Standard practice is that the distinction between between
 weak and strong symbols should have effect only at static link time.)
@@ -481,7 +491,7 @@ In glibc 2.2
 the dynamic linker was modified to provide the current behavior
 (which was the behavior that was provided by most other implementations
 at that time).
-
+.IP
 Defining the
 .B LD_DYNAMIC_WEAK
 environment variable (with any value) provides
@@ -491,7 +501,7 @@ a strong symbol subsequently discovered in another shared library.
 (Note that even when this variable is set,
 a strong symbol in a shared library will not override
 a weak definition of the same symbol in the main program.)
-
+.IP
 Since glibc 2.3.4,
 .B LD_DYNAMIC_WEAK
 is ignored in secure-execution mode.
@@ -503,7 +513,7 @@ Mask for hardware capabilities.
 Path where the binary is found.
 .\" Used only if $ORIGIN can't be determined by normal means
 .\" (from the origin path saved at load time, or from /proc/self/exe)?
-
+.IP
 Since glibc 2.4,
 .B LD_ORIGIN_PATH
 is ignored in secure-execution mode.
@@ -528,11 +538,12 @@ which is now always enabled.
 The name of a (single) shared object to be profiled,
 specified either as a pathname or a soname.
 Profiling output is appended to the file whose name is:
-"\fI$LD_PROFILE_OUTPUT\fP/\fI$LD_PROFILE\fP.profile".
-
+.BI $LD_PROFILE_OUTPUT / $LD_PROFILE .profile\c
+\&.
+.IP
 Since glibc 2.2.5,
 .BR LD_PROFILE
-is ignored in secure execution mode.
+is ignored in secure-execution mode.
 .TP
 .BR LD_PROFILE_OUTPUT " (since glibc 2.1)"
 Directory where
@@ -541,7 +552,7 @@ output should be written.
 If this variable is not defined, or is defined as an empty string,
 then the default is
 .IR /var/tmp .
-
+.IP
 .B LD_PROFILE_OUTPUT
 is ignored in secure-execution mode; instead
 .IR /var/profile
@@ -555,7 +566,7 @@ is also ignored in secure-execution mode.)
 If this environment variable is defined (with any value),
 show the auxiliary array passed up from the kernel (see also
 .BR getauxval (3)).
-
+.IP
 Since glibc 2.3.4,
 .B LD_SHOW_AUXV
 is ignored in secure-execution mode.
@@ -588,7 +599,7 @@ If
 .B LD_USE_LOAD_BIAS
 is defined with the value 0,
 neither executables nor PIEs will honor the base addresses.
-
+.IP
 Since glibc 2.3.3, this variable is ignored in secure-execution mode.
 .TP
 .BR LD_VERBOSE " (since glibc 2.1)"
@@ -606,13 +617,13 @@ According to the Intel Silvermont software optimization guide, for 64-bit
 applications, branch prediction performance can be negatively impacted
 when the target of a branch is more than 4GB away from the branch.
 If this environment variable is set (to any value),
-.BR ld.so
+the dynamic linker
 will first try to map executable pages using the
 .BR mmap (2)
 .BR MAP_32BIT
 flag, and fall back to mapping without that flag if that attempt fails.
 NB: MAP_32BIT will map to the low 2GB (not 4GB) of the address space.
-
+.IP
 Because
 .B MAP_32BIT
 reduces the address range available for address space layout
@@ -620,7 +631,6 @@ randomization (ASLR),
 .B LD_PREFER_MAP_32BIT_EXEC
 is always disabled in secure-execution mode.
 .SH FILES
-.PD 0
 .TP
 .I /lib/ld.so
 a.out dynamic linker/loader
@@ -655,11 +665,11 @@ all programs that are executed on the system.
 and is typically employed only as an emergency remedy, for example,
 as a temporary workaround to a library misconfiguration issue.)
 .TP
-.B lib*.so*
+.IR lib * .so *
 shared objects
-.PD
 .SH NOTES
-.SS Hardware capabilities
+.\" Restore subsection heading if material on other topics is added.
+.\".SS Hardware capabilities
 Some shared objects are compiled using hardware-specific instructions which do
 not exist on every CPU.
 Such objects should be installed in directories whose names define the

--2jfcspawskvrhukt--

--myjm4b4pz3hr4pe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAlkSl94ACgkQ0Z6cfXEm
bc66RA/9HYyUBp93YWIUJPIqG0Cr8Nj3+CcwY5NRhnnUuJ4Zfd9bAyec0YubXNsm
yHDqqVp6U5/+ayHnG5qaF+1BJyBrc9DSd7yYJmWZAkTyfTuPerObSQgTACv6SyRt
yHBezUwd3gN0IXzLYR5VVHuCH5hiX0ZauYx0swaGes8ThxZz9Un9LSRe2pkoKXRI
cd6WiiseULB5qANj3WxjeNudd1w4xWrMCPmI6SfIpWTRR+jZ4yIIcyoqNadwUkvy
XHvabD0+evxrjrHNZQpZw4gv4vg2XMu6XNJfFPTQUfLrddy/28mFpe/DWewsd9RZ
FcNTgJSc2c7b54EZl2h0XWQ/mluhIfMHvWIJF5rjcskwXoVo0IKKnyzZ/bVrUN7L
Gg0/vDi2h6XfqKJjqcKAytCCIHuByg4Ax+R9zPxB3VnO3rPgOquqDRJfIh1NoYiW
okMRTq5bleBykJj+ifK+mZi7fjEmp3Ntmq884Wjzrb8fzzG1+b2D6CUBYd3FmBkE
fnzSLjDq4DGkl0jEVoD+yGD6+FIEIkldHsyv7GkaNAU5ArhA6+IAXERmX0PzPlUu
h+qBfKKQSnrxJ5xbcHvcw5h8SmV83jfLDwtRna2c3DFWafrlnmrlP8t340LmK0ER
L8tQNz/MhrzPKZ8jY2G3EuSCjUNFUn/iktMYIvx8Ucaek/QSoNE=
=iSYX
-----END PGP SIGNATURE-----

--myjm4b4pz3hr4pe6--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
