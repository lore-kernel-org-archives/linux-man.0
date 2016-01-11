From: Nikola =?ISO-8859-1?Q?Forr=F3?= <nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [patch] rcmd.3: Add missing condition concerning .rhosts file
Date: Mon, 11 Jan 2016 11:06:57 +0100
Message-ID: <1452506817.5951.7.camel@redhat.com>
References: <1451924313.4749.4.camel@redhat.com>
	 <568FE2A5.3020809@gmail.com>
Reply-To: nforro-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <568FE2A5.3020809-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, 2016-01-08 at 17:24 +0100, Michael Kerrisk (man-pages) wrote:
> Just to better document the patch, could you point to the
> relevant location in the glibc source code?
> 
Sure. It's iruserfopen function in inet/rcmd.c [1].

[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=inet/rcmd.c;hb=HEA
D#l465
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
