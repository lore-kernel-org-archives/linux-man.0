From: Eric Hopper <hopper-mHNs42olblhbd4swqxETsg@public.gmane.org>
Subject: Re: A problem with prctl(2) and proc(5)
Date: Mon, 23 Oct 2017 15:47:32 -0700
Message-ID: <CAJWcbJEr0DxmJch2K-CjidF6oQ+wBn43zBXEBH5XZmDkgT=5kg@mail.gmail.com>
References: <CAJWcbJEJDZS34g8v3dG-RAe=W0T-9ti_LUQ=GM9LJiEcetVphA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAJWcbJEJDZS34g8v3dG-RAe=W0T-9ti_LUQ=GM9LJiEcetVphA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Also... execve(2) should make a passing mention of the DUMPABLE flag
and point at the prctl documentation where it talks about set-user-ID
processes. That would've greatly shortened my search for the answer I
needed.

On Mon, Oct 23, 2017 at 3:26 PM, Eric Hopper <hopper-mHNs42olblhbd4swqxETsg@public.gmane.org> wrote:
> These two manual pages both imply that a setuid process can call
> prctl(PR_SET_DUMPABLE, 1, 0, 0, 0); to set this flag back to 1 and
> restore the ownership of /proc files back to being the real user id of
> the process.  This is not exactly true.
>
> Empirical testing reveals that this flag is ignored in favor of the
> value in /proc/sys/fs/suid_dumpable if either the real group or user id
> fail to match the effective group or user id. You can use prctl to set
> it to 1, and then prctl(PR_GET_DUMPABLE, 0, 0, 0, 0); to fetch it, and
> it will report as '1', but the ownership of files in /proc/self will
> remain as root:root until the effective and real ids match.
>
> This should be mentioned in the manual as it prescribes a very specific
> sequence of events that must happen to restore the ownership of these
> files that the current manual does not make clear.
>
> Thank you,
> --
> Eric Hopper -- http://www.omnifarious.org/~hopper/



-- 
Eric Hopper -- http://www.omnifarious.org/~hopper/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
