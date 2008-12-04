From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: Review request: revised bindresvport() man page
Date: Thu, 4 Dec 2008 08:54:02 -0500
Message-ID: <cfd18e0f0812040554o12738fd8p2cf7f48e8e1d554a@mail.gmail.com>
References: <cfd18e0f0812031917t3554bc17uc7ebf3e8221ab3e1@mail.gmail.com>
	 <cfd18e0f0812040359y16117d71q2fb1ef7dca915903@mail.gmail.com>
	 <FE028D69955796489B510CE43DBBE8031095F257@rrsmsx503.amr.corp.intel.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <FE028D69955796489B510CE43DBBE8031095F257-iFQM6J6nBmdQxe9IK+vIArfspsVTdybXVpNB7YpNyf8@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Wichmann, Mats D" <mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Ulrich Drepper <drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Dec 4, 2008 at 8:33 AM, Wichmann, Mats D
<mats.d.wichmann-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> Michael Kerrisk wrote:
>> Hi Mats,
>>
>> I fixed the page after Petr's comments, and also added a note to
>> explicitly say that the implementation doesn't use sin->sin_port.
>> Revised version of the page below.
>
> Looks okay to me.

Thanks for checking it over Mats.

M


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
