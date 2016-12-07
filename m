From: "Dmitry V. Levin" <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 1/3] sock_diag.7: New page documenting NETLINK_SOCK_DIAG interface
Date: Wed, 7 Dec 2016 18:57:28 +0300
Message-ID: <20161207155727.GB2272@altlinux.org>
References: <20161207135943.GC1100@altlinux.org> <447179de-e8a9-92aa-9196-b3e11ebbb11d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <447179de-e8a9-92aa-9196-b3e11ebbb11d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Dec 07, 2016 at 04:15:25PM +0100, Michael Kerrisk (man-pages) wrote:
> On 12/07/2016 02:59 PM, Dmitry V. Levin wrote:
> > From: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
> > 
> > Co-authored-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> > Signed-off-by: Pavel Emelyanov <xemul-5HdwGun5lf+gSpxsJD1C4w@public.gmane.org>
> > Signed-off-by: Dmitry V. Levin <ldv-u2l5PoMzF/Vg9hUCZPvPmw@public.gmane.org>
> 
> Thank you, Pavel and Dmitry, for all the work that went into this page!
> I've applied and pushed to Git. I made a lot of trivial edits
> to the page. You may want to review it, but I don't think
> I broke anything.

Yes, it looks fine, thanks a lot!

> Perhaps the most notable change was to consistently
> replace "protocol family" by "address family".

This is definitely more consistent with use of AF_* names instead of PF_*.


-- 
ldv
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
