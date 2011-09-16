From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Wrong formulae for complex elementary functions
Date: Fri, 16 Sep 2011 08:05:57 +0200
Message-ID: <CAKgNAkgHrLgk+QBs0jnWXavj5PLBPhaLO=33tgQxAwTUyFhzwg@mail.gmail.com>
References: <4CEF7677.30500@ginac.de> <AANLkTinAUyVTdjxY9KVgnOerWxhXtnvmHeTQ-Gb0-TxC@mail.gmail.com>
 <4E3C61FE.1010107@ginac.de> <CAKgNAkjamtuK95ouh6+zsCS1dHiZO0-1q72GpN0CSaFk9XxWqg@mail.gmail.com>
 <CAKgNAkiv7-FL95p2D_80EaRTxhbwDOTun7N_uSsPr2e71Cz8EA@mail.gmail.com> <4E727152.2060503@ginac.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E727152.2060503-HEL5OUoDxoc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Richard B. Kreckel" <kreckel-HEL5OUoDxoc@public.gmane.org>
Cc: Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Enge <andreas.enge-MZpvjPyXg2s@public.gmane.org>, Bill Allombert <Bill.Allombert-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>, Karim Belabas <Karim.Belabas-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Richard,

On Thu, Sep 15, 2011 at 11:42 PM, Richard B. Kreckel <kreckel-HEL5OUoDxoc@public.gmane.org> wrote:
> Hi!
>
> On 09/15/2011 08:38 PM, Michael Kerrisk wrote:
>>
>> For man-pages-3.33, I have applied the changes below. They should be
>> consistent with what you proposed (and Andries confirmed). Could you
>> please carefully check...
>
> Yes, the patch looks correct. Thanks a lot for applying it.
>
> (I would have loved to try it but couldn't find the git repository for
> man-pages.)

Well, with the current state of affairs
(http://lwn.net/Articles/457142/), no one can find it...

>> I think it's not so necessary to add a warning to the page source.
>> Nowadays we have version control and logs, so the reasoning should be
>> easy to find.
>
> Certainly. Out of curiousity: Does the version control of man-pages date
> back enough to tell when and why the formulas got written the wrong way?

Unfortunately not. Version control dates back to the start of my watch
(Nov 2004), and those pages were added prior to that. Looking in old
tarballs, it seems the the error was there in the initial versions of
these pages.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
