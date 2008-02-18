From: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>
Subject: What's the equivalent of readdirat()?
Date: Mon, 18 Feb 2008 14:26:44 -0600
Message-ID: <200802181426.44768.rob@landley.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

I'm moving some code to use openat() and friends, but there doesn't appear to 
be a readdirat().

The problem is that readdir(3) takes a path from cwd.  The syscall readdir(2) 
takes a file descriptor, but the man page for readdir(2) says it was 
supplanted by getdents.  The getdents man page says that's an internal 
syscall that glibc doesn't even bother to _wrap_, and points me back at 
readdir(3) which still takes a path from cwd...

None of the "see also" stuff at the end of any of these pages is useful.

Any hints?

Rob
-- 
"One of my most productive days was throwing away 1000 lines of code."
  - Ken Thompson.
