From: Andi Kleen <ak-l3A5Bk7waGM@public.gmane.org>
Subject: Re: arch_prctl.2 changes
Date: Wed, 2 Jan 2008 11:03:40 +0100
Message-ID: <200801021103.40079.ak@suse.de>
References: <477B5F43.3070009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <477B5F43.3070009-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wednesday 02 January 2008 10:54:11 Michael Kerrisk wrote:
> Hi Andi,
> 
> I noticed some apparent inconsistencies in the arch_prctl.2 page
> (http://www.kernel.org/doc/man-pages/online/pages/man2/arch_prctl.2.html ).
>  The main issue is that 'addr' is interpreted as an unsigned long or as an
> unsigned long *, depending on code.  (right?)

Yes.

> 
> For man-pages-2.75, I have applied the following patch, which also updates
> a few other minor points.  Does this look okay to you?

Yes.

-Andi
-
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
