From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] [2/4] Add a migrate_pages(2) page
Date: Mon, 14 Jun 2010 06:08:23 +0200
Message-ID: <AANLkTilmfas_rUlx8tftG_R4NW_NDv2JKJKrN-tpOnS9@mail.gmail.com>
References: <20100320429.026463287@firstfloor.org> <20100320152929.12751B19E8@basil.firstfloor.org>
	<AANLkTiltMCXRd9jKI5Rd9b6Kt-t_zIHuOtkq0-IMGVyS@mail.gmail.com>
	<20100613102345.GD31464@basil.fritz.box>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100613102345.GD31464-u0/ZJuX+froe6aEkudXLsA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andi.

On Sun, Jun 13, 2010 at 12:23 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> On Fri, Jun 11, 2010 at 05:38:19PM +0200, Michael Kerrisk wrote:
>> Andi,
>>
>> On Sat, Mar 20, 2010 at 5:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
>> >
>> > Based on move_pages.
>> >
>> > Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> >
>> > Index: man-pages-3.24/man2/migrate_pages.2
>>
>> Thanks for this page!
>>
>> I made some language edits, and add a couple of errors in the (still
>> incomplete) ERRORS section.
>>
>> Could you please review, to make sure my changes are okay?
>
> I did a quick read and don't see anything wrong.

Thanks.

>>
>> Also, if you have any insights on the FIXME related to "current
>> cpset", let me know.
>
> get_mempolicy always acts on the current task, so current.
> Yes it means it cannot be done for a target with different cpuset.

Okay.

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
