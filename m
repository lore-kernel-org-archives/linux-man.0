From: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>
Subject: Re: [PATCH] [2/4] Add a migrate_pages(2) page
Date: Sun, 13 Jun 2010 12:23:45 +0200
Message-ID: <20100613102345.GD31464@basil.fritz.box>
References: <20100320429.026463287@firstfloor.org> <20100320152929.12751B19E8@basil.firstfloor.org> <AANLkTiltMCXRd9jKI5Rd9b6Kt-t_zIHuOtkq0-IMGVyS@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTiltMCXRd9jKI5Rd9b6Kt-t_zIHuOtkq0-IMGVyS-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Jun 11, 2010 at 05:38:19PM +0200, Michael Kerrisk wrote:
> Andi,
> 
> On Sat, Mar 20, 2010 at 5:29 PM, Andi Kleen <andi-Vw/NltI1exuRpAAqCnN02g@public.gmane.org> wrote:
> >
> > Based on move_pages.
> >
> > Signed-off-by: Andi Kleen <ak-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> >
> > Index: man-pages-3.24/man2/migrate_pages.2
> 
> Thanks for this page!
> 
> I made some language edits, and add a couple of errors in the (still
> incomplete) ERRORS section.
> 
> Could you please review, to make sure my changes are okay?

I did a quick read and don't see anything wrong.

> 
> Also, if you have any insights on the FIXME related to "current
> cpset", let me know.

get_mempolicy always acts on the current task, so current.
Yes it means it cannot be done for a target with different cpuset.

-Andi
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
