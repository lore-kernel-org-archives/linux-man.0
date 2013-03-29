From: ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org (Eric W. Biederman)
Subject: Re: For review (v2): user_namespaces(7) man page
Date: Thu, 28 Mar 2013 19:21:51 -0700
Message-ID: <87ehez2beo.fsf@xmission.com>
References: <CAKgNAkjgmTJ1BiHVbqVtz-g-=yfewMiYaroDJELJpa1aRrFAvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjgmTJ1BiHVbqVtz-g-=yfewMiYaroDJELJpa1aRrFAvQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Michael Kerrisk's message of "Wed, 27 Mar 2013 22:26:07 +0100")
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vasily Kulikov <segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>, Serge Hallyn <serge.hallyn-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org
List-Id: linux-man@vger.kernel.org


Over the last little while I have been working to correct a design
oversight in user namespaces, that probably needs to be documented
somewhere, and the fixes for the worst of the oversight have been
merged.

The problem was I forgot to consider what when there are shared
resources and root uses things like chroot and mounts as access policy
controls, and not as a mechanism to prevent the gaining of privilege.

This has led to the realization that the root directory is one of the
privileged identifiers that is controlled by the user namespace.

So now there is a restriction that user namespaces can not be created
if you are chrooted.

Beyond that there are restrictions on what you can do in a mount
namespace created inside a user namespace.  Read-only bind mounts
may not be remounted to read-write.   The mqueue filesystem may only be
mounted if you have CAP_SYS_ADMIN over it's ipc namespace.  proc and
sysfs may only be mounted if they are already somewhere in the mount
namespace.

There is a remaining open question on what to allow in the context of
unmounting and bind mounts.  In the normal case unmounting something is
safe because mounts almost always happen on an empty directory.  The
only significant case that I can think of where this is different are
union mounts and union filesystems.  However the general principle of
following the restrictions of the root user makes suggests that unmounts
should not happen.

In the grand scheme of things these are small little things but they are
details we need to get right so that enabling user namespaces is no
worse that adding any other feature to the kernel.  In the worst case
just adding more attack surface for the bad guys, but not a matter of
risk semantically.

Eric
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
