From: josh-iaAMLnmF4UmaiuxdJuQwMA@public.gmane.org
Subject: Re: [PATCH] clone.2: Document that clone silently ignores
 CLONE_PID and CLONE_STOPPED
Date: Fri, 27 Feb 2015 08:31:58 -0800
Message-ID: <20150227163157.GA10309@cloud>
References: <20150227004118.GA15530@jtriplet-mobl1>
 <54F011E4.1020502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54F011E4.1020502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, Feb 27, 2015 at 07:42:44AM +0100, Michael Kerrisk (man-pages) wrote:
> On 02/27/2015 01:41 AM, Josh Triplett wrote:
> > Normally, system calls return EINVAL for flags they don't support.
> > Explicitly document that clone does *not* produce an error for these two
> > obsolete flags.
> 
> Thanks, Josh! Applied.

Doesn't appear to be in the current git repository.

- Josh Triplett
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
