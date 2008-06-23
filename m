From: bugme-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 10967] include/asm-i386 removed but not documented
Date: Mon, 23 Jun 2008 11:54:20 -0700 (PDT)
Message-ID: <20080623185420.A5AFB11D109@picon.linux-foundation.org>
References: <bug-10967-11311@http.bugzilla.kernel.org/>
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-10967-11311-V0hAGp6uBxO456/isadD/XN4h3HLQggn@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

http://bugzilla.kernel.org/show_bug.cgi?id=10967


devzero-S0/GAf8tV78@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |devzero-S0/GAf8tV78@public.gmane.org




------- Comment #1 from devzero-S0/GAf8tV78@public.gmane.org  2008-06-23 11:54 -------
>Problem Description:Between kernel 2.6.23.17 and 2.6.24 the include/asm-i386
>directory was removed

it`s because of i386/x64 unification. see http://lwn.net/Articles/243704/

>there is no mention of it in the change log or the documentation.

it`s all documented - it began here
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=96a388de5dc53a8b234b3fd41f3ae2cedc9ffd42

and this is the latest information about those changes in asm-i386
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=history;f=include/asm-x86;h=9999ac87466fcbe63aa527c61f1e11627a349dea;hb=481c5346d0981940ee63037eb53e4e37b0735c10

git provides more detail than any documentation can provide. it`s the whole
changelog for the kernel - patch by patch.

>There are still many source files that include headers from asm-i386 

which ?

>and also third party software that will try to include /usr/include/asm-i386 >will now be broken for anyone trying to compile a kernel on a 32 bit CPU.

yes, we know out of tree code is a pain in the ass - but it`s like that - and
that`s the way it is. 
see
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/stable_api_nonsense.txt


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
