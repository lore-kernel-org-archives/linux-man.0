From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wavelan.4: Remove manpage for no longer available driver
Date: Wed, 4 Sep 2013 21:13:14 +0200
Message-ID: <CAGWqfihQ6mjrygiy0Ytopx5yYfU4C7Cj6=byBH09PMXCfivAAQ@mail.gmail.com>
References: <1377929583-5438-1-git-send-email-eliedebrauwer@gmail.com>
	<CAKgNAkj9bFt8PAp_tDCdG870XvR5CM9R=33+yV96AoWMMg3aVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkj9bFt8PAp_tDCdG870XvR5CM9R=33+yV96AoWMMg3aVA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk-manpages <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Wed, Sep 4, 2013 at 2:38 PM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello Elie,
>
> On Sat, Aug 31, 2013 at 8:13 AM, Elie De Brauwer
> <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Hello Michael, list,
>>
>> The current release of the manpages contains wavelan(4), but support for
>> this module/driver is gone since several years. Starting from 2.6.32
>> (2009 )the driver was put in a staging mode ready for deprecation:
>>
>> The announcement e-mail is here: http://lwn.net/Articles/367876/
>> Then it lived in staging for two more releases with the following cry
>> for help: http://lxr.linux.no/linux+v2.6.34.14/drivers/staging/wavelan/TODO
>> and disappeared since 2.6.35 and then all other traces (documentation, etc)
>> were also removed.
>>
>> Hence I think it's pointless to continue dragging this information around,
>> if the driver doesn't have much use to people anymore, I doubt the manpage
>> has.
>
> I'm reluctant to discard the page outright (occasionally, people do
> want to see even obsolete information), so I've simply added a note to
> the top of the page to say that the driver was removed in 2.6.35.

No problem, I only saw after my patch that has also happened for the
sk98lin(4) page.
My initial reflex would be that anybody interested in older stuff
already has a habit
with working with version control history.

my 2 cents
E.

-- 
Elie De Brauwer
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
