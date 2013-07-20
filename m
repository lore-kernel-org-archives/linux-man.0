From: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Subject: Re: [PATCH] open(2): document O_PATH
Date: Sat, 20 Jul 2013 12:40:17 +0100
Message-ID: <20130720114017.GA2118@ZenIV.linux.org.uk>
References: <CAKgNAkgWiANFA1Z7o2EQmKmsMzzpa1ga2ggLeX3Bo58QmjDx6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkgWiANFA1Z7o2EQmKmsMzzpa1ga2ggLeX3Bo58QmjDx6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Aneesh Kumar K.V" <aneesh.kumar-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, benjamin-+ZN9ApsXKcEdnm+yROfE0A@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Mar 14, 2013 at 10:35:59AM +0100, Michael Kerrisk (man-pages) wrote:
> Hello Al et al,
> 
> Documenting O_PATH fell by the wayside last year
> (http://thread.gmane.org/gmane.linux.man/2790) as I got distracted
> with other tasks. A recent prod or two have reminded me restart this.
> I have the following patch queued to document O_PATH.
> 
> Could you please review. I've provided the O_PATH doc both as
> formatted text, for ease of reviewing, and as a patch and entire file
> (attached).

Seems to be mostly correct; the only thing missing is that F_GETFL is also
allowed (and return value will contain O_PATH for such descriptors).  Had
been there since the very beginning...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
