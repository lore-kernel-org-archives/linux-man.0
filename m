From: Bjarni Ingi Gislason <bjarniig-2945IVfuVpf1P9xLtpHBDw@public.gmane.org>
Subject: Re: [PATCH] man-pages: ffix: Add a no-break space between a number
 and a unit (prefix)
Date: Mon, 21 Aug 2017 12:29:51 +0000
Message-ID: <20170821122951.GA17238@rhi.hi.is>
References: <20170818002253.GA20222@rhi.hi.is>
 <70c234b4-27dd-ec6f-0bfd-820eb8678835@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <70c234b4-27dd-ec6f-0bfd-820eb8678835-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Aug 19, 2017 at 09:11:07PM +0200, Michael Kerrisk (man-pages) wrote:
[...]

> 
> On 08/18/2017 02:22 AM, Bjarni Ingi Gislason wrote:
> >   A missing measuring unit is not added to a prefix (a subject for a later
> > patch?).
> 
> Sorry, I do not understand that last sentence.
> 

  Example: "64k ", I inserted only a non-break space, but " 64 k" makes no
sense without a measuring unit.  I saw that you had added a unit, but I
intended to add it later in another patch-run.

> >   Tables (fd.4): Units are removed from numbers as they belong to the header
> 
> This piece should really be a separate patch. (I have not
> made these changes manually.) Could you resend please?
> 

  Yes

N.B.  Remove irrelevant content in your responses.  There are obout 800 lines
of content that is already present in an e-mail, and thus preserved.

[about 800 lines removed]

-- 
Bjarni I. Gislason
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
