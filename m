From: Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: man-pages text for MAV_MERGEABLE and MADV_UNMERGEABLE
Date: Mon, 21 Jun 2010 09:11:23 -0700
Message-ID: <AANLkTil8umNYwlc1FUZJaGv2ObTLG37rHEmIgxfJAUqB@mail.gmail.com>
References: <AANLkTinX4TlNfvwrCtjfkU-bar3URnpvmPJB-sOi-9aT@mail.gmail.com>
	<alpine.DEB.1.00.1006191622450.14879@tigran.mtv.corp.google.com>
	<AANLkTimt6HQZVeTtv_UO-5Lt4ngtPr0cyNXkq2YGR3lA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimt6HQZVeTtv_UO-5Lt4ngtPr0cyNXkq2YGR3lA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Sat, Jun 19, 2010 at 10:36 PM, Michael Kerrisk
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Jun 20, 2010 at 2:02 AM, Hugh Dickins <hughd-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrot=
e:
>> On Sat, 19 Jun 2010, Michael Kerrisk wrote:
>>> +The KSM daemon
>>> +.RI ( ksmd )
>>> +periodically scans those areas of user memory that have
>>> +been marked as mergeable,
>>> +looking for pages with identical content.
>>
>> I was rather puzzled by Andi calling that an internal implementation
>> detail. =C2=A0Okay, I suppose the "KSM daemon periodically scans" is=
 an
>> internal implementation detail, though I think it helps to warn the
>> programmer of the overhead of MADV_MERGEABLE; but without "pages
>> with identical content", aren't we left mystified as to just what
>> this "merging" is all about?
>
> I agree. All I had changed was to remove mention of the KSM daemon --
> I just say "the kernel".

Great, that's just right: thanks.

Hugh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
