From: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [Bug 51871] getxattr() man page wrongly refers to ENOATTR
Date: Sat, 22 Dec 2012 03:19:26 -0500
Message-ID: <20121222081926.GA22573@infradead.org>
References: <bug-51871-11311@https.bugzilla.kernel.org/>
 <20121220181354.10AA011F8B9@bugzilla.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121220181354.10AA011F8B9-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Dec 20, 2012 at 06:13:54PM +0000, bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org wrote:
> --- Comment #1 from Andrew Perepechko <andrew_perepechko-qCPWdT176rRBDgjK7y7TUQ@public.gmane.org>  2012-12-20 18:13:53 ---
> Hm, actually ENODATA is an alias of ENOATTR defined in libattr header.

But that's:

 a) not how normal Posix errno values are supposed to work.  I
 b) limited to using xattr, whichle getxattr is also exposed by glibc
 directly.

This really needs an explanation in the NOTES section, I'll see if I can
come up with someting useful.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
