From: "Serge E. Hallyn" <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: Could you write some CLONE_NEWUSER?
Date: Thu, 4 Dec 2008 13:04:30 -0600
Message-ID: <20081204190430.GA16026@us.ibm.com>
References: <cfd18e0f0812040720y5cabd2aarbf3912644dea42c4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cfd18e0f0812040720y5cabd2aarbf3912644dea42c4-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org, herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org, dev-3ImXcnM4P+0@public.gmane.org, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Quoting Michael Kerrisk (mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org):
> Hi Serge,
> 
> Thanks for CCing me on recent CLONE_NEWUSER patches.
> 
> Would you be will to write some documentation for this flag?  (It's
> the only remaining undocumented flag in clone(2).)  Plain text would
> be fine -- I'll integrate it into the man page with suitable macros.

Well here is a start.  David, writing this actually reminded me that
the per-user keys still aren't per-namespace.  Did you say you were
looking at that, or should I send a patch (starting at
security/keys/key.c:key_user_lookup())?

Eric, if you get a second, could you please review?

thanks,
-serge


CLONE_NEWUSER
	Start the child in a new user namespace.

	User namespaces are very incomplete.  When complete, they
	will implement hierarchical userid namespaces designed to
	be safely used without privilege.  User namespaces are
	unnamed, but for the sake of this explanation we will give
	them a single-letter ID.  Let us refer to userid 500 in user
	namespace B  as (B, 500).  Assume a process owned by (B, 500)
	passes CLONE_NEWUSER to clone(2).  A new user namespace, C,
	will be created.  The new task will be owned by user
	(C, 0).  No userid in user namespace C will be able to
	gain more access than (B, 500) could obtain.  User (C, 500)
	will be protected from (C, 501) as usual.  Files created
	by (C, 501) are owned by both (C, 501) and (B, 500), so 
	(B, 500) owns all files created in user namespace C.  Likewise
	(B, 500) can kill and ptrace any processes owned by (C, 501).

	In (!SECURE_NOROOT) mode, userid 0 gets privilege when executing
	files.  With user namespaces, userid 0 will still get these
	privileges, but limited to namespaces it owns.  For instance,
	CAP_DAC_OVERRIDE will be targeted to files owned by the user's
	user namespace, while CAP_SETUID is by nature per-namespace
	and hence always safe.

	Most of the permission checks to make this work are currently
	unimplemented.  If your kernel is compiled with CONFIG_USER_NS,
	then you can create a new user namespace if you have
	CAP_SYS_ADMIN, CAP_SETUID and CAP_SETGID capabilities.  The
	new task will be owned by userid and gid 0 in the new user
	namespace.  Current support is sufficient to provide separate
	accounting, since uid 0 in different namespaces are represented by
	different user structs.

	Will return -EINVAL if called on a kernel compiled without
	user namespace support (CONFIG_USER_NS=n), and -EPERM if
	called by a process with insufficient privilege before support
	is complete.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
