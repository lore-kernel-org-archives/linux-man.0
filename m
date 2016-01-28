From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] elf.5: remove erroneous, duplicate SHN_* section
Date: Thu, 28 Jan 2016 08:55:31 +0100
Message-ID: <56A9C973.7070802@gmail.com>
References: <CAKXpx3pmsBpp8UF+sGKf2O=mXz8ma-8h6Cmxib49N8s9pULn8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKXpx3pmsBpp8UF+sGKf2O=mXz8ma-8h6Cmxib49N8s9pULn8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Pick <kernel-IESHnRRlF+tiLUuM0BA3LQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/27/2016 11:57 PM, Chris Pick wrote:
> The ELF header section's e_shstrndx contained a duplicate desription of
> the SHN_* special section header indicies.  Remove them.

Thanks, Chris. Patch applied. (Things are a little easier if you
inline patches though.)

Cheers,

Michael


====
>From 562c62bc0fd68fb7f94a98142a9fd49baab95e45 Mon Sep 17 00:00:00 2001
From: Chris Pick <kernel-IESHnRRlF+tiLUuM0BA3LQ@public.gmane.org>
Date: Wed, 27 Jan 2016 17:32:21 -0500
Subject: [PATCH] elf.5: remove erroneous, duplicate SHN_* section

The ELF header section's e_shstrndx contained a duplicate desription of
the SHN_* special section header indicies.  Remove them.
---
 man5/elf.5 | 49 -------------------------------------------------
 1 file changed, 49 deletions(-)

diff --git a/man5/elf.5 b/man5/elf.5
index c140bb2..5a64704 100644
--- a/man5/elf.5
+++ b/man5/elf.5
@@ -622,55 +622,6 @@ member of the initial entry in section header table.
 Otherwise, the
 .IR sh_link
 member of the initial entry in section header table contains the value zero.
-.RS 12
-.\" .Bl -tag -width "SHN_LORESERVE"
-.TP 14
-.BR SHN_UNDEF
-This value marks an undefined, missing, irrelevant, or otherwise meaningless
-section reference.
-For example, a symbol
-"defined"
-relative to section number
-.BR SHN_UNDEF
-is an undefined symbol.
-.TP
-.BR SHN_LORESERVE
-This value specifies the lower bound of the range of reserved indices.
-.TP
-.BR SHN_LOPROC
-Values greater than or equal to
-.BR SHN_HIPROC
-are reserved for processor-specific semantics.
-.TP
-.BR SHN_HIPROC
-Values less than or equal to
-.BR SHN_LOPROC
-are reserved for processor-specific semantics.
-.TP
-.BR SHN_ABS
-This value specifies absolute values for the corresponding reference.
-For
-example, symbols defined relative to section number
-.BR SHN_ABS
-have absolute values and are not affected by relocation.
-.TP
-.BR SHN_COMMON
-Symbols defined relative to this section are common symbols, such as Fortran
-COMMON or unallocated C external variables.
-.TP
-.BR SHN_HIRESERVE
-This value specifies the upper bound of the range of reserved
-indices between
-.BR SHN_LORESERVE
-and
-.BR SHN_HIRESERVE ,
-inclusive; the values do
-not reference the section header table.
-That is, the section header table
-does
-.I not
-contain entries for the reserved indices.
-.RE
 .\" .El
 .\" .El
 .PP
-- 
1.9.1


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
