From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: cgroups(7): documenting /sys/kernel/cgroup files
Date: Wed, 10 Jan 2018 09:33:40 -0800
Message-ID: <20180110173340.GG3668920@devbig577.frc2.facebook.com>
References: <ff431fd8-f1c1-ed8d-2d69-64ea83a8a505@gmail.com>
 <CAKgNAkhk-527Rh6tGYJO-U3UXgwBC1+t5nB+5JEq62nTO2p15A@mail.gmail.com>
 <20180110124407.GA26913@castle.DHCP.thefacebook.com>
 <20180110140239.GX3668920@devbig577.frc2.facebook.com>
 <CAKgNAkhDY09gauX-1Ut4SoL9DEoxj9wJ8SjS6h-Ntc90xeWi1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cgroups-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkhDY09gauX-1Ut4SoL9DEoxj9wJ8SjS6h-Ntc90xeWi1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: cgroups-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Roman Gushchin <guro-b10kYP2dOMg@public.gmane.org>, "Serge E. Hallyn" <serge-A9i7LUbDfNHQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:CONTROL GROUP (CGROUP)" <cgroups-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello, Michael.

On Wed, Jan 10, 2018 at 06:31:20PM +0100, Michael Kerrisk (man-pages) wrote:
> So, I am confused. According to Documentation/cgroup-v2.txt,
> cgoup.threads is delegated:
> 
> [[
> Model of Delegation
> ~~~~~~~~~~~~~~~~~~~
> 
> A cgroup can be delegated in two ways.  First, to a less privileged
> user by granting write access of the directory and its "cgroup.procs",
> "cgroup.threads" and "cgroup.subtree_control" files to the user.
> Second, if the "nsdelegate" mount option is set, automatically to a
> cgroup namespace on namespace creation.
> ]]
> 
> So, is that a mistake in that text file?

Yes, it is.  I probably copy&pasted from an earlier version where we
were marking threaded domains instead of threaded roots.  Will fix it
right away.

Thanks.

-- 
tejun
