From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] elf.5: Typo on macro name
Date: Thu, 20 Dec 2012 17:49:52 +0100
Message-ID: <CAKgNAkigv5jwOo8kFry419NjcVi-0L9peqYQF0CjsA-EozUWJg@mail.gmail.com>
References: <CA+5g0SKXRS-qeVzwR9sudVar0kbyZVoXbs_gZ2wn57cDbfnj-Q@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+5g0SKXRS-qeVzwR9sudVar0kbyZVoXbs_gZ2wn57cDbfnj-Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Pena <felipensp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Felipe,

On Tue, Dec 18, 2012 at 10:55 PM, Felipe Pena <felipensp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi all,
> I just noticed a typo in the ELF[32|64]_R_TYPE macro name in the current
> ELF(5) man page. The patch follows below:


Thanks. Applied.

Cheers,

Michael


> diff --git a/man5/elf.5 b/man5/elf.5
> index 5ead1bb..8b63c2e 100644
> --- a/man5/elf.5
> +++ b/man5/elf.5
> @@ -1756,7 +1756,7 @@ types are processor specific.
> When the text refers to a relocation
> entry's relocation type or symbol table index, it means the result of
> applying
> -.BR ELF_[32|64]_R_TYPE
> +.BR ELF[32|64]_R_TYPE
> or
> .BR ELF[32|64]_R_SYM ,
> respectively, to the entry's
>
>
>
> Thanks!
>
> --
> Regards,
> Felipe Pena



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
