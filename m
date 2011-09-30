From: "Serge E. Hallyn" <serge.hallyn-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: grantpt and ptsname man pages
Date: Thu, 29 Sep 2011 19:03:07 -0500
Message-ID: <20110930000307.GA10103@sergelap>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sukadev Bhattiprolu <sukadev-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

near as i can tell (from tests and code), ptsname and grantpt both
require the passed-in fd to exist in /dev/pts.  So if you pass in
an fd from a newinstance devpts mounted elsewhere things can go
wrong.  Particularly if the passed-in fd is for /other/dev/pts/0
and /dev/pts/0 does not exist, then grantpt and ptsname will return
-ENOENT.

The manpage should probably mention that.  I've not written anything
for it yet.  (Willing to, but not until this weekend I'm afraid.)

thanks,
-serge
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
