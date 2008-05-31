From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Sat, 31 May 2008 07:44:45 +0200
Message-ID: <cfd18e0f0805302244lc25315fm11ff316c7a115861@mail.gmail.com>
References: <482D4665.4050401@gmail.com>
	 <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com>
	 <E1K27bZ-0002Gk-3b@pomaz-ex.szeredi.hu>
	 <cfd18e0f0805301124o5f217dden10726b268d05d81a@mail.gmail.com>
	 <20080530131722.07f9723b.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20080530131722.07f9723b.akpm@linux-foundation.org>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: miklos@szeredi.hu, drepper@redhat.com, viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

Andrew,

On Fri, May 30, 2008 at 10:17 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Fri, 30 May 2008 20:24:22 +0200
> "Michael Kerrisk" <mtk.manpages@googlemail.com> wrote:
>
>> > After we fixed the original issue, we can still think about this other
>> > thing :)
>>
>> Okay, by now quite a bit of my time has been wasted, and my patience
>> is starting to get a little thin.
>
> Well yeah.  This has been dragging on for ages.  I was going to just
> apply this patch and stomp off again but this:
>
>  "against 2.6.26rc2, with the 2008-05-19 git changes you sent me
>   applied"
>
> stymied me.
>
> Please, if poss, just send a standalone, fully-changelogged,
> not-referential-to-some-random-email-discussion patch and let's get
> going.

Yes, I'll send it to you by Tuesday latest.  Sorry I probably can't
manage sooner.  Am travelling part of Monday, and trying to spend
(most of) the weekend with my baby daughter.

> (Where's Ulrich, btw?)

That's what I'd like to know....

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
