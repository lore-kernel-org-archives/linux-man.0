From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getauxval.3 correct AT_HWCAP result description
Date: Thu, 14 Jul 2016 08:44:12 +0200
Message-ID: <b06470a2-cfbc-cf66-f7df-0bb73078d4f1@gmail.com>
References: <397D95928DECEF49983F5B237627E9785733058A@IRSMSX108.ger.corp.intel.com>
 <2b181d0f-3a50-bf18-268b-9991de75d216@gmail.com> <5785F835.4070209@arm.com>
 <397D95928DECEF49983F5B237627E97857330926@IRSMSX108.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <397D95928DECEF49983F5B237627E97857330926-kPTMFJFq+rEMvF1YICWikbfspsVTdybXVpNB7YpNyf8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Cownie, James H" <james.h.cownie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Szabolcs Nagy <szabolcs.nagy-5wv7dgnIgG8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "nd-5wv7dgnIgG8@public.gmane.org" <nd-5wv7dgnIgG8@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 07/13/2016 10:34 AM, Cownie, James H wrote:
>> It's a long and the target abi decides how many bits of that are used.
> Then suggest a patch to say that :-)
> The absolutely critical aspect is that it is *not* a pointer (as was
> previously stated).

Thanks, James, and Szabolcs.

Patch applied.

Cheers,

Michael

>
> Maybe something like this?
>
> --- PATCH ---
> --- a/man3/getauxval.3
> +++ b/man3/getauxval.3
> @@ -101,7 +101,7 @@ performed by the kernel.
>  The real group ID of the thread.
>  .TP
>  .BR AT_HWCAP
> -A 32 bit long bit-mask whose settings
> +An architecture and ABI dependent bit-mask whose settings
>  indicate detailed processor capabilities.
>  The contents of the bit mask are hardware dependent
>  (for example, see the kernel source file
> --- END PATCH ---
>
> -- Jim
>
> James Cownie <james.h.cownie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> SSG/DPD/TCAR (Technical Computing, Analyzers and Runtimes)
> Tel: +44 117 9071438
>
> -----Original Message-----
> From: Szabolcs Nagy [mailto:szabolcs.nagy-5wv7dgnIgG8@public.gmane.org]
> Sent: Wednesday, July 13, 2016 9:14 AM
> To: Michael Kerrisk (man-pages) <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>; Cownie, James H <james.h.cownie-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: nd-5wv7dgnIgG8@public.gmane.org; libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org; linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [patch] getauxval.3 correct AT_HWCAP result description
>
> On 12/07/16 21:24, Michael Kerrisk (man-pages) wrote:
>>>  .BR AT_HWCAP
>>> -A pointer to a multibyte mask of bits whose settings
>>> +A four byte long bit-mask whose settings
>>>  indicate detailed processor capabilities.
>
> why is it four byte long?
>
> it's a long and the target abi decides how many
> bits of that is used.
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
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
