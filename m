From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [1/4] Document hwpoison signal extensions
Date: Wed, 16 Jun 2010 09:36:00 +0200
Message-ID: <AANLkTiltLaZHMOlI424zjkDZ1HNvaqMJpDXRmhDL763c@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152928.0FA17B19E8@basil.firstfloor.org>
	<AANLkTimT70TyR_mr3B44DpseY6KobM1441KAO1IhvkCY@mail.gmail.com>
	<20100611083134.GF6864@basil.fritz.box> <AANLkTikG5Axa39aSgHkCRzmk56fGBIE6rqkXzko3iuOa@mail.gmail.com>
	<20100613103343.GE31464@basil.fritz.box> <AANLkTilzdFecfwtgrMjEX2bT_ruPa6oegFeVUgSXBvM0@mail.gmail.com>
	<20100614082054.GD17092@basil.fritz.box> <AANLkTikvazub4Ni-3aL4CFhimfVoTYz4xI1FskFUMSGd@mail.gmail.com>
	<20100615110552.GG6727@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100615110552.GG6727-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi,

On Tue, Jun 15, 2010 at 1:05 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> On Tue, Jun 15, 2010 at 07:25:36AM +0200, Michael Kerrisk wrote:
>
> Hi Michael,
>
>> Okay -- so at this point I plead ignorance/blindness. These are the
>> things that confuse me (and I admit not being able to follow all the
>> kernel code convolutions here):
>
> Sorry, it was actually me being wrong. The trapno is only set in
> the sigcontext on x86, not in the siginfo.
>
> So you're right on this.

Thanks for the confirmation.

>> In principle, I'd accept a patch like you suggest for sigaction.2 --
>> probably by the time we finish this discussion, I'll be able to write
>> it myself ;-).
>
> Ok, I assume you'll be writing it.

So, I did go away to do this, looked once again at the sigaction.2
page (please pull the latest version), and concluded that everything
in your original patch really is covered in sigaction.2. (SIGTRAP
wasn't covered, but is now.) I really can't see a benefit of adding a
tabular summary to sigaction.2, so I decided not to do this. (Sorry!)

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
