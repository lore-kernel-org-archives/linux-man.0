From: "Bryan Donlan" <bdonlan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Could you write some CLONE_NEWUSER?
Date: Thu, 4 Dec 2008 15:18:35 -0500
Message-ID: <3e8340490812041218l7b4633fev5126f25a5d33076c@mail.gmail.com>
References: <cfd18e0f0812040720y5cabd2aarbf3912644dea42c4@mail.gmail.com>
	 <20081204190430.GA16026@us.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081204190430.GA16026-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Serge E. Hallyn" <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org, herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org, dev-3ImXcnM4P+0@public.gmane.org, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, Dec 4, 2008 at 2:04 PM, Serge E. Hallyn <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> wrote:
> Quoting Michael Kerrisk (mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org):
>> Hi Serge,
>>
>> Thanks for CCing me on recent CLONE_NEWUSER patches.
>>
>> Would you be will to write some documentation for this flag?  (It's
>> the only remaining undocumented flag in clone(2).)  Plain text would
>> be fine -- I'll integrate it into the man page with suitable macros.
>
> Well here is a start.  David, writing this actually reminded me that
> the per-user keys still aren't per-namespace.  Did you say you were
> looking at that, or should I send a patch (starting at
> security/keys/key.c:key_user_lookup())?
>
> Eric, if you get a second, could you please review?
>
> thanks,
> -serge
>
>
> CLONE_NEWUSER
>        Start the child in a new user namespace.
>
>        User namespaces are very incomplete.  When complete, they
>        will implement hierarchical userid namespaces designed to
>        be safely used without privilege.  User namespaces are
>        unnamed, but for the sake of this explanation we will give
>        them a single-letter ID.  Let us refer to userid 500 in user
>        namespace B  as (B, 500).  Assume a process owned by (B, 500)
>        passes CLONE_NEWUSER to clone(2).  A new user namespace, C,
>        will be created.  The new task will be owned by user
>        (C, 0).  No userid in user namespace C will be able to
>        gain more access than (B, 500) could obtain.  User (C, 500)
>        will be protected from (C, 501) as usual.  Files created
>        by (C, 501) are owned by both (C, 501) and (B, 500), so
>        (B, 500) owns all files created in user namespace C.  Likewise
>        (B, 500) can kill and ptrace any processes owned by (C, 501).

This is something more of a general question than one about this
manpage, but how will files owned by user namespaces be represented on
the underlying filesystem? Since (C, 501) will be meaningless after a
reboot at the latest, it makes little sense to persist them...
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
