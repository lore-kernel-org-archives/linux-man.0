From: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] man: Add io_setup.3 and io_destroy.3
Date: Tue, 02 Apr 2013 14:46:53 -0400
Message-ID: <x49li9022jm.fsf@segfault.boston.devel.redhat.com>
References: <20130328105243.GA6202@rei.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130328105243.GA6202-J5syqNJeCN7twjQa/ONI9g@public.gmane.org> (Cyril Hrubis's message of
	"Thu, 28 Mar 2013 11:52:43 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> writes:

> This is a second version that includes
> fixes proposed by Michael Kerrisk.

Now that I see what this looks like, I think it's rather confusing to
have the user reference both the .2 and .3 pages to write code for
libaio.  I'd prefer to keep all of the text for how to use the library
inside the .3 man pages.

-Jeff
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
