From: Daisuke HATAYAMA <d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH] elf.5: Add description for ELF extension
Date: Thu, 21 Jan 2010 11:56:48 +0900 (JST)
Message-ID: <20100121.115648.183035225.d.hatayama@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Currently major user-land tools manipulating ELF objects such as
binutils and GDB support an ELF extension that helps field-size
shortage for some ELF header fields: e_phnum, e_shnum and e_strshndx.

It's also in progress to support the ELF extension for process
coredump on Linux kernel. Please refer to my post in LKML:
http://lkml.org/lkml/2010/1/3/103

We therefore describe the ELF extension and its reference to the
specifications in man5/elf.5.

Signed-off-by: Daisuke HATAYAMA <d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
---
 man5/elf.5 |   53 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 52 insertions(+), 1 deletions(-)

diff --git a/man5/elf.5 b/man5/elf.5
index 20ed3d8..e4987b8 100644
--- a/man5/elf.5
+++ b/man5/elf.5
@@ -30,7 +30,7 @@
 .\" 2007-10-11, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, various fixes
 .\" 2007-12-08, mtk, Converted from mdoc to man macros
 .\"
-.TH ELF 5 2007-12-28 "Linux" "Linux Programmer's Manual"
+.TH ELF 5 2010-01-21 "Linux" "Linux Programmer's Manual"
 .SH NAME
 elf \- format of Executable and Linking Format (ELF) files
 .SH SYNOPSIS
@@ -543,6 +543,28 @@ in bytes.
 If a file has no program header,
 .IR e_phnum
 holds the value zero.
+.IP
+If the number of entries in the program header table is larger than or equal to
+.BR PN_XNUM
+(0xffff), this member holds
+.BR PN_XNUM
+(0xffff). The real number of entries in the program header table is held in
+.IR sh_info
+member of the initial entry in section header table. Otherwise, the
+.IR sh_info
+member of the initial entry contains the value zero.
+.\" .Bl -tag -width "PN_XNUM"
+.RS 12
+.TP 9
+.BR PN_XNUM
+This is defined as 0xffff, the largest number
+.IR e_phnum
+can have, specifying where the actual number of program headers is
+assigned.
+.PD
+.RE
+.\" .El
+.IP
 .TP
 .IR e_shentsize
 This member holds a sections header's size in bytes.
@@ -561,6 +583,17 @@ If a file has no section
 header table,
 .IR e_shnum
 holds the value of zero.
+.IP
+If the number of entries in the section header table is larger than or equal to
+.BR SHN_LORESERVE
+(0xff00),
+.IR e_shnum
+holds the value zero. The real number of entries in the section header
+table is held in
+.IR sh_size
+of the initial entry in section header table. Otherwise, the
+.IR sh_size
+of the initial entry in section header table holds the value zero.
 .TP
 .IR e_shstrndx
 This member holds the section header table index of the entry associated
@@ -568,6 +601,17 @@ with the section name string table.
 If the file has no section name string
 table, this member holds the value
 .BR SHN_UNDEF .
+.IP
+If the index of section name string table section is larger than or equal to
+.BR SHN_LORESERVE
+(0xff00), this member holds
+.BR SHN_XINDEX
+(0xffff) and the real index of the section name string table section
+is held in the
+.IR sh_link
+member of the initial entry in section header table. Otherwise, the
+.IR sh_link
+member of the initial entry in section header table contains the value zero.
 .RS 12
 .\" .Bl -tag -width "SHN_LORESERVE"
 .TP 14
@@ -1876,3 +1920,10 @@ Santa Cruz Operation,
 Unix System Laboratories,
 "Object Files",
 .IR "Executable and Linking Format (ELF)" .
+.PP
+Sun microsystems,
+.IR "Linker and Libraries Guide" .
+.PP
+AMD64 ABI Draft,
+.IR "System V Application Binary Interface AMD64 Architecture Processor Supplement" .
+.PP
-- 
1.6.5.1

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
