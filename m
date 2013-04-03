From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH] man: Add io_setup.3 and io_destroy.3
Date: Wed, 3 Apr 2013 11:59:54 +0200
Message-ID: <20130403095954.GB1545@rei>
References: <20130328105243.GA6202@rei.suse.cz>
 <x49li9022jm.fsf@segfault.boston.devel.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <x49li9022jm.fsf-RRHT56Q3PSP4kTEheFKJxxDDeQx5vsVwAInAS/Ez/D0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
> > This is a second version that includes
> > fixes proposed by Michael Kerrisk.
> 
> Now that I see what this looks like, I think it's rather confusing to
> have the user reference both the .2 and .3 pages to write code for
> libaio.  I'd prefer to keep all of the text for how to use the library
> inside the .3 man pages.

Then we need to duplicate some of the information from the .2 pages to
the libaio .3 pages. I'm fine with that, but we should probably finish
the .2 pages cleanup first.

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
