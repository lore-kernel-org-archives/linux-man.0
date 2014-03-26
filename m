From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Small nit in locale(7)
Date: Wed, 26 Mar 2014 14:26:46 +0100
Message-ID: <CAKgNAkiuRxN4+CwHAHR2hSXRZyCkYCqfif=sKRCD4f=Cs_VfZA@mail.gmail.com>
References: <87lhvxdrts.fsf@baal.isag.at>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87lhvxdrts.fsf-8e+O88gBorxfvwH+7sc+jQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Bihlmeyer <r.bihlmeyer-LBFTf0UgD8fk7+2FdBfRIA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Robert,

On Wed, Mar 26, 2014 at 2:15 PM, Robert Bihlmeyer
<r.bihlmeyer-LBFTf0UgD8fk7+2FdBfRIA@public.gmane.org> wrote:
> Hello,
>
> citing from locale(7):
>
>    LC_ADDRESS
>               [...] which return strings such as
>               "Deutschland" and "Deutsch" (for German-language locales).
>
> The first is not true for most German-language locales, only for de_DE*

Sigh! Yes, sorry about that. I suppose changing this to "for German
locales, such as de_DE" should suffice?

Thanks for the report.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
