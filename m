From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [patch] getauxval.3 correct AT_HWCAP result description
Date: Tue, 12 Jul 2016 22:24:55 +0200
Message-ID: <2b181d0f-3a50-bf18-268b-9991de75d216@gmail.com>
References: <397D95928DECEF49983F5B237627E9785733058A@IRSMSX108.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-71743-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <397D95928DECEF49983F5B237627E9785733058A@IRSMSX108.ger.corp.intel.com>
To: "Cownie, James H" <james.h.cownie@intel.com>
Cc: mtk.manpages@gmail.com, "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>
List-Id: linux-man@vger.kernel.org

Hello James,

On 07/12/2016 06:35 PM, Cownie, James H wrote:
> The getauxval(3) man page describes the result for AT_HWCAP as "A
> pointer to a multibyte mask of bits", however the actual value
> returned is not a pointer, but simply the first 32 bits of the
> capabilities mask.
>
> This can be observed directly. Note the value shown for AT_HWCAP is a
> 32 bit value that is not a pointer (see AT_PHDR or AT_RANDOM for how
> pointers are shown).

Thanks! Patch applied.

Cheers,

Michael

>
> % LD_SHOW_AUXV=1 cat < /dev/null
> AT_SYSINFO_EHDR: 0x7fffe89fe000
> AT_HWCAP:        bfebfbff
> AT_PAGESZ:       4096
> AT_CLKTCK:       100
> AT_PHDR:         0x400040
> AT_PHENT:        56
> AT_PHNUM:        9
> AT_BASE:         0x0
> AT_FLAGS:        0x0
> AT_ENTRY:        0x402634
> AT_UID:          515
> AT_EUID:         515
> AT_GID:          114
> AT_EGID:         114
> AT_SECURE:       0
> AT_RANDOM:       0x7fffe8917be9
> AT_EXECFN:       /usr/bin/cat
> AT_PLATFORM:     x86_64
>
>
> --- PATCH ---
> diff --git a/man3/getauxval.3 b/man3/getauxval.3
> index 85d7f41..7ce0237 100644
> --- a/man3/getauxval.3
> +++ b/man3/getauxval.3
> @@ -101,12 +101,13 @@ performed by the kernel.
>  The real group ID of the thread.
>  .TP
>  .BR AT_HWCAP
> -A pointer to a multibyte mask of bits whose settings
> +A four byte long bit-mask whose settings
>  indicate detailed processor capabilities.
>  The contents of the bit mask are hardware dependent
>  (for example, see the kernel source file
>  .IR arch/x86/include/asm/cpufeature.h
> -for details relating to the Intel x86 architecture).
> +for details relating to the Intel x86 architecture; the value
> +returned is the first 32 bit word of the array described there).
>  A human-readable version of the same information is available via
>  .IR /proc/cpuinfo .
>  .TP
> --- END PATCH ---
>
> -- Jim
>
> James Cownie <james.h.cownie@intel.com>
> SSG/DPD/TCAR (Technical Computing, Analyzers and Runtimes)
> Tel: +44 117 9071438
>
>
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
