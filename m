From: Cyrill Gorcunov <gorcunov-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] Add kcmp.2 manpage
Date: Sat, 10 Mar 2012 01:18:13 +0400
Message-ID: <20120309211813.GO13346@moon>
References: <1331326042-32558-1-git-send-email-gorcunov@openvz.org>
 <1331326042-32558-3-git-send-email-gorcunov@openvz.org>
 <4F5A6D09.3050704@zytor.com>
 <20120309210342.GN13346@moon>
 <4F5A72E9.5030802@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F5A72E9.5030802-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, xemul-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Fri, Mar 09, 2012 at 01:15:21PM -0800, H. Peter Anvin wrote:
> No, you missed the point, which is that the comma moved to the .IR line.
> 
> .BR and .IR mean "alternate between bold/italic and regular", so
> 
> .IR foo bar
> 
> gives you "foobar" where only "foo" is italiziced.  It is equivalent to:
> 
> \fIfoo\fPbar
> 

Ouch, sorry. Will update shortly.

	Cyrill
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
