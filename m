From: Scot Doyle <lkml14-enLWO88E2pdl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] console_codes.4: Add missing escape sequence
Date: Fri, 27 Feb 2015 14:32:44 +0000 (UTC)
Message-ID: <alpine.LNX.2.11.1502271409270.274@localhost>
References: <alpine.LNX.2.11.1502270231140.723@localhost> <54F01D8B.6090501@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54F01D8B.6090501-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 27 Feb 2015, Michael Kerrisk (man-pages) wrote:
> Hello Scott,
> 
> On 02/27/2015 03:35 AM, Scot Doyle wrote:
> > An undocumented escape sequence in drivers/tty/vt/vt.c brings the
> > previously accessed virtual terminal to the foreground.
> 
> Thanks. Applied. Looks like this sequence appeared with ~2.6.0 or so.
> Do you know if this is so?
> 
> Cheers,
> 
> Michael

"git log -p -- drivers/char/vt.c" shows that it's included in the initial 
2005 git commit. Is there an easier way to view early kernel history than 
digging through kernel tarballs?
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
