From: bugzilla-daemon-590EEB7GvNiWaY/ihj7yzEB+6BGkLq7r@public.gmane.org
Subject: [Bug 60744] waitid man page does not document the 5th argument
 "struct rusage*"
Date: Wed, 04 Sep 2013 13:12:20 +0000
Message-ID: <bug-60744-11311-PnkmjUa1ic@https.bugzilla.kernel.org/>
References: <bug-60744-11311@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bug-60744-11311-3bo0kxnWaOQUvHkbgXJLS5sdmw4N0Rt+2LY78lusg7I@public.gmane.org/>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=60744

Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         Resolution|---                         |CODE_FIX

--- Comment #1 from Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Hannes Landeholm from comment #0)
> I just spent 5 hours debugging my program and trying to figure out why the
> kernel overwrote my stack. I had to read the source code to realize that the
> real syscall took an additional 5th argument.
> 
> Wrong signature:
> int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options);
> 
> Correct signature:
> int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options, struct
> rusage* rusage);
> 
> The kernel man pages should not assume that the user is using glibc, or at
> least give enough information for developers to write their own, correct
> wrappers.

To be precise, the page is documenting the POSIX waitid() interface (rather
than glibc), but you are of course right that the page should make mention of
the fifth argument. I've added some text on this.

http://git.kernel.org/cgit/docs/man-pages/man-pages.git/commit/?id=d8b13fb4d939978f02db3d49697cbccff2881a30

Cheers,

Michael

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
