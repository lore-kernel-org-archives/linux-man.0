From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 120671] missing info about userns restrictions
Date: Mon, 20 Jun 2016 20:18:59 +0000
Message-ID: <bug-120671-11311-GAi8gaGhvj@https.bugzilla.kernel.org/>
References: <bug-120671-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-120671-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D120671

--- Comment #4 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Micha=C5=82 Zegan from comment #2)
> Well... For example, cap_sys_module does not work in user namespace, =
doesn't
> it? cap_sys_mknod last i checked did not work in userns, but may be w=
rong.

Yes, but that is conveyed in a sentence in user_namespaces(7):

       Having a capability inside a user namespace permits  a  process
       to   perform   operations  (that  require  privilege)  only  on
       resources governed by that namespace.

[1] Loading a kernel module or creating a device node are not governed =
by any
of the 7 current namespace types. What I mean here: this is not a quest=
ion of
whether particular capabilities work in a namespace, rather what operat=
ions /
abilities are associated with various namespaces.

> About mounting filesystems, there is probably a whitelist.  If I reca=
ll
> correctly you are unable to mount any block based fs like ext4 inside=
 of the
> userns, like you have no permissions to mount most of them except tmp=
fs,
> proc and such like.=20

[2] This isn't correct as far as I know, but if you can show me an inte=
resting
counterexample...

> There may be other restrictions I am not aware of, but
> those are some I know, unless I am wrong. It will help to clarify som=
e
> things that are just not present in that manpage.

So far, I don't see a real problem in the man page(s). (But maybe, the
explanations on the first point could be more detailed.)

--=20
You are receiving this mail because:
You are watching the assignee of the bug.--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
