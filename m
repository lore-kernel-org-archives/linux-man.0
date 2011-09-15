From: "Richard B. Kreckel" <kreckel-HEL5OUoDxoc@public.gmane.org>
Subject: Re: Wrong formulae for complex elementary functions
Date: Thu, 15 Sep 2011 23:42:42 +0200
Message-ID: <4E727152.2060503@ginac.de>
References: <4CEF7677.30500@ginac.de> <AANLkTinAUyVTdjxY9KVgnOerWxhXtnvmHeTQ-Gb0-TxC@mail.gmail.com> <4E3C61FE.1010107@ginac.de> <CAKgNAkjamtuK95ouh6+zsCS1dHiZO0-1q72GpN0CSaFk9XxWqg@mail.gmail.com> <CAKgNAkiv7-FL95p2D_80EaRTxhbwDOTun7N_uSsPr2e71Cz8EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkiv7-FL95p2D_80EaRTxhbwDOTun7N_uSsPr2e71Cz8EA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Enge <andreas.enge-MZpvjPyXg2s@public.gmane.org>, Bill Allombert <Bill.Allombert-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>, Karim Belabas <Karim.Belabas-AE+LCD0i0auq1rftRos53FaPQRlvutdw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi!

On 09/15/2011 08:38 PM, Michael Kerrisk wrote:
> For man-pages-3.33, I have applied the changes below. They should be
> consistent with what you proposed (and Andries confirmed). Could you
> please carefully check...

Yes, the patch looks correct. Thanks a lot for applying it.

(I would have loved to try it but couldn't find the git repository for 
man-pages.)

> I think it's not so necessary to add a warning to the page source.
> Nowadays we have version control and logs, so the reasoning should be
> easy to find.

Certainly. Out of curiousity: Does the version control of man-pages date 
back enough to tell when and why the formulas got written the wrong way?

Bye,
   -richy.
-- 
Richard B. Kreckel
<http://www.ginac.de/~kreckel/>
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
