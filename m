From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] unix.7: Explain that MSG_NOSIGNAL is useless for
 recvmsg(2)
Date: Sun, 24 Jul 2016 21:32:09 +0200
Message-ID: <9997abd3-141b-d225-ac82-415c6f34b8b9@gmail.com>
References: <bug-137351-11311@https.bugzilla.kernel.org/>
 <20160722064522.5159-1-laurent.georget@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160722064522.5159-1-laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ivan Kharpalev <ivan.kharpalev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Laurent,

On 07/22/2016 08:45 AM, Laurent Georget wrote:
> recvmsg(2) never causes a "Broken pipe" error but the unix(7) man page implies
> that MSG_NOSIGNAL can be used in the flags of recvmsg(2) to avoid sending a
> SIGPIPE. Fixes Bug 137351.
>
> Signed-Off-By: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
>
> ---
>  man7/unix.7 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Hi Michael,
>
> I found the culprit line in unix(7). It can be misleading indeed because it
> that it makes sense to use MSG_NOSIGNAL as a flag to recvmsg(2) to avoid a
> SIGPIPE but recvmsg(2) actually never triggers such an error. I propose the
> patch below to fix this.

Thanks for delving into this and finding the page that had the problem
reported in https://bugzilla.kernel.org/show_bug.cgi?id=137351

I applied a slightly somewhat different patch. See below.

> Best regards,
>
> Laurent Georget
>
> diff --git a/man7/unix.7 b/man7/unix.7
> index 82715f9..fce5eb2 100644
> --- a/man7/unix.7
> +++ b/man7/unix.7
> @@ -515,12 +515,12 @@ Remote socket was closed on a stream socket.
>  If enabled, a
>  .B SIGPIPE
>  is sent as well.
> -This can be avoided by passing the
> +Sending the signal can be avoided by passing the
>  .B MSG_NOSIGNAL
>  flag to
>  .BR sendmsg (2)
> -or
> -.BR recvmsg (2).
> +.RB ( recvmsg (2)
> +never causes such an error).

I think the parenthetical comment isn't needed. The previous page text was
obviously wrong, but we don't need to mention recvmsg() in the fix.

>  .TP
>  .B EPROTONOSUPPORT
>  Passed protocol is not


I applied this patch:

[[
diff --git a/man7/unix.7 b/man7/unix.7
index e111734..0d44dd6 100644
--- a/man7/unix.7
+++ b/man7/unix.7
@@ -518,9 +518,9 @@ is sent as well.
  This can be avoided by passing the
  .B MSG_NOSIGNAL
  flag to
-.BR sendmsg (2)
+.BR send (2)
  or
-.BR recvmsg (2).
+.BR sendmsg (2).
  .TP
  .B EPROTONOSUPPORT
  Passed protocol is not
]]

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
