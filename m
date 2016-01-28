From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] elf.5: wfix
Date: Thu, 28 Jan 2016 10:42:49 +0100
Message-ID: <56A9E299.80706@gmail.com>
References: <CAKXpx3q=TzyVknkBscpZ9yoeva0ODp6BsjvAyoQB-vC68uaRDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKXpx3q=TzyVknkBscpZ9yoeva0ODp6BsjvAyoQB-vC68uaRDw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Pick <kernel-IESHnRRlF+tiLUuM0BA3LQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/27/2016 11:50 PM, Chris Pick wrote:
> Clarify PT_LOPROC/PT_HIPROC and SHN_LOPROC/SHN_HIPROC ranges.
> 

Thanks for catching that. I actually applied a different, somewhat
large patch. See below.

Cheers,

Michael

diff --git a/man5/elf.5 b/man5/elf.5
index fb4ee30..4de3cea 100644
--- a/man5/elf.5
+++ b/man5/elf.5
@@ -739,14 +739,9 @@ occur only if the program header table is part of the memory image of the
 program.
 If it is present, it must precede any loadable segment entry.
 .TP
-.BR PT_LOPROC
-Values greater than or equal to
-.BR PT_HIPROC
-are reserved for processor-specific semantics.
-.TP
-.BR PT_HIPROC
-Values less than or equal to
-.BR PT_LOPROC
+.BR PT_LOPROC ", " PT_HIPROC
+Values in the inclusive range
+.RB [ PT_LOPROC ", " PT_HIPROC ]
 are reserved for processor-specific semantics.
 .TP
 .BR PT_GNU_STACK
@@ -870,14 +865,9 @@ section reference.
 .BR SHN_LORESERVE
 This value specifies the lower bound of the range of reserved indices.
 .TP
-.BR SHN_LOPROC
-Values greater than or equal to
-.BR SHN_HIPROC
-are reserved for processor-specific semantics.
-.TP
-.BR SHN_HIPROC
-Values less than or equal to
-.BR SHN_LOPROC
+.BR SHN_LOPROC ", " SHN_HIPROC
+Values greater in the inclusive range
+.RB [ SHN_LOPROC ", " SHN_HIPROC ]
 are reserved for processor-specific semantics.
 .TP
 .BR SHN_ABS
@@ -1032,15 +1022,10 @@ object file can also contain a
 .BR SHT_SYMTAB
 section.
 .TP
-.BR SHT_LOPROC
-This value up to and including
-.BR SHT_HIPROC
-is reserved for processor-specific semantics.
-.TP
-.BR SHT_HIPROC
-This value down to and including
-.BR SHT_LOPROC
-is reserved for processor-specific semantics.
+.BR SHT_LOPROC ", " SHT_HIPROC
+Values in the inclusive range
+.RB [ SHT_LOPROC ", " SHT_HIPROC ]
+are reserved for processor-specific semantics.
 .TP
 .BR SHT_LOUSER
 This value specifies the lower bound of the range of indices reserved for
@@ -1542,15 +1527,10 @@ and it precedes the other
 .BR STB_LOCAL
 symbols of the file, if it is present.
 .TP
-.BR STT_LOPROC
-This value up to and including
-.BR STT_HIPROC
-is reserved for processor-specific semantics.
-.TP
-.BR STT_HIPROC
-This value down to and including
-.BR STT_LOPROC
-is reserved for processor-specific semantics.
+.BR STT_LOPROC ", " STT_HIPROC
+Values in the inclusive range
+.RB [ STT_LOPROC ", " STT_HIPROC ]
+are reserved for processor-specific semantics.
 .\" .El
 .\" .Bl -tag -width "STB_GLOBAL"
 .TP
@@ -1570,15 +1550,10 @@ reference to the same symbol.
 Weak symbols resemble global symbols, but their definitions have lower
 precedence.
 .TP
-.BR STB_LOPROC
-This value up to and including
-.BR STB_HIPROC
-is reserved for processor-specific semantics.
-.TP
-.BR STB_HIPROC
-This value down to and including
-.BR STB_LOPROC
-is reserved for processor-specific semantics.
+.BR STB_LOPROC ", " STB_HIPROC
+Values in the inclusive range
+.RB [ STB_LOPROC ", " STB_HIPROC ]
+are reserved for processor-specific semantics.
 .IP
 There are macros for packing and unpacking the binding and type fields:
 .IP
@@ -1840,11 +1815,10 @@ the executable
 .BR DT_RUNPATH
 String table offset to library search path
 .TP
-.BR DT_LOPROC
-Start of processor-specific semantics
-.TP
-.BR DT_HIPROC
-End of processor-specific semantics
+.BR DT_LOPROC ", " DT_HIPROC
+Values in the inclusive range
+.RB [ DT_LOPROC ", " DT_HIPROC ]
+are reserved for processor-specific semantics
 .RE
 .\" .El
 .TP


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
