From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Error in man cal
Date: Tue, 16 Jun 2015 08:23:11 +0200
Message-ID: <CAKgNAkii9KCRcgboqCxx=ivDYk_4G8J4rmiwH0z0H71eJu=DZQ@mail.gmail.com>
References: <CA+w_OVcn2u5dZH0XQUA2BnabkfLn_WWp1c4iFn+F_2bKYSj5mQ@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+w_OVcn2u5dZH0XQUA2BnabkfLn_WWp1c4iFn+F_2bKYSj5mQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felix Neumann <felix.neumann-0PLPjs5DLsA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Felix,

On 16 June 2015 at 00:04, Felix Neumann <felix.neumann-0PLPjs5DLsA@public.gmane.org> wrote:
> Hi,
>
> in the man page for cal there's a small error in section "bugs":
>
>        cal program uses the 3rd of September 1752 as the date of the
>        Gregorian calendar reformation -- that is when it happened in Great
>        Britain and its colonies (including what is now the USA).  Ten days
>        following that date were eliminated by this reformation, so the
>        calendar for that month is rather unusual.  The actual historical
>        dates at which the calendar reform happened in all the different
>        countries (locales) are ignored.
>
> It should read "Eleven days following" instead of "Ten days
> following", as the jump is from September 3rd to 14th. (cf. output of
> cal 9 1752).
>
> I checked the man page on
> http://man7.org/linux/man-pages/man1/cal.1.html as well as my CentOS 6
> installation.
>
> I apologize for not submitting in the preferred format for patches,
> that's my first report.


This bug needs to be reported elsewhere. See
http://man7.org/linux/man-pages/man1/cal.1.html#COLOPHON

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
