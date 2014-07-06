From: Rich Felker <dalias-8zAoT0mYgF4@public.gmane.org>
Subject: Very confusing use of PID in man set_tid_address
Date: Sat, 5 Jul 2014 23:44:26 -0400
Message-ID: <20140706034426.GM179@brightrain.aerifal.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

I'm pretty sure all uses of "PID" in the man page for set_tid_address
should instead read "TID". While the issue is present in many man
pages and should probably be fixed globally, this one is particularly
confusing because "TID" is also used in the function, argument, and
task attribute names to mean the exact same thing. The word "process"
is also used misleadingly, "For each process...".

The most important fix is to clarify that the return value is the TID
of the caller, not the PID. But I think it should just all be fixed.

Rich
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
