From: "Serge E. Hallyn" <serue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Subject: Re: Could you write some CLONE_NEWUSER?
Date: Thu, 4 Dec 2008 16:33:36 -0600
Message-ID: <20081204223336.GA20990@us.ibm.com>
References: <cfd18e0f0812040720y5cabd2aarbf3912644dea42c4@mail.gmail.com> <20081204190430.GA16026@us.ibm.com> <3e8340490812041218l7b4633fev5126f25a5d33076c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3e8340490812041218l7b4633fev5126f25a5d33076c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Donlan <bdonlan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, clg-NmTC/0ZBporQT0dZR+AlfA@public.gmane.org, herbert-dBHVzrDq9nF4Lj/PQRBjDg@public.gmane.org, dev-3ImXcnM4P+0@public.gmane.org, Subrata Modak <subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, David Howells <dhowells-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Quoting Bryan Donlan (bdonlan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org):
> This is something more of a general question than one about this
> manpage, but how will files owned by user namespaces be represented on
> the underlying filesystem? Since (C, 501) will be meaningless after a
> reboot at the latest, it makes little sense to persist them...

Yeah that's a very interesting question.  Clearly persistant names for
the user namespaces are needed.  Eric very much wanted to avoid having
the user namespaces be explicitly named, so we pursued the path of
having the filesystem handle the naming.  So in my last patchset,
a mount option could register the mounter's user namespace name.
There would be a system-wide policy saying for instance that (B,500)
user namespaces owned by can register themselves at C.

(end of discussion arising from that patchset is here: )
https://lists.linux-foundation.org/pipermail/containers/2008-August/012793.html

In the simplest case of no fs support for user namespaces, the mount
will be 'owned' by the userns which mounted it (no persistant name
needed for that).  Users who are in a different namespace will only get
the 'user other' permission to the file/dir, and may not create files
there (since we wouldn't know which userid to place on it).

Then the fs can support user namespaces - however it wants.  It could
just store (B, 500),(C, 501) in an xattr.  Or it could just store the
userid and userns name of the lowest user (I.e. C and 0), and count on
knowning that (B, 500) owns user namespace C.  We do want to provide
generic helpers in lib/fsuserns.c which any fs could use.

But yes, picking a meaningful persistant name for a user namespace
is an issue.

-serge
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
