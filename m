From: Maria Guseva <m.guseva-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [patch] ld.so.8: outline missed cases of secure run
Date: Mon, 31 Aug 2015 19:12:03 +0300
Message-ID: <"01f701d0e407$c718f530$554adf90$@guseva"@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-language: ru
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Yury Gribov' <y.gribov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, v.garbuzov-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

For the purpose of security many ld.so options(e.g. --inhibit-rpath,
LD_LIBRARY_PATH and others) are disabled for secure types of programs.
Current ld.so man page mentions them as set-user-ID/set-group-ID binaries.
However according to GNU libc sources there could be other cases where
__libc_enable_secure is set to non-zero -- when AT_SECURE value is set in
auxiliary vector:

elf/dl-sysdep.c:148
      case AT_SECURE:
#ifndef HAVE_AUX_SECURE
    seen = -1;
#endif
    __libc_enable_secure = av->a_un.a_val;


So I suggest ld.so man page should reflect this. The man3/getauxval.3 page
already covers this.    
Proposed patch is below. Maybe it also worth mentioning the particular case
of binary files with capabilities as it's done on getauxval.3 page.

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 8d8a759..686a0e4 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -62,8 +62,8 @@ Use of DT_RPATH is deprecated.
 .IP o
 Using the environment variable
 .BR LD_LIBRARY_PATH .
-Except if the executable is a set-user-ID/set-group-ID binary,
-in which case it is ignored.
+Except if the executable is a set-user-ID/set-group-ID binary or has a
non-zero
+AT_SECURE value in auxiliary vector, in which cases it is ignored.
 .IP o
 (ELF only) Using the directories specified in the
 DT_RUNPATH dynamic section attribute
@@ -168,7 +168,8 @@ Ignore RPATH and RUNPATH information in object names in
 .IR list .
 This option is ignored if
 .B ld.so
-is set-user-ID or set-group-ID.
+is set-user-ID or set-group-ID or has a non-zero AT_SECURE value
+in auxiliary vector.
 .TP
 .BI \-\-audit " list"
 Use objects named in
@@ -235,7 +236,8 @@ The items in the list are separated by either colons or
semicolons.
 Similar to the
 .B PATH
 environment variable.
-Ignored in set-user-ID and set-group-ID programs.
+Ignored in set-user-ID and set-group-ID programs and programs with a
non-zero
+AT_SECURE value in auxiliary vector.
 .TP
 .B LD_PRELOAD
 A list of additional, user-specified, ELF shared
@@ -243,7 +245,8 @@ objects to be loaded before all others.
 The items of the list can be separated by spaces or colons.
 This can be used to selectively override functions in other shared objects.
 The objects are searched for using the rules given under DESCRIPTION.
-For set-user-ID/set-group-ID ELF binaries,
+For set-user-ID/set-group-ID ELF binaries
+or programs with a non-zero AT_SECURE value in auxiliary vector,
 preload pathnames containing slashes are ignored,
 and shared objects in the standard search directories are loaded
 only if the set-user-ID mode bit is enabled on the shared object file.
@@ -282,7 +285,8 @@ to be loaded before all others in a separate linker
namespace
 would occur in the process).
 These objects can be used to audit the operation of the dynamic linker.
 .B LD_AUDIT
-is ignored for set-user-ID/set-group-ID binaries.
+is ignored for set-user-ID/set-group-ID binaries and programs with
+a non-zero AT_SECURE value in auxiliary vector.

 The dynamic linker will notify the audit
 shared objects at so-called auditing checkpoints\(emfor example,
@@ -313,7 +317,8 @@ prints a help message about which categories can be
specified in this
 environment variable.
 Since glibc 2.3.4,
 .B LD_DEBUG
-is ignored for set-user-ID/set-group-ID binaries.
+is ignored for set-user-ID/set-group-ID binaries and programs with
+a non-zero AT_SECURE value in auxiliary vector.
 .TP
 .B LD_DEBUG_OUTPUT
 (glibc since 2.1)
@@ -322,14 +327,16 @@ File in which
 output should be written.
 The default is standard error.
 .B LD_DEBUG_OUTPUT
-is ignored for set-user-ID/set-group-ID binaries.
+is ignored for set-user-ID/set-group-ID binaries and programs with
+a non-zero AT_SECURE value in auxiliary vector.
 .TP
 .B LD_DYNAMIC_WEAK
 (glibc since 2.1.91)
 Allow weak symbols to be overridden (reverting to old glibc behavior).
 For security reasons, since glibc 2.3.4,
 .B LD_DYNAMIC_WEAK
-is ignored for set-user-ID/set-group-ID binaries.
+is ignored for set-user-ID/set-group-ID binaries and programs with
+a non-zero AT_SECURE value in auxiliary vector.
 .TP
 .B LD_HWCAP_MASK
 (glibc since 2.1)
@@ -350,7 +357,8 @@ version numbers.
 Path where the binary is found (for non-set-user-ID programs).
 For security reasons, since glibc 2.4,
 .B LD_ORIGIN_PATH
-is ignored for set-user-ID/set-group-ID binaries.
+is ignored for set-user-ID/set-group-ID binaries and programs with
+a non-zero AT_SECURE value in auxiliary vector.
 .\" Only used if $ORIGIN can't be determined by normal means
 .\" (from the origin path saved at load time, or from /proc/self/exe)?
 .TP
@@ -382,7 +390,8 @@ If this variable is not defined, or is defined as an
empty string,
 then the default is
 .IR /var/tmp .
 .B LD_PROFILE_OUTPUT
-is ignored for set-user-ID and set-group-ID programs,
+is ignored for set-user-ID and set-group-ID programs and programs with
+a non-zero AT_SECURE value in auxiliary vector,
 which always use
 .IR /var/profile .
 .TP
@@ -391,7 +400,8 @@ which always use
 Show auxiliary array passed up from the kernel.
 For security reasons, since glibc 2.3.5,
 .B LD_SHOW_AUXV
-is ignored for set-user-ID/set-group-ID binaries.
+is ignored for set-user-ID/set-group-ID binaries and programs with
+a non-zero AT_SECURE value in auxiliary vector.
 .TP
 .B LD_TRACE_PRELINKING
 (glibc since 2.4)
@@ -421,7 +431,8 @@ If
 .B LD_USE_LOAD_BIAS
 is defined with the value 0,
 neither executables nor PIEs will honor the base addresses.
-This variable is ignored by set-user-ID and set-group-ID programs.
+This variable is ignored by set-user-ID and set-group-ID programs and
+programs with a non-zero AT_SECURE value in auxiliary vector.
 .TP
 .B LD_VERBOSE
 (glibc since 2.1)

Regards,
Maria

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
