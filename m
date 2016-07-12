From: "Cownie, James H" <james.h.cownie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [patch] getauxval.3 correct AT_HWCAP result description
Date: Tue, 12 Jul 2016 16:35:43 +0000
Message-ID: <397D95928DECEF49983F5B237627E9785733058A@IRSMSX108.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org" <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

The getauxval(3) man page describes the result for AT_HWCAP as "A pointer to a multibyte mask of bits", however the actual value returned is not a pointer, but simply the first 32 bits of the capabilities mask.

This can be observed directly. Note the value shown for AT_HWCAP is a 32 bit value that is not a pointer (see AT_PHDR or AT_RANDOM for how pointers are shown).

% LD_SHOW_AUXV=1 cat < /dev/null
AT_SYSINFO_EHDR: 0x7fffe89fe000
AT_HWCAP:        bfebfbff
AT_PAGESZ:       4096
AT_CLKTCK:       100
AT_PHDR:         0x400040
AT_PHENT:        56
AT_PHNUM:        9
AT_BASE:         0x0
AT_FLAGS:        0x0
AT_ENTRY:        0x402634
AT_UID:          515
AT_EUID:         515
AT_GID:          114
AT_EGID:         114
AT_SECURE:       0
AT_RANDOM:       0x7fffe8917be9
AT_EXECFN:       /usr/bin/cat
AT_PLATFORM:     x86_64   


--- PATCH ---
diff --git a/man3/getauxval.3 b/man3/getauxval.3
index 85d7f41..7ce0237 100644
--- a/man3/getauxval.3
+++ b/man3/getauxval.3
@@ -101,12 +101,13 @@ performed by the kernel.
 The real group ID of the thread.
 .TP
 .BR AT_HWCAP
-A pointer to a multibyte mask of bits whose settings
+A four byte long bit-mask whose settings 
 indicate detailed processor capabilities.
 The contents of the bit mask are hardware dependent
 (for example, see the kernel source file
 .IR arch/x86/include/asm/cpufeature.h
-for details relating to the Intel x86 architecture).
+for details relating to the Intel x86 architecture; the value
+returned is the first 32 bit word of the array described there).
 A human-readable version of the same information is available via
 .IR /proc/cpuinfo .
 .TP
--- END PATCH ---

-- Jim

James Cownie <james.h.cownie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
SSG/DPD/TCAR (Technical Computing, Analyzers and Runtimes)
Tel: +44 117 9071438


---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
