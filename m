From: Daisuke HATAYAMA <d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: [PATCH v2] elf.5: Add description for ELF extension
Date: Thu, 13 May 2010 14:55:04 +0900 (JST)
Message-ID: <20100513.145504.71089765.d.hatayama@jp.fujitsu.com>
References: <20100315.120246.193685481.d.hatayama@jp.fujitsu.com>
	<20100511015854.GF16800@machine.or.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100511015854.GF16800-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pasky-AlSwsSmVLrQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi. Petr.

Thank you for your comments.

I reflected your comments to the previous patch.
Could you check it?

#   What a strange interface, the other two hold the max value while
# e_shnum holds zero in case of overflow.

I considered one answer to the question based on the difference of
compatibility policy for each object format.

For core object format, it is better for ordinary tools to understand
as many program headers as possible, even if it is incomplete. On the
other hand, for relocatable object format, it is meaningless if it is
incomplete. This is why e_phnum is set to PN_XNUM(0xffff) and e_shnum
is set to 0, respectively: in the latter case, any ordinary linker
cannot recognize the relocatable object correctly.

But I don't know why e_shstrndx is set to 0xffff. We could choose it
from the reserved range of section header table indices, i.e. 0 and
[0xff00, ..., 0xffff].

At any rate, to see accurately why it's so, we need to look at the
discussion when the ELF extension was specified. I will post it here
if I can find it.

Thanks
HATAYAMA, Daisuke
---
linux-2.6.34-rc1 added an ELF core extension, which user-land tools,
such as gdb and binutils, have already supported. Therefore, elf.5
needs to be modified accordingly.

You can follow information on the ELF extension via the LKML post:
http://lkml.org/lkml/2010/1/3/103

Signed-off-by: Daisuke HATAYAMA <d.hatayama-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
---
 man5/elf.5 |   62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/man5/elf.5 b/man5/elf.5
index 20ed3d8..e5270e7 100644
--- a/man5/elf.5
+++ b/man5/elf.5
@@ -30,7 +30,7 @@
 .\" 2007-10-11, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, various fixes
 .\" 2007-12-08, mtk, Converted from mdoc to man macros
 .\"
-.TH ELF 5 2007-12-28 "Linux" "Linux Programmer's Manual"
+.TH ELF 5 2010-05-13 "Linux" "Linux Programmer's Manual"
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
+(0xffff) and the real number of entries in the program header table is held in
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
+holds the value zero and the real number of entries in the section header
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
@@ -841,7 +885,10 @@ holds the size in bytes of each entry.
 .PP
 A section header table index is a subscript into this array.
 Some section
-header table indices are reserved.
+header table indices are reserved:
+the initial entry and the indices between SHN_LORESERVE and SHN_HIRESERVE.
+The initial entry is used in ELF extensions for e_phnum, e_shnum and e_strndx;
+in other cases, each field in the initial entry is set to zero.
 An object file does not have sections for
 these special indices:
 .\" .Bl -tag -width "SHN_LORESERVE"
@@ -1851,6 +1898,10 @@ This is automatically populated by the linker.
 ELF first appeared in
 System V.
 The ELF format is an adopted standard.
+.PP
+The extensions for e_phnum, e_shnum and e_strndx respectively are
+Linux extensions. Sun, BSD and AMD64 also support them, whose
+specifications are listed in SEE ALSO.
 .\" .SH AUTHORS
 .\" The original version of this manual page was written by
 .\" .An Jeroen Ruigrok van der Werven
@@ -1876,3 +1927,10 @@ Santa Cruz Operation,
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
